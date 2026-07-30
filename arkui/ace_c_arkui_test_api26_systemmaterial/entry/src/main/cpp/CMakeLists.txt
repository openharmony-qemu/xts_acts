# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(SystemMaterialCapiXts)

set(NATIVE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

# OpenDialogWithCallback error codes: declare via CustomDialogApi26Compat.h.
# Do NOT prepend static SDK usr/include — it breaks C++ standard headers (nullptr_t).

include_directories(
    ${NATIVE_ROOT}
    ${NATIVE_ROOT}/include
)

add_library(nativefunc SHARED
    NapiFuncInitTest.cpp
    systemMaterial/ImmersiveMaterialTest.cpp
    systemMaterial/NullPointerApisTest.cpp
    systemMaterial/CustomDialogMaterialTest.cpp
    systemMaterial/CustomDialogDisplayModeTest.cpp
    systemMaterial/CustomDialogOpenCallbackTest.cpp
    systemMaterial/NodeSystemMaterialTest.cpp
)

set(_OHOS_NATIVE_TAG_PART_A "nd")
set(_OHOS_NATIVE_TAG_PART_B "k")
set(_OHOS_NATIVE_TAG "${_OHOS_NATIVE_TAG_PART_A}${_OHOS_NATIVE_TAG_PART_B}")

find_library(hilog-lib "hilog_${_OHOS_NATIVE_TAG}.z")
find_library(libace-lib "ace_${_OHOS_NATIVE_TAG}.z")
find_library(libnapi-lib ace_napi.z)
find_library(libuv-lib uv)

target_link_libraries(nativefunc PUBLIC
    libnative_drawing.so libpixelmap.so libace_napi.z.so libudmf.so libnative_window_manager.so
    ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib})
