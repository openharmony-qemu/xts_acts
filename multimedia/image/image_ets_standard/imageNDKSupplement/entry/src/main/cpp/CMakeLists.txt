# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.1)
project(OHImageEffectNDK)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
    ${NATIVERENDER_ROOT_PATH}/utils
)

add_library(imageEffect SHARED
    napi_init.cpp
    utils/CommonUtilsTest.cpp
    utils/PixelmapHelperTest.cpp
    utils/GlUtilsTest.cpp
    OHEffectBufferInfoSetTimestampTest.cpp
    OHEffectBufferInfoGetTimestampTest.cpp
    OHEffectBufferInfoSetTextureIdTest.cpp
    OHEffectBufferInfoGetTextureIdTest.cpp
    OHEffectFilterInfoSupplementTest.cpp
    ImageEffectFilterSuppTest.cpp
    OHImageErrorSuppTest.cpp
    ImageEffectSuppTest.cpp
    ImageEffectFilterRenderSuppTest.cpp
    ImageFrameworkPixelMapNativeCreateSuppTest.cpp
    ImageSourceNativeCreateTest.cpp
    InitNativePixelMapTest.cpp
    ImagePackerCreateTest.cpp
    ImagePixelMapTest.cpp)

find_library(
    # Sets the name of the path variable.
    EGL-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    EGL
)

find_library(
    # Sets the name of the path variable.
    GLES-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    GLESv3
)


target_link_libraries(imageEffect PUBLIC
    libimage_ndk.z.so
    libace_napi.z.so
    libhilog_ndk.z.so
    libimage_effect.so
    libpixelmap.so
    libnative_window.so
    libnative_buffer.so
    libpixelmap_ndk.z.so
    libimage_packer.so
    libimage_source.so
    libimage_receiver_ndk.z.so
    libimage_common.so
    libimage_packer_ndk.z.so
    libimage_source_ndk.z.so
    libpicture.so
    ${EGL-lib}
    ${GLES-lib}
)