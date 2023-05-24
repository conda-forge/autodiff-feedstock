#!/bin/bash

# Avoid errors on the server such as:
#  - Error: virtual memory exhausted: Cannot allocate memory
#  - Error: Exit code 137
# due to many parallel jobs consuming all available memory
JOBS=$((CPU_COUNT*2 - 1))

echo "Using $JOBS parallel jobs out of $((CPU_COUNT*2)) available to build autodiff."

mkdir .build
cd .build

# Turn of tests for 
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" == "1" ]]; then
  build_tests="OFF"
else
  build_tests="ON"
fi


# Configure the build of autodiff
cmake -GNinja .. ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release     \
    -DAUTODIFF_BUILD_EXAMPLES=OFF  \
    -DAUTODIFF_BUILD_TESTS=${build_tests}  \
    -DPYTHON_EXECUTABLE=$PYTHON

# Build and install autodiff in $PREFIX
# make install -j $JOBS
ninja install

# Perform all autodiff tests after build step
ninja tests
