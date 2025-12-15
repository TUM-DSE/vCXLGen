import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.ticker as ticker
import os


# Get the directory where this script is located
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
DATA_DIR = os.path.join(REPO_ROOT, "data")
PLOTS_DIR = os.path.join(DATA_DIR, "plots")
FIGURES_DIR = os.path.join(DATA_DIR, "figures")

# Ensure figures directory exists
os.makedirs(FIGURES_DIR, exist_ok=True)
# Set serif font globally (similar to Times New Roman)
plt.rcParams['font.family'] = 'serif'
plt.rcParams['font.size'] = 12  # Increase default font size to 12

# Read the CSV file
df = pd.read_csv(os.path.join(PLOTS_DIR, "all.csv"), index_col=False)
print(f"File loaded successfully. Rows: {len(df)}")

# Plot settings
bar_edge_color = "black"
colors = ['#fdbf11', '#ffe48d', '#33a02c', '#99e194']  # Yellow and green
hatches = ("", "", "/", "/")

# Only LLC components
columns = ["LLC ld hits", "LLC st hits", "LLC ld misses", "LLC st misses"]

# Protocol labels
labels = [r"$R$", r"$E$", r"$X$"]  
fulllabels = ["$MOESI$", "$MESI$-$Br$", "$CXL$-$Br$"]  # Removed MOESI-110ns

figsize = (7, 2.5)

# Order of applications in the plot - only keep fluidanimate and histogram
ORDER = (
    "fluidanimate",
    "histogram"
)

# Order of protocols - remove MOESI_no-lat
order_prot = ["MOESI_gem5", "MESI_MESI_MESI", "MESI_CXL_MESI"]
df["protocol"] = pd.Categorical(df["protocol"], order_prot, ordered=True)

# Filter out MOESI_no-lat
df = df[df["protocol"].isin(order_prot)]

# Verify and create missing columns if necessary
print("Available columns:", df.columns.tolist())
missing_columns = [col for col in columns if col not in df.columns]
if missing_columns:
    print(f"Missing columns: {missing_columns}")
    for col in missing_columns:
        df[col] = df["normtime"] / len(columns)  # Uniform distribution

# Create a new DataFrame with only the necessary columns
df_reduced = df[["apps", "protocol"] + columns].copy()

def plot_breakdown(title, df, order, text_points=[]):
    # Create the plot
    fig = plt.figure(figsize=figsize)
    ax = plt.subplot(111)
    
    # Filter for specifically ordered applications
    df_selected = df[df["apps"].isin(order)]
    
    # Calculate the mean for all other applications (just one mean)
    df_others = df[~df["apps"].isin(order)]
    df_mean = df_others.groupby("protocol")[columns].mean().reset_index()
    df_mean["apps"] = "mean"
    
    # Debug: print the sum of LLC components for each app and protocol
    print("\nDEBUG: Sum of LLC components (should be ≈1.0 for MOESI_gem5):")
    for app in order:
        app_data = df_selected[df_selected["apps"] == app]
        print(f"  App: {app}")
        for protocol in order_prot:
            protocol_data = app_data[app_data["protocol"] == protocol]
            if len(protocol_data) > 0:
                llc_sum = sum(protocol_data[col].iloc[0] for col in columns)
                print(f"    {protocol}: {llc_sum:.6f}")
    
    # Combine selected data with the mean
    df_combined = pd.concat([df_mean, df_selected])
    
    # Sort applications
    app_order = ["mean"] + list(order)
    df_combined["apps"] = pd.Categorical(df_combined["apps"], app_order, ordered=True)
    df_combined.sort_values(["apps"], inplace=True)
    
    # Create groups by protocol
    df_bars = [g for _, g in df_combined.groupby("protocol")]
    
    # MODIFICATION: Make bars narrower by reducing bar_width
    bar_width = 0.2  # Reduced from 0.2 to 0.15
    
    # Create stacked bar chart for each protocol
    for index, df_bar in enumerate(df_bars):
        df_bar.plot(
            x="apps",
            y=columns,
            kind="bar",
            stacked=True,
            ax=ax,
            legend=False,
            color=colors,
            edgecolor=bar_edge_color,
            linewidth=0.5,
            ylim=(0, 1.5)
        )
        df_bars[index] = df_bar
    
    # Add protocol labels below the bars
    trans = ax.get_xaxis_transform()
    n_df = len(df_bars)
    n_col = len(columns)
    
    # Position bars and apply styles
    drawn_texts = {}
    h, l = ax.get_legend_handles_labels()
    
    # Store positions of the 'E' protocol labels for later reference
    e_label_positions = []
    
    for i in range(0, n_df * n_col, n_col):
        for j, pa in enumerate(h[i:i+n_col]):
            for k, rect in enumerate(pa.patches):
                label_ind = int(i / n_col)
                rect.set_x(rect.get_x() + 1 / float(n_df + 2) * i / float(n_col))
                if hatches:
                    rect.set_hatch(hatches[j] * 3)
                rect.set_width(bar_width)
                
                # Add protocol labels (if desired)
                if labels and (k, label_ind) not in drawn_texts:
                    # Calculate the protocol label x position
                    protocol_x = rect.get_x() + rect.get_width() / 2.0
                    ax.text(
                        protocol_x,
                        -0.07,
                        labels[label_ind],
                        fontsize=8,
                        ha='center',
                        va='bottom',
                        transform=trans
                    )
                    drawn_texts[(k, label_ind)] = True
                    
                    # Store the position of the 'E' label (protocol index 1)
                    if label_ind == 1:
                        e_label_positions.append(protocol_x)
    
    # Configure legend
    h, l = ax.get_legend_handles_labels()
    l1 = ax.legend(
        h[:n_col],
        ["Ld hits", "St hits", "Ld misses", "St misses"],
        loc=[1.01, 0.40],
        handlelength=0.7,
        labelspacing=0.3,
        edgecolor='white',
        fancybox=False,
        framealpha=1,
        fontsize=10
    )
    l1.get_frame().set_facecolor('white')
    
    # Add full protocol names
    if labels:
        slabels = ""
        stinynames = ""
        for i in range(n_df):
            slabels += fulllabels[i] + "\n"
            stinynames += labels[i] + "\n"
        ax.text(1.02, -0.05, stinynames, fontsize=10, transform=ax.transAxes)
        ax.text(1.07, -0.05, slabels, fontsize=10, transform=ax.transAxes)
    
    ax.add_artist(l1)
    
    # Configure axes
    ax.tick_params(
        labelcolor='black',
        which='major',
        direction='out',
        length=3,
        labelsize=13,
        right=False, top=False, bottom=False
    )
    ax.tick_params(
        labelcolor='black',
        which='minor',
        direction='out',
        length=0,
        labelsize=13,
        right=False, top=False, bottom=False
    )
    
    # Configure grid
    ax.grid(visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
    ax.yaxis.set_major_locator(ticker.MultipleLocator(0.5))  
    ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.1))
    ax.grid(which='minor', visible=True, axis='y', linestyle='--', alpha=0.3, color='lightgray')
    ax.grid(visible=True, which='both', axis='y', zorder=0)
    ax.xaxis.grid(False)
    n_ind = len(df_bars[0].index)

    # --- MANUAL POSITIONING OF X-AXIS LABELS ---

    # Remove the auto-generated x ticks
    ax.set_xticks([])
    
    # Define your manual labels
    manual_labels = ["mean", "fluidanimate", "histogram"]
    
    # MODIFICATION: Position the labels directly under the 'E' protocol labels
    for idx, label in enumerate(manual_labels):
        if idx < len(e_label_positions):
            ax.text(
                e_label_positions[idx],  # Use the stored 'E' label x-positions
                -0.25,  # Slightly lower than the protocol labels
                label,
                fontsize=13,
                ha='center', 
                va='center',
                transform=ax.transData
            )
    
    # Configure x-axis tick padding (if needed)
    ax.xaxis.set_tick_params(pad=7)    
    
    # Configure axis labels
    ax.set_ylabel("LLC hits and misses\nAcc. #cycles (norm)", fontsize=13)
    ax.set_xlabel("", fontsize=0)
    
    # Add vertical lines to separate groups (if desired)
    v_line = 0 + 1 - 0.4
    ax.axvline(v_line, linewidth=0.9, color='grey', dashes=[3, 3])
    
    # Configure borders
    for pos in ['top', 'bottom', 'right', 'left']:
        ax.spines[pos].set_edgecolor("black")
    
    # Configure background
    ax.set_facecolor("white")
    ax.yaxis.label.set_color('black')
    ax.xaxis.label.set_color('black')
    
    # Adjust layout and save - increase bottom space for multi-line labels
    # plt.subplots_adjust(left=0.14, right=0.55, top=0.90, bottom=0.24)  # Increased bottom margin
    out_path = os.path.join(FIGURES_DIR, "fig12.pdf")
    plt.savefig(out_path, dpi=300, pad_inches=0.05, bbox_inches="tight")
    print(f"Plot saved as {out_path}")
    
    return fig, ax

# Generate the plot
plot_breakdown("", df_reduced, ORDER)