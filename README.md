# vCXLGen: Automated Synthesis and Verification of CXL Bridges for Heterogeneous Architectures

Artifacts for "vCXLGen: Automated Synthesis and Verification of CXL Bridges for Heterogeneous Architectures", ASPLOS '26

This repository contains the artifact for verifying and evaluating CXL-based cache coherence protocols using model checkers and the gem5 simulator.

This artifact can be used for:

- Generating CXL bridges between several cache coherence protocols and CXL.mem
- Verifying liveness and safety (through litmus tests) of the bridged protocols using model checkers
- Evaluating performance of bridged protocols with gem5

## Evaluated Protocols

**Liveness models**:

| LP_1   | GP     | LP_2   | Caches per LP Cluster | Model Name               |
|--------|--------|--------|-----------------------|--------------------------|
| `MESI` | `MESI` | `MESI` | 3                     | `MESIxMESIxMESI/2Cl_3CC` |
| `MESI` | `CXL`  | `RCC`  | 2                     | `MESIxCXLxRCC/2Cl_2CC`   |
| `MESI` | `CXL`  | `RCC`  | 3                     | `MESIxCXLxRCC/2Cl_3CC`   |

**Litmus Test models**:

| LP_1   | GP     | LP_2   | Caches per LP Cluster | Model Name               |
|--------|--------|--------|-----------------------|--------------------------|
| `MESI` | `MESI` | `MESI` | 2                     | `MESIxMESIxMESI`         |
| `MESI` | `CXL`  | `MESI` | 2                     | `MESIxCXLxMESI`          |
| `MESI` | `CXL`  | `RCC`  | 2                     | `MESIxCXLxRCC`           |
| `RCC`  | `CXL`  | `RCC`  | 2                     | `RCCxCXLxRCC`            |

**Performance Evaluation**

| CSV Name | gem5 Protocol | Description |
|----------|---------------|-------------|
| `MOESI_gem5` | `MOESI_CMP_directory`  | Two MOESI cluster connected through MOESI coherence |
| `MESI_MESI_MESI` | `MESI_unord`  | Two MESI cluster connected through MESI coherence |
| `MESI_CXL_MESI` | `MESI_unord_CXL` | Two MESI cluster connected through CXL coherence |

---

## Table of Contents

- [Hardware Requirements](#hardware-requirements)
- [Quick Start](#quick-start)
- [Prerequisites](#prerequisites)
- [Repository Structure](#repository-structure)
- [Build CMurphi and Rumur](#build-cmurphi-and-rumur)
- [Run Litmus Test Experiments](#run-litmus-test-experiments)
- [Build Liveness Models](#build-liveness-models)
- [Run Liveness Experiments](#run-liveness-experiments)
- [Build gem5](#build-gem5)
- [Build Benchmarks](#build-benchmarks)
- [Run Experiments](#run-experiments)
- [Generate Plots](#generate-plots)

---

## Hardware Requirements

* Any general purpose CPU
* ~20GB free disk space (~5GB for litmus test models, ~10GB for gem5 builds)
* ~100GB available RAM for the liveness evaluation
* ~2TB available RAM for the litmus test evaluation
* ~2GB available RAM per gem5 simulation

---

## Quick Start

**Verification**
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

**Performance**
```bash
# 1. Build gem5 with all protocols
./script/build-gem5.sh

# 2. Build benchmarks (PARSEC, SPLASH-4, Phoenix, YCSB)
./script/build-benchmark-x86.sh

# 3. Generate experiment configurations
./script/create-conf.sh

# 4. Run experiments
./script/run.sh

# 5. Generate plots (extracts stats + runs Python scripts)
./script/plot.sh
```

---

## Prerequisites

* **OS**: Ubuntu 22.04 LTS
* **Packet Manager**: Nix with flakes support
* **Compiler**: GCC 11.4.0
* **Python**: 3.10+
* **SCons**: 4.0+

---

## Install Dependencies

To install nix with flake support you have multiple options:

**Using the Determinate Nix installer**: simply run:
```bash
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

**Using the official Nix installer**: following the instructions at https://nixos.org/download.html and enabling flake support:
```bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf
sudo systemctl restart nix-daemon.service
```

---

## Repository Structure

```
vCXLGen-Artifact/
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

├── gem5/                    # gem5 simulator source
├── slicc/                   # SLICC protocol definitions
├── benchmarks/              # Benchmark suites
│   ├── parsec-benchmark/    # PARSEC 3.0
│   ├── Splash-4/            # Splash-4
│   ├── phoenix/             # Phoenix
│   └── YCSB-C/              # YCSB-C (database workload)
├── script/                  # Build and run scripts
│   ├── build-gem5.sh        # Build gem5 for all protocols
│   ├── build-benchmark-x86.sh   # Build X86 benchmarks
│   ├── create-conf.sh       # Generate experiment configurations
│   ├── run.sh               # Run all experiments
│   ├── run-benchmarks.sh    # Run PARSEC/SPLASH/Phoenix (Fig 11,12)
│   ├── run-ycsb.sh          # Run YCSB experiments (Fig 13,14)
│   ├── extract-stats.py     # Extract statistics to CSV
│   ├── plot.sh              # Generate all plots
│   ├── fig11.py             # Performance comparison plot
│   ├── fig12.py             # LLC breakdown plot
│   ├── fig13.py             # YCSB throughput plot
│   ├── fig14.py             # YCSB scaling plot
├── setup/                   # gem5 configuration scripts
│   ├── setup.py             # Main setup script
│   └── protocols/           # Protocol definitions
└── data/                    # Output directory (created at runtime)
    ├── gem5.output/         # Raw simulation outputs
    ├── logs/                # Execution logs
    ├── plots/               # Generated CSV files
    └── figures/             # Generated PDF/PNG figures
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

---

## Generated protocols performance evaluation

### Prepare the Environment

**gem5 dependencies:**
```bash
sudo apt-get update && sudo apt-get install -y \
    build-essential \
    cmake \
    g++ \
    git \
    python3 \
    python3-pip \
    python3-venv \
    scons \
    zlib1g-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libgoogle-perftools-dev \
    libboost-all-dev \
    libhdf5-serial-dev \
    libpng-dev \
    libjemalloc-dev \
    pkg-config \
    wget \
    m4 \
    libtbb-dev \
    gettext \
    libgettextpo-dev \
    libglw1-mesa-dev \
    libxext-dev \
    libx11-dev \
    libxmu-dev \
    libglut-dev \
    libxi-dev \
```

**Python Dependencies (for plotting):**
```bash
pip3 install pandas numpy matplotlib seaborn
```

### Build gem5

Build the gem5 simulator with all cache coherence protocols:

```bash
./script/build-gem5.sh
```

This builds:
- `gem5/build/X86_MOESI_CMP_directory_edit/gem5.opt`
- `gem5/build/X86_MESI_unord/gem5.opt`
- `gem5/build/X86_MESI_unord_CXL/gem5.opt`

**Expected build time**: ~30-60 minutes (depending on CPU cores).


### Build Benchmarks

Build all benchmark suites:

```bash
./script/build-benchmark-x86.sh
```

To build only YCSB:

```bash
./script/build-benchmark-x86.sh ycsb
```

**Benchmark Suites:**
- **PARSEC**: 13 applications (blackscholes, bodytrack, canneal, etc.)
- **SPLASH-4**: 15 applications (barnes, cholesky, fft, etc.)
- **Phoenix**: 7 applications (histogram, kmeans, linear_regression, etc.)
- **YCSB-C**: 5 workloads (A, B, C, D, F)

### Functional Validation (YCSB)

We provide a small functional validation harness that runs selected YCSB-C workloads as a correctness check across the evaluated coherence protocols.

- Script: `script/run-functional.sh`
- Workloads: YCSB A, B, C, D, F (the `_test.spec` variants in `benchmarks/YCSB-C/workloads`)
- YCSB client threads: `-threads 2` (2 client threads)
- Protocols tested: `MOESI_CMP_directory_edit`, `MESI_unord`, `MESI_unord_CXL`
- Expected total runtime: ~15 minutes

Run the functional validation with:

```bash
./script/run-functional.sh
```

The validation script runs each workload for the three protocols and records a simple throughput value per run. Results are written to:

```
data/functional/results.txt
```

---

## Run Experiments

### Generate Workload Configurations

First, generate the experiment configurations:

```bash
./script/create-conf.sh
```

This creates `benchmarks/configuration/commands.conf` with all benchmark/protocol combinations.

### Run All Experiments

```bash
./script/run.sh
```

### Run Experiments by Figure

Different figures require different benchmark suites:

| Figures | Required Benchmarks | Run Script |
|---------|---------------------|------------|
| **11, 12** | PARSEC, SPLASH-4, Phoenix | `./script/run-benchmarks.sh` |
| **13, 14** | YCSB | `./script/run-ycsb.sh` |

**To generate Figures 11, 12** (performance comparison and LLC breakdown):
```bash
./script/run-benchmarks.sh              # Run PARSEC, SPLASH-4, Phoenix
```

**To generate Figures 13, 14** (YCSB throughput and scaling):
```bash
./script/run-ycsb.sh                    # Run YCSB workloads
```

### Run Filtered Experiments

```bash
# Benchmark suites (for Figures 11, 12)
./script/run-benchmarks.sh parsec                   # Run only PARSEC
./script/run-benchmarks.sh splash                   # Run only SPLASH-4
./script/run-benchmarks.sh phoenix                  # Run only Phoenix
./script/run-benchmarks.sh parsec blackscholes      # Run specific app

# YCSB (for Figures 13, 14)
./script/run-ycsb.sh workloada                      # Run only workload A
./script/run-ycsb.sh workloadb                      # Run only workload B
```

### Output Structure

```
data/
├── gem5.output/
│   ├── parsec/{app}/{protocol}/stats.txt
│   ├── splash/{app}/{protocol}/stats.txt
│   ├── phoenix/{app}/{protocol}/stats.txt
│   └── ycsb/{workload}/{protocol}/threads_{N}/stats.txt
└── logs/
    └── {suite}_{app}_{protocol}.log
```

---

## Generate Plots

The plot script automatically extracts statistics and generates figures:

```bash
./script/plot.sh
```

To generate a specific figure:

```bash
./script/plot.sh fig11
```

### Available Figures

| Figure | Script | Description | Required Data |
|--------|--------|-------------|---------------|
| Fig 11 | `fig11.py` | Performance comparison (mean + selected apps) | PARSEC, SPLASH-4, Phoenix |
| Fig 12 | `fig12.py` | LLC hits/misses breakdown | PARSEC, SPLASH-4, Phoenix |
| Fig 13 | `fig13.py` | YCSB throughput at 8 threads | YCSB |
| Fig 14 | `fig14.py` | YCSB scaling with thread counts | YCSB |

### Generated CSV Files

The extraction script generates:
- `data/plots/all_parsec.csv` - PARSEC normalized times
- `data/plots/all_splash.csv` - SPLASH-4 normalized times
- `data/plots/all_phoenix.csv` - Phoenix normalized times
- `data/plots/all.csv` - Combined data with LLC stats
- `data/plots/gem5-ycsb-all.csv` - YCSB throughput
- `data/plots/gem5-ycsb-scale.csv` - YCSB scaling data

### Generated Figures

The plotting pipeline writes final figure files into the `data/figures/` directory. The main files produced by the plotting scripts are:

- `data/figures/fig11.pdf` — Performance comparison (mean + selected applications) produced by `script/fig11.py`
- `data/figures/fig12.pdf` — LLC hits/misses breakdown produced by `script/fig12.py`
- `data/figures/fig13.pdf` — YCSB throughput at 8 threads produced by `script/fig13.py`
- `data/figures/fig14.pdf` — YCSB scaling with thread counts produced by `script/fig14.py`
---
