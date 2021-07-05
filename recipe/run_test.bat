@REM Build and execute C++ test application using autodiff
cd test\app
cmake -S . -B build -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%
cmake --build build --config Release
build\Release\app.exe
