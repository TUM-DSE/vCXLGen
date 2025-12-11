# vCXLGen: Automated Synthesis and Verification of CXL Bridges for Heterogeneous Architectures

This repository contains the artifact for verifying CXL-based cache coherence protocols using model checkers.

## Evaluated Setups

**Liveness Evaluation**:

| LP_1   | GP     | LP_2   | Caches per LP Cluster | Model Name               |
|--------|--------|--------|-----------------------|--------------------------|
| `MESI` | `MESI` | `MESI` | 3                     | `MESIxMESIxMESI/2Cl_3CC` |
| `MESI` | `CXL`  | `RCC`  | 2                     | `MESIxCXLxRCC/2Cl_2CC`   |
| `MESI` | `CXL`  | `RCC`  | 3                     | `MESIxCXLxRCC/2Cl_3CC`   |

**Litmus Test Evaluation**:

| LP_1   | GP     | LP_2   | Caches per LP Cluster | Model Name               |
|--------|--------|--------|-----------------------|--------------------------|
| `MESI` | `MESI` | `MESI` | 2                     | `MESIxMESIxMESI`         |
| `MESI` | `CXL`  | `MESI` | 2                     | `MESIxCXLxMESI`          |
| `MESI` | `CXL`  | `RCC`  | 2                     | `MESIxCXLxRCC`           |
| `RCC`  | `CXL`  | `RCC`  | 2                     | `RCCxCXLxRCC`            |

---

## Table of Contents

- [Prerequisites](#prerequisites)
- [Repository Structure](#repository-structure)
- [Build CMurphi and Rumur](#build-cmurphi-and-rumur)
- [Run Litmus Test Experiments](#run-litmus-test-experiments)
- [Build Liveness Models](#build-liveness-models)
- [Run Liveness Experiments](#run-liveness-experiments)

---

## Prerequisites

* **OS**: Ubuntu 22.04 LTS
* **Packet Manager**: Nix with flakes support

**Hardware Requirements**:
* ~2TB of RAM for the litmus test evaluation
* ~100GB of RAM for the liveness evaluation

---

## Quick Start

```bash
# 1. Build tools and initialize setup
cd tools
nix develop -c "./init.sh"
cd ..

# 2. Run litmus tests for all models
cd CXLGen
git checkout -f mc-cxl-lit
nix develop -c python3 -- "eval.py" "all"
cd ..

# 3. Generate liveness models for all setups
cd CXLGen
git checkout -f mc-cxl-dev
nix develop -c "./eval.sh"
cd ..

# 4. Check liveness models, collect performance data, and generate plots
cd liveness_models
nix develop -c python3 -- "eval.py" "all"
nix develop -c python3 -- "extract_data.py"
nix develop -c python3 -- "gen_figs.py"
cd ..
```

---

## Install Dependencies

To install nix with flake support you have multiple options:

**Using the Determinate Nix installer**: simply run:
```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

**Using the official Nix installer**: follow the instructions at https://nixos.org/download.html, and enable flakes by adding the following lines to your `/etc/nix/nix.conf`:
```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf
sudo systemctl restart nix-daemon.service
```

---

## Repository Structure

```
├── CXLGen/                  # vCXLGen protocol generator
├── tools/                   # Model checker tools
│   ├── murphi_src/          # CMurphi v5.4.9 
│   ├── rumur_src/           # Rumur v2024.7.14
│   ├── flake.nix            # Nix flake (dependencies) for tools
│   └── init.sh              # Builds tools and initializes setup
├── liveness_models/         # Liveness model checking and plotting
│   ├── MESIxMESIxMESI/      # Liveness models for all MESIxMESIxMESI setups
│   ├── MESIxCXLxRCC/        # Liveness models for all MESIxCXLxRCC setups
│   ├── bench_murphi.sh      # Check all models in the current directory with CMurphi
│   ├── bench_rumur.sh       # Check all models in the current directory with Rumur
│   ├── eval.py              # Check liveness models
│   ├── extract_data.py      # Extract data from model runs
│   ├── eval.sh              # Check all liveness models, collect data and generate plots
│   ├── flake.nix            # Nix flake (dependencies) for liveness models
│   └── gen_figs.py          # Generate plots from extracted data
├── output/                  # Output directory for evaluation results
│   ├── litmus/              # Litmus test evaluation results
│   │   ├── {ModelName}.txt  # Litmus test results for {ModelName}
│   └── liveness/            # Liveness evaluation results
│       ├── results.csv      # Summary of liveness evaluation results
│       └── incomplete.csv   # Summary of incomplete liveness evaluation runs
└── eval.sh                  # Full evaluation of all models 
```

---

## Build CMurphi and Rumur

From the `tools/` directory, run:

```bash
nix develop -c "./build_tools.sh"
```

This builds:
- CMurphi: `tools/murphi_src/src/mu`
- Rumur: `/scratch/julian/cxl/tools/rumur_src/build/rumur/rumur`

**Expected build time**: a few minutes.

---

## Run Litmus Test Experiments

From the `CXLGen/` directory, run:
```bash
git checkout -f mc-cxl-lit
nix develop -c python3 -- "eval.py" "all"
```

Alternatively, you can run specific models by replacing `all` with a list of model names, e.g. `MESIxMESIxMESI`, from the [table above](#evaluated-setups).

This generates litmus test models in the `CXLGen/Protocols/MOESI_Directory/RF_Dir/ord_net/FullSystem_NoCE` directory and automatically evaluates them using a CMurphi worker pool.

**Expected run time**: a few hours per model (depending on available RAM and CPUs).

**RAM usage**: 2TB recommended, some litmus test models require >1.4TB.

<details>

<summary>[Optional] Manual Evaluation</summary>

> If you want to have more control over the individual steps, you can can also manually evaluate specific models, e.g. (inside the `CXLGen/` directory):
> 1. Check out the litmus test branch:
>     ```bash
>     git checkout -f mc-cxl-lit
>     ```
> 2. Only generate models for the MESIxMESIxMESI setup:
>     ```bash
>     nix develop -c python3 -- "GenMESIxMESIxMESI.py"
>     ```
> 3. Only compile the IRIW litmus tests of the MESIxMESIxMESI setup:
>     ```bash
>     nix develop -c python3 -- "ParallelCompiler.py" "Protocols/MOESI_Directory/RF_Dir/ord_net/FullSystem_NoCE/MESIxMESIxMESI/Litmus_Tests/IRIW"
> 4. Only check a specific IRIW configuration of the MESIxMESIxMESI setup:
>     ```bash
>     nix develop -c python3 -- "ParallelChecker.py" \
>     "CXLGen/Protocols/MOESI_Directory/RF_Dir/ord_net/FullSystem_NoCE/MESIxMESIxMESI/Litmus_Tests/IRIW/cacheL1A_cacheL1A_cacheL1B_cacheL1A" \
>     "../output/litmus/MESIxMESIxMESI_IRIW_cacheL1A_cacheL1A_cacheL1B_cacheL1A.txt"
>     ```

</details>

## Build Liveness Models

From the `CXLGen/` directory, run:
```bash
git checkout -f mc-cxl-dev
nix develop -c "./eval.sh"
```

This generates liveness models in the `CXLGen/Protocols/MOESI_Directory/RF_Dir/ord_net/FullSystem` directory.

**Expected build time**: ~30min.

<details>

<summary>[Optional] Model Migration</summary>

> The model generation for the CXLGen tool is non-deterministic. For reproducibility, we provide the exact models used in our evaluation in the `liveness_models/` directory. If you want to instead copy over the models that you just generated, you can run the following commands from the `liveness_models/` directory, note that this may affect reproducibility of results:
> ```bash
> ./migrate.sh
> ```

</details>

## Run Liveness Experiments

From the `liveness_models/` directory, run:
```bash
nix develop -c python3 -- "eval.py" "all"
```

Alternatively, you can run specific models by replacing `all` with a list of model names, e.g. `MESIxCXLxRCC/2Cl_3CC`, from the [table above](#evaluated-setups).

This checks all specified liveness models using CMurphi or Rumur depending on the model. The raw model checker outputs are stored next to each model file, including:
- `out.txt`: Standard output of the model checker
- `time.txt`: Execution time of the model checker
- `cc_time.txt`: Compilation time of the model 
- `mu_time.txt`: Rumur execution time (if applicable)
- `rumur_time.txt`: Rumur execution time (if applicable)

To collect all this data into a single CSV file and generate plots, run the following in the `liveness_models/` directory:
```bash
# To extract the data to a csv file
nix develop -c python3 -- "extract_data.py"
# To generate plots from the csv file
nix develop -c python3 -- "gen_figs.py"
```

This generates two CSV files and three figures in the `output/liveness/` directory:
- `results.csv`: Summary of liveness evaluation results
- `incomplete.csv`: Summary of incomplete liveness evaluation runs
- `liveness-big.png`: Figure 10.a from the paper
- `liveness-mid.png`: Figure 10.b from the paper
- `liveness-small.png`: Figure 18 from the paper

**Expected run time**: a few hours per model (depending on available RAM and CPUs).

**RAM usage**: 100GB recommended.
