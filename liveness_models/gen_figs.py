#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
from datetime import datetime
import matplotlib.pyplot as plt

plt.style.use('default')
plt.style.use('tableau-colorblind10') 
# plt.style.use('seaborn-v0_8-pastel') 
# Custom color scheme with shades of blue
custom_colors = [
    '#2171b5',  # dark blue
    '#6baed6',  # medium blue
    '#c6dbef',  # light blue
]
custom_colors = [
    (0.12156862745098039, 0.47058823529411764, 0.7058823529411765),
    (0.6509803921568628, 0.807843137254902, 0.8901960784313725),  
]
plt.rcParams['axes.prop_cycle'] = plt.cycler(color=custom_colors)

# Columns #

c_approx_mem_GB = "Verification Memory"
c_max_mem_GB = "Maximum measured memory usage for check"
c_cc_mem_GB = "Compiler Memory"
c_mc_mem_GB = "Rumur/Murphi Memory"
c_mc_time = "Rumur/Murphi Time"
c_cc_time = "Compiler Time"
c_init_time = "Initialization"
c_explore_time = "Exploration"
c_other = "Initialization + Exploration + Liveness (usr+sys time)"
c_verif_time = "Verification Time"

c_live_time = "Extended Liveness Check"
c_OB_reprod_time = "OB Reproduction Check"

###########

# Read the main results CSV
df_main = pd.read_csv('results.csv', comment='#')
df_incomplete = pd.read_csv('incomplete.csv', comment='#')

df = pd.concat([df_main, df_incomplete], ignore_index=True)

df = df.sort_values(by=['check'], key=lambda x: x.map(lambda y: (y == 'FullMurphi', y == 'FullRumurLive', y)))
df = pd.concat([df[df['check'].str.contains('CompModel')], df[df['check'].str.contains('CompModel') == False]])

last_data_load = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

# Fill NAs
df['exploration_start'].fillna(0.0)
df['exploration_end'].fillna(df["reported_time"])

# Conversions

df["approx_mem"] = df["states"] * df["state_size"]
df["max_mem"] = df["max_mem_kbytes"] * 1024

df.loc[df['incomplete'] , 'approx_mem'] += df.loc[df['incomplete'] , 'queue'] * df.loc[df['incomplete'] , 'state_size']

df[c_approx_mem_GB] = df["approx_mem"] / 1073741824
df[c_max_mem_GB] = df["max_mem"] / 1073741824 

df[c_cc_mem_GB] = df["cc_max_mem_kbytes"] * 1024/ 1073741824 
df[c_mc_mem_GB] = df["mc_max_mem_kbytes"] * 1024/ 1073741824 

df[c_mc_time] = (df["mc_usr_time"] + df["mc_sys_time"]) / 60
df[c_cc_time] = (df["cc_usr_time"] + df["cc_sys_time"]) / 60

df[c_init_time] = df["exploration_start"] / 60
df[c_explore_time] = (df["exploration_end"] - df["exploration_start"]) / 60
df[c_live_time] = (df["reported_time"] - df["exploration_end"]) / 60
df[c_OB_reprod_time] = 0.0

df.loc[df['incomplete'] & df['liveness_states_remaining'].notna(), c_live_time] += (df.loc[df['incomplete'] & df['liveness_states_remaining'].notna(), 'liveness_states_remaining'] / df.loc[df['incomplete'] & df['liveness_states_remaining'].notna(), 'liveness_state_step'] * df.loc[df['incomplete'] & df['liveness_states_remaining'].notna(), 'liveness_time_step'] ) / 60

# Move c_live_time to c_OB_reprod_time for rows where "check" contains "EQ"
df.loc[df['check'].str.contains('EQ'), c_OB_reprod_time] = df.loc[df['check'].str.contains('EQ'), c_live_time]
df.loc[df['check'].str.contains('EQ'), c_live_time] = 0.0

df[c_verif_time] = df[c_init_time] + df[c_explore_time] + df[c_OB_reprod_time]

df[c_other] = ((df["usr_time"] + df["sys_time"]) / 60)

df['setup'] = df['setup'].str.replace('/', '\n')

# df.loc[df['incomplete'] , 'setup'] = df.loc[df['incomplete'] , 'setup'].str.replace('\n', '*\n')
df.loc[df['incomplete'] , 'check'] += "*"
# df.loc[df['incomplete'] & df['liveness_states_remaining'].notna(), 'setup'] = df.loc[df['incomplete'] & df['liveness_states_remaining'].notna(), 'setup'].str.replace('*\n', '**\n')
df.loc[df['incomplete'] & df['liveness_states_remaining'].notna(), 'check'] += "*"


# Remove max_mem from murphi, it is not useful
df.loc[df['mc'] == "mu", 'max_mem'] = None
df.loc[df['mc'] == "mu", c_max_mem_GB] = None


# # Paper Graphs

# In[103]:


from matplotlib.patches import Rectangle


print(f"Last data load: {last_data_load}")

extra1 = Rectangle((0, 0), 1, 1, fc="w", fill=False, edgecolor='none', linewidth=0)
extra2 = Rectangle((0, 0), 1, 1, fc="w", fill=False, edgecolor='none', linewidth=0)

df_mcr = df[df['setup'].str.startswith('MESIxCXLxRCC')]
df_mcr_2cc = df_mcr[df_mcr['setup'].str.endswith('2CC')]
df_mcr_3cc = df_mcr[df_mcr['setup'].str.endswith('3CC')]

df_mmm = df[df['setup'].str.startswith('MESIxMESIxMESI')]
df_mmm_2cc = df_mmm[df_mmm['setup'].str.endswith('2CC')]
df_mmm_3cc = df_mmm[df_mmm['setup'].str.endswith('3CC')]

dfa = df_mcr_3cc

dfa.loc[dfa['check'].str.endswith('*'), c_approx_mem_GB] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_mc_mem_GB] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_cc_mem_GB] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_verif_time] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_live_time] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_mc_time] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_cc_time] = 0

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(7, 4.2))
plt.rcParams.update({'font.size': 11})

# bar_width = 0.175
bar_width = 0.25
y_positions = [0,1,2,3,4,5,6.4,7.8]


bar1 = ax1.barh([y + bar_width for y in y_positions], dfa[c_approx_mem_GB], height=bar_width, label="$Full Mur\phi$")
bar2 = ax1.barh(y_positions, dfa[c_mc_mem_GB], height=bar_width, label=c_mc_mem_GB, color='none', edgecolor="grey" ,hatch="//")
bar3 = ax1.barh([y - bar_width for y in y_positions], dfa[c_cc_mem_GB], height=bar_width, label=c_cc_mem_GB, color='none', edgecolor="grey" ,hatch="\\\\")

ax1.spines[['right', 'top']].set_visible(False)
ax1.set_yticks(y_positions)
ax1.set_yticklabels(reversed(["$Mur\phi$\nFull System", "$Rumur$\nFull System", "$CC_{CXL} \sqsubseteq b^{CXL}_{RCC}$", "$b^{CXL}_{RCC} \sqsubseteq CC_{CXL}$", "$CC_{CXL} \sqsubseteq b^{CXL}_{MESI}$", "$b^{CXL}_{MESI} \sqsubseteq CC_{CXL}$", "Comp. RCC", "Comp. MESI"]))

ax1.set_ylabel("")
ax1.set_xlabel("Memory (GB)", fontsize=13)
ax1.xaxis.label.set_ha("right")
ax1.xaxis.label.set_va("bottom")
ax1.xaxis.set_label_coords(1.0, 0.0)
# legend1 = ax1.legend([extra1, bar1, extra2, bar2, bar3], ["$\it{Runtime}$", "Verification", "$\it{Compiletime}$", "Rumur/Murphi", "GCC"], loc="lower right")
# for i, text in enumerate(legend1.get_texts()):
#     if i in [0, 2]:
#         text.set_x(-28)
# plt.title(dfa["setup"].iloc[0].replace('\n', ' '))s
plt.tight_layout()

# Set xlim based on the maximum from the rows which have "incomplete" set to false
max_value = 80 # dfa[dfa['incomplete'] == False][[c_approx_mem_GB, c_mc_mem_GB, c_cc_mem_GB]].sum(axis=1).max()
ax1.set_xlim(0, max_value * 1.05)

# max_value = dfa[[c_approx_mem_GB, c_mc_mem_GB, c_cc_mem_GB]].sum(axis=1).max()
# ax1.set_xlim(0, max_value * 1.05)


for y_pos, label in zip([0, 1.3, 2.7],  ["Deadlock Freedom ↓", "Extended Liveness (EL) ↓", "Comp. Checks (EL) ↓"]):
    if 0 < y_pos < 3:
        ax1.axhline(y=y_positions[-1] + 0.8 - y_pos, color='darkslategrey', linestyle='--', linewidth=0.5)

    ax1.text(max_value * 1.04 , y_positions[-1] + 0.8 - y_pos - 0.05, label, verticalalignment='top', horizontalalignment="right", color='darkslategrey', fontsize=11)

ax1.set_ylim(ymax=y_positions[-1] + 0.8)

i = 1
for _, row in dfa.iterrows():
    if row['incomplete']:
        print(i)
        ax1.text(0, y_positions[-i], " ✖ OOM ", color='black', verticalalignment='center', horizontalalignment="left", fontsize=11)
        i += 1

# for i, row in dfa.iterrows():
#     if row['incomplete']:
#         ax.text(max_value * 1.09, i - 22 + bar_width, "⚡ OOM ", color='firebrick', verticalalignment='center', horizontalalignment="right", path_effects=[path_effects.withStroke(linewidth=1.5, foreground='white')])

# Plot the second set of bars first
bars3 = ax2.barh(y_positions, dfa[c_verif_time], height=0.3, label=c_verif_time, edgecolor=custom_colors[0])
bars5 = ax2.barh(y_positions, dfa[c_live_time], left=dfa[c_verif_time], height=0.3, label=c_live_time, edgecolor=custom_colors[1])

# Plot the first set of bars next to the second set
bars1 = ax2.barh(y_positions, dfa[c_mc_time], left=dfa[c_init_time] + dfa[c_explore_time] + dfa[c_live_time] + dfa[c_OB_reprod_time], height=0.3, label=c_mc_time, color='none', edgecolor="grey" ,hatch="//")
bars2 = ax2.barh(y_positions, dfa[c_cc_time], left=dfa[c_init_time] + dfa[c_explore_time] + dfa[c_live_time] + dfa[c_OB_reprod_time] + dfa[c_mc_time], height=0.3, label=c_cc_time, color='none', edgecolor="grey", hatch="\\\\")

ax2.set_ylabel("")
ax2.set_xlabel("Time (min)", fontsize=13)
ax2.xaxis.label.set_ha("right")
ax2.xaxis.label.set_va("bottom")
ax2.xaxis.set_label_coords(1.0, 0.0)
# legend2 = ax2.legend([extra1, extra2, bars3, bars1, bars5, bars2], ["$\it{Runtime}:$", "$\it{Compiletime}:$", "Verification", "Rumur/Murphi", "Extended Liveness", "GCC"], loc="lower right", bbox_to_anchor=(1, 1), ncol=3)
legend2 = ax2.legend([extra1, extra2, bars3, bars1, bars5, bars2], ["$\it{Runtime}:$", "$\it{Compiletime}:$", "Verification", "Rumur/Murphi", "Extended Liveness", "GCC"], loc="lower right", bbox_to_anchor=(1, 1), ncol=3)
for i, text in enumerate(legend2.get_texts()):
    if i in [0, 1]:
        # text.set_x(-28)
        pass
legend2.get_frame().set_linewidth(0)
plt.tight_layout()
# plt.title(dfa["setup"].iloc[0].replace('\n', ' '))

# Set xlim based on the maximum from the rows which have "incomplete" set to false
max_value = dfa[dfa['incomplete'] == False][[c_verif_time, c_live_time, c_mc_time, c_cc_time]].sum(axis=1).max()
ax2.set_xlim(0, max_value * 1.1)

# Set xlim based on the maximum from all rows without liveness check time
# max_value = dfa[[c_verif_time, c_mc_time, c_cc_time]].sum(axis=1).max()
# ax.set_xlim(0, max_value * 1.1)
ax2.set_ylim(ymax=y_positions[-1] + 0.8)

for y_pos, label in zip([0, 1.3, 2.7],  ["Deadlock Freedom ↓", "Extended Liveness (EL) ↓", "Comp. Checks (EL) ↓"]):
# for y_pos, label in zip([0, 1.2, 2.4],  ["Deadlock Freedom ↓", "Extended Liveness (EL) ↓", "Comp. Checks (EL) ↓"]):
    if 0 < y_pos < 3:
        ax2.axhline(y=y_positions[-1] + 0.8 - y_pos, color='darkslategrey', linestyle='--', linewidth=0.5)

    ax2.text(max_value * 1.09 , y_positions[-1] + 0.8 - y_pos - 0.05, label, verticalalignment='top', horizontalalignment="right", color='darkslategrey', fontsize=11)

i = 1
for _, row in dfa.iterrows():
    if row['incomplete']:
        ax2.text(0, y_positions[-i], " ✖ OOM ", color='black', verticalalignment='center', horizontalalignment="left", fontsize=11)
        i += 1


ax2.spines[['right', 'top']].set_visible(False)
ax2.set_yticklabels([])
ax2.set_yticks([])
plt.subplots_adjust(wspace=0.02)
fig.savefig('../output/liveness/liveness-big.pdf', transparent=True, dpi=600)
fig.savefig('../output/liveness/liveness-big.png', transparent=True, dpi=600)

print(dfa[['check', c_approx_mem_GB, c_mc_mem_GB, c_cc_mem_GB, c_verif_time, c_live_time, c_mc_time, c_cc_time]])


# In[ ]:


from matplotlib.patches import Rectangle


print(f"Last data load: {last_data_load}")

extra1 = Rectangle((0, 0), 1, 1, fc="w", fill=False, edgecolor='none', linewidth=0)
extra2 = Rectangle((0, 0), 1, 1, fc="w", fill=False, edgecolor='none', linewidth=0)

df_mcr = df[df['setup'].str.startswith('MESIxCXLxRCC')]
df_mcr_2cc = df_mcr[df_mcr['setup'].str.endswith('2CC')]
df_mcr_3cc = df_mcr[df_mcr['setup'].str.endswith('3CC')]

df_mmm = df[df['setup'].str.startswith('MESIxMESIxMESI')]
df_mmm_2cc = df_mmm[df_mmm['setup'].str.endswith('2CC')]
df_mmm_3cc = df_mmm[df_mmm['setup'].str.endswith('3CC')]

dfa = df_mcr_2cc

dfa.loc[dfa['check'].str.endswith('*'), c_approx_mem_GB] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_mc_mem_GB] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_cc_mem_GB] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_verif_time] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_live_time] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_mc_time] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_cc_time] = 0

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(7, 3.6))
plt.rcParams.update({'font.size': 11})

# bar_width = 0.175
bar_width = 0.25
y_positions = [0,1,2,3,4,5,6.4,7.8]

bar1 = ax1.barh([y + bar_width for y in y_positions], dfa[c_approx_mem_GB], height=bar_width, label="$Full Mur\phi$")
bar2 = ax1.barh(y_positions, dfa[c_mc_mem_GB], height=bar_width, label=c_mc_mem_GB, color='none', edgecolor="grey" ,hatch="//")
bar3 = ax1.barh([y - bar_width for y in y_positions], dfa[c_cc_mem_GB], height=bar_width, label=c_cc_mem_GB, color='none', edgecolor="grey" ,hatch="\\\\")

ax1.spines[['right', 'top']].set_visible(False)
ax1.set_yticks(y_positions)
ax1.set_yticklabels(reversed(["$Mur\phi$\nFull System", "$Rumur$\nFull System", "$CC_{CXL} \sqsubseteq b^{CXL}_{RCC}$", "$b^{CXL}_{RCC} \sqsubseteq CC_{CXL}$", "$CC_{CXL} \sqsubseteq b^{CXL}_{MESI}$", "$b^{CXL}_{MESI} \sqsubseteq CC_{CXL}$", "Comp. RCC", "Comp. MESI"]))

ax1.set_ylabel("")
ax1.set_xlabel("Memory (GB)", fontsize=13)
ax1.xaxis.label.set_ha("right")
ax1.xaxis.label.set_va("bottom")
ax1.xaxis.set_label_coords(1.0, 0.0)
# legend1 = ax1.legend([extra1, bar1, extra2, bar2, bar3], ["$\it{Runtime}$", "Verification", "$\it{Compiletime}$", "Rumur/Murphi", "GCC"], loc="lower right")
# for i, text in enumerate(legend1.get_texts()):
#     if i in [0, 2]:
#         text.set_x(-28)
# plt.title(dfa["setup"].iloc[0].replace('\n', ' '))s
plt.tight_layout()

# Set xlim based on the maximum from the rows which have "incomplete" set to false
max_value = 80 #dfa[dfa['incomplete'] == False][[c_approx_mem_GB, c_mc_mem_GB, c_cc_mem_GB]].sum(axis=1).max()
ax1.set_xlim(0, max_value * 1.05)

# max_value = dfa[[c_approx_mem_GB, c_mc_mem_GB, c_cc_mem_GB]].sum(axis=1).max()
# ax1.set_xlim(0, max_value * 1.05)


for y_pos, label in zip([0, 1.3, 2.7],  ["Deadlock Freedom ↓", "Extended Liveness (EL) ↓", "Comp. Checks (EL) ↓"]):
    if 0 < y_pos < 3:
        ax1.axhline(y=y_positions[-1] + 0.8 - y_pos, color='darkslategrey', linestyle='--', linewidth=0.5)

    ax1.text(max_value * 1.04 , y_positions[-1] + 0.8 - y_pos - 0.05, label, verticalalignment='top', horizontalalignment="right", color='darkslategrey', fontsize=11)

ax1.set_ylim(ymax=y_positions[-1] + 0.8)

for i, row in dfa.iterrows():
    if row['incomplete']:
        ax1.text(0, y_positions[i - 22], " ✖ OOM ", color='black', verticalalignment='center', horizontalalignment="left", fontsize=11)

# for i, row in dfa.iterrows():
#     if row['incomplete']:
#         ax.text(max_value * 1.09, i - 22 + bar_width, "⚡ OOM ", color='firebrick', verticalalignment='center', horizontalalignment="right", path_effects=[path_effects.withStroke(linewidth=1.5, foreground='white')])

# Plot the second set of bars first
bars3 = ax2.barh(y_positions, dfa[c_verif_time], height=0.3, label=c_verif_time, edgecolor=custom_colors[0])
bars5 = ax2.barh(y_positions, dfa[c_live_time], left=dfa[c_verif_time], height=0.3, label=c_live_time, edgecolor=custom_colors[1])

# Plot the first set of bars next to the second set
bars1 = ax2.barh(y_positions, dfa[c_mc_time], left=dfa[c_init_time] + dfa[c_explore_time] + dfa[c_live_time] + dfa[c_OB_reprod_time], height=0.3, label=c_mc_time, color='none', edgecolor="grey" ,hatch="//")
bars2 = ax2.barh(y_positions, dfa[c_cc_time], left=dfa[c_init_time] + dfa[c_explore_time] + dfa[c_live_time] + dfa[c_OB_reprod_time] + dfa[c_mc_time], height=0.3, label=c_cc_time, color='none', edgecolor="grey", hatch="\\\\")

ax2.set_ylabel("")
ax2.set_xlabel("Time (min)", fontsize=13)
ax2.xaxis.label.set_ha("right")
ax2.xaxis.label.set_va("bottom")
ax2.xaxis.set_label_coords(1.0, 0.0)
# legend2 = ax2.legend([extra1, extra2, bars3, bars1, bars5, bars2], ["$\it{Runtime}:$", "$\it{Compiletime}:$", "Verification", "Rumur/Murphi", "Extended Liveness", "GCC"], loc="lower center", bbox_to_anchor=(-0.2, 1), ncol=3)
# for i, text in enumerate(legend2.get_texts()):
#     if i in [0, 1]:
#        text.set_x(-28)
plt.tight_layout()
# plt.title(dfa["setup"].iloc[0].replace('\n', ' '))

# Set xlim based on the maximum from the rows which have "incomplete" set to false
max_value = dfa[dfa['incomplete'] == False][[c_verif_time, c_live_time, c_mc_time, c_cc_time]].sum(axis=1).max()
ax2.set_xlim(0, max_value * 1.1)

# Set xlim based on the maximum from all rows without liveness check time
# max_value = dfa[[c_verif_time, c_mc_time, c_cc_time]].sum(axis=1).max()
# ax.set_xlim(0, max_value * 1.1)
ax2.set_ylim(ymax=y_positions[-1] + 0.8)

for y_pos, label in zip([0, 1.3, 2.7],  ["Deadlock Freedom ↓", "Extended Liveness (EL) ↓", "Comp. Checks (EL) ↓"]):
    if 0 < y_pos < 3:
        ax2.axhline(y=y_positions[-1] + 0.8 - y_pos, color='darkslategrey', linestyle='--', linewidth=0.5)

    ax2.text(max_value * 1.09 , y_positions[-1] + 0.8 - y_pos - 0.05, label, verticalalignment='top', horizontalalignment="right", color='darkslategrey', fontsize=11)

for i, row in dfa.iterrows():
    if row['incomplete']:
        ax2.text(0, y_positions[i - 22], " ✖ OOM ", color='black', verticalalignment='center', horizontalalignment="left", fontsize=11)


ax2.spines[['right', 'top']].set_visible(False)
ax2.set_yticklabels([])
ax2.set_yticks([])
plt.subplots_adjust(wspace=0.02)
fig.savefig('../output/liveness/liveness-small.pdf', transparent=True, dpi=600)
fig.savefig('../output/liveness/liveness-small.png', transparent=True, dpi=600)


print(dfa[['check', c_approx_mem_GB, c_mc_mem_GB, c_cc_mem_GB, c_verif_time, c_live_time, c_mc_time, c_cc_time]])

total_time = dfa[~dfa['check'].str.contains("Full")][[c_verif_time, c_live_time, c_mc_time, c_cc_time]].sum().sum()
print(f"Total time for rows not containing 'Full' in 'check': {total_time}")

total_time = dfa[~dfa['check'].str.contains("Full")][[c_mc_time, c_cc_time]].sum().sum()
print(f"Total compile time for rows not containing 'Full' in 'check': {total_time}")

total_time = dfa[~dfa['check'].str.contains("Full")][[c_verif_time, c_live_time]].sum().sum()
print(f"Total verification time for rows not containing 'Full' in 'check': {total_time}")


# In[111]:


from matplotlib.patches import Rectangle


print(f"Last data load: {last_data_load}")

extra1 = Rectangle((0, 0), 1, 1, fc="w", fill=False, edgecolor='none', linewidth=0)
extra2 = Rectangle((0, 0), 1, 1, fc="w", fill=False, edgecolor='none', linewidth=0)

df_mcr = df[df['setup'].str.startswith('MESIxCXLxRCC')]
df_mcr_2cc = df_mcr[df_mcr['setup'].str.endswith('2CC')]
df_mcr_3cc = df_mcr[df_mcr['setup'].str.endswith('3CC')]

df_mmm = df[df['setup'].str.startswith('MESIxMESIxMESI')]
df_mmm_2cc = df_mmm[df_mmm['setup'].str.endswith('2CC')]
df_mmm_3cc = df_mmm[df_mmm['setup'].str.endswith('3CC')]

dfa = df_mmm_3cc

# dfa.loc[dfa['check'].str.endswith('*'), c_approx_mem_GB] = 0
# dfa.loc[dfa['check'].str.endswith('*'), c_mc_mem_GB] = 0
# dfa.loc[dfa['check'].str.endswith('*'), c_cc_mem_GB] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_verif_time] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_live_time] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_mc_time] = 0
dfa.loc[dfa['check'].str.endswith('*'), c_cc_time] = 0

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(7, 3))
plt.rcParams.update({'font.size': 11})


bar_width = 0.25
y_positions = [3,4,5,6.4,7.8]

bar1 = ax1.barh([y + bar_width for y in y_positions], dfa[c_approx_mem_GB], height=bar_width, label="$Full Mur\phi$")
bar2 = ax1.barh(y_positions, dfa[c_mc_mem_GB], height=bar_width, label=c_mc_mem_GB, color='none', edgecolor="grey" ,hatch="//")
bar3 = ax1.barh([y - bar_width for y in y_positions], dfa[c_cc_mem_GB], height=bar_width, label=c_cc_mem_GB, color='none', edgecolor="grey" ,hatch="\\\\")

ax1.spines[['right', 'top']].set_visible(False)
ax1.set_yticks(y_positions)
ax1.set_yticklabels(reversed(["$Mur\phi$\nFull System", "$Rumur$\nFull System", "$CC_{MESI} \sqsubseteq b^{MESI}_{MESI}$", "$b^{MESI}_{MESI} \sqsubseteq CC_{MESI}$", "Comp. MESI"]))

ax1.set_ylabel("")
ax1.set_xlabel("Memory (GB)", fontsize=13)
ax1.xaxis.label.set_ha("right")
ax1.xaxis.label.set_va("bottom")
ax1.xaxis.set_label_coords(1.0, 0.0)
# legend1 = ax1.legend([extra1, bar1, extra2, bar2, bar3], ["$\it{Runtime}$", "Verification", "$\it{Compiletime}$", "Rumur/Murphi", "GCC"], loc="lower right")
# for i, text in enumerate(legend1.get_texts()):
#     if i in [0, 2]:
#         text.set_x(-28)
# plt.title(dfa["setup"].iloc[0].replace('\n', ' '))s
plt.tight_layout()

# Set xlim based on the maximum from the rows which have "incomplete" set to false
max_value = 80 # dfa[[c_approx_mem_GB, c_mc_mem_GB, c_cc_mem_GB]].sum(axis=1).max()
ax1.set_xlim(0, max_value * 1.05)

# max_value = dfa[[c_approx_mem_GB, c_mc_mem_GB, c_cc_mem_GB]].sum(axis=1).max()
# ax1.set_xlim(0, max_value * 1.05)


for y_pos, label in zip([0, 1.3, 2.7],  ["Deadlock Freedom ↓", "Extended Liveness (EL) ↓", "Comp. Checks (EL) ↓"]):
    if 0 < y_pos < 3:
        ax1.axhline(y=y_positions[-1] + 0.8 - y_pos, color='darkslategrey', linestyle='--', linewidth=0.5)

    ax1.text(max_value * 1.04 , y_positions[-1] + 0.8 - y_pos - 0.05, label, verticalalignment='top', horizontalalignment="right", color='darkslategrey', fontsize=11)

ax1.set_ylim(ymax=y_positions[-1] + 0.8)


# Plot the second set of bars first
bars3 = ax2.barh(y_positions, dfa[c_verif_time], height=0.3, label=c_verif_time, edgecolor=custom_colors[0])
bars5 = ax2.barh(y_positions, dfa[c_live_time], left=dfa[c_verif_time], height=0.3, label=c_live_time, edgecolor=custom_colors[1])

# Plot the first set of bars next to the second set
bars1 = ax2.barh(y_positions, dfa[c_mc_time], left=dfa[c_init_time] + dfa[c_explore_time] + dfa[c_live_time] + dfa[c_OB_reprod_time], height=0.3, label=c_mc_time, color='none', edgecolor="grey" ,hatch="//")
bars2 = ax2.barh(y_positions, dfa[c_cc_time], left=dfa[c_init_time] + dfa[c_explore_time] + dfa[c_live_time] + dfa[c_OB_reprod_time] + dfa[c_mc_time], height=0.3, label=c_cc_time, color='none', edgecolor="grey", hatch="\\\\")

ax2.set_ylabel("")
ax2.set_xlabel("Time (min)", fontsize=13)
ax2.xaxis.label.set_ha("right")
ax2.xaxis.label.set_va("bottom")
ax2.xaxis.set_label_coords(1.0, 0.0)
# legend2 = ax2.legend([extra1, extra2, bars3, bars1, bars5, bars2], ["$\it{Runtime}:$", "$\it{Compiletime}:$", "Verification", "Rumur/Murphi", "Extended Liveness", "GCC"], loc="lower center", bbox_to_anchor=(-0.2, 1), ncol=3)
# for i, text in enumerate(legend2.get_texts()):
#     if i in [0, 1]:
#        text.set_x(-28)
plt.tight_layout()
# plt.title(dfa["setup"].iloc[0].replace('\n', ' '))

# Set xlim based on the maximum from the rows which have "incomplete" set to false
max_value = dfa[dfa['incomplete'] == False][[c_verif_time, c_live_time, c_mc_time, c_cc_time]].sum(axis=1).max()
ax2.set_xlim(0, max_value * 1.1)

# Set xlim based on the maximum from all rows without liveness check time
# max_value = dfa[[c_verif_time, c_mc_time, c_cc_time]].sum(axis=1).max()
# ax.set_xlim(0, max_value * 1.1)
ax2.set_ylim(ymax=y_positions[-1] + 0.8)

for y_pos, label in zip([0, 1.3, 2.7],  ["Deadlock Freedom ↓", "Extended Liveness (EL) ↓", "Comp. Checks (EL) ↓"]):
    if 0 < y_pos < 3:
        ax2.axhline(y=y_positions[-1] + 0.8 - y_pos, color='darkslategrey', linestyle='--', linewidth=0.5)

    ax2.text(max_value * 1.09 , y_positions[-1] + 0.8 - y_pos - 0.05, label, verticalalignment='top', horizontalalignment="right", color='darkslategrey', fontsize=11)

i = 2
for _, row in dfa.iterrows():
    if row['incomplete']:
        ax2.text(0, y_positions[-i], " ✖ ", color='black', verticalalignment='center', horizontalalignment="left", fontsize=11)
        i += 1

ax2.spines[['right', 'top']].set_visible(False)
ax2.set_yticklabels([])
ax2.set_yticks([])
plt.subplots_adjust(wspace=0.02)
fig.savefig('../output/liveness/liveness-mid.pdf', transparent=True, dpi=600)
fig.savefig('../output/liveness/liveness-mid.png', transparent=True, dpi=600)

print(dfa[['check', c_approx_mem_GB, c_mc_mem_GB, c_cc_mem_GB, c_verif_time, c_live_time, c_mc_time, c_cc_time]])

