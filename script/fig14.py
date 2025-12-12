import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

# Definitions of YCSB descriptions
YCSB_DESCRIPTIONS = {
    "A": "A (50% read, 50% update)",
    "B": "B (95% read, 5% update)",
    "C": "C (100% read)",
    "D": "D (95% read, 5% insert)",
    "F": "F (50% read, 50% read-modify-write)"
}

def plot_ycsb_scaling(file_path, output_filename="data/figures/gem5-ycsb-scale.pdf", figsize=(6, 1.5)):

    # Leggi il file CSV
    df_ycsb_scale = pd.read_csv(file_path)
    
    # Split data for workloads A and B
    df_ycsb_scale_A = df_ycsb_scale[df_ycsb_scale['apps'] == 'A']
    df_ycsb_scale_B = df_ycsb_scale[df_ycsb_scale['apps'] == 'B']

    # Set the global font to a common serif font
    plt.rcParams['font.family'] = 'serif'

    # Create figure with two subplots
    fig = plt.figure(figsize=figsize)
    gs = fig.add_gridspec(1, 2, hspace=0.1, wspace=0.2)
    ax = gs.subplots(sharey="row", sharex="row")

    # Define markers and colors to use
    markers = ["o", "s", "v", "D", "X"]
    # Consistent color palette
    colors = ['#1f78b4', '#fdbf6f', '#ff7f00', '#add8e6']

    # Labels list for the legend
    legend_labels = ["MOESI", 
                     "MESI-Br", "CXL-Br"]
    
    # Plot data for YCSB-A
    for i, protocol in enumerate(df_ycsb_scale_A['protocol'].unique()):
        subset = df_ycsb_scale_A[df_ycsb_scale_A['protocol'] == protocol]
        ax[0].plot(subset['threads'], subset['throughput'], 
                  marker=markers[i], label=legend_labels[i] if i < len(legend_labels) else protocol,
                  color=colors[i], linewidth=1.5, markersize=5)
    
    # Plot data for YCSB-B
    for i, protocol in enumerate(df_ycsb_scale_B['protocol'].unique()):
        subset = df_ycsb_scale_B[df_ycsb_scale_B['protocol'] == protocol]
        ax[1].plot(subset['threads'], subset['throughput'], 
                  marker=markers[i], label=legend_labels[i] if i < len(legend_labels) else protocol,
                  color=colors[i], linewidth=1.5, markersize=5)
    
    # Configure the first subplot (YCSB-A)
    ax[0].spines["top"].set_visible(False)
    ax[0].spines["right"].set_visible(False)
    ax[0].set_axisbelow(True)
    ax[0].yaxis.grid(color='lightgray', linestyle='--', alpha=0.4)
    ax[0].set_ylabel("Throughput\n(Kops/s)", fontsize=12, labelpad=5)
    ax[0].set_xlabel("#Threads", fontsize=12, labelpad=-30)
    ax[0].tick_params(axis="both", labelsize=9)
    ax[0].set_ylim([0, 950])
    ax[0].yaxis.set_major_locator(ticker.MultipleLocator(200))
    ax[0].set_title(YCSB_DESCRIPTIONS['A'], y=1, x=0.51,pad=-10, fontsize=10, 
                  loc="center", backgroundcolor="white", fontweight='bold')
    
    # Configure the second subplot (YCSB-B)
    ax[1].spines["top"].set_visible(False)
    ax[1].spines["right"].set_visible(False)
    ax[1].set_axisbelow(True)
    ax[1].yaxis.grid(color='lightgray', linestyle='--', alpha=0.4)
    ax[1].set_ylabel("", fontsize=12, labelpad=5)  # No ylabel for second plot
    ax[1].set_xlabel("#Threads", fontsize=12, labelpad=-30)
    ax[1].tick_params(axis="both", labelsize=9)
    ax[1].yaxis.set_major_locator(ticker.MultipleLocator(200))
    ax[1].set_title(YCSB_DESCRIPTIONS['B'], y=1, pad=-10, fontsize=10, 
                   loc="center", backgroundcolor="white", fontweight='bold')
    
    # Create a shared legend for both subplots
    handles, labels = ax[1].get_legend_handles_labels()
    # Remove the legend from the first subplot
    ax[0].legend().remove()
    
    # Add a compact legend to the second subplot
    l = ax[1].legend(
        handles=handles,
        labels=labels,
        title=None,
        loc='upper right',
        bbox_to_anchor=(1.1, 1.2),
        frameon=False,
        ncol=4,
        fontsize=9,
        handlelength=1.0,
        markerscale=1.0
    )
    
    plt.tight_layout()
    plt.savefig(output_filename, format="pdf", pad_inches=0.05, bbox_inches="tight", dpi=300)
    print(f"Plot saved as {output_filename}")
    
    return fig, ax

# Example usage
if __name__ == "__main__":
    try:
        # Replace with the actual path to your CSV file
        plot_ycsb_scaling("data/plots/gem5-ycsb-scale.csv")
    except Exception as e:
        print(f"Error creating plot: {e}")