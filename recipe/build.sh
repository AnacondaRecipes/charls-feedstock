set -ex

cmake -B build ${CMAKE_ARGS} -LAH                                         \
    -DCMAKE_BUILD_TYPE="Release"                                          \
    -DCMAKE_PREFIX_PATH=${PREFIX}                                         \
    -DCMAKE_INSTALL_PREFIX=${PREFIX}                                      \
    -DCMAKE_INSTALL_LIBDIR="lib"                                          \
    -DBUILD_SHARED_LIBS=1                                                 \
    -DCHARLS_BUILD_TESTS=1                                                \
    -DCHARLS_BUILD_SAMPLES=0                                              \
    -DCHARLS_INSTALL=1                                                    \
    .

cmake --build build -j --target install --config Release
ctest -j -C Release --test-dir build