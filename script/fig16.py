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
    "radix",
    "cholesky",
    "radiosity",
    "fft",
    "volrend",
    "volrend-npl",     
    "water-sp",
    "water-ns",
    "lu-cont",
    "lu-ncont",
    "ocean-cont",
    "ocean-nc",
    "fmm",
    "barnes",   
)
    
def do(title, df, order, text_points=[]):
#for title,df in [("PARSEC",df_parsec), ("SPLASH",df_splash), ("PHOENIX",df_phoenix)]:
    
    #df = df_parsec
    #df.replace(to_replace="MESI_CXL_MESI", value="CXL-Br$\mathregular{_{450ns}}$", inplace=True)
    #df.replace(to_replace="MESI_MESI_MESI", value="MESI-Br$\mathregular{_{450ns}}$", inplace=True)
    #df.replace(to_replace="MOESI_no-lat", value="MOESI$\mathregular{_{110ns}}$", inplace=True)
    #df.replace(to_replace="MOESI_gem5", value="MOESI$\mathregular{_{450ns}}$", inplace=True)

    #df["apps"] = pd.Categorical(df["apps"])#, ordered=True)
    df["apps"] = pd.Categorical(df["apps"], list(order), ordered=True)
    df.sort_values(["apps"], inplace=True)
    #df_parsec.name.cat.rename_categories(list(PARSEC_ORDER), inplace=True)
    df["protocol"] = pd.Categorical(df["protocol"])# ordered=True)
    #df.sort_values(["protocol"], inplace=True)
    
    #df = df.loc[:, ["MOESI$\mathregular{_{110ns}}$", "MOESI$\mathregular{_{450ns}}$", "MESI-Br$\mathregular{_{450ns}}$", "CXL-Br$\mathregular{_{450ns}}$"]]
    
    #title="PARSEC"
    df = df.pivot_table(
                index="apps",
                columns="protocol",
                values="time",
                #aggfunc=gmean,   #np.mean,
                aggfunc=np.mean,
                margins=True,
                margins_name="mean"
            )
    df.drop(columns="mean", inplace=True)
    df = df[["MOESI_no-lat", "MOESI_gem5", "MESI_MESI_MESI", "MESI_CXL_MESI"]]
    ax = df.plot(
                kind="bar",
                figsize=(12,2),
                linewidth=0.5,
                ylim=(0,1.6),
                #edgecolor="black",
                edgecolor="#595959",
                #color=['#a6cee3', '#1f78b4', '#33a02c', '#b2df8a',  '#E8F7DA', '#e31a1c', '#fdbf6f'],
                title=title,
                #**kwargs
    )
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
                pad=-1,
            )
    ax.set_xticklabels(ax.xaxis.get_majorticklabels(), rotation=0)
    #hatches = ("//////", "", "", r"\\\\\\", "//////",)
    hatches = ("//", "", "", r"\\", "//",)
    bars = ax.patches
    # num_groups = int(len(bars) / len(self.hatches))
    num_groups = len(ax.get_xticks())
    hatches = [h for h in hatches for n in range(num_groups)]
    for bar, hatch in zip(bars, hatches):
        if hatch:
            bar.set_hatch(hatch)
            # bar.set_ec("black")
    for pos in ['top', 'bottom', 'right', 'left']:
        ax.spines[pos].set_edgecolor("black")
    ax.grid(visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
    ax.yaxis.set_major_locator(ticker.MultipleLocator(0.5))  # Ticks maggiori a 0, 1, 2
    ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.1))  # Ticks minori ogni 0.1
    ax.grid(which='minor', visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
    ax.grid(visible=True, which='both', axis='y', zorder=0)
    
    ax.set_ylabel("Normalized runtime\n(w.r.t. $\mathregular{MOESI_{450ns}}$)", fontsize=10)
    ax.set_xlabel("", fontsize=0)
    v_line=len(df.index)-1-0.4
    ax.axvline(v_line, linewidth=0.9, color='grey', dashes=[3, 3])
    for point in text_points:
        ax.text(point[0], point[1], point[2], fontsize=8)
    ax.set_facecolor("white")
    ax.yaxis.label.set_color('black')
    ax.xaxis.label.set_color('black')
    ax.grid(
                color='#E0EEEE',  # azure2 from R
                linewidth="0.6",
                linestyle="-",  # solid line
            )
    ax.xaxis.grid(False)  # disable vertical lines
    ax.set_title(
                ax.get_title(),
                {
                    'fontsize': 10,
                    'fontweight': 'bold',
                    'horizontalalignment': "center",
                },
                pad=-10,
            )
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
        labels=["MOESI$\mathregular{_{110ns}}$", "MOESI$\mathregular{_{450ns}}$", "MESI-Br$\mathregular{_{450ns}}$", "CXL-Br$\mathregular{_{450ns}}$"]
    )
    l.get_frame().set_facecolor('#ffffff')
    #ax.legend(labels=["MOESI$\mathregular{_{110ns}}$", "MOESI$\mathregular{_{450ns}}$", "MESI-Br$\mathregular{_{450ns}}$", "CXL-Br$\mathregular{_{450ns}}$"])
    if title != "PARSEC":
        ax.legend().remove()
    
    
    #plt.plot(bbox_inches="tight", pad_inches=0.0, dpi="figure")
    plt.savefig("gem5-"+title.lower()+".pdf", dpi="figure", pad_inches=0.05, bbox_inches="tight")

do("PARSEC", df_parsec, PARSEC_ORDER)
do("Splash", df_splash, SPLASH_ORDER, [(13.65,1.475,"2.12")])
do("Phoenix", df_phoenix, PHOENIX_ORDER, [(5.9,1.475,"2.16")])