mkdir .build
cd .build

@REM Configure the build of autodiff
cmake -GNinja ..                              ^
    -DCMAKE_BUILD_TYPE=Release                ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%   ^
    -DCMAKE_INCLUDE_PATH=%LIBRARY_INC%        ^
    -DAUTODIFF_BUILD_EXAMPLES=OFF             ^
    -DAUTODIFF_PYTHON_INSTALL_PREFIX=%PREFIX% ^
    -DPYTHON_EXECUTABLE=%PYTHON%

@REM Build and install autodiff in %LIBRARY_PREFIX%
ninja install

@REM Perform all autodiff tests after build step
ninja tests
