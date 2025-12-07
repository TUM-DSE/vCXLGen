#!/usr/bin/env python3

import os
import sys
import csv
import shutil
from collections import defaultdict
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.ticker as ticker
import matplotlib as mpl


PHOENIX_DIR = "phoenix"
SPLASH_DIR = "splash"
PARSEC_DIR = "parsec"
OUTPUT_DIR = "breakdown_analysis"

PROTOCOL_DIRS = {
    "MOESI_no-lat": "MOESI_CMP_directory_edit_lat_10_MOESI_CMP_directory_edit",
    "MOESI_gem5": "MOESI_CMP_directory_edit_lat_140_MOESI_CMP_directory_edit",
    "MESI_MESI_MESI": "MESI_unord_lat_140_MESI_unord",
    "MESI_CXL_MESI": "MESI_unord_CXL_lat_140_MESI_unord_CXL"
}

start_remote_miss = 128  # LLC misses threshold
end_remote_miss = 850
granularity = 1

L1_HIT_LATENCY = 1      
LLC_HIT_LATENCY = 40    
LLC_MISS_LATENCY = 300  


SPECIFIC_APPS = [
    # Phoenix
    "phoenix/histogram",
    "phoenix/linear_regression",
    "phoenix/matrix_multiply",
    "phoenix/pca",
    "phoenix/string_match",
    "phoenix/word_count",
    "phoenix/kmeans",
    # Splash
    "splash/barnes",
    "splash/fmm",
    "splash/ocean-cont",
    "splash/ocean-ncont",
    "splash/radiosity",
    "splash/raytrace",
    "splash/water-nsquared",
    "splash/water-spatial",
    "splash/lu-ncont",
    "splash/lu-cont",
    # Parsec
    "parsec/streamcluster",
    "parsec/blackscholes",
    "parsec/bodytrack",
    "parsec/canneal",
    "parsec/dedup",
    "parsec/facesim",
    "parsec/ferret",
    "parsec/fluidanimate",
    "parsec/freqmine",
    "parsec/swaptions",
    "parsec/vips",
    "parsec/x264"
]

APP_NAMES = {
    # Phoenix Benchmarks
    "histogram": "histogram",
    "kmeans": "kmeans", 
    "linear_regression": "linear_regression",
    "matrix_multiply": "matrix_multiply",
    "pca": "pca",
    "string_match": "string_match",
    "word_count": "word_count",
    # Splash Benchmarks
    "barnes": "barnes",
    "fmm": "fmm",
    "ocean-cont": "ocean-cont",
    "ocean-ncont": "ocean-nc",
    "radiosity": "radiosity",
    "raytrace": "raytrace",
    "water-nsquared": "water-ns",
    "water-spatial": "water-sp",
    "lu-ncont": "lu-ncont",
    "lu-cont": "lu-cont",
    # Parsec Benchmarks
    "blackscholes": "blackscholes",
    "bodytrack": "bodytrack",
    "canneal": "canneal",
    "dedup": "dedup",
    "facesim": "facesim",
    "ferret": "ferret",
    "fluidanimate": "fluidanimate",
    "freqmine": "freqmine",
    "streamcluster": "streamcluster",
    "swaptions": "swaptions",
    "vips": "vips",
    "x264": "x264"
}

ALL_OP_TYPES = ['LD', 'ST', 'IFETCH', 'RMW_Read', 'Locked_RMW_Read']


OP_TYPE_MAPPING = {
    'LD': 'LD',
    'IFETCH': 'LD',  
    'ST': 'ST',
    'RMW_Read': 'ST',  
    'Locked_RMW_Read': 'ST'  
}

MAIN_OP_TYPES = ['LD', 'ST']

LATENCY_RANGES = [
    (0, start_remote_miss, "LLC Hit"),  
    (start_remote_miss, end_remote_miss, "LLC Miss"),  
    (end_remote_miss, float('inf'), "High Latency Miss")  
]



def get_app_display_name(app_dir):
    base_name = os.path.basename(app_dir)
    return APP_NAMES.get(base_name, base_name)  

def get_app_path(app_spec):
    
    parts = app_spec.split('/')
    if len(parts) != 2:
        print(f"Format error: {app_spec}.Must be 'suite/app'")
        return None
    
    suite, app = parts
    
    if suite.lower() == 'phoenix':
        base_dir = PHOENIX_DIR
    elif suite.lower() == 'splash':
        base_dir = SPLASH_DIR
    elif suite.lower() == 'parsec':
        base_dir = PARSEC_DIR
    else:
        print(f"Suite unknown: {suite}")
        return None
    
    app_path = os.path.join(base_dir, app)
    
    if not os.path.isdir(app_path):
        print(f"App not found: {app_path}")
        return None
    
    return app_path

def clean_output_directories():

    
    if os.path.exists(OUTPUT_DIR):
        shutil.rmtree(OUTPUT_DIR)
    
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    



def extract_hits_and_misses(stats_file):

    data = {}
    
    for op_type in ALL_OP_TYPES:
        data[op_type] = {
            'miss_bucket_size': None,
            'miss_max_bucket': None,
            'miss_samples': None,  
            'miss_mean': None,
            'miss_gmean': None,
            'miss_stdev': None,
            'miss_histogram': [],
            
            'l1_hits': None,  
            
            'llc_hits': 0,    
            'llc_misses': 0,  
            
            'l1_hit_cycles': 0,   
            'llc_hit_cycles': 0,  
            'llc_miss_cycles': 0,  
            'total_cycles': 0,    
        }
    
    try:
        with open(stats_file, 'r') as f:
            for line in f:
                for op_type in ALL_OP_TYPES:
                    if f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::bucket_size" in line:
                        data[op_type]['miss_bucket_size'] = int(line.split()[1])
                    
                    elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::max_bucket" in line:
                        data[op_type]['miss_max_bucket'] = int(line.split()[1])
                    
                    elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::samples" in line:
                        data[op_type]['miss_samples'] = int(line.split()[1])
                    
                    elif f"system.caches.RequestType.{op_type}.hit_latency_hist_seqr::samples" in line:
                        data[op_type]['l1_hits'] = int(line.split()[1])
                    
                    elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::mean" in line:
                        data[op_type]['miss_mean'] = float(line.split()[1])
                    elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::gmean" in line:
                        data[op_type]['miss_gmean'] = float(line.split()[1])
                    elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::stdev" in line:
                        data[op_type]['miss_stdev'] = float(line.split()[1])
                    
                    elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr |" in line:
                        values = []
                        parts = line.split('|')
                        for part in parts[1:-1]: 
                            if part.strip():
                                count = int(part.split()[0])
                                values.append(count)
                        data[op_type]['miss_histogram'] = values
        
        for op_type in ALL_OP_TYPES:
            hist = data[op_type]['miss_histogram']
            bucket_size = data[op_type]['miss_bucket_size']
            
            if hist and bucket_size:
                llc_hits = 0
                llc_misses = 0
                llc_hit_cycles = 0
                llc_miss_cycles = 0
                
                for i, count in enumerate(hist):
                    bucket_start = i * bucket_size
                    bucket_end = (i + 1) * bucket_size - 1
                    bucket_mid = (bucket_start + bucket_end) / 2  
                    
                    if bucket_start < start_remote_miss:
                        llc_hits += count
                        llc_hit_cycles += count * bucket_mid  
                    else:
                       
                        llc_misses += count
                        llc_miss_cycles += count * bucket_mid  
                
                data[op_type]['llc_hits'] = llc_hits
                data[op_type]['llc_misses'] = llc_misses
                data[op_type]['llc_hit_cycles'] = llc_hit_cycles
                data[op_type]['llc_miss_cycles'] = llc_miss_cycles
                
                if data[op_type]['l1_hits'] is not None:
                    data[op_type]['l1_hit_cycles'] = data[op_type]['l1_hits'] * L1_HIT_LATENCY
                
                data[op_type]['total_cycles'] = (data[op_type]['l1_hit_cycles'] + 
                                               data[op_type]['llc_hit_cycles'] + 
                                               data[op_type]['llc_miss_cycles'])
    
    except Exception as e:
        return None
    
    return data

def analyze_application(app_dir):

    app_name = get_app_display_name(app_dir)
    dir_name = os.path.basename(app_dir)
    
    protocol_data = {}
    all_protocols_available = True
    
    for protocol_label, dir_name in PROTOCOL_DIRS.items():
        stats_file = os.path.join(app_dir, dir_name, "stats.txt")
        
        if not os.path.exists(stats_file):
            all_protocols_available = False
            continue
        
        data = extract_hits_and_misses(stats_file)
        if not data:
            all_protocols_available = False
            continue
            
        protocol_data[protocol_label] = data
    
    if not all_protocols_available:
        return None
    
    result = {
        'app_name': app_name,
        'dir_name': dir_name,
    }
    
    for protocol_label in PROTOCOL_DIRS.keys():
        result[protocol_label] = protocol_data[protocol_label]
    
    return result

def calculate_total_latency(histogram, bucket_size):

    total_latency = 0.0
    
    for i, count in enumerate(histogram):
        if count == 0:
            continue
            
        bucket_start = i * bucket_size
        bucket_end = (i + 1) * bucket_size - 1
        latency = (bucket_start + bucket_end) / 2
        
        total_latency += latency * count
    
    return total_latency


def save_csv_for_breakdown_plot(all_results):

    csv_path = os.path.join(OUTPUT_DIR, "results-collection.csv")

    rows = []
    
    protocol_labels = list(PROTOCOL_DIRS.keys())
    
    for app_data in all_results:
        app_name = app_data['app_name']
        
        reference_protocol = "MOESI_gem5"  
        reference_total_cycles = 0
        
        for op_type in ALL_OP_TYPES:
            reference_total_cycles += app_data[reference_protocol][op_type]['total_cycles']
        
        for protocol_label in protocol_labels:
            total_cycles = 0
            for op_type in ALL_OP_TYPES:
                total_cycles += app_data[protocol_label][op_type]['total_cycles']
                
            if reference_total_cycles > 0:
                normtime = total_cycles / reference_total_cycles
            else:
                normtime = 1.0
                
            data = {
                'apps': app_name,
                'protocol': protocol_label,
                'time': total_cycles,
                'normtime': normtime
            }
            rows.append(data)
    
    with open(csv_path, 'w', newline='') as csvfile:
        fieldnames = ['apps', 'protocol', 'time', 'normtime']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    
    return csv_path

def save_detailed_csv(all_results):
   
    csv_path = os.path.join(OUTPUT_DIR, "detailed_breakdown.csv")
    
    rows = []
    for app_data in all_results:
        app_name = app_data['app_name']
        
        for op_type in ALL_OP_TYPES:
            for protocol_label in PROTOCOL_DIRS.keys():
                protocol_data = app_data[protocol_label][op_type]
                row = {
                    'application': app_name,
                    'operation': op_type,
                    'main_operation_type': OP_TYPE_MAPPING[op_type],  
                    'protocol': protocol_label,
                    'l1_hits': protocol_data['l1_hits'],
                    'l1_hit_cycles': protocol_data['l1_hit_cycles'],
                    'l1_misses': protocol_data['miss_samples'],
                    'llc_hits': protocol_data['llc_hits'],
                    'llc_hit_cycles': protocol_data['llc_hit_cycles'],
                    'llc_misses': protocol_data['llc_misses'],
                    'llc_miss_cycles': protocol_data['llc_miss_cycles'],
                    'total_cycles': protocol_data['total_cycles']
                }
                rows.append(row)
    
    with open(csv_path, 'w', newline='') as csvfile:
        fieldnames = ['application', 'operation', 'main_operation_type', 'protocol', 
                     'l1_hits', 'l1_hit_cycles', 'l1_misses', 'llc_hits', 
                     'llc_hit_cycles', 'llc_misses', 'llc_miss_cycles', 'total_cycles']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    
    return csv_path

def prepare_breakdown_data(all_results):

    breakdown_data = []
    
    categories = [
        "L1 ld hits", "L1 st hits",
        "LLC ld hits", "LLC st hits",
        "LLC ld misses", "LLC st misses",
        "remaining time"
    ]
    
    protocol_labels = list(PROTOCOL_DIRS.keys())
    
    for app_data in all_results:
        app_name = app_data['app_name']
        
        reference_protocol = "MOESI_gem5"  
        reference_total_cycles = 0
        
        for op_type in ALL_OP_TYPES:
            reference_total_cycles += app_data[reference_protocol][op_type]['total_cycles']
        
        for protocol_label in protocol_labels:
            ld_types = [op for op in ALL_OP_TYPES if OP_TYPE_MAPPING[op] == 'LD']
            ld_l1_cycles = sum(app_data[protocol_label][op]['l1_hit_cycles'] for op in ld_types)
            ld_llc_hit_cycles = sum(app_data[protocol_label][op]['llc_hit_cycles'] for op in ld_types)
            ld_llc_miss_cycles = sum(app_data[protocol_label][op]['llc_miss_cycles'] for op in ld_types)
            
            st_types = [op for op in ALL_OP_TYPES if OP_TYPE_MAPPING[op] == 'ST']
            st_l1_cycles = sum(app_data[protocol_label][op]['l1_hit_cycles'] for op in st_types)
            st_llc_hit_cycles = sum(app_data[protocol_label][op]['llc_hit_cycles'] for op in st_types)
            st_llc_miss_cycles = sum(app_data[protocol_label][op]['llc_miss_cycles'] for op in st_types)
            
            protocol_total_cycles = (ld_l1_cycles + ld_llc_hit_cycles + ld_llc_miss_cycles +
                                   st_l1_cycles + st_llc_hit_cycles + st_llc_miss_cycles)
            
            if reference_total_cycles > 0:
                normtime = protocol_total_cycles / reference_total_cycles
            else:
                normtime = 1.0
            
            if reference_total_cycles > 0:
                l1_ld_hits_norm = ld_l1_cycles / reference_total_cycles
                l1_st_hits_norm = st_l1_cycles / reference_total_cycles
                llc_ld_hits_norm = ld_llc_hit_cycles / reference_total_cycles
                llc_st_hits_norm = st_llc_hit_cycles / reference_total_cycles
                llc_ld_misses_norm = ld_llc_miss_cycles / reference_total_cycles
                llc_st_misses_norm = st_llc_miss_cycles / reference_total_cycles
                
                remaining_time_norm = max(0, normtime - l1_ld_hits_norm - l1_st_hits_norm - 
                                        llc_ld_hits_norm - llc_st_hits_norm - 
                                        llc_ld_misses_norm - llc_st_misses_norm)
            else:
                l1_ld_hits_norm = l1_st_hits_norm = llc_ld_hits_norm = llc_st_hits_norm = 0
                llc_ld_misses_norm = llc_st_misses_norm = remaining_time_norm = 0
            
            row = {
                'apps': app_name,
                'protocol': protocol_label,
                'L1 ld hits': l1_ld_hits_norm,
                'L1 st hits': l1_st_hits_norm,
                'LLC ld hits': llc_ld_hits_norm,
                'LLC st hits': llc_st_hits_norm,
                'LLC ld misses': llc_ld_misses_norm,
                'LLC st misses': llc_st_misses_norm,
                'remaining time': remaining_time_norm
            }
            breakdown_data.append(row)
    
    return breakdown_data



def create_breakdown_plot(breakdown_data, order):

    df = pd.DataFrame(breakdown_data)
    
    bar_edge_color = "black"
    colors = ['#33a02c', '#b2df8a', '#FF9C1F', '#FFC51F', '#1f78b4', '#a6cee3', '#fafafa']
    hatches = ("", "", "", "/", "/", "\\", "")
    
    columns = ["L1 ld hits", "L1 st hits",
               "LLC ld hits", "LLC st hits",
               "LLC ld misses", "LLC st misses",
               "remaining time"]
    
    labels = [r"$L$", r"$R$", r"$E$", r"$X$"]
    fulllabels = ["$MOESI$-110$ns$", "$MOESI$-450$ns$", "$MESI$-$Br$-450$ns$", "$CXL$-$Br$-450$ns$"]
    
    figsize = (12, 3)  
    
    order_prot = list(PROTOCOL_DIRS.keys())
    df["protocol"] = pd.Categorical(df["protocol"], order_prot, ordered=True)
    
    def do(title, df, order, text_points=[]):
        fig = plt.figure(figsize=figsize)
        ax = plt.subplot(111)
        
        df_others = df[~df["apps"].isin(order)]
        df = df[df["apps"].isin(order)]
        
        df_others = df_others.groupby(['protocol']).mean(numeric_only=True)
        df_others = df_others.reset_index()
        df_others["apps"] = "mean"
        
        df = pd.concat([df, df_others])
        
        df["apps"] = pd.Categorical(df["apps"], ["mean"]+list(order), ordered=True)
        df.sort_values(["apps"], inplace=True)
        
        df_bars = [g for _, g in df.groupby('protocol')]
        
        for index, df_bar in enumerate(df_bars):
            df_bar = df_bar[["apps"] + columns]
            
            df_bar.plot(
                kind="bar",
                linewidth=0.5,
                ylim=(0, 1.4),
                stacked=True,
                ax=ax,
                legend=False,
                figsize=figsize,
                edgecolor=bar_edge_color,
                color=colors,
                title=title,
            )
            
            df_bars[index] = df_bar
        
        trans = ax.get_xaxis_transform()
        
        n_df = len(df_bars)
        n_col = len(columns)
        
        drawn_texts = {}
        h, l = ax.get_legend_handles_labels()
        
        bar_width = 0.18  
        
        for i in range(0, n_df * n_col, n_col):
            for j, pa in enumerate(h[i:i + n_col]):
                for k, rect in enumerate(pa.patches):
                    label_ind = int(i / n_col)
                    rect.set_x(rect.get_x() + 1 / float(n_df + 2) * i / float(n_col))
                    if hatches:
                        rect.set_hatch(hatches[j] * 3)
                    rect.set_width(bar_width)

                    if labels and (k, label_ind) not in drawn_texts:
                        ax.text(
                            rect.get_x() + rect.get_width() / 2.0,  # x - in mezzo alla barra
                            -0.07,
                            labels[label_ind],
                            fontsize=6,
                            ha='center',
                            va='bottom',
                            transform=trans
                        )
                        drawn_texts[(k, label_ind)] = True

        h, l = ax.get_legend_handles_labels()
        n_df = len(df_bars)
        n_col = len(columns)

        l1 = ax.legend(
            h[:n_col],
            l[:n_col],
            loc=[1.005, 0.425],
            handlelength=0.7,
            labelspacing=0.3,
            edgecolor='white',
            fancybox=False,
            framealpha=1,
            fontsize=8
        )
        l1.get_frame().set_facecolor('white')

        if labels:
            slabels = ""
            stinynames = ""
            for i in range(0, n_df):
                slabels += fulllabels[i] + "\n"
                stinynames += labels[i] + "\n"
            ax.text(1.010, -0.09, stinynames, fontsize=8, transform=ax.transAxes)
            ax.text(1.030, -0.09, slabels, fontsize=8, transform=ax.transAxes)

        ax.add_artist(l1)
        
        ax.tick_params(
            labelcolor='black',
            which='major',
            direction='out',
            length=3,
            labelsize=8,
            right=False, top=False, bottom=False
        )
        ax.tick_params(
            labelcolor='black',
            which='minor',
            direction='out',
            length=0,
            labelsize=8,
            right=False, top=False, bottom=False
        )
        ax.tick_params(
            axis='x',
            pad=0,
        )
        
        ax.set_xticklabels(ax.xaxis.get_majorticklabels(), rotation=0)
        n_ind = len(df_bars[0].index)
        ax.set_xticks((np.arange(0, 2 * n_ind, 2) + 1 / float(len(df_bars) + 1)) / 2.)
        ax.set_xticklabels(df_bars[0]["apps"], rotation=0)
        ax.xaxis.set_tick_params(pad=7)
        
        for pos in ['top', 'bottom', 'right', 'left']:
            ax.spines[pos].set_edgecolor("black")
            
        ax.grid(visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
        ax.yaxis.set_major_locator(ticker.MultipleLocator(0.5))  
        ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.1)) 
        ax.grid(which='minor', visible=True, axis='y', linestyle='--', alpha=0.3, color='lightgray')
        ax.grid(visible=True, which='both', axis='y', zorder=0)
        
        ax.set_ylabel("Cache hits and misses\n(cumulated norm. time)", fontsize=10)
        ax.set_xlabel("", fontsize=0)
        
        v_line = 0 + 1 - 0.4
        v_line1 = v_line + 3
        ax.axvline(v_line, linewidth=0.9, color='grey', dashes=[3, 3])
        ax.axvline(v_line1, linewidth=0.9, color='grey', dashes=[3, 3])
        
        for point in text_points:
            ax.text(point[0], point[1], point[2], fontsize=8)
            
        ax.set_facecolor("white")
        ax.yaxis.label.set_color('black')
        ax.xaxis.label.set_color('black')
        ax.grid(
            color='#E0EEEE',  
            linewidth="0.6",
            linestyle="-",
        )
        ax.xaxis.grid(False)  
        
        ax.set_title(
            ax.get_title(),
            {
                'fontsize': 10,
                'fontweight': 'bold',
                'horizontalalignment': "center",
            },
            pad=0,
        )
        
        handles, previous_labels = ax.get_legend_handles_labels()
        l = ax.legend(
            title=None,
            loc=(0.0075, .79),
            frameon=True,
            ncol=2,
            labelspacing=0,
            columnspacing=1,
            borderpad=0,
            handlelength=0.7,
            fontsize=10,
            edgecolor='white',
            fancybox=False,
            framealpha=1,
            handles=handles,
            labels=["MOESI$\mathregular{_{110ns}}$", "MOESI$\mathregular{_{450ns}}$", "MESI-Br$\mathregular{_{450ns}}$", "CXL-Br$\mathregular{_{450ns}}$"]
        )
        l.get_frame().set_facecolor('#ffffff')
        
        if title != "PARSEC":
            ax.legend().remove()
            
        plt.subplots_adjust(left=0.07, right=0.86, top=0.90, bottom=0.14)
        
        # Salva il grafico
        plt.savefig(f"{OUTPUT_DIR}/gem5-breakdown-{title.lower() if title else 'all'}.pdf", dpi="figure", pad_inches=0.1, bbox_inches="tight")
        plt.savefig(f"{OUTPUT_DIR}/gem5-breakdown-{title.lower() if title else 'all'}.png", dpi=300, pad_inches=0.1, bbox_inches="tight")
        
        return fig, ax

    fig, ax = do("", df, order)
    
    return fig, ax


def main():
    clean_output_directories()
    
    all_results = []
    
    app_paths = []
    
    for app_spec in SPECIFIC_APPS:
        app_path = get_app_path(app_spec)
        if app_path:
            app_paths.append(app_path)
        
    
    if not app_paths:
        return
    
    
    for app_path in app_paths:
        app_name = os.path.basename(app_path)
        suite_name = os.path.basename(os.path.dirname(app_path))
        
        app_data = analyze_application(app_path)
        
        if app_data:
            all_results.append(app_data)
    
    if all_results:

        
        save_detailed_csv(all_results)
        
        csv_path = save_csv_for_breakdown_plot(all_results)
        
        breakdown_data = prepare_breakdown_data(all_results)
        
        all_apps = [app_data['app_name'] for app_data in all_results]
        

        ORDER = [
            "ferret",
            "fluidanimate",
            "dedup",
            "streamcluster",
            "word_count",
            "string_match",
            "pca",
            "linear_regression",
            "fmm",
            "matrix_multiply",
            "histogram",
            "barnes"
        ]
        
        filtered_order = [app for app in ORDER if app in all_apps]
if __name__ == "__main__":
    main()