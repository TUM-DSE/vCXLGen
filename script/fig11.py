import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

df_parsec = pd.read_csv("plots/all_parsec.csv", index_col=False)
df_splash = pd.read_csv("plots/all_splash.csv")
df_phoenix = pd.read_csv("plots/all_phoenix.csv")

PARSEC_ORDER = (
    "canneal",
    "bodytrack",
    "facesim",
    "vips",
    "raytrace",
    "x264",
    "blackscholes",
    "swaptions",
    "freqmine",
    "ferret",
    "fluidanimate",
    "dedup",
    "streamcluster",
)

PHOENIX_ORDER = (
    "kmeans",
    "word_count",
    "string_match",
    "linear_regression",     
    "pca",
    "matrix_multiply",
    "histogram",   
)

SPLASH_ORDER = (
    "raytrace",
    "cholesky",
    "radiosity",
    "lu-cont",
    "water-ns",
    "radix",
    "volrend",
    "volrend-npl",
    "fft",     
    "water-sp",
    "lu-ncont",
    "ocean-c",
    "fmm",
    "ocean-nc",
    "barnes",   
)

# Function to process benchmark data to get means
def process_benchmark_data(df, order):
    df["apps"] = pd.Categorical(df["apps"], list(order), ordered=True)
    df.sort_values(["apps"], inplace=True)
    df["protocol"] = pd.Categorical(df["protocol"])
    
    df_pivot = df.pivot_table(
                index="apps",
                columns="protocol",
                values="time",
                aggfunc=np.mean,
                margins=True,
                margins_name="mean"
            )
    
    # Return only the mean values
    return df_pivot.loc["mean"].copy()

# Function to create a modified combined plot with only specified applications
def create_modified_combined_plot():
    # Set the global font to a common serif font
    plt.rcParams['font.family'] = 'serif'
    
    # Process each benchmark suite to get the mean values
    parsec_means = process_benchmark_data(df_parsec, PARSEC_ORDER)
    splash_means = process_benchmark_data(df_splash, SPLASH_ORDER)
    phoenix_means = process_benchmark_data(df_phoenix, PHOENIX_ORDER)
    
    # Create a DataFrame for the combined plot (first with means)
    means_df = pd.DataFrame({
        'PARSEC_mean (13)': parsec_means,
        'PHOENIX_mean (7)': phoenix_means,
        'SPLASH_mean (15)': splash_means
    }).T
    
    # Selected applications (only fluidanimate and histogram as requested)
    selected_data = {}
    
    # Extract fluidanimate data from PARSEC
    df_temp = df_parsec[df_parsec["apps"] == "fluidanimate"].pivot_table(
        columns="protocol",
        values="time",
        aggfunc=np.mean
    )
    selected_data["fluidanimate"] = df_temp.iloc[0]
    
    # Extract histogram data from PHOENIX
    df_temp = df_phoenix[df_phoenix["apps"] == "histogram"].pivot_table(
        columns="protocol",
        values="time",
        aggfunc=np.mean
    )
    selected_data["histogram"] = df_temp.iloc[0]
    
    # Create DataFrame from selected apps data
    selected_df = pd.DataFrame(selected_data).T
    
    # Combine means and selected apps
    combined_df = pd.concat([means_df, selected_df])
    
    # Drop MOESI_no-lat column as requested
    combined_df = combined_df[["MOESI_gem5", "MESI_MESI_MESI", "MESI_CXL_MESI"]]
    
    # Create the plot
    fig, ax = plt.subplots(figsize=(7,2.5))
    combined_df.plot(
        kind="bar",
        ax=ax,
        linewidth=0.5,
        ylim=(0,1.7),
        edgecolor="#595959",
        width=0.6
    )
    
    ax.tick_params(
        labelcolor='black',
        which='major',
        direction='out',
        length=3,
        labelsize=13,
        right=False, top=False, bottom=False
    )
    
    # Format app names by replacing underscores with line breaks
    formatted_labels = [label.replace('_', '\n') for label in combined_df.index]
    ax.set_xticklabels(formatted_labels, rotation=0)
    
    # Adjust layout to give more space to labels
    plt.subplots_adjust(bottom=0.25)
    
    hatches = ("", "", r"\\",)  # Removed '//' since we no longer have MOESI_no-lat
    bars = ax.patches
    num_groups = len(ax.get_xticks())
    hatches = [h for h in hatches for n in range(num_groups)]
    
    for bar, hatch in zip(bars, hatches):
        if hatch:
            bar.set_hatch(hatch)
    
    for pos in ['top', 'bottom', 'right', 'left']:
        ax.spines[pos].set_edgecolor("black")
    
    ax.grid(visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
    ax.yaxis.set_major_locator(ticker.MultipleLocator(0.5))
    ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.1))
    ax.grid(which='minor', visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
    
    ax.set_ylabel("Normalized runtime\n(w.r.t. MOESI)", fontsize=13)
    ax.set_xlabel("", fontsize=0)
    
    # Add labels for benchmark suites and selected applications
    ax.text(1.0, 1.8, "Benchmark Suites", fontsize=13, ha='center', va='center', fontweight='bold')
    ax.text(3.5, 1.8, "Selected Applications", fontsize=13, ha='center', va='center', fontweight='bold')
    
    # Add a vertical line after the means section
    ax.axvline(2.5, linewidth=0.9, color='grey', dashes=[3, 3])
    
    ax.set_facecolor("white")
    
    handles, previous_labels = ax.get_legend_handles_labels()
    l = ax.legend(
        title=None,
        loc=(0.005,.77),
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
        # Updated labels to exclude MOESI_no-lat
        labels=["MOESI", "MESI-Br", "CXL-Br"]
    )
    l.get_frame().set_facecolor('#ffffff')
    
    plt.tight_layout()
    plt.savefig("gem5-modified-combined.pdf", dpi="figure", pad_inches=0.05, bbox_inches="tight")
    
    return ax

# Only run the modified combined plot function
if __name__ == "__main__":
    create_modified_combined_plot()