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
    ${CMAKE_CURRENT_SOURCE_DIR}/mate.bar.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/mate.bar.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/mate.foo.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/mate.foo.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/mate.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/mate.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/nova.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/nova.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pura.baz.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/pura.baz.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pura.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/pura.abi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/test.inner.ani.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/test.inner.abi.c
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

add_library(entry SHARED mate.bar.impl.cpp mate.foo.impl.cpp mate.impl.cpp nova.impl.cpp pura.baz.impl.cpp pura.impl.cpp test.inner.impl.cpp ani_constructor.cpp ${SOURCE_FILES} ${RUNTIME_FILES})

add_definitions("-DLOG_DOMAIN=0x0000")
add_definitions("-DLOG_TAG=\"testTag\"")
