#!/usr/bin/env bash

set -e
set -x

BASEDIR=$(dirname "$0")
pushd "$BASEDIR"

# if exist path `build' then remove.
_d=build
test -d $_d && rm $_d

conan install . --install-folder=build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -DCMAKE_BUILD_TYPE=Release
cmake --build .
./compressor

popd
