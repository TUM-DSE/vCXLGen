import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from matplotlib.patches import Rectangle

# Define the order for YCSB applications with correct English descriptions
YCSB_DESCRIPTIONS = {
    "A": "A",
    "B": "B",
    "C": "C",
    "D": "D",
    "F": "F"
}

# Full descriptions for the text box
YCSB_FULL_DESCRIPTIONS = {
    "A": "50% Read\n50% Update",
    "B": "95% Read\n5% Update",
    "C": "100% Read",
    "D": "95% Read\n5% Insert",
    "F": "50% Read\n50% RMW"
}

def plot_ycsb(file_path, metric='throughput', figsize=(7,2.5), save=True):
    # Read CSV file
    df_ycsb = pd.read_csv(file_path)
    
    # Create a copy of the DataFrame to avoid warnings
    df = df_ycsb.copy()
    
    # Get the order of apps from the dataframe
    apps_order = sorted(df['apps'].unique())
    
    # Create a new column with complete descriptions
    df['app_description'] = df['apps'].map(YCSB_DESCRIPTIONS)
    
    # Organize data in the correct order
    df["apps"] = pd.Categorical(df["apps"], list(apps_order), ordered=True)
    df.sort_values(["apps"], inplace=True)
    df["protocol"] = pd.Categorical(df["protocol"])
    
    # Pivot table on data (using throughput as the metric)
    df_pivot = df.pivot_table(
                index="app_description",  # Use the column with complete descriptions
                columns="protocol",
                values=metric,
                aggfunc=np.mean
            )
    
    # Reorder the pivot DataFrame based on the original app order
    ordered_indices = [YCSB_DESCRIPTIONS[app] for app in apps_order if app in YCSB_DESCRIPTIONS]
    df_pivot = df_pivot.reindex(ordered_indices)
    
    # Assume we have the same protocols as the original example
    protocols = ["MOESI_gem5", "MESI_MESI_MESI", "MESI_CXL_MESI"]
    available_protocols = [p for p in protocols if p in df_pivot.columns]
    
    df_pivot = df_pivot[available_protocols]
    
    # Explicit check for NaN or infinite values
    max_value = df_pivot.values.max()
    if np.isnan(max_value) or np.isinf(max_value):
        print(f"Warning: NaN or Inf values detected in the data. Setting the maximum limit to a default value.")
        y_max = 600 
    else:
        y_max = max_value * 1.2
    
    # Set the global font to a common serif font
    plt.rcParams['font.family'] = 'serif'
    
    # Create the plot with a safe ylim
    fig, ax = plt.subplots(figsize=figsize)
    df_pivot.plot(
                kind="bar",
                ax=ax,
                linewidth=0.5,
                ylim=(0, 450),  # Use the checked y_max value
                edgecolor="#595959",
    )
    
    ax.tick_params(
                labelcolor='black',
                which='major',
                direction='out',
                length=3,
                labelsize=11,
                right=False, top=False, bottom=False
            )
    ax.tick_params(
                labelcolor='black',
                which='minor',
                direction='out',
                length=0,
                labelsize=9,
                right=False, top=False, bottom=False
            )
    ax.tick_params(
                axis='x',
                pad=5,
            )
            
    # Set empty tick labels to remove the x-axis labels
    ax.set_xticklabels([], rotation=0)  # Empty list to remove all x-axis tick labels
    
    hatches = ( "", "", r"\\",)
    bars = ax.patches
    num_groups = len(ax.get_xticks())
    hatches = [h for h in hatches for n in range(num_groups)]
    
    for bar, hatch in zip(bars, hatches):
        if hatch:
            bar.set_hatch(hatch)
    
    for pos in ['top', 'bottom', 'right', 'left']:
        ax.spines[pos].set_edgecolor("black")
    
    ax.grid(visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
    
    # Set locators based on actual values (dynamically calculated)
    if not np.isnan(max_value) and not np.isinf(max_value):
        major_step = max(round(max_value / 5, -int(np.floor(np.log10(max_value)))+1), 0.5)
        minor_step = major_step / 5
        
        ax.yaxis.set_major_locator(ticker.MultipleLocator(major_step))
        ax.yaxis.set_minor_locator(ticker.MultipleLocator(minor_step))
    else:
        # Use default values if data is not valid
        ax.yaxis.set_major_locator(ticker.MultipleLocator(100))
        ax.yaxis.set_minor_locator(ticker.MultipleLocator(20))
    
    ax.grid(which='minor', visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
    ax.grid(visible=True, which='both', axis='y', zorder=0)
    
    # Adjust the Y label based on the metric type, using actual values
    if metric == 'throughput':
        ax.set_ylabel("Throughput (Kops/s)", fontsize=12)
    else:
        ax.set_ylabel(metric.capitalize(), fontsize=10)
    
    # No X axis label
    ax.set_xlabel("", fontsize=0)
    
    ax.xaxis.grid(False)
    
    handles, previous_labels = ax.get_legend_handles_labels()
    
    # Use the same legend labels as the original example
    legend_labels = ["MOESI", 
                    "MESI-Br", "CXL-Br"]
    
    # Make sure we have the correct number of labels
    legend_labels = legend_labels[:len(handles)]
    
    l = ax.legend(
        title=None,
        loc='upper right',
        frameon=True,
        ncol=3,
        labelspacing=0,
        columnspacing=1,
        borderpad=0.5,
        handlelength=1.0,
        fontsize=9,
        edgecolor='white',
        fancybox=False,
        framealpha=1,
        handles=handles,
        labels=legend_labels
    )
    l.get_frame().set_facecolor('#ffffff')
    
    # Add individual text boxes for each workload description
    # Get the apps that are actually in the data
    actual_apps = [app for app in apps_order if app in df['apps'].unique()]
    
    # Text box style properties
    props = dict(boxstyle='round', facecolor='white', alpha=0.9, edgecolor='gray', pad=0.3)
    
    # ---- CUSTOMIZABLE POSITIONS FOR WORKLOAD DESCRIPTION BOXES ----
    # Dictionary to store x, y positions for each workload box
    # Values are in axis coordinates (0-1 range)
    workload_box_positions = {
        'A': {'x': 0.1, 'y': 0.1},
        'B': {'x': 0.3, 'y': 0.1},
        'C': {'x': 0.5, 'y': 0.1},
        'D': {'x': 0.7, 'y': 0.1},
        'F': {'x': 0.9, 'y': 0.1}
    }
    # ---- END OF CUSTOMIZABLE POSITIONS ----
    
    # Size and style for workload boxes
    props = dict(boxstyle='round', facecolor='white', alpha=0.9, edgecolor='gray', pad=0.3)
    
    # Add a text box for each workload with a smaller font size
    for app in actual_apps:
        pos = workload_box_positions.get(app, {'x': 0.5, 'y': -0.3})  # Default position if not specified
        ax.text(pos['x'], pos['y'], YCSB_FULL_DESCRIPTIONS[app], 
                transform=ax.transAxes, fontsize=8,
                verticalalignment='center', horizontalalignment='center', 
                bbox=props)
    
    # Apply tight_layout and adjust to make room for the boxes at the bottom
    plt.tight_layout()
    plt.subplots_adjust(bottom=0.27)  # Adjust this value to make room for the boxes
    
    if save:
        plt.savefig(f"data/figures/gem5-ycsb-all.pdf", dpi="figure", pad_inches=0.05, bbox_inches="tight")
    
    return fig, ax

# Example usage 
if __name__ == "__main__":
    try:
        # Path to your CSV file
        csv_path = "data/plots/gem5-ycsb-all.csv"
        
        # Create the plot with the original dimensions
        fig, ax = plot_ycsb(csv_path, metric='throughput', figsize=(7, 2.5))
        
        plt.show()
        print("Plot created successfully!")
    except Exception as e:
        print(f"Error creating plot: {e}")