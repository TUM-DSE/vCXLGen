# Clean up non-model files
find MESIxCXLxRCC -type f ! -name "*.m" -delete
find MESIxMESIxMESI -type f ! -name "*.m" -delete

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Bench Everything
find MESIxCXLxRCC -type f -name "COMP*.m" | while read -r model; do
    dir=$(dirname "$model")
    (cd "$dir" && timeout 5h bash "$SCRIPT_DIR/bench_rumur.sh")
done
find MESIxMESIxMESI -type f -name "COMP*.m" | while read -r model; do
    dir=$(dirname "$model")
    (cd "$dir" && timeout 5h bash "$SCRIPT_DIR/bench_rumur.sh")
done

find MESIxMESIxMESI -type f -name "MU*.m" | while read -r model; do
    dir=$(dirname "$model")
    (cd "$dir" && timeout 5h bash "$SCRIPT_DIR/bench_murphi.sh")
done
find MESIxCXLxRCC -type f -name "MU*.m" | while read -r model; do
    dir=$(dirname "$model")
    (cd "$dir" && timeout 5h bash "$SCRIPT_DIR/bench_murphi.sh")
done

find MESIxMESIxMESI -type f -name "RMR*.m" | while read -r model; do
    dir=$(dirname "$model")
    (cd "$dir" && timeout 5h bash "$SCRIPT_DIR/bench_rumur.sh")
done
find MESIxCXLxRCC -type f -name "RMR*.m" | while read -r model; do
    dir=$(dirname "$model")
    (cd "$dir" && timeout 5h bash "$SCRIPT_DIR/bench_rumur.sh")
done

# Collect Data
mkdir -p ../output/liveness/
python3 extract_data.py
cp results.csv ../output/liveness/results.csv
cp incomplete.csv ../output/liveness/incomplete.csv

# Generate Plots
python3 gen_figs.py
