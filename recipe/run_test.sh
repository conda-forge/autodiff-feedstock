#!/bin/sh

# Build and execute C++ test application using autodiff
cd test/app
mkdir build
cd build
cmake -GNinja .. -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%
ninja
./app

