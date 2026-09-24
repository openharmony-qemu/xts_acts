# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(taihe_test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(CMAKE_CXX_STANDARD 17)
if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

if (DEFINED OHOS_SDK_NATIVE)
    get_filename_component(OHOS_SDK_NATIVE "${OHOS_SDK_NATIVE}/.." ABSOLUTE)
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${OHOS_SDK_NATIVE}/toolchains/taihe/include
                    )

set(SOURCE_FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/abilityInfo.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/abilityInfo.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/applicationInfo.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/applicationInfo.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/bundleInfo.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/bundleInfo.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/customizeData.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/customizeData.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/elementName.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/elementName.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/hapModuleInfo.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/hapModuleInfo.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/moduleInfo.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/moduleInfo.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/ohos_app_ability_want.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/ohos_app_ability_want.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/ohos_bundle.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/ohos_bundle.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/shortcutInfo.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/shortcutInfo.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/taihe.platform.ani.abi.c
)

set(RUNTIME_FILES
    ${OHOS_SDK_NATIVE}/toolchains/taihe/src/taihe/runtime/object.cpp
    ${OHOS_SDK_NATIVE}/toolchains/taihe/src/taihe/runtime/runtime_ani.cpp
    ${OHOS_SDK_NATIVE}/toolchains/taihe/src/taihe/runtime/string.cpp
)

foreach(file ${SOURCE_FILES})
    set_source_files_properties(${file} PROPERTIES GENERATED TRUE)
endforeach()

add_library(entry SHARED
    abilityInfo.impl.cpp
    applicationInfo.impl.cpp
    bundleInfo.impl.cpp
    customizeData.impl.cpp
    elementName.impl.cpp
    hapModuleInfo.impl.cpp
    moduleInfo.impl.cpp
    ohos_app_ability_want.impl.cpp
    ohos_bundle.impl.cpp
    shortcutInfo.impl.cpp
    ani_constructor.cpp
    ${SOURCE_FILES}
    ${RUNTIME_FILES}
)

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")