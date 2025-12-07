#!/usr/bin/env bash
#
# plot.sh - Generate all plots from simulation results
#
# This script:
#   1. Calls extract-stats.sh to generate CSV files from simulation outputs
#   2. Runs Python plot scripts to generate figures
#
# Usage:
#   ./script/plot.sh               # Extract stats and generate all plots
#   ./script/plot.sh fig11         # Generate only Figure 11
#   ./script/plot.sh --no-extract  # Skip extraction, only generate plots
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
DATA_DIR="${REPO_ROOT}/data"
PLOTS_DIR="${DATA_DIR}/plots"

# Parse arguments
SKIP_EXTRACT=false
FILTER_FIG=""

for arg in "$@"; do
    case "${arg}" in
        --no-extract)
            SKIP_EXTRACT=true
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS] [FIGURE]"
            echo ""
            echo "Options:"
            echo "  --no-extract    Skip CSV extraction, only generate plots"
            echo "  --help, -h      Show this help message"
            echo ""
            echo "Figures: fig11, fig12, fig13, fig14, fig16, fig17, breakdown-plot"
            exit 0
            ;;
        *)
            FILTER_FIG="${arg}"
            ;;
    esac
done

echo "=============================================="
echo "          Plot Generation Pipeline"
echo "=============================================="
echo "Data directory: ${DATA_DIR}"
echo "Plots directory: ${PLOTS_DIR}"
[[ -n "${FILTER_FIG}" ]] && echo "Filter: ${FILTER_FIG}"
echo "=============================================="
echo ""

# Step 1: Extract statistics (generate CSVs)
if [[ "${SKIP_EXTRACT}" == "false" ]]; then
    echo ">>> Step 1: Extracting statistics..."
    echo ""
    
    if [[ ! -f "${SCRIPT_DIR}/extract-stats.sh" ]]; then
        echo "ERROR: extract-stats.sh not found"
        exit 1
    fi
    
    bash "${SCRIPT_DIR}/extract-stats.sh"
    
    echo ""
    echo ">>> Statistics extraction complete"
    echo ""
else
    echo ">>> Step 1: Skipping extraction (--no-extract)"
    echo ""
fi

# Step 2: Verify CSV files exist
echo ">>> Step 2: Verifying CSV files..."

if [[ ! -d "${PLOTS_DIR}" ]]; then
    echo "ERROR: Plots directory not found: ${PLOTS_DIR}"
    echo "Run './script/extract-stats.sh' first."
    exit 1
fi

required_csvs=("all_parsec.csv" "all_splash.csv" "all_phoenix.csv" "all.csv")
missing_csv=false

for csv in "${required_csvs[@]}"; do
    if [[ ! -f "${PLOTS_DIR}/${csv}" ]]; then
        echo "  Missing: ${csv}"
        missing_csv=true
    else
        echo "  Found: ${csv}"
    fi
done

if [[ -f "${PLOTS_DIR}/gem5-ycsb-all.csv" ]]; then
    echo "  Found: gem5-ycsb-all.csv"
else
    echo "  Optional: gem5-ycsb-all.csv not found (YCSB plots will be skipped)"
fi

if [[ "${missing_csv}" == "true" ]]; then
    echo ""
    echo "ERROR: Required CSV files are missing."
    exit 1
fi

echo ""

# Step 3: Generate plots
echo ">>> Step 3: Generating plots..."
echo ""

mkdir -p "${DATA_DIR}/figures"

FIGURE_SCRIPTS=("fig11" "fig12" "fig13" "fig14" "fig16" "fig17" "breakdown-plot")
YCSB_REQUIRED=("fig13" "fig14")

success_count=0
fail_count=0
skip_count=0

cd "${PLOTS_DIR}"

for script_name in "${FIGURE_SCRIPTS[@]}"; do
    # Skip if filter is set and doesn't match
    if [[ -n "${FILTER_FIG}" && "${script_name}" != "${FILTER_FIG}" ]]; then
        continue
    fi
    
    script_file="${SCRIPT_DIR}/${script_name}.py"
    
    if [[ ! -f "${script_file}" ]]; then
        echo "WARNING: Script not found: ${script_file}"
        ((skip_count++)) || true
        continue
    fi
    
    # Check if YCSB is required for this figure
    is_ycsb_fig=false
    for ycsb_fig in "${YCSB_REQUIRED[@]}"; do
        if [[ "${script_name}" == "${ycsb_fig}" ]]; then
            is_ycsb_fig=true
            break
        fi
    done
    
    if [[ "${is_ycsb_fig}" == "true" && ! -f "${PLOTS_DIR}/gem5-ycsb-all.csv" ]]; then
        echo "  Skipping ${script_name}.py (YCSB data not available)"
        ((skip_count++)) || true
        continue
    fi
    
    echo "  Processing ${script_name}.py..."
    
    if python3 "${script_file}" 2>&1 | sed 's/^/    /'; then
        echo "    ${script_name}.py completed successfully"
        ((success_count++)) || true
    else
        echo "    ${script_name}.py failed"
        ((fail_count++)) || true
    fi
    
    echo ""
done

# Step 4: Move generated figures to figures directory
echo ">>> Step 4: Organizing output files..."

for pdf in "${PLOTS_DIR}"/*.pdf; do
    [[ -f "${pdf}" ]] && mv "${pdf}" "${DATA_DIR}/figures/"
done

for png in "${PLOTS_DIR}"/*.png; do
    [[ -f "${png}" ]] && mv "${png}" "${DATA_DIR}/figures/"
done

echo ""

# Summary
echo "=============================================="
echo "          Plot Generation Complete"
echo "=============================================="
echo "  Successful: ${success_count}"
echo "  Failed:     ${fail_count}"
echo "  Skipped:    ${skip_count}"
echo ""
echo "Generated figures in ${DATA_DIR}/figures/:"
ls -la "${DATA_DIR}/figures/"*.pdf 2>/dev/null || echo "  No PDF files found"
echo ""

if [[ ${fail_count} -gt 0 ]]; then
    echo "Note: Some plots failed. Install packages with:"
    echo "  pip3 install matplotlib pandas numpy seaborn"
    exit 1
fi
