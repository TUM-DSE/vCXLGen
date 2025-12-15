#!/usr/bin/env python3
import os
import sys
import csv
import re
from collections import defaultdict

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
DATA_DIR = os.path.join(REPO_ROOT, "data")
OUTPUT_DIR = os.path.join(DATA_DIR, "gem5.output")
PLOTS_DIR = os.path.join(DATA_DIR, "plots")

SUITES = ["parsec", "splash", "phoenix"]

PROTOCOLS = ["MOESI_gem5", "MESI_MESI_MESI", "MESI_CXL_MESI"]

REFERENCE_PROTOCOL = "MOESI_gem5"

START_REMOTE_MISS = 128  # LLC misses threshold
END_REMOTE_MISS = 850

ALL_OP_TYPES = ['LD', 'ST', 'IFETCH', 'RMW_Read', 'Locked_RMW_Read']

OP_TYPE_MAPPING = {
    'LD': 'LD',
    'IFETCH': 'LD',
    'ST': 'ST',
    'RMW_Read': 'ST',
    'Locked_RMW_Read': 'ST'
}


def extract_sim_ticks(stats_file):
    """Extract simTicks from stats.txt"""
    try:
        with open(stats_file, 'r') as f:
            for line in f:
                if line.startswith("simTicks"):
                    parts = line.split()
                    if len(parts) >= 2:
                        return int(parts[1])
    except Exception as e:
        pass
    return None


def extract_histogram_stats(stats_file):
    data = {}
    
    for op_type in ALL_OP_TYPES:
        data[op_type] = {
            'bucket_size': None,
            'histogram': [],
            'l1_hits': 0,
            'llc_hits': 0,
            'llc_misses': 0,
            'l1_hit_cycles': 0,
            'llc_hit_cycles': 0,
            'llc_miss_cycles': 0,
        }
    
    try:
        with open(stats_file, 'r') as f:
            for line in f:
                for op_type in ALL_OP_TYPES:
                    # Extract bucket size
                    if f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::bucket_size" in line:
                        parts = line.split()
                        if len(parts) >= 2:
                            data[op_type]['bucket_size'] = int(parts[1])
                    
                    # Extract L1 hits (from hit_latency_hist_seqr::samples)
                    elif f"system.caches.RequestType.{op_type}.hit_latency_hist_seqr::samples" in line:
                        parts = line.split()
                        if len(parts) >= 2:
                            data[op_type]['l1_hits'] = int(parts[1])
                    
                    # Extract histogram data
                    elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr |" in line:
                        values = []
                        parts = line.split('|')
                        for part in parts[1:-1]:
                            if part.strip():
                                try:
                                    count = int(part.split()[0])
                                    values.append(count)
                                except (ValueError, IndexError):
                                    pass
                        data[op_type]['histogram'] = values
        
        # Process histograms to separate LLC hits from misses
        for op_type in ALL_OP_TYPES:
            hist = data[op_type]['histogram']
            bucket_size = data[op_type]['bucket_size']
            
            if hist and bucket_size:
                llc_hits = 0
                llc_misses = 0
                llc_hit_cycles = 0
                llc_miss_cycles = 0
                
                for i, count in enumerate(hist):
                    bucket_start = i * bucket_size
                    bucket_end = (i + 1) * bucket_size - 1
                    bucket_mid = (bucket_start + bucket_end) / 2
                    
                    if bucket_start < START_REMOTE_MISS:
                        llc_hits += count
                        llc_hit_cycles += count * bucket_mid
                    else:
                        llc_misses += count
                        llc_miss_cycles += count * bucket_mid
                
                data[op_type]['llc_hits'] = llc_hits
                data[op_type]['llc_misses'] = llc_misses
                data[op_type]['llc_hit_cycles'] = llc_hit_cycles
                data[op_type]['llc_miss_cycles'] = llc_miss_cycles
                
                # L1 hit cycles (assume 1 cycle per hit)
                data[op_type]['l1_hit_cycles'] = data[op_type]['l1_hits'] * 1
    
    except Exception as e:
        print(f"  Error reading {stats_file}: {e}")
        return None
    
    # Aggregate by LD/ST
    result = {
        'l1_ld_hits': 0, 'l1_st_hits': 0,
        'llc_ld_hits': 0, 'llc_st_hits': 0,
        'llc_ld_misses': 0, 'llc_st_misses': 0,
        'l1_ld_cycles': 0, 'l1_st_cycles': 0,
        'llc_ld_hit_cycles': 0, 'llc_st_hit_cycles': 0,
        'llc_ld_miss_cycles': 0, 'llc_st_miss_cycles': 0,
        'total_cycles': 0,
    }
    
    for op_type in ALL_OP_TYPES:
        main_type = OP_TYPE_MAPPING[op_type]
        if main_type == 'LD':
            result['l1_ld_hits'] += data[op_type]['l1_hits']
            result['llc_ld_hits'] += data[op_type]['llc_hits']
            result['llc_ld_misses'] += data[op_type]['llc_misses']
            result['l1_ld_cycles'] += data[op_type]['l1_hit_cycles']
            result['llc_ld_hit_cycles'] += data[op_type]['llc_hit_cycles']
            result['llc_ld_miss_cycles'] += data[op_type]['llc_miss_cycles']
        else:  # ST
            result['l1_st_hits'] += data[op_type]['l1_hits']
            result['llc_st_hits'] += data[op_type]['llc_hits']
            result['llc_st_misses'] += data[op_type]['llc_misses']
            result['l1_st_cycles'] += data[op_type]['l1_hit_cycles']
            result['llc_st_hit_cycles'] += data[op_type]['llc_hit_cycles']
            result['llc_st_miss_cycles'] += data[op_type]['llc_miss_cycles']
    
    result['total_cycles'] = (
        result['l1_ld_cycles'] + result['l1_st_cycles'] +
        result['llc_ld_hit_cycles'] + result['llc_st_hit_cycles'] +
        result['llc_ld_miss_cycles'] + result['llc_st_miss_cycles']
    )
    
    return result


def extract_ycsb_throughput(simerr_file):
    if not os.path.exists(simerr_file):
        return None

    import re
    pattern = re.compile(r'^lock_stl\s+.*\s+(\d+\.?\d*)$')
    try:
        with open(simerr_file, 'r') as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                m = pattern.match(line)
                if m:
                    try:
                        return float(m.group(1))
                    except ValueError:
                        continue
    except Exception:
        return None

    return None


def generate_suite_csv(suite):
    
    """Generate per-suite CSV (all_parsec.csv, all_splash.csv, all_phoenix.csv)"""
    csv_file = os.path.join(PLOTS_DIR, f"all_{suite}.csv")
    print(f"Generating {csv_file}...")
    
    suite_dir = os.path.join(OUTPUT_DIR, suite)
    if not os.path.isdir(suite_dir):
        print(f"  Warning: Suite directory not found: {suite_dir}")
        return 0
    
    # Collect reference times
    ref_times = {}
    
    for app_name in os.listdir(suite_dir):
        app_dir = os.path.join(suite_dir, app_name)
        if not os.path.isdir(app_dir):
            continue
        
        ref_stats = os.path.join(app_dir, REFERENCE_PROTOCOL, "stats.txt")
        ref_time = extract_sim_ticks(ref_stats)
        
        if ref_time and ref_time > 0:
            ref_times[app_name] = ref_time
    
    # Generate normalized data
    rows = []
    for app_name in os.listdir(suite_dir):
        app_dir = os.path.join(suite_dir, app_name)
        if not os.path.isdir(app_dir):
            continue
        
        if app_name not in ref_times:
            continue
        
        ref_time = ref_times[app_name]
        
        for protocol in PROTOCOLS:
            stats_file = os.path.join(app_dir, protocol, "stats.txt")
            sim_time = extract_sim_ticks(stats_file)
            
            if sim_time and sim_time > 0:
                norm_time = sim_time / ref_time
                rows.append({
                    'apps': app_name,
                    'protocol': protocol,
                    'time': norm_time,
                    'normtime': norm_time
                })
    
    # Write CSV
    with open(csv_file, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=['apps', 'protocol', 'time', 'normtime'])
        writer.writeheader()
        writer.writerows(rows)
    
    print(f"  {len(set(r['apps'] for r in rows))} applications processed")
    return len(set(r['apps'] for r in rows))


def generate_all_csv():
    """Generate combined CSV with LLC breakdown (all.csv)"""
    csv_file = os.path.join(PLOTS_DIR, "all.csv")
    print(f"Generating {csv_file}...")
    
    # Collect all data first
    all_data = []
    
    for suite in SUITES:
        suite_dir = os.path.join(OUTPUT_DIR, suite)
        if not os.path.isdir(suite_dir):
            continue
        
        for app_name in os.listdir(suite_dir):
            app_dir = os.path.join(suite_dir, app_name)
            if not os.path.isdir(app_dir):
                continue
            
            # Get reference data
            ref_stats = os.path.join(app_dir, REFERENCE_PROTOCOL, "stats.txt")
            ref_time = extract_sim_ticks(ref_stats)
            ref_hist = extract_histogram_stats(ref_stats)
            
            if not ref_time or ref_time == 0 or not ref_hist:
                continue
            
            ref_total_cycles = ref_hist['total_cycles']
            if ref_total_cycles == 0:
                ref_total_cycles = 1  # Avoid division by zero
            
            for protocol in PROTOCOLS:
                stats_file = os.path.join(app_dir, protocol, "stats.txt")
                sim_time = extract_sim_ticks(stats_file)
                hist_data = extract_histogram_stats(stats_file)
                
                if not sim_time or sim_time == 0 or not hist_data:
                    continue
                
                norm_time = sim_time / ref_time
                
                # Normalize cycle counts
                all_data.append({
                    'apps': app_name,
                    'protocol': protocol,
                    'time': sim_time,
                    'normtime': norm_time,
                    'L1 ld hits': hist_data['l1_ld_cycles'] / ref_total_cycles,
                    'L1 st hits': hist_data['l1_st_cycles'] / ref_total_cycles,
                    'LLC ld hits': hist_data['llc_ld_hit_cycles'] / ref_total_cycles,
                    'LLC st hits': hist_data['llc_st_hit_cycles'] / ref_total_cycles,
                    'LLC ld misses': hist_data['llc_ld_miss_cycles'] / ref_total_cycles,
                    'LLC st misses': hist_data['llc_st_miss_cycles'] / ref_total_cycles,
                })
    
    # Write CSV
    fieldnames = ['apps', 'protocol', 'time', 'normtime', 
                  'L1 ld hits', 'L1 st hits', 
                  'LLC ld hits', 'LLC st hits', 
                  'LLC ld misses', 'LLC st misses']
    
    with open(csv_file, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(all_data)
    
    app_count = len(set(r['apps'] for r in all_data))
    print(f"  {app_count} applications processed")
    return app_count


def generate_ycsb_csv():
    """Generate YCSB CSV files"""
    ycsb_dir = os.path.join(OUTPUT_DIR, "ycsb")
    
    if not os.path.isdir(ycsb_dir):
        print(f"YCSB directory not found: {ycsb_dir}")
        return
    
    # gem5-ycsb-all.csv - All workloads at 8 threads
    csv_all = os.path.join(PLOTS_DIR, "gem5-ycsb-all.csv")
    print(f"Generating {csv_all}...")
    
    # gem5-ycsb-scale.csv - Scaling experiments
    csv_scale = os.path.join(PLOTS_DIR, "gem5-ycsb-scale.csv")
    print(f"Generating {csv_scale}...")
    
    all_rows = []
    scale_rows = []
    
    for workload in os.listdir(ycsb_dir):
        workload_dir = os.path.join(ycsb_dir, workload)
        if not os.path.isdir(workload_dir):
            continue
        
        for protocol in os.listdir(workload_dir):
            protocol_dir = os.path.join(workload_dir, protocol)
            if not os.path.isdir(protocol_dir):
                continue
            
            for threads_dir_name in os.listdir(protocol_dir):
                if not threads_dir_name.startswith("threads_"):
                    continue
                
                try:
                    threads = int(threads_dir_name.replace("threads_", ""))
                except ValueError:
                    continue

                threads_dir = os.path.join(protocol_dir, threads_dir_name)
                
                # Try to extract throughput directly from simerr.txt (preferred)
                simerr_file = os.path.join(threads_dir, "simerr.txt")
                throughput = extract_ycsb_throughput(simerr_file)

                # Fallback: use simTicks from stats.txt and compute throughput
                if throughput is None:
                    stats_file = os.path.join(threads_dir, "stats.txt")
                    sim_time = extract_sim_ticks(stats_file)

                    if not sim_time or sim_time == 0:
                        continue

                    ops = 10000
                    output_file = os.path.join(threads_dir, "output.txt")
                    if os.path.exists(output_file):
                        try:
                            with open(output_file, 'r') as f:
                                for line in f:
                                    match = re.search(r'operations:\s*(\d+)', line)
                                    if match:
                                        ops = int(match.group(1))
                                        break
                        except:
                            pass

                    # Calculate throughput in Kops/s
                    # sim_time is in ticks, 1 tick = 1ps at 1THz
                    throughput = ops / (sim_time / 1e9)
                
                # Add to all CSV (only 8 threads)
                if threads == 8:
                    all_rows.append({
                        'apps': workload,
                        'protocol': protocol,
                        'threads': threads,
                        'throughput': throughput
                    })
                
                # Add to scale CSV (workloads A and B)
                if workload in ['A', 'B']:
                    scale_rows.append({
                        'apps': workload,
                        'protocol': protocol,
                        'threads': threads,
                        'cores': threads,
                        'throughput': throughput
                    })
    
    scale_rows.sort(key=lambda x: (x['apps'], x['protocol'], x['threads']))
    
    all_rows.sort(key=lambda x: (x['apps'], x['protocol']))

    # Write CSVs
    if all_rows:
        with open(csv_all, 'w', newline='') as f:
            writer = csv.DictWriter(f, fieldnames=['apps', 'protocol', 'threads', 'throughput'])
            writer.writeheader()
            writer.writerows(all_rows)
    
    if scale_rows:
        with open(csv_scale, 'w', newline='') as f:
            writer = csv.DictWriter(f, fieldnames=['apps', 'protocol', 'threads', 'cores', 'throughput'])
            writer.writeheader()
            writer.writerows(scale_rows)
    
    print(f"  YCSB CSV files generated")


def main():
    print("==============================================")
    print("Extracting simulation statistics")
    print("==============================================")
    print(f"Output dir: {OUTPUT_DIR}")
    print(f"Plots dir: {PLOTS_DIR}")
    print("==============================================")
    print()
    
    # Create plots directory
    os.makedirs(PLOTS_DIR, exist_ok=True)
    
    # Generate per-suite CSVs
    for suite in SUITES:
        generate_suite_csv(suite)
    
    # Generate combined CSV with LLC breakdown
    generate_all_csv()
    
    # Generate YCSB CSVs
    generate_ycsb_csv()
    
    print()
    print("==============================================")
    print(f"CSV files generated in: {PLOTS_DIR}")
    print("==============================================")
    
    # List generated files
    for f in sorted(os.listdir(PLOTS_DIR)):
        if f.endswith('.csv'):
            filepath = os.path.join(PLOTS_DIR, f)
            size = os.path.getsize(filepath)
            print(f"  {f} ({size} bytes)")
    
    print("==============================================")
    print()
    print("Next step: Run plot.sh to generate figures")
    print("  ./script/plot.sh --no-extract")


if __name__ == "__main__":
    main()
