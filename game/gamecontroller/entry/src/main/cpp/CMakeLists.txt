# the minimum version of CMake.
cmake_minimum_required(VERSION 3.16.5)
project(gamecontrollercapi)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

set(GAMECONTROLLER_SOURCES
    acts/src/GameDeviceEventTest.cpp
    acts/src/GameControllerRealTest.cpp
    acts/src/GamePadEventTest.cpp
    acts/src/GamePadTest.cpp
    acts/src/GameDeviceTest.cpp
    ExportsApiTest.cpp
)

set(FRAMEGENERATION_INCLUDE_DIRECTORIES
    acts/include
)

add_library(entry SHARED
    ${GAMECONTROLLER_SOURCES})

find_library(gamecontroller-lib libohgame_controller.z.so REQUIRED)

target_link_libraries(entry PUBLIC libace_napi.z.so libace_ndk.z.so libhilog_ndk.z.so libohgame_controller.z.so libuv.so)

include_directories(${HMOS_SDK_NATIVE}/sysroot/usr/lib)
include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

# Disable libentry.so symbol publishing
set_target_properties(entry PROPERTIES
    CXX_VISIBILITY_PRESET hidden
)

