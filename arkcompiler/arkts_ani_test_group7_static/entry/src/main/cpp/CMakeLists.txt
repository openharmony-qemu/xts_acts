# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ani_test)

# WORKAROUND: hvigor 26 (5.14.2-td-rc) BuildNativeWithNinja hardlinks the
# library from the ninja output dir to an identical expected path, which fails
# on Windows. Force the output into the ninja build dir so source != target.
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}" CACHE PATH "override" FORCE)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_CXX_STANDARD 17)
if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED AniTest.cpp 
    NativeObjectStorageTest.cpp
    ClassStorageTest.cpp
    ContainerStorageTest.cpp
    ThreadSafeStorageTest.cpp
    AniObjectTypeTest.cpp
    ConcurrentStorageTest.cpp
    MapKeyStorageTest.cpp
    ExceptionStorageTest.cpp)

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")
target_link_libraries(entry PUBLIC libhilog_ndk.z.so)