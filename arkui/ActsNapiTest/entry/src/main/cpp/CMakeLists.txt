cmake_minimum_required(VERSION 3.5)

project(napitest)
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(OPENHARMONY_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../../../../../../../../..)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/common
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

# napi callback risk probe library
add_library(napicallbackriskndktest SHARED
    napicallbackrisk/callback_risk_init.cpp
    napicallbackrisk/callback_risk_lifecycle.cpp
    napicallbackrisk/callback_risk_finalizer.cpp
    napicallbackrisk/callback_risk_async.cpp
    napicallbackrisk/callback_risk_js_module.cpp
    napicallbackrisk/callback_risk_native_binding.cpp
    napicallbackrisk/callback_risk_common.h
    common/native_common.h)
target_link_libraries(napicallbackriskndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(napispecdiffbatch1ndktest SHARED spec_diff/batch1/napispecdiffbatch1.cpp native_common.h)
target_link_libraries(napispecdiffbatch1ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(napispecdiffbatch2ndktest SHARED spec_diff/batch2/napispecdiffbatch2.cpp native_common.h)
target_link_libraries(napispecdiffbatch2ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(napispecdiffbatch3ndktest SHARED spec_diff/batch3/napispecdiffbatch3.cpp native_common.h)
target_link_libraries(napispecdiffbatch3ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(napispecdiffbatch4ndktest SHARED spec_diff/batch4/napispecdiffbatch4.cpp native_common.h)
target_link_libraries(napispecdiffbatch4ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)