#!/usr/bin/env bash
#
# create-conf.sh - Generate configuration files for experiments
#
# This script generates configurations for performance comparison across protocols.
#
# Protocols and their mappings:
#   MOESI_CMP_directory_edit (lat=10)  -> MOESI_no-lat in CSV
#   MOESI_CMP_directory_edit (lat=140) -> MOESI_gem5 in CSV  
#   MESI_unord (lat=140)          -> MESI_MESI_MESI in CSV (MESI-Br)
#   MESI_unord_CXL (lat=140)      -> MESI_CXL_MESI in CSV (CXL-Br)
#
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
BENCHMARKS_DIR="${REPO_ROOT}/benchmarks"
CONFIG_DIR="${BENCHMARKS_DIR}/configuration"
COMMANDS_FILE="${CONFIG_DIR}/commands.conf"

# Output base directory for experiments (relative to REPO_ROOT)
OUTPUT_BASE="data/gem5.output"

# Protocol configurations with latency
# Format: "protocol_name:latency:csv_name"
PROTOCOL_CONFIGS=(
    "MOESI_CMP_directory_edit:10:MOESI_no-lat"
    "MOESI_CMP_directory_edit:140:MOESI_gem5"
    "MESI_unord:140:MESI_MESI_MESI"
    "MESI_unord_CXL:140:MESI_CXL_MESI"
)

# Create output directories
mkdir -p "${CONFIG_DIR}"
mkdir -p "${REPO_ROOT}/output"

#------------------------------------------------------------------------------
# Generate commands.conf header
#------------------------------------------------------------------------------
echo "# FORMAT: suite | csv_protocol | name | command_line" > "${COMMANDS_FILE}"
echo "# csv_protocol: Protocol name as it will appear in CSV files" >> "${COMMANDS_FILE}"
echo "# Output directory: \${REPO_ROOT}/${OUTPUT_BASE}/{suite}/{name}/{csv_protocol}" >> "${COMMANDS_FILE}"
echo "# Auto-generated on $(date)" >> "${COMMANDS_FILE}"
echo "" >> "${COMMANDS_FILE}"

#------------------------------------------------------------------------------
# PARSEC Configuration
#------------------------------------------------------------------------------
declare -A parsec_cores=(
    ["blackscholes"]=4
    ["bodytrack"]=40
    ["canneal"]=24
    ["dedup"]=16
    ["facesim"]=2
    ["ferret"]=24
    ["fluidanimate"]=24
    ["freqmine"]=24
    ["raytrace"]=24
    ["streamcluster"]=16
    ["swaptions"]=24
    ["vips"]=30
    ["x264"]=2
    ["fluidanimate"]=16
)


declare -A parsec_args=(
    ["blackscholes"]="16 in_4.txt prices.txt"
    ["bodytrack"]="sequenceB_1 1 1 5 1 0 8"
    ["canneal"]="16 5 100 10.nets 1"
    ["dedup"]="-c -p -v -t 4 -i test.dat -o output.dat.ddp"
    ["facesim"]="-h"
    ["ferret"]="corel lsh queries 5 5 4 output.txt"
    ["freqmine"]="T10I4D100K_3.dat 1"
    ["fluidanimate"]="16 1 in_5K.fluid out.fluid"
    ["raytrace"]="octahedron.obj -automove -nthreads 16 -frames 1 -res 1 1"
    ["streamcluster"]="2 5 1 5 5 5 none output.txt 8"
    ["swaptions"]="-ns 32 -sm 5 -nt 16"
    ["vips"]="im_benchmark barbados_256x288.v output.v"
    ["x264"]="--quiet --qp 20 --partitions b8x8,i4x4 --ref 5 --direct auto --b-pyramid --weightb --mixed-refs --no-fast-pskip --me umh --subme 7 --analyse b8x8,i4x4 --threads 2 -o eledream.264 eledream_32x18_1.y4m"
    ["fluidanimate"]="8 5 in_5K.fluid out.fluid"
)

declare -A parsec_binary=(
    ["raytrace"]="rtview"
    ["vips"]="vips"
    ["ferret"]="ferret"
)

declare -A parsec_gcc_pthreads=(
    ["vips"]="yes"
)

echo "[parsec]" >> "${COMMANDS_FILE}"

for app_dir in "${BENCHMARKS_DIR}/parsec-benchmark/pkgs/apps/"*/inst/amd64-linux.gcc/bin \
               "${BENCHMARKS_DIR}/parsec-benchmark/pkgs/apps/"*/inst/amd64-linux.gcc-pthreads/bin \
               "${BENCHMARKS_DIR}/parsec-benchmark/pkgs/kernels/"*/inst/amd64-linux.gcc/bin; do
    [[ -d "$app_dir" ]] || continue
    
    if [[ "$app_dir" == *"/apps/"* ]]; then
        name=$(echo "$app_dir" | sed 's|.*/apps/\([^/]*\)/.*|\1|')
    else
        name=$(echo "$app_dir" | sed 's|.*/kernels/\([^/]*\)/.*|\1|')
    fi
    
    # Skip if not in our list
    [[ -z "${parsec_cores[$name]:-}" ]] && continue
    
    # Check if this app needs gcc-pthreads
    if [[ -n "${parsec_gcc_pthreads[$name]:-}" ]]; then
        [[ "$app_dir" == *"amd64-linux.gcc/bin" ]] && continue
    else
        [[ "$app_dir" == *"gcc-pthreads/bin" ]] && continue
    fi
    
    rel_path=$(echo "$app_dir" | sed "s|${BENCHMARKS_DIR}/||")
    binary=${parsec_binary[$name]:-$name}
    
    cores=${parsec_cores[$name]}
    
    args_template=${parsec_args[$name]}
    
    # Generate full command line for each protocol configuration
    for config in "${PROTOCOL_CONFIGS[@]}"; do
        IFS=':' read -r protocol latency csv_name <<< "$config"
        
        out_dir="${OUTPUT_BASE}/parsec/${name}/${csv_name}"
        
        args="${args_template//\{DIR\}/benchmarks/${rel_path}}"
        args="${args//\{OUTDIR\}/${out_dir}}"
        
        cmd_line="gem5/build/X86_${protocol}/gem5.opt --outdir=${out_dir} --redirect-stdout --redirect-stderr setup/setup.py -c ${cores} --remote-latency ${latency} -ro -- benchmarks/${rel_path}/${binary} ${args}"
        echo "parsec | ${csv_name} | ${name} | ${cmd_line}" >> "${COMMANDS_FILE}"
    done
done

echo "" >> "${COMMANDS_FILE}"

#------------------------------------------------------------------------------
# SPLASH Configuration
#------------------------------------------------------------------------------
declare -A splash_cores=(
    ["barnes"]=8
    ["cholesky"]=8
    ["fft"]=8
    ["fmm"]=8
    ["lu-cont"]=8
    ["lu-ncont"]=8
    ["ocean-cont"]=8
    ["ocean-nc"]=8
    ["radiosity"]=8
    ["radix"]=8
    ["raytrace"]=8
    ["volrend"]=8
    ["volrend-npl"]=8
    ["water-nsquared"]=8
    ["water-ns"]=8
    ["water-spatial"]=8
    ["water-sp"]=8
)


declare -A splash_args=(
    ["barnes"]="BARNES"
    ["cholesky"]="CHOLESKY -p8"
    ["fft"]="FFT -p8 -m16"
    ["fmm"]="FMM"
    ["lu-cont"]="LU-CONT -p8 -n256"
    ["lu-ncont"]="LU-NOCONT -p8 -n256"
    ["ocean-cont"]="OCEAN-CONT -p8 -n130"
    ["ocean-nc"]="OCEAN-NOCONT -p8 -n130"
    ["radiosity"]="RADIOSITY -p 8 -ae 100 -bf 0.1 -en 0.05 -room -batch"
    ["radix"]="RADIX -p8 -n200000"
    ["raytrace"]="RAYTRACE -p8 -m34 inputs/teapot.env"
    ["volrend"]="VOLREND 8 inputs/head-scaleddown4 2"
    ["volrend-npl"]="VOLREND-NPL 8 inputs/head-scaleddown4 1"
    ["water-nsquared"]="WATER-NSQUARED"
    ["water-ns"]="WATER-NSQUARED"
    ["water-spatial"]="WATER-SPATIAL"
    ["water-sp"]="WATER-SPATIAL"
)

declare -A splash_dir_map=(
    ["barnes"]="barnes"
    ["cholesky"]="cholesky"
    ["fft"]="fft"
    ["fmm"]="fmm"
    ["lu-contiguous_blocks"]="lu-cont"
    ["lu-non_contiguous_blocks"]="lu-ncont"
    ["ocean-contiguous_partitions"]="ocean-cont"
    ["ocean-non_contiguous_partitions"]="ocean-nc"
    ["radiosity"]="radiosity"
    ["radix"]="radix"
    ["raytrace"]="raytrace"
    ["volrend"]="volrend"
    ["volrend-no_print_lock"]="volrend-npl"
    ["water-nsquared"]="water-ns"
    ["water-spatial"]="water-sp"
)

declare -A splash_input=(
    ["barnes"]="inputs/n16384-p8"
    ["cholesky"]="inputs/tk14.O"
    ["fft"]=""
    ["fmm"]="fmm.8.2048"
    ["lu-cont"]=""
    ["lu-ncont"]=""
    ["ocean-cont"]=""
    ["ocean-nc"]=""
    ["radiosity"]=""
    ["radix"]=""
    ["raytrace"]=""
    ["volrend"]=""
    ["volrend-npl"]=""
    ["water-ns"]="inputs/n512-p8"
    ["water-sp"]="inputs/n512-p8"
)

echo "[splash]" >> "${COMMANDS_FILE}"

SPLASH_DIR="${BENCHMARKS_DIR}/Splash-4/Splash-4"
if [[ -d "${SPLASH_DIR}" ]]; then
    for bench_dir in "${SPLASH_DIR}"/*/; do
        [[ -d "$bench_dir" ]] || continue
        
        dir_name=$(basename "$bench_dir")
        name=${splash_dir_map[$dir_name]:-""}
        [[ -z "$name" ]] && continue
        
        rel_path=$(echo "$bench_dir" | sed "s|${BENCHMARKS_DIR}/||" | sed 's|/$||')
        
        cores=${splash_cores[$name]:-8}
        
        args=${splash_args[$name]:-""}
        input_file=${splash_input[$name]:-""}
        
        # Generate full command line for each protocol configuration
        for config in "${PROTOCOL_CONFIGS[@]}"; do
            IFS=':' read -r protocol latency csv_name <<< "$config"
            
            out_dir="${OUTPUT_BASE}/splash/${name}/${csv_name}"
            
            if [[ -n "$input_file" ]]; then
                cmd_line="gem5/build/X86_${protocol}/gem5.opt --outdir=${out_dir} --redirect-stdout --redirect-stderr setup/setup.py -c ${cores} --remote-latency ${latency} -ro -- benchmarks/${rel_path}/${args} < benchmarks/${rel_path}/${input_file}"
            else
                cmd_line="gem5/build/X86_${protocol}/gem5.opt --outdir=${out_dir} --redirect-stdout --redirect-stderr setup/setup.py -c ${cores} --remote-latency ${latency} -ro -- benchmarks/${rel_path}/${args}"
            fi
            echo "splash | ${csv_name} | ${name} | ${cmd_line}" >> "${COMMANDS_FILE}"
        done
    done
fi

echo "" >> "${COMMANDS_FILE}"

#------------------------------------------------------------------------------
# PHOENIX Configuration
#------------------------------------------------------------------------------
declare -A phoenix_cores=(
    ["histogram"]=10
    ["kmeans"]=10
    ["linear_regression"]=8
    ["matrix_multiply"]=10
    ["pca"]=30
    ["string_match"]=8
    ["word_count"]=8
)


declare -A phoenix_args=(
    ["histogram"]="histogram image-2.bmp"
    ["kmeans"]="kmeans -d 500 -c 6 -p 100 -s 100"
    ["linear_regression"]="linear_regression ex1data1.txt"
    ["matrix_multiply"]="matrix_multiply 50 50"
    ["pca"]="pca -r 125 -c 125 -s 75"
    ["string_match"]="string_match test.txt"
    ["word_count"]="word_count test.txt"
)

echo "[phoenix]" >> "${COMMANDS_FILE}"

PHOENIX_DIR="${BENCHMARKS_DIR}/phoenix/phoenix-2.0/tests"
if [[ -d "${PHOENIX_DIR}" ]]; then
    for bench_dir in "${PHOENIX_DIR}"/*/; do
        [[ -d "$bench_dir" ]] || continue
        
        name=$(basename "$bench_dir")
        [[ -z "${phoenix_cores[$name]:-}" ]] && continue
        
        rel_path=$(echo "$bench_dir" | sed "s|${BENCHMARKS_DIR}/||" | sed 's|/$||')
        
        cores=${phoenix_cores[$name]}
        
        args=${phoenix_args[$name]}
        
        # Generate full command line for each protocol configuration
        for config in "${PROTOCOL_CONFIGS[@]}"; do
            IFS=':' read -r protocol latency csv_name <<< "$config"
            
            out_dir="${OUTPUT_BASE}/phoenix/${name}/${csv_name}"
            
            cmd_line="gem5/build/X86_${protocol}/gem5.opt --outdir=${out_dir} --redirect-stdout --redirect-stderr setup/setup.py -c ${cores} --remote-latency ${latency} -ro -- benchmarks/${rel_path}/${args}"
            echo "phoenix | ${csv_name} | ${name} | ${cmd_line}" >> "${COMMANDS_FILE}"
        done
    done
fi

echo "" >> "${COMMANDS_FILE}"

#------------------------------------------------------------------------------
# YCSB Configuration
#------------------------------------------------------------------------------
echo "[ycsb]" >> "${COMMANDS_FILE}"

YCSB_DIR="${BENCHMARKS_DIR}/YCSB-C"
if [[ -d "${YCSB_DIR}" && -f "${YCSB_DIR}/ycsbc" ]]; then
    # YCSB workloads: A, B, C, D, F (E is for range queries, skip)
    YCSB_WORKLOADS=("A" "B" "C" "D" "F")
    
    # Thread counts for scaling experiments
    YCSB_THREADS=(2 4 8 16 24 32)
    
    for workload in "${YCSB_WORKLOADS[@]}"; do
        for threads in "${YCSB_THREADS[@]}"; do
            # Cores = threads (no extra core for this benchmark)
            cores=$threads
            
            # Generate full command line for each protocol configuration
            for config in "${PROTOCOL_CONFIGS[@]}"; do
                IFS=':' read -r protocol latency csv_name <<< "$config"
                
                out_dir="${OUTPUT_BASE}/ycsb/${workload}/${csv_name}/threads_${threads}"
                rel_path="YCSB-C"
                
                # YCSB command: ./ycsbc -db lock_stl -threads N -P workloads/workloadX.spec
                cmd_line="gem5/build/X86_${protocol}/gem5.opt --outdir=${out_dir} --redirect-stdout --redirect-stderr setup/setup.py -c ${cores} --remote-latency ${latency} -ro -- benchmarks/${rel_path}/ycsbc -db lock_stl -threads ${threads} -P benchmarks/${rel_path}/workloads/workload${workload,,}.spec"
                echo "ycsb | ${csv_name} | ${workload}_t${threads} | ${cmd_line}" >> "${COMMANDS_FILE}"
            done
        done
    done
    
    echo "    YCSB configurations generated for workloads: ${YCSB_WORKLOADS[*]}"
    echo "    Thread counts: ${YCSB_THREADS[*]}"
else
    echo "    WARNING: YCSB-C not found or not built at ${YCSB_DIR}"
    echo "    Run './script/build-benchmark-x86.sh ycsb' first"
fi

echo "" >> "${COMMANDS_FILE}"

echo ""
echo "=============================================="
echo "Generated ${COMMANDS_FILE}"
echo "=============================================="
echo ""
echo "Protocol mappings:"
echo "  MOESI_CMP_directory_edit (lat=10)  -> MOESI_no-lat"
echo "  MOESI_CMP_directory_edit (lat=140) -> MOESI_gem5"
echo "  MESI_unord (lat=140)          -> MESI_MESI_MESI"
echo "  MESI_unord_CXL (lat=140)      -> MESI_CXL_MESI"
echo ""
echo "Benchmark suites configured:"
echo "  - PARSEC"
echo "  - SPLASH-4" 
echo "  - PHOENIX"
echo "  - YCSB-C"
echo "=============================================="
