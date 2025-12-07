
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

ARCH="${1:-x86}"

# Validation directories
VALIDATION_DIR="${REPO_ROOT}/data/functional"
EXPECTED_FILE="${VALIDATION_DIR}/expected_output.txt"
RESULTS_FILE="${VALIDATION_DIR}/results.txt"

# Benchmark configuration
KMEANS_ARGS="-d 500 -c 6 -p 100 -s 100"
GEM5_CORES=10

#------------------------------------------------------------------------------
# Extract Final means values from kmeans output (normalized for comparison)
#------------------------------------------------------------------------------
extract_final_means() {
    local output_file="$1"
    sed -n '/Final means:/,$ p' "$output_file" | tail -n +2 | \
        grep -oE '[0-9]+' | tr '\n' ' ' | sed 's/ $//'
}

#------------------------------------------------------------------------------
# Compare two outputs
#------------------------------------------------------------------------------
compare_outputs() {
    local actual="$1"
    local expected="$2"
    
    local actual_means=$(extract_final_means "$actual")
    local expected_means=$(extract_final_means "$expected")
    
    [[ "$actual_means" == "$expected_means" ]]
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
# Generate expected output from native binary
#------------------------------------------------------------------------------
generate_expected() {
    log_step "Generating Reference Output (Native Execution)"
    
    local kmeans_dir="${REPO_ROOT}/benchmarks/phoenix/phoenix-2.0/tests/kmeans"
    
    log_info "Running kmeans natively to generate expected output..."
    
    cd "${kmeans_dir}"
    ./kmeans ${KMEANS_ARGS} > "${EXPECTED_FILE}" 2>&1
    
    local num_values=$(extract_final_means "${EXPECTED_FILE}" | wc -w)
    log_info "Saved to: ${EXPECTED_FILE}"
}


run_x86_functional() {
    log_step "X86 Functional Validation"
    
    local protocols=("MOESI_CMP_directory_edit" "MESI_unord" "MESI_unord_CXL")
    local kmeans_binary="benchmarks/phoenix/phoenix-2.0/tests/kmeans/kmeans"
    
    log_info "Validating ${#protocols[@]} protocols: ${protocols[*]}"
    log_info "Each protocol will be tested against the native reference output."
    echo ""
    
    local passed=0
    local failed=0
    local skipped=0
    
    for protocol in "${protocols[@]}"; do
        local gem5_binary="${REPO_ROOT}/gem5/build/X86_${protocol}/gem5.opt"
        local out_dir="${VALIDATION_DIR}/x86/${protocol}"
        
        if [[ ! -f "$gem5_binary" ]]; then
            log_error "${protocol}: gem5 build not found (skipped)"
            ((skipped++))
            continue
        fi
        
        mkdir -p "${out_dir}"
        
        log_info "${protocol}: Running gem5 simulation..."
        
        cd "${REPO_ROOT}"
        local start_time=$(date +%s)
        
        if "${gem5_binary}" \
            --outdir="${out_dir}" \
            --redirect-stdout \
            --redirect-stderr \
            setup/setup.py \
            -c ${GEM5_CORES} \
            --switched \
            -ro \
            -- \
            "${kmeans_binary}" \
            ${KMEANS_ARGS} > /dev/null 2>&1; then
            
            local end_time=$(date +%s)
            local duration=$((end_time - start_time))
            
            if compare_outputs "${out_dir}/output.txt" "${EXPECTED_FILE}"; then
                log_success "${protocol}: PASSED (${duration}s)"
                echo "x86 | ${protocol} | PASSED | ${duration}s" >> "${RESULTS_FILE}"
                ((passed++))
            else
                log_error "${protocol}: FAILED - output mismatch"
                echo "x86 | ${protocol} | FAILED | output mismatch" >> "${RESULTS_FILE}"
                ((failed++))
            fi
        else
            log_error "${protocol}: FAILED - simulation error"
            echo "x86 | ${protocol} | FAILED | simulation error" >> "${RESULTS_FILE}"
            ((failed++))
        fi
    done
    
    echo ""
    log_info "X86 Results: ${passed} passed, ${failed} failed, ${skipped} skipped"
    
    [[ $failed -eq 0 && $skipped -eq 0 ]]
}


mkdir -p "${VALIDATION_DIR}"
echo "# Functional Validation Results - $(date)" > "${RESULTS_FILE}"

# Generate expected output first
generate_expected

X86_PASSED=true

run_x86_functional || X86_PASSED=false
