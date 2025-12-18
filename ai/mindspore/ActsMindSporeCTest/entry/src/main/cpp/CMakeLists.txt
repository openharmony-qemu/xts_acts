# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(NativeTemplate)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(mindspore SHARED
NapiInitTest.cpp
OhosCommonTest.cpp
ActsMindSporeCommonTest.cpp
ActsMindSporeTrainTest.cpp)

target_link_libraries(mindspore PUBLIC libace_napi.z.so libmindspore_lite_ndk.so libhilog_ndk.z.so)