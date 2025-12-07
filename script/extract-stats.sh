#!/usr/bin/env bash
#
# extract-stats.sh - Extract simulation statistics from gem5 outputs
#
# Generates CSV files in data/plots/ for plotting scripts
#
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DATA_DIR="${REPO_ROOT}/data"
OUTPUT_DIR="${DATA_DIR}/gem5.output"
PLOTS_DIR="${DATA_DIR}/plots"

# Benchmark suites
SUITES=("parsec" "splash" "phoenix")

# Protocol names as they appear in CSV files
PROTOCOLS=("MOESI_no-lat" "MOESI_gem5" "MESI_MESI_MESI" "MESI_CXL_MESI")

# Reference protocol for normalization
REFERENCE_PROTOCOL="MOESI_gem5"

echo "=============================================="
echo "Extracting simulation statistics"
echo "=============================================="
echo "Output dir: ${OUTPUT_DIR}"
echo "Plots dir: ${PLOTS_DIR}"
echo "=============================================="
echo ""

# Create plots directory
mkdir -p "${PLOTS_DIR}"

#------------------------------------------------------------------------------
# Extract simTicks from stats.txt
#------------------------------------------------------------------------------
extract_sim_ticks() {
    local stats_file="$1"
    if [[ -f "$stats_file" ]]; then
        local sim_ticks=$(grep "^simTicks" "$stats_file" | head -1 | awk '{print $2}')
        if [[ -n "$sim_ticks" ]]; then
            echo "${sim_ticks}"
        else
            echo ""
        fi
    else
        echo ""
    fi
}

#------------------------------------------------------------------------------
# Extract LLC statistics from stats.txt
#------------------------------------------------------------------------------
extract_llc_stats() {
    local stats_file="$1"
    if [[ -f "$stats_file" ]]; then
        # Extract LLC hit/miss statistics
        # Format: "LLC ld hits,LLC st hits,LLC ld misses,LLC st misses"
        local l2_ld_hits=$(grep "system.caches.l2_cntrl.*\.L2cache\.demand_hits.*::Load" "$stats_file" 2>/dev/null | awk '{sum+=$2} END {print sum+0}')
        local l2_st_hits=$(grep "system.caches.l2_cntrl.*\.L2cache\.demand_hits.*::Store" "$stats_file" 2>/dev/null | awk '{sum+=$2} END {print sum+0}')
        local l2_ld_misses=$(grep "system.caches.l2_cntrl.*\.L2cache\.demand_misses.*::Load" "$stats_file" 2>/dev/null | awk '{sum+=$2} END {print sum+0}')
        local l2_st_misses=$(grep "system.caches.l2_cntrl.*\.L2cache\.demand_misses.*::Store" "$stats_file" 2>/dev/null | awk '{sum+=$2} END {print sum+0}')
        
        echo "${l2_ld_hits},${l2_st_hits},${l2_ld_misses},${l2_st_misses}"
    else
        echo "0,0,0,0"
    fi
}

#------------------------------------------------------------------------------
# Extract L1 statistics from stats.txt
#------------------------------------------------------------------------------
extract_l1_stats() {
    local stats_file="$1"
    if [[ -f "$stats_file" ]]; then
        local l1_ld_hits=$(grep "system.caches.l1_cntrl.*\.L1Dcache\.demand_hits.*::Load" "$stats_file" 2>/dev/null | awk '{sum+=$2} END {print sum+0}')
        local l1_st_hits=$(grep "system.caches.l1_cntrl.*\.L1Dcache\.demand_hits.*::Store" "$stats_file" 2>/dev/null | awk '{sum+=$2} END {print sum+0}')
        
        echo "${l1_ld_hits},${l1_st_hits}"
    else
        echo "0,0"
    fi
}

#------------------------------------------------------------------------------
# Generate per-suite CSV (all_parsec.csv, all_splash.csv, all_phoenix.csv)
#------------------------------------------------------------------------------
generate_suite_csv() {
    local suite="$1"
    local csv_file="${PLOTS_DIR}/all_${suite}.csv"
    
    echo "Generating ${csv_file}..."
    
    # Write header
    echo "apps,protocol,time,normtime" > "$csv_file"
    
    local suite_dir="${OUTPUT_DIR}/${suite}"
    if [[ ! -d "$suite_dir" ]]; then
        echo "  Warning: Suite directory not found: ${suite_dir}"
        return
    fi
    
    # Collect reference times for normalization
    declare -A ref_times
    
    # First pass: collect reference protocol times
    for app_dir in "${suite_dir}"/*/; do
        [[ -d "$app_dir" ]] || continue
        local app_name=$(basename "$app_dir")
        
        local ref_stats="${app_dir}${REFERENCE_PROTOCOL}/stats.txt"
        local ref_time=$(extract_sim_ticks "$ref_stats")
        
        if [[ -n "$ref_time" && "$ref_time" != "0" ]]; then
            ref_times["$app_name"]="$ref_time"
        fi
    done
    
    # Second pass: generate normalized data
    local app_count=0
    for app_dir in "${suite_dir}"/*/; do
        [[ -d "$app_dir" ]] || continue
        local app_name=$(basename "$app_dir")
        
        # Skip if no reference time
        [[ -z "${ref_times[$app_name]:-}" ]] && continue
        local ref_time="${ref_times[$app_name]}"
        
        for protocol in "${PROTOCOLS[@]}"; do
            local stats_file="${app_dir}${protocol}/stats.txt"
            local sim_time=$(extract_sim_ticks "$stats_file")
            
            if [[ -n "$sim_time" && "$sim_time" != "0" ]]; then
                # Calculate normalized time
                local norm_time=$(echo "scale=15; ${sim_time} / ${ref_time}" | bc)
                echo "${app_name},${protocol},${norm_time},${norm_time}" >> "$csv_file"
            fi
        done
        
        app_count=$((app_count + 1))
    done
    
    echo "  ${app_count} applications processed"
}

#------------------------------------------------------------------------------
# Generate combined CSV with LLC breakdown (all.csv)
#------------------------------------------------------------------------------
generate_all_csv() {
    local csv_file="${PLOTS_DIR}/all.csv"
    
    echo "Generating ${csv_file}..."
    
    # Write header
    echo "apps,protocol,time,normtime,L1 ld hits,L1 st hits,LLC ld hits,LLC st hits,LLC ld misses,LLC st misses" > "$csv_file"
    
    # Collect reference times and LLC totals for normalization
    declare -A ref_times
    declare -A ref_llc_totals
    
    local total_apps=0
    
    # Process all suites
    for suite in "${SUITES[@]}"; do
        local suite_dir="${OUTPUT_DIR}/${suite}"
        [[ -d "$suite_dir" ]] || continue
        
        # First pass: collect reference protocol data
        for app_dir in "${suite_dir}"/*/; do
            [[ -d "$app_dir" ]] || continue
            local app_name=$(basename "$app_dir")
            
            local ref_stats="${app_dir}${REFERENCE_PROTOCOL}/stats.txt"
            local ref_time=$(extract_sim_ticks "$ref_stats")
            
            if [[ -n "$ref_time" && "$ref_time" != "0" ]]; then
                ref_times["$app_name"]="$ref_time"
                
                # Get LLC stats for normalization
                local llc_stats=$(extract_llc_stats "$ref_stats")
                IFS=',' read -r ld_hits st_hits ld_misses st_misses <<< "$llc_stats"
                local llc_total=$((ld_hits + st_hits + ld_misses + st_misses))
                ref_llc_totals["$app_name"]="$llc_total"
            fi
        done
        
        # Second pass: generate normalized data
        for app_dir in "${suite_dir}"/*/; do
            [[ -d "$app_dir" ]] || continue
            local app_name=$(basename "$app_dir")
            
            # Skip if no reference time
            [[ -z "${ref_times[$app_name]:-}" ]] && continue
            local ref_time="${ref_times[$app_name]}"
            local ref_llc="${ref_llc_totals[$app_name]:-1}"
            [[ "$ref_llc" == "0" ]] && ref_llc=1
            
            for protocol in "${PROTOCOLS[@]}"; do
                local stats_file="${app_dir}${protocol}/stats.txt"
                local sim_time=$(extract_sim_ticks "$stats_file")
                
                if [[ -n "$sim_time" && "$sim_time" != "0" ]]; then
                    # Calculate normalized time
                    local norm_time=$(echo "scale=15; ${sim_time} / ${ref_time}" | bc)
                    
                    # Get L1 and LLC stats
                    local l1_stats=$(extract_l1_stats "$stats_file")
                    local llc_stats=$(extract_llc_stats "$stats_file")
                    
                    # Normalize LLC stats
                    IFS=',' read -r l1_ld l1_st <<< "$l1_stats"
                    IFS=',' read -r llc_ld_h llc_st_h llc_ld_m llc_st_m <<< "$llc_stats"
                    
                    local l1_ld_norm=$(echo "scale=15; ${l1_ld} / ${ref_llc}" | bc)
                    local l1_st_norm=$(echo "scale=15; ${l1_st} / ${ref_llc}" | bc)
                    local llc_ld_h_norm=$(echo "scale=15; ${llc_ld_h} / ${ref_llc}" | bc)
                    local llc_st_h_norm=$(echo "scale=15; ${llc_st_h} / ${ref_llc}" | bc)
                    local llc_ld_m_norm=$(echo "scale=15; ${llc_ld_m} / ${ref_llc}" | bc)
                    local llc_st_m_norm=$(echo "scale=15; ${llc_st_m} / ${ref_llc}" | bc)
                    
                    echo "${app_name},${protocol},${sim_time},${norm_time},${l1_ld_norm},${l1_st_norm},${llc_ld_h_norm},${llc_st_h_norm},${llc_ld_m_norm},${llc_st_m_norm}" >> "$csv_file"
                fi
            done
            
            total_apps=$((total_apps + 1))
        done
    done
    
    echo "  ${total_apps} applications processed"
}

#------------------------------------------------------------------------------
# Generate YCSB CSV files
#------------------------------------------------------------------------------
generate_ycsb_csv() {
    local ycsb_dir="${OUTPUT_DIR}/ycsb"
    
    if [[ ! -d "$ycsb_dir" ]]; then
        echo "YCSB directory not found: ${ycsb_dir}"
        return
    fi
    
    # gem5-ycsb-all.csv - All workloads at 8 threads
    local csv_all="${PLOTS_DIR}/gem5-ycsb-all.csv"
    echo "Generating ${csv_all}..."
    echo "apps,protocol,threads,throughput" > "$csv_all"
    
    # gem5-ycsb-scale.csv - Scaling experiments (A and B)
    local csv_scale="${PLOTS_DIR}/gem5-ycsb-scale.csv"
    echo "Generating ${csv_scale}..."
    echo "apps,protocol,threads,cores,throughput" > "$csv_scale"
    
    for workload_dir in "${ycsb_dir}"/*/; do
        [[ -d "$workload_dir" ]] || continue
        local workload=$(basename "$workload_dir")
        
        for protocol_dir in "${workload_dir}"/*/; do
            [[ -d "$protocol_dir" ]] || continue
            local protocol=$(basename "$protocol_dir")
            
            for threads_dir in "${protocol_dir}"/threads_*/; do
                [[ -d "$threads_dir" ]] || continue
                local threads=$(basename "$threads_dir" | sed 's/threads_//')
                
                local stats_file="${threads_dir}/stats.txt"
                local sim_time=$(extract_sim_ticks "$stats_file")
                
                if [[ -n "$sim_time" && "$sim_time" != "0" ]]; then
                    # Extract operation count from output
                    local output_file="${threads_dir}/output.txt"
                    local ops=1000000  # Default 1M operations
                    if [[ -f "$output_file" ]]; then
                        local extracted_ops=$(grep -oP 'operations:\s*\K\d+' "$output_file" 2>/dev/null | head -1)
                        [[ -n "$extracted_ops" ]] && ops="$extracted_ops"
                    fi
                    
                    # Calculate throughput in Kops/s
                    # sim_time is in ticks, 1 tick = 1ps = 1e-12s at 2GHz
                    # throughput = ops / (sim_time * 1e-12) / 1000 = ops / (sim_time * 1e-9)
                    local throughput=$(echo "scale=3; ${ops} / (${sim_time} / 1000000000)" | bc)
                    
                    # Add to all CSV (only 8 threads)
                    if [[ "$threads" == "8" ]]; then
                        echo "${workload},${protocol},${threads},${throughput}" >> "$csv_all"
                    fi
                    
                    # Add to scale CSV (workloads A and B)
                    if [[ "$workload" == "A" || "$workload" == "B" ]]; then
                        echo "${workload},${protocol},${threads},${threads},${throughput}" >> "$csv_scale"
                    fi
                fi
            done
        done
    done
    
    echo "  YCSB CSV files generated"
}

#------------------------------------------------------------------------------
# Main execution
#------------------------------------------------------------------------------

# Generate per-suite CSVs
for suite in "${SUITES[@]}"; do
    generate_suite_csv "$suite"
done

# Generate combined CSV with LLC breakdown
generate_all_csv

# Generate YCSB CSVs
generate_ycsb_csv

echo ""
echo "=============================================="
echo "CSV files generated in: ${PLOTS_DIR}"
echo "=============================================="
ls -la "${PLOTS_DIR}"/*.csv 2>/dev/null || echo "No CSV files found"
echo "=============================================="
echo ""
echo "Next step: Run plot.sh to generate figures"
echo "  ./script/plot.sh --no-extract"
