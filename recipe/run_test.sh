#!/bin/sh

# Build and execute C++ test application using autodiff
cd test/app
cmake -S . -B build -DCMAKE_PREFIX_PATH=$PREFIX
cmake --build build
./build/app
