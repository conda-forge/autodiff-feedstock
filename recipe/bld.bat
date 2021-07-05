@REM Configure the build of autodiff
cmake -S . -B .build                          ^
    -DCMAKE_BUILD_TYPE=Release                ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%   ^
    -DCMAKE_INCLUDE_PATH=%LIBRARY_INC%        ^
    -DAUTODIFF_BUILD_EXAMPLES=OFF             ^
    -DAUTODIFF_PYTHON_INSTALL_PREFIX=%PREFIX% ^
    -DPYTHON_EXECUTABLE=%PYTHON%

@REM Build and install autodiff in %LIBRARY_PREFIX%
@REM Note: No need for --parallel below, since cmake takes care of the /MP flag for MSVC
cmake --build .build --config Release --target install

@REM Perform all autodiff tests after build step
cmake --build .build --config Release --target tests
