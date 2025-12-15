
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

ARCH="${1:-x86}"

# Validation directories
VALIDATION_DIR="${REPO_ROOT}/data/functional"
RESULTS_FILE="${VALIDATION_DIR}/results.txt"

# YCSB configuration
YCSB_BINARY="benchmarks/YCSB-C/ycsbc"
YCSB_WORKLOADS_DIR="${REPO_ROOT}/benchmarks/YCSB-C/workloads"
YCSB_THREADS=2
GEM5_CORES=4
YCSB_DB="lock_stl"

# Workloads to test (a, b, c, d, f with _test.spec suffix)
YCSB_WORKLOADS=("a" "b" "c" "d" "f")

#------------------------------------------------------------------------------
# Extract throughput from YCSB output for comparison
#------------------------------------------------------------------------------
extract_ycsb_throughput() {
    local output_file="$1"
    awk '{ if($NF ~ /^[0-9]+(\.[0-9]+)?$/) print $NF }' "$output_file" | tail -n1
}

#------------------------------------------------------------------------------
# Check if YCSB completed successfully (look for throughput output)
#------------------------------------------------------------------------------
check_ycsb_success() {
    local output_file="$1"
    grep -E -q '[[:space:]][0-9]+(\.[0-9]+)?$' "$output_file" 2>/dev/null
}

#------------------------------------------------------------------------------
# Log functions
#------------------------------------------------------------------------------
log_step() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  $1"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

log_info() {
    echo "  → $1"
}

log_success() {
    echo "  ✓ $1"
}

log_error() {
    echo "  ✗ $1"
}

#------------------------------------------------------------------------------
# Run X86 functional validation with YCSB
#------------------------------------------------------------------------------
run_x86_functional() {
    log_step "X86 Functional Validation (YCSB)"
    
    local protocols=("MOESI_CMP_directory_edit" "MESI_unord" "MESI_unord_CXL")
    
    log_info "Testing ${#protocols[@]} protocols: ${protocols[*]}"
    log_info "YCSB workloads: ${YCSB_WORKLOADS[*]}"
    log_info "Threads: ${YCSB_THREADS}, Cores: ${GEM5_CORES}"
    echo ""
    
    local passed=0
    local failed=0
    local skipped=0
    
    for protocol in "${protocols[@]}"; do
        local gem5_binary="${REPO_ROOT}/gem5/build/X86_${protocol}/gem5.opt"
        
        if [[ ! -f "$gem5_binary" ]]; then
            log_error "${protocol}: gem5 build not found (skipped)"
            ((skipped++))
            continue
        fi
        
        for workload in "${YCSB_WORKLOADS[@]}"; do
            local workload_file="${YCSB_WORKLOADS_DIR}/workload${workload}_test.spec"
            local out_dir="${VALIDATION_DIR}/x86/${protocol}/workload${workload}"
            
            if [[ ! -f "$workload_file" ]]; then
                log_error "Workload file not found: ${workload_file} (skipped)"
                ((skipped++))
                continue
            fi
            
            mkdir -p "${out_dir}"
            
            log_info "${protocol} / workload${workload}: Running gem5 simulation..."
            
            cd "${REPO_ROOT}"
            local start_time=$(date +%s)
            
            if "${gem5_binary}" \
                --outdir="${out_dir}" \
                --redirect-stdout \
                --redirect-stderr \
                setup/setup.py \
                -c ${GEM5_CORES} \
                -ro \
                --remote-latency 1 \
                -- \
                "${YCSB_BINARY}" \
                -db ${YCSB_DB} \
                -threads ${YCSB_THREADS} \
                -P "${workload_file}" > /dev/null 2>&1; then
                
                local end_time=$(date +%s)
                local duration=$((end_time - start_time))
                
                if check_ycsb_success "${out_dir}/simerr.txt"; then
                    local throughput=$(extract_ycsb_throughput "${out_dir}/simerr.txt")
                    log_success "${protocol} / workload${workload}: PASSED (${duration}s, throughput: ${throughput:-N/A})"
                    echo "x86 | ${protocol} | workload${workload} | PASSED | ${duration}s | throughput: ${throughput:-N/A}" >> "${RESULTS_FILE}"
                    ((passed++))
                else
                    log_error "${protocol} / workload${workload}: FAILED - no throughput output"
                    echo "x86 | ${protocol} | workload${workload} | FAILED | no throughput output" >> "${RESULTS_FILE}"
                    ((failed++))
                fi
            else
                log_error "${protocol} / workload${workload}: FAILED - simulation error"
                echo "x86 | ${protocol} | workload${workload} | FAILED | simulation error" >> "${RESULTS_FILE}"
                ((failed++))
            fi
        done
    done
    
    echo ""
    log_info "X86 Results: ${passed} passed, ${failed} failed, ${skipped} skipped"
    
    [[ $failed -eq 0 && $skipped -eq 0 ]]
}


mkdir -p "${VALIDATION_DIR}"
echo "# Functional Validation Results (YCSB) - $(date)" > "${RESULTS_FILE}"

X86_PASSED=true

run_x86_functional || X86_PASSED=false
