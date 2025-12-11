# Verification Artifacts

This repository contains the verification artifacts for vCXLGen.

## Requirements
- Nix package manager: https://nixos.org/download.html
- 2 TB of RAM for running the litmus tests
- ~100 GB of RAM for generating and verifying liveness models

## Reproduction
To reproduce the results, run the `eval.sh` script from the root of this repository:
```bash
./eval.sh
```

This script will:
1. Build the necessary model-checking tools.
2. Run the litmus tests and save the results to `output/LitmusTest_Results.txt`.
3. Generate liveness models using vCXLGen.
4. Benchmark the liveness models and save the results+figures to `output/liveness/`.

> Note: The liveness models come with pre-generated models for reproducibility. We recommend those over using newly generated models, which may differ due to non-determinism in the generation process.

## Notes

### Out of Memory Issues
Murphi statically allocates memory upfront before model checking. If you are unable to provide enough RAM all murphi checks will fail, even if they would require less RAM. You can try reducing the allocated memory in `liveness_models/bench_murphi.sh`, `liveness_models/bench_rumur.sh` and `CXLGen/ParallelChecker.py` to run the smaller models, note that this will still fail for larger models and may produce different results than those in the paper.

### Runtime
Parts of the evaluation are paralellized to reduce runtime (Litmus Tests, Rumur Model Checking). The full evaluation will likely take multiple days depending on your hardware. Our test machine is a dual-Intel SPR 6438Y+ hyperthreaded 128-core server with 2TB of main memory. We estimate that on this machine the `MESIxMESIxMESI/2Cl_3CC/FullRumurLive` liveness model alone can take >30 days to verify, therefore we set a **timeout of 5 hours per individual model** in the evaluation script.

