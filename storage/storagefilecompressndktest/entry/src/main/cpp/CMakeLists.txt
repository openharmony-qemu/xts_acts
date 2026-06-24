
## the minimum version of CMake.
cmake_minimum_required(VERSION 3.5)
project(MyApplication4)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

add_compile_definitions(entry UNIT_TEST)

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)
include_directories(${HMOS_SDK_NATIVE}/sysroot/usr/include)
link_directories(${HMOS_SDK_NATIVE}/sysroot/usr/lib/aarch64-linux-ohos)

aux_source_directory(. DIR_LIB_SRCS)
aux_source_directory(ctests DIR_LIB_SRCS)
add_library(entry SHARED ${DIR_LIB_SRCS})

target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so librawfile.z.so liboharchive.so)