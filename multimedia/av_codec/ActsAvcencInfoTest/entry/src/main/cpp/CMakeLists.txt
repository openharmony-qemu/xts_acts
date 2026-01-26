cmake_minimum_required(VERSION 3.10)
project(cencinfotest)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CURRENT_DIR ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(
    ${OHOS_SYSROOT}/usr/include/multimedia/player_framework
    ${OHOS_SYSROOT}/usr/include/multimedia/drm_framework
    ${CMAKE_SYSROOT}/usr/include/multimedia
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CURRENT_DIR}/include
)
link_directories(
    ${OHOS_SYSROOT}/usr/lib/${CMAKE_SYSTEM_PROCESSOR}
    ${OHOS_SYSROOT}/usr/lib
)
add_library(cencinfotest SHARED
    AvcencInfoCheckTest.cpp
    NapiTest.cpp
)
target_link_libraries(cencinfotest
    libace_napi.z.so
    libnative_media_avcencinfo.so
    libnative_media_core.so
    libnative_media_acodec.so
)