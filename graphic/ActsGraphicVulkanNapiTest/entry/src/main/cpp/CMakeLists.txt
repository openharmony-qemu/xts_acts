cmake_minimum_required(VERSION 3.5.0)
project(GraphicVulkanNapiTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(graphic_vulkan_napi_test SHARED
    VulkanTest.cpp
    VulkanTestInterfaceTest.cpp)

find_library(hilog-lib hilog_ndk.z)

target_link_libraries(graphic_vulkan_napi_test PUBLIC
    libace_napi.z.so
    ${hilog-lib}
    libace_ndk.z.so
    libnative_window.so
    libvulkan.so
)

