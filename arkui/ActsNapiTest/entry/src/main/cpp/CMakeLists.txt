cmake_minimum_required(VERSION 3.5)

project(napitest)
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(OPENHARMONY_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../../..)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/include
)

aux_source_directory(${OPENHARMONY_ROOT_PATH}/third_party/bounds_checking_function/src/ SECUREC_SRCS)
add_library(securec SHARED ${SECUREC_SRCS})

add_library(napiBuffer SHARED ./napi/napiBuffer.cpp)
target_link_libraries(napiBuffer PUBLIC securec libace_napi.z.so libuv.so)

add_library(napiData SHARED ./napi/napiData.cpp)
target_link_libraries(napiData PUBLIC securec libace_napi.z.so libuv.so)

add_library(napiString SHARED ./napi/napiString.cpp)
target_link_libraries(napiString PUBLIC securec libace_napi.z.so libuv.so)