git clone https://github.com/Gingerbreadz/CXLGen.git CXLGen

# === Build Tools ===
# cd tools
# nix develop -c "./build_tools.sh"
# cd ..

# === Litmus Tests ===
# cd CXLGen
# git checkout -f mc-cxl-lit
# nix develop -c "./eval.sh"
# cd ..
# mkdir -p output
# cp CXLGen/TestScripts/Test_Result.txt output/LitmusTest_Results.txt

# === Liveness ===
# Generate Models
# cd CXLGen
# git checkout -f mc-cxl-dev
# nix develop -c "./eval.sh"
# cd ..

# Bench Models
cd liveness_models
# These files come with pre-generated models. The below step replaces the included models with the newly generated ones.
# Since generation is non-deterministic, we recommend using the included models for reproduction.
# nix develop -c "./migrate.sh"
nix develop -c "./eval.sh"
cd ..
