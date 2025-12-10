import os
from pathlib import Path
import pandas as pd
import re
try:
    from termcolor import colored
except:
    pass
import sys
import glob

def sprint(status, text):
    symbol = "\u2714" if status else "\u2718"
    color = "green" if status else "red"
    try:
        symbol = colored(symbol, color)
    except:
        pass
    print(f"  {symbol} {text}")

def extract_datapoints(file, column_name, file_txt, data_points, dat):
    """
    Extract datapoints from the file_text and inserts them into the dat dictionary
    """
    for dp in data_points:
        match = re.search(dp[1], file_txt)
        if not match:
            sprint(False, f"Can not extract {dp[0]} from {file}")
            continue
        dat[column_name + dp[0]] = float(match.group(1))

cwd = os.getcwd()

folders = []
# Get folders from command line arguments
if len(sys.argv) > 1:
    for arg in sys.argv[1:]:
        folders.extend(glob.glob(arg))
else:
    
    folders = [item for item in os.listdir(cwd) if os.path.isdir(os.path.join(cwd, item))]

folders.sort()
    
# Walk through all folders and find subfolders containing *.m files
subfolders_with_m_files = []
for folder in folders:
    for root, dirs, files in os.walk(folder):
        if any(file.endswith('.m') for file in files):
            subfolders_with_m_files.append(root)

# Update folders to only include subfolders with *.m files
folders = subfolders_with_m_files
folders.sort()

print("Searching the following folders:")
print("  " + ", ".join(folders))

data = []
data_incomplete = []
# 2. Go over all folders, to extract one data line for each
for folder in folders:
    dat = {"incomplete": False}

    folder_parts = folder.rsplit("/", 1)
    if len(folder_parts) > 1:
        dat["setup"] = folder_parts[0]
        dat["check"] = folder_parts[1]
    else:
        dat["setup"] = None
        dat["check"] = folder
    

    # 2.1 Detect the model checker that is used
    if os.path.isfile(os.path.join(cwd, folder, "rumur_time.txt")):
        dat["mc"] = "rumur"
    elif os.path.isfile(os.path.join(cwd, folder, "mu_time.txt")):
        dat["mc"] = "mu"
    else:
        print(folder + ": Unable to detect model checker, skipping...")
        continue
    print(f"{folder}: detected {dat["mc"]}")

    # 2.2 Go over all time files and extract the data
    relevant_time_files = ["cc_time.txt", "time.txt", f"{dat["mc"]}_time.txt"]

    for file in relevant_time_files:
        try:
            file_txt = Path(os.path.join(cwd, folder, file)).read_text()
            column_name = file.removesuffix("time.txt").replace("rumur_", "mc_").replace("mu_", "mc_")

            data_points = [
                ("max_mem_kbytes", r"Maximum resident set size \(kbytes\): (\d+(\.\d+)?)"),
                ("usr_time", r"User time \(seconds\): (\d+(\.\d+)?)"),
                ("sys_time", r"System time \(seconds\): (\d+(\.\d+)?)"),
            ]

            extract_datapoints(file, column_name, file_txt, data_points, dat)
            sprint(True, f"{file} parsed.")
        except FileNotFoundError:
            sprint(False, f"{file} not found. Skipping...")

    try:
        # 2.3 Read the output file and extract the information
        out_txt = Path(os.path.join(cwd, folder, "out.txt")).read_text()

        data_points = [
            ("state_size", r"The size of each state is \d+ bits \(rounded up to (\d+) bytes\)"),
            ("exploration_start", r"explored in (\d+(\.\d+)?)s"),
            ("reported_time", r"\d+ states, \d+ rules fired in (\d+(\.\d+)?)s"),
            ("states", r"(\d+) states, \d+ rules fired in (\d+(\.\d+)?)s"),
            ("rules", r"\d+ states, (\d+) rules fired in (\d+(\.\d+)?)s"),
        ]

        extract_datapoints("out.txt", "", out_txt, data_points, dat)

        # 2.4. To search for last occurences reverse text order
        out_txt_lines = out_txt.splitlines()
        out_txt_lines.reverse()
        out_txt_rev = "\n".join(out_txt_lines)

        data_points = [
            ("exploration_end", r"explored in (\d+(\.\d+)?)s"),
        ]
        
        extract_datapoints("out.txt", "", out_txt_rev, data_points, dat)
        sprint(True, f"out.txt parsed.")

    except FileNotFoundError:
        sprint(False, f"{file} not found. Skipping...")

    if "states" in dat:
        data.append(dat)
        sprint(True, f"Added data to results.csv")
    else:
        sprint(False, f"Run seems incomplete, trying to reparse as incomplete...")
        dat["incomplete"] = True
        
        try:
            out_txt = Path(os.path.join(cwd, folder, "out.txt")).read_text()

            data_points = [
            ]

            extract_datapoints("out.txt", "", out_txt, data_points, dat)

            out_txt_lines = out_txt.splitlines()
            out_txt_lines.reverse()
            out_txt_rev = "\n".join(out_txt_lines)

            data_points = [
                ("reported_time", r"(?:\d+(?:\.\d+)?) states explored in (\d+(\.\d+)?)s, with (?:\d+(?:\.\d+)?) rules fired and (?:\d+(?:\.\d+)?) states in the queue"),
                ("states", r"(\d+(\.\d+)?) states explored in (?:\d+(?:\.\d+)?)s, with (?:\d+(?:\.\d+)?) rules fired and (?:\d+(?:\.\d+)?) states in the queue"),
                ("rules", r"(?:\d+(?:\.\d+)?) states explored in (?:\d+(?:\.\d+)?)s, with (\d+(\.\d+)?) rules fired and (?:\d+(?:\.\d+)?) states in the queue"),
                ("queue", r"(?:\d+(?:\.\d+)?) states explored in (?:\d+(?:\.\d+)?)s, with (?:\d+(?:\.\d+)?) rules fired and (\d+(\.\d+)?) states in the queue"),

                ("liveness_states_remaining", r"(?:\d+(?:\.\d+)?) further liveness constraints proved in (?:\d+(?:\.\d+)?)s, with (\d+(\.\d+)?) remaining"),
                ("liveness_time_step", r"(?:\d+(?:\.\d+)?) further liveness constraints proved in (\d+(\.\d+)?)s, with (?:\d+(?:\.\d+)?) remaining"),
                ("liveness_state_step", r"(\d+(\.\d+)?) further liveness constraints proved in (?:\d+(?:\.\d+)?)s, with (?:\d+(?:\.\d+)?) remaining"),
            ]
            
            extract_datapoints("out.txt", "", out_txt_rev, data_points, dat)

            if "reported_time" in dat:
                dat["reported_time"] += sum(float(match[0]) for match in re.findall(r"liveness constraints proved in (\d+(\.\d+)?)s", out_txt))
            else:
                sprint(False, f"Could not read reported_time, will also skip adding the liveness phase time to it")


            sprint(True, f"out.txt re-parsed.")
            data_incomplete.append(dat)
            sprint(True, f"Incomplete Run added to incomplete.csv")
        except FileNotFoundError:
            sprint(False, f"{file} not found. Skipping...")

        


# 3. Create CSV File
df = pd.DataFrame(data)
df.to_csv('results.csv', index=False) 

print(f"Results written to results.csv")

df = pd.DataFrame(data_incomplete)
df.to_csv('incomplete.csv', index=False) 

print(f"Incomplete results written to incomplete.csv")

