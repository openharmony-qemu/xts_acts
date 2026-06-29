# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(SystemMaterialCapiXts)

set(NATIVE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

include_directories(
    ${NATIVE_ROOT}
    ${NATIVE_ROOT}/include
)

add_library(nativefunc SHARED
    NapiFuncInitTest.cpp
    systemMaterial/ImmersiveMaterialTest.cpp
    systemMaterial/CustomDialogMaterialTest.cpp
    systemMaterial/NodeSystemMaterialTest.cpp
)

find_library(hilog-lib hilog_ndk.z)
find_library(libace-lib ace_ndk.z)
find_library(libnapi-lib ace_napi.z)
find_library(libuv-lib uv)

target_link_libraries(nativefunc PUBLIC
    libnative_drawing.so libpixelmap.so libace_napi.z.so libudmf.so
    ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})
