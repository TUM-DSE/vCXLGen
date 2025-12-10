#!/usr/bin/python3

import argparse
import os
from pathlib import Path
from sshkeyboard import listen_keyboard, stop_listening
import re


parser = argparse.ArgumentParser()
parser.add_argument("file_path", type=Path)

p = parser.parse_args()

print("Reading from: ", p.file_path)

def get_relevant_dict(current_text_state):
    rule = "[[final state]]"
    lines = current_text_state.splitlines()
    for line in lines:
        if "fired." in line:
            rule = line
            break

    lines = [line for line in lines if ':' in line]
    ret_dict = {}
    for line in lines:
        key = line.split(":")[0].strip()
        value = line.split(":")[1].strip()

        ret_dict[key] = value


    return {
        "full_text": current_text_state,
        "full_dict": ret_dict,
        "rule": rule
    }

## Construct history
system_states = []
error_msg = "[[unknown]]"
with open(p.file_path, "r") as out_file:
    full_text = out_file.read()

    try:
        error_msg = re.search("error:(.*)\nStartstate", full_text, flags=re.S).group(1).strip()
    except:
        pass
    if error_msg == "[[unknown]]":
        try:
            error_msg = re.search("(liveness property .*)\nStartstate", full_text, flags=re.S).group(1).strip()
        except:
            pass
    if error_msg == "[[unknown]]":
        try:
            error_msg = "(*) " + re.search("\t(.*)\nStartstate", full_text, flags=re.S).group(1).strip()
        except:
            pass
    
    print("Error:", error_msg)
    system_text_states = full_text.split("----------\n")

    for text_state in system_text_states:
        system_states += [get_relevant_dict(text_state)] 


## compute content
channels = ["req", "req2", "resp", "fwd", "rwd", "birsp", "bisnp", "drs", "ndr"]
machines = set()

for ch in channels:
    for machine in re.findall(f"{ch}[^\] ]*\[([^\]]*)\]", system_states[0]["full_text"]):
        machines.add(machine)
        machines.add(machine.replace("RHS", "LHS"))
        machines.add(machine.replace("LHS", "RHS"))

machines = list(set(machines))
print(f"There are {len(machines)} machines:")

def sort_func(name):
    val = 0
    if "RHS" in name:
        val += 1000
    if "L1" in name:
        val += 100
    if "cache" in name:
        val += 10
    return val
machines.sort(key=sort_func)

ack_sfx = set()
for sfx in re.findall(f"acksExpected(.*):", system_states[0]["full_text"]):
    ack_sfx.add(sfx)

## compute max queue depth
q_depth = 1
while True:
    if f"[{q_depth}]" in system_states[0]["full_text"]:
        q_depth += 1
    else:
        break
print(f"There queues have a max depth of {q_depth}")

current_idx = -1
running = True
show_acks = False

def readx(state_idx, key):
    global system_states

    while key not in system_states[state_idx]["full_dict"]:
        state_idx -= 1
        if state_idx < 0:
            # breakpoint()
            raise KeyError(f"Not found: {key}")
    return system_states[state_idx]["full_dict"][key]

def get_i_name(machine):
    return machine.removeprefix(f"OBJSET_").split("_")[0]

def get_ack_list(state_idx, variable, name):
    ret = ""

    for sfx in ack_sfx:
        try:
            ae  = readx(state_idx, variable + name + sfx)
            ret += f"{name}{sfx}={ae}, "
        except:
            pass

    if ret:
        ret = ret[:-2]
    return ret


def get_q_str(state_idx, entity, mach_name, q_name):
    ret = ""
    for i in range(q_depth):
        mt = readx(state_idx, f"{q_name}_{get_i_name(entity)}[{mach_name}][{i}].mtype")
        if mt != "Undefined":
            ms = "Unknown"
            for mach in machines:
                try:
                    ms_pot = readx(state_idx, f"{q_name}_{get_i_name(entity)}[{mach_name}][{i}].src.{get_i_name(mach)}").removeprefix(f"OBJSET_")
                    if ms_pot != "Undefined":
                        ms = ms_pot
                        break
                except:
                    pass
            if show_acks:
                ae = get_ack_list(state_idx, f"{q_name}_{get_i_name(entity)}[{mach_name}][{i}].", "acksExpected")
                ret += f"{mt}[{ms}, {ae}], "
            else:
                ret += f"{mt}[{ms}], "

    return ret

def get_state_str(state_idx):
    ret = ""
    
    try:
        ret += "SystemState: " + readx(state_idx, f"g_system_state") + "\n\n"
        try:
            ret += "ProgressTracking: " + readx(state_idx, f"g_progress_tracking") + "\n\n"
        except:
            pass
    except:
        pass

    lhs = False
    for machine in machines:
        now_lhs = "LHS" in machine
        if lhs and not now_lhs:
            ret += "=== ↑ LHS ↑ === === ↓ RHS ↓ ===\n\n"
        lhs = now_lhs

        for mach_name in [machine, machine.replace("RHS", "LHS")]:
            try:
                state = readx(state_idx, f"i_{get_i_name(machine)}[{mach_name}].cb[Address_0].State")
                state = state[state.find("_")+1:]
                ret += f"{machine} = {state}:\n"

                if show_acks:
                    ae = get_ack_list(state_idx, f"i_{get_i_name(machine)}[{mach_name}].cb[Address_0].", "acksExpected")
                    ar = get_ack_list(state_idx, f"i_{get_i_name(machine)}[{mach_name}].cb[Address_0].", "acksReceived")
                    if ae:
                        ret += "{" f"{ae}, {ar}" + "}\n"
                    elif ar:
                        ret += "{" f"{ar}" + "}\n"

                for ch in channels:
                    try:
                        ret += f"  {ch}: " + get_q_str(state_idx, machine, mach_name, ch) + "\n"
                    except:
                        pass

                ret += "\n"
                break
            except:
                pass


    ret += "\n"
    
    return ret

def press(key):
    global current_idx
    global system_states
    global running
    global show_acks
    global show_sharers

    stop_listening()
    if key == "left":
        current_idx = max(current_idx - 1, 0)
    if key == "right":
        current_idx = min(current_idx + 1, len(system_states) - 1)
    if key == "a":
        show_acks = not show_acks
    
    if key == "q":
        running = False
    else:
        os.system('clear')

        print("Step:", current_idx + 1, " of ", len(system_states))
        print("Error:", error_msg)
        print("Options:", f"ShowAcks(a)={show_acks}")
        print()
        
        print(system_states[current_idx]["rule"])
        print()

        print(get_state_str(current_idx))

while running:
    listen_keyboard(on_press=press)