UID := `id -u`
GID := `id -g`

gem5-unpack:
    tar xf gem5.tar.gz ./gem5/

# build vCXLGen base docker image
docker-build-base:
    docker build -f ./docker/base/Dockerfile -t gingerbreadz/vcxlgen-artifact-base:v1 .

# build vCXLGen prebuilt docker image -- from local gem5 & benchmarks directories, build steps are run when building docker image
docker-build-multi:
    docker build -f ./docker/multi/Dockerfile -t gingerbreadz/vcxlgen-artifact-prebuilt:v1 .

# From vCXLGen prebuilt image -- skip gem5 and benchmark compilation
docker-prebuilt:
    docker run                                     \
        --volume ./script:/script       \
        --volume ./setup:/setup       \
        --volume ./slicc:/slicc       \
        --volume ./data:/data       \
        --volume ./output:/output       \
        --volume ./CXLGen:/CXLGen       \
        --volume ./liveness_models:/liveness_models       \
        --volume ./tools:/tools  \
        -it gingerbreadz/vcxlgen-artifact-prebuilt:v1

# From vCXLGen base image -- only includes extra dependencies, compile gem5 & benchmarks from instructions
docker-base:
    docker run                                     \
        --mount type=bind,source=./gem5.tar.gz,target=/gem5.tar.gz \
        --volume ./gem5:/gem5       \
        --volume ./benchmarks:/benchmarks       \
        --volume ./script:/script       \
        --volume ./setup:/setup       \
        --volume ./slicc:/slicc       \
        --volume ./data:/data       \
        --volume ./output:/output       \
        --volume ./CXLGen:/CXLGen       \
        --volume ./liveness_models:/liveness_models       \
        --volume ./tools:/tools  \
        -it gingerbreadz/vcxlgen-artifact-base:v1

# From gem5 official base image -- install extra vCXLGen dependencies and build gem5 & benchmarks from instructions
gem5-docker:
    docker run                                     \
        --mount type=bind,source=./gem5.tar.gz,target=/gem5.tar.gz \
        --volume ./gem5:/gem5       \
        --volume ./benchmarks:/benchmarks       \
        --volume ./script:/script       \
        --volume ./setup:/setup       \
        --volume ./slicc:/slicc       \
        --volume ./data:/data       \
        --volume ./output:/output       \
        --volume ./CXLGen:/CXLGen       \
        --volume ./liveness_models:/liveness_models       \
        --volume ./tools:/tools  \
        -it ghcr.io/gem5/ubuntu-24.04_all-dependencies:v25-0
