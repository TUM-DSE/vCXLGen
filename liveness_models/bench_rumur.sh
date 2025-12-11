ulimit -v 104857600

rm -f checker checker.c output.txt

set -e

printf "========================================\n Generating C Model Checker from Murphi\n========================================\n"

env time -o rumur_time.txt -v time "$(dirname "$0")/../tools/rumur" *.m -v --symmetry-reduction exhaustive --output checker.c -s 500000000

printf "\n========================================\n        Compiling Model Checker\n========================================\n"

env time -o cc_time.txt -v cc -std=c11 -march=native -O1 checker.c -lpthread -mcx16 -o checker

rm -f time.txt
rm -f out.txt
rm -f err*

env time -o time.txt -v stdbuf --output=L ./checker | tee out.txt

csplit -z out.txt '/Startstate/-2' '{*}' -n 1 -f err -s

rm err0
