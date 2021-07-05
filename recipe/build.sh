#!/bin/bash

# Avoid errors on the server such as:
#  - Error: virtual memory exhausted: Cannot allocate memory
#  - Error: Exit code 137
# due to many parallel jobs consuming all available memory
JOBS=$((CPU_COUNT*2 - 1))

<<<<<<< HEAD
mkdir .build
cd .build
=======
echo "Using $JOBS parallel jobs out of $((CPU_COUNT*2)) available to build autodiff."
>>>>>>> v0.6

# Configure the build of autodiff
cmake -S . -B build ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_EXECUTABLE=$PYTHON

# Build and install autodiff in $PREFIX
cmake --build build --target install --parallel $JOBS
