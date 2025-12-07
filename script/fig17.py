import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.ticker as ticker
import os

# Legge il file CSV
df = pd.read_csv("plots/all.csv", index_col=False)
print(f"File caricato con successo. Righe: {len(df)}")

# Impostazioni del grafico
bar_edge_color = "black"
colors = ['#FF9C1F', '#FFC51F', '#1f78b4', '#a6cee3']  # 4 colori per 4 componenti
hatches = ("", "", "/", "/")

# Solo componenti LLC
columns = ["LLC ld hits", "LLC st hits", "LLC ld misses", "LLC st misses"]

# Etichette dei protocolli
labels = [r"$L$", r"$R$", r"$E$", r"$X$"]
fulllabels = ["$MOESI$-110$ns$", "$MOESI$-450$ns$", "$MESI$-$Br$-450$ns$", "$CXL$-$Br$-450$ns$"]

figsize = (12, 2)

# Ordine delle applicazioni nel grafico
ORDER = (
    "ferret",
    "fluidanimate",
    "dedup",
    "linear_regression",
    "word_count",
    "string_match",
    "fmm",
    "matrix_multiply",
    "barnes",
    "histogram"
)

# Ordine dei protocolli
order_prot = ["MOESI_no-lat", "MOESI_gem5", "MESI_MESI_MESI", "MESI_CXL_MESI"]
df["protocol"] = pd.Categorical(df["protocol"], order_prot, ordered=True)

# Verifica e crea colonne mancanti se necessario
print("Colonne disponibili:", df.columns.tolist())
missing_columns = [col for col in columns if col not in df.columns]
if missing_columns:
    print(f"Colonne mancanti: {missing_columns}")
    for col in missing_columns:
        df[col] = df["normtime"] / len(columns)  # Distribuzione uniforme

# Crea un nuovo DataFrame con solo le colonne necessarie
df_reduced = df[["apps", "protocol"] + columns].copy()

# Crea un file di debug
with open("debug_normalization.txt", "w") as debug_file:
    debug_file.write("=== NORMALIZZAZIONE LLC ===\n\n")
    
    # Calcola i valori di riferimento per ogni app (somma LLC per MOESI_gem5)
    reference_values = {}
    for app in df_reduced["apps"].unique():
        app_data = df_reduced[df_reduced["apps"] == app]
        moesi_data = app_data[app_data["protocol"] == "MOESI_gem5"]
        
        if len(moesi_data) > 0:
            # Somma delle componenti LLC per MOESI_gem5
            llc_total = sum(moesi_data[col].iloc[0] for col in columns)
            reference_values[app] = llc_total
            
            # Scrivi nel file di debug
            debug_file.write(f"App: {app}\n")
            debug_file.write(f"  MOESI_gem5 LLC total: {llc_total:.6f}\n")
            debug_file.write("  MOESI_gem5 valori originali:\n")
            for col in columns:
                debug_file.write(f"    {col}: {moesi_data[col].iloc[0]:.6f}\n")
            
            # Normalizza MOESI_gem5 a 1.0 totale
            if llc_total > 0:
                debug_file.write("  MOESI_gem5 valori normalizzati:\n")
                for col in columns:
                    normalized_value = moesi_data[col].iloc[0] / llc_total
                    df_reduced.loc[moesi_data.index, col] = normalized_value
                    debug_file.write(f"    {col}: {normalized_value:.6f}\n")
            
            # Scrivi informazioni per altri protocolli
            debug_file.write("\n  Altri protocolli:\n")
            for protocol in ["MOESI_no-lat", "MESI_MESI_MESI", "MESI_CXL_MESI"]:
                prot_data = app_data[app_data["protocol"] == protocol]
                if len(prot_data) > 0:
                    debug_file.write(f"    {protocol} valori originali:\n")
                    for col in columns:
                        debug_file.write(f"      {col}: {prot_data[col].iloc[0]:.6f}\n")
            debug_file.write("\n")

    debug_file.write("\n=== NORMALIZZAZIONE ALTRI PROTOCOLLI ===\n\n")
    
    # Normalizza gli altri protocolli rispetto a MOESI_gem5
    for app in df_reduced["apps"].unique():
        if app in reference_values:
            debug_file.write(f"App: {app}\n")
            for protocol in ["MOESI_no-lat", "MESI_MESI_MESI", "MESI_CXL_MESI"]:
                protocol_data = df_reduced[(df_reduced["apps"] == app) & (df_reduced["protocol"] == protocol)]
                
                if len(protocol_data) > 0 and reference_values[app] > 0:
                    debug_file.write(f"  {protocol} valori normalizzati:\n")
                    idx = protocol_data.index[0]
                    for col in columns:
                        original_value = protocol_data[col].iloc[0]
                        normalized_value = original_value / reference_values[app]
                        df_reduced.at[idx, col] = normalized_value
                        debug_file.write(f"    {col}: {original_value:.6f} -> {normalized_value:.6f}\n")
            debug_file.write("\n")

# Salva il DataFrame normalizzato per verifica
df_reduced.to_csv("normalized_llc_data.csv", index=False)
print("DataFrame normalizzato salvato come 'normalized_llc_data.csv' per verifica")

def plot_breakdown(title, df, order, text_points=[]):
    # Crea il plot
    fig = plt.figure(figsize=figsize)
    ax = plt.subplot(111)
    
    # Filtra per applicazioni specificate in 'order'
    df_selected = df[df["apps"].isin(order)]
    df_others = df[~df["apps"].isin(order)]
    
    # Calcola la media per le altre applicazioni
    df_mean = df_others.groupby("protocol")[columns].mean().reset_index()
    df_mean["apps"] = "mean"
    
    # Debug: stampa la somma delle componenti LLC per ogni app e protocollo
    print("\nDEBUG: Somma delle componenti LLC (dovrebbe essere ≈1.0 per MOESI_gem5):")
    for app in order:
        app_data = df_selected[df_selected["apps"] == app]
        print(f"  App: {app}")
        for protocol in order_prot:
            protocol_data = app_data[app_data["protocol"] == protocol]
            if len(protocol_data) > 0:
                llc_sum = sum(protocol_data[col].iloc[0] for col in columns)
                print(f"    {protocol}: {llc_sum:.6f}")
    
    # Combina i dati selezionati con la media
    df_combined = pd.concat([df_selected, df_mean])
    
    # Ordina le applicazioni
    app_order = ["mean"] + list(order)
    df_combined["apps"] = pd.Categorical(df_combined["apps"], app_order, ordered=True)
    df_combined.sort_values(["apps"], inplace=True)
    
    # Crea i gruppi per protocollo
    df_bars = [g for _, g in df_combined.groupby("protocol")]
    
    # Crea il grafico a barre impilate per ciascun protocollo
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
            ylim=(0, 1.9)
        )
        df_bars[index] = df_bar
    
    # Aggiungi etichette dei protocolli sotto le barre
    trans = ax.get_xaxis_transform()
    n_df = len(df_bars)
    n_col = len(columns)
    
    # Posiziona le barre e applica stili
    drawn_texts = {}
    h, l = ax.get_legend_handles_labels()
    bar_width = 0.18
    
    for i in range(0, n_df * n_col, n_col):
        for j, pa in enumerate(h[i:i+n_col]):
            for k, rect in enumerate(pa.patches):
                label_ind = int(i / n_col)
                rect.set_x(rect.get_x() + 1 / float(n_df + 2) * i / float(n_col))
                if hatches:
                    rect.set_hatch(hatches[j] * 3)
                rect.set_width(bar_width)
                
                # Aggiungi etichette dei protocolli
                if labels and (k, label_ind) not in drawn_texts:
                    ax.text(
                        rect.get_x() + rect.get_width() / 2.0,
                        -0.07,
                        labels[label_ind],
                        fontsize=6,
                        ha='center',
                        va='bottom',
                        transform=trans
                    )
                    drawn_texts[(k, label_ind)] = True
    
    # Configura la legenda
    h, l = ax.get_legend_handles_labels()
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
    
    # Aggiungi nomi completi dei protocolli
    if labels:
        slabels = ""
        stinynames = ""
        for i in range(n_df):
            slabels += fulllabels[i] + "\n"
            stinynames += labels[i] + "\n"
        ax.text(1.010, -0.09, stinynames, fontsize=8, transform=ax.transAxes)
        ax.text(1.030, -0.09, slabels, fontsize=8, transform=ax.transAxes)
    
    ax.add_artist(l1)
    
    # Configura gli assi
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
    # ax.tick_params(axis='x', pad=7)
    
    # Configura la griglia
    ax.grid(visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
    ax.yaxis.set_major_locator(ticker.MultipleLocator(0.5))  
    ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.1))
    ax.grid(which='minor', visible=True, axis='y', linestyle='--', alpha=0.3, color='lightgray')
    ax.grid(visible=True, which='both', axis='y', zorder=0)
    ax.xaxis.grid(False)
    ax.set_xticklabels(df_bars[0]["apps"], rotation=0, ha='center')
    # Configura le etichette
    ax.set_ylabel("LLC hits and misses\nCumulative #cycles (norm.)", fontsize=8)
    ax.set_xlabel("", fontsize=0)
    
    # Aggiungi linee verticali
    v_line = 0 + 1 - 0.4
    v_line1 = v_line + 3
    ax.axvline(v_line, linewidth=0.9, color='grey', dashes=[3, 3])
    ax.axvline(v_line1, linewidth=0.9, color='grey', dashes=[3, 3])
    
    # Configura i bordi
    for pos in ['top', 'bottom', 'right', 'left']:
        ax.spines[pos].set_edgecolor("black")
    
    # Configura lo sfondo
    ax.set_facecolor("white")
    ax.yaxis.label.set_color('black')
    ax.xaxis.label.set_color('black')
    
    # Configura il titolo
    ax.set_title(
        title,
        {
            'fontsize': 10,
            'fontweight': 'bold',
            'horizontalalignment': "center",
        },
        pad=0
    )
    
    # Aggiungi la legenda
    handles, _ = ax.get_legend_handles_labels()
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
    
    # Configura il layout e salva
    plt.subplots_adjust(left=0.07, right=0.86, top=0.90, bottom=0.14)
    plt.savefig("gem5-breakdown.pdf", dpi=300, pad_inches=0.05, bbox_inches="tight")
    print(f"Grafico salvato come gem5-breakdown.pdf")
    
    return fig, ax

# Genera il grafico
plot_breakdown("", df_reduced, ORDER)