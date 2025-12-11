
cd rumur_src
rm -rf build
cmake -B build -S .
cmake --build build

cd ../murphi_src/src
make clean
rm -f mu
make 

cd ../../
ln -sf rumur_src/build/rumur/rumur rumur
ln -sf murphi_src/src/mu mu

cd ..
git submodule update --init --recursive
mkdir -p output/liveness/
mkdir -p output/litmus/
