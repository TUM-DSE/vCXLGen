# === 1. Build Tools ===
cd tools
nix develop -c "./build_tools.sh"
cd ..


# === 2. Litmus Tests ===
cd CXLGen
git checkout -f mc-cxl-lit
nix develop -c python3 -- "eval.py" "all"
cd ..


# === 3. Generate Liveness Models ===
cd CXLGen
git checkout -f mc-cxl-dev
nix develop -c "./eval.sh"
cd ..


# === 4. Benchmark Liveness Models ===
cd liveness_models
# These files come with pre-generated models. The command replaces the included models with the newly generated ones.
# Since generation is non-deterministic, we recommend using the included models for reproduction.
# nix develop -c "./migrate.sh"
nix develop -c "./eval.sh"
cd ..
