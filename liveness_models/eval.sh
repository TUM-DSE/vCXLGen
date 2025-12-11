# Clean up non-model files
find MESIxCXLxRCC -type f ! -name "*.m" -delete
find MESIxMESIxMESI -type f ! -name "*.m" -delete

python3 eval.py all

# Collect Data
python3 extract_data.py

# Generate Plots
python3 gen_figs.py
