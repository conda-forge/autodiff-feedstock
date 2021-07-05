<<<<<<< HEAD
mkdir .build
cd .build
=======
@REM Configure the build of autodiff
cmake -S . -B build                           ^
    -DCMAKE_BUILD_TYPE=Release                ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%   ^
    -DCMAKE_INCLUDE_PATH=%LIBRARY_INC%        ^
    -DAUTODIFF_PYTHON_INSTALL_PREFIX=%PREFIX% ^
    -DPYTHON_EXECUTABLE=%PYTHON%
>>>>>>> v0.6

@REM Build and install autodiff in %LIBRARY_PREFIX%
@REM Note: No need for --parallel below, since cmake takes care of the /MP flag for MSVC
cmake --build build --config Release --target install
