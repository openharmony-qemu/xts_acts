# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(NativeTemplate)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(drawingnative SHARED
NapiInitTest.cpp
OhosCommonTest.cpp
DrawingCanvasDrawRecordCmdTest.cpp)

target_link_libraries(drawingnative PUBLIC 
libace_napi.z.so 
libEGL.so 
libpixelmap.so 
libGLESv3.so 
libnative_drawing.so 
libhilog_ndk.z.so)