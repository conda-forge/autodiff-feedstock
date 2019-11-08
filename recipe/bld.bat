mkdir build
cd build

set "CC=cl.exe"
set "CXX=cl.exe"

REM Configure step
cmake .. ^
    -GNinja ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%
if errorlevel 1 exit 1

REM Build step
ninja install
if errorlevel 1 exit 1
