import fnmatch
import os
import sys
import subprocess
from pathlib import Path

SCRIPT_DIR = Path(__file__).resolve().parent
TIMEOUT_SECS = 5 * 60 * 60  # 5 hours

def run_bench(base_dir: str, pattern: str, bench_script: str) -> None:
    for root, _, files in os.walk(base_dir):
        for name in files:
            if fnmatch.fnmatch(name, pattern):
                try:
                    subprocess.run(
                        ["bash", str(SCRIPT_DIR / bench_script)],
                        cwd=root,
                        timeout=TIMEOUT_SECS,
                        check=False,
                    )
                except subprocess.TimeoutExpired:
                    print(f"Benchmark timed out for file {name} in {root}")
                except: 
                    print(f"Benchmark failed for file {name} in {root}")
                


if __name__ == "__main__":
    tests =[
        ("MESIxMESIxMESI/2Cl_3CC", "MU*.m", "bench_murphi.sh"),
        ("MESIxMESIxMESI/2Cl_3CC", "COMP*.m", "bench_rumur.sh"),
        ("MESIxMESIxMESI/2Cl_3CC", "RMR*.m", "bench_rumur.sh"),
        
        ("MESIxCXLxRCC/2Cl_2CC", "MU*.m", "bench_murphi.sh"),
        ("MESIxCXLxRCC/2Cl_2CC", "COMP*.m", "bench_rumur.sh"),
        ("MESIxCXLxRCC/2Cl_2CC", "RMR*.m", "bench_rumur.sh"),

        ("MESIxCXLxRCC/2Cl_3CC", "MU*.m", "bench_murphi.sh"),
        ("MESIxCXLxRCC/2Cl_3CC", "COMP*.m", "bench_rumur.sh"),
        ("MESIxCXLxRCC/2Cl_3CC", "RMR*.m", "bench_rumur.sh"),
    ]
    
    args = sys.argv[1:]
    success = False

    for base_dir, pattern, bench_script in tests:
        if ("all" in args) or any(a in base_dir for a in args):
            success = True
            run_bench(base_dir, pattern, bench_script)

    if not success:
        print("ERROR: No configuration specified. Use 'all' or specify which configurations to evaluate:")
        for base_dir in set( base_dir for base_dir, _, _ in tests):
            print(f" - {base_dir}")
        sys.exit(1)
