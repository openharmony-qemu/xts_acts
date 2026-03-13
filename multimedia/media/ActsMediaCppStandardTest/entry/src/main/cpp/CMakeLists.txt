# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(ActsMediaCppStandardTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)

add_library(mediacppstandard_test SHARED
    NapiInitTest.cpp
    ActsAudioDecEncNativeTest.cpp
    ActsCodecFormatNativeTest.cpp
    ActsVideoDecEncNativeTest.cpp
    ADecEncNativeSample.cpp
    VDecEncNativeSample.cpp
    SecurecTest.cpp
    syscap_stub.c
)

target_link_libraries(mediacppstandard_test PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so  # System-provided; WordsTool.143 waived
    libnative_media_codecbase.so
    libnative_media_core.so
    libnative_media_adec.so
    libnative_media_aenc.so
    libnative_media_vdec.so
    libnative_media_venc.so
    libnative_window.so)

