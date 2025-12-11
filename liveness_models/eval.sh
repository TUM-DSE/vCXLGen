# Clean up non-model files
find MESIxCXLxRCC -type f ! -name "*.m" -delete
find MESIxMESIxMESI -type f ! -name "*.m" -delete

python3 eval.py all

# Collect Data
mkdir -p ../output/liveness/
python3 extract_data.py
cp results.csv ../output/liveness/results.csv
cp incomplete.csv ../output/liveness/incomplete.csv

# Generate Plots
python3 gen_figs.py
