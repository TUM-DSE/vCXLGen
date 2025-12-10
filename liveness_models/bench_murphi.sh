printf "========================================\n Generating C Model Checker from Murphi\n========================================\n"

env time -v -o mu_time.txt "$(dirname "$0")/../tools/murphi_src/src/mu" -b *.m

printf "\n========================================\n        Compiling Model Checker\n========================================\n"

env time -v -o cc_time.txt g++ -O3 *.cpp -I"$(dirname "$0")/../tools/murphi_src/include" -o checker
env time -v -o time.txt stdbuf --output=L ./checker -pr -m 1900000 | tee out.txt
