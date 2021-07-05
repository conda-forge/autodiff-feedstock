#!/bin/sh

<<<<<<< HEAD
if [ $CLANGXX ]; then
    echo 'Skipping test for osx_64 build in azure pipeline.'
    echo 'Reason: it seems conda`s linker doesn`t support macOS 10.14 SDK.' # @chrisburr said at gitter
    exit 0
fi

cd test
mkdir .build
cd .build
cmake .. -GNinja -DCMAKE_PREFIX_PATH=$PREFIX
ninja
./test
=======
# Build and execute C++ test application using autodiff
cd test/app
cmake -S . -B build -DCMAKE_PREFIX_PATH=$PREFIX
cmake --build build
./build/app
>>>>>>> v0.6
