@echo ON
setlocal enabledelayedexpansion

cmake -B build -LAH -G "Ninja"                                            ^
    -DCMAKE_BUILD_TYPE="Release"                                          ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX%                               ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX%                                  ^
    -DOPENCV_BIN_INSTALL_PATH=bin                                         ^
    -DOPENCV_LIB_INSTALL_PATH=lib                                         ^
    -DBUILD_SHARED_LIBS=1                                                 ^
    -DCHARLS_BUILD_TESTS=1                                                ^
    -DCHARLS_BUILD_SAMPLES=0                                              ^
    -DCHARLS_INSTALL=1                                                    ^
    .

if errorlevel 1 exit 1

cmake --build build --target install --config Release
if errorlevel 1 exit 1
ctest -j -C Release --test-dir build
if errorlevel 1 exit 1