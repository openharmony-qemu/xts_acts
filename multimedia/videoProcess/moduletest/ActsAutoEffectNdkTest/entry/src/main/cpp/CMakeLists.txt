# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsAutoEffectNdkTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(autoeffecttest SHARED
NapiInitTest.cpp
ApiTest.cpp
FunctionTest.cpp)

target_link_libraries(autoeffecttest PUBLIC libace_napi.z.so
libvideo_processing.so
libnative_media_core.so
libhilog_ndk.z.so
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
