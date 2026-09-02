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
target_link_libraries(napiBuffer PUBLIC securec libace_napi.z.so libuv.so libhilog_ndk.z.so)

add_library(napiData SHARED ./napi/napiData.cpp)
target_link_libraries(napiData PUBLIC securec libace_napi.z.so libuv.so libhilog_ndk.z.so)

add_library(napiString SHARED ./napi/napiString.cpp)
target_link_libraries(napiString PUBLIC securec libace_napi.z.so libuv.so libhilog_ndk.z.so)

add_library(napiComplexScenarios SHARED ./napi/napiComplexScenarios.cpp)
target_link_libraries(napiComplexScenarios PUBLIC securec libace_napi.z.so libuv.so)

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

add_library(napispecdiffbatch1ndktest SHARED napispecdiff/batch1/napispecdiffbatch1.cpp common/native_common.h)
target_link_libraries(napispecdiffbatch1ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(napispecdiffbatch2ndktest SHARED napispecdiff/batch2/napispecdiffbatch2.cpp common/native_common.h)
target_link_libraries(napispecdiffbatch2ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(napispecdiffbatch3ndktest SHARED napispecdiff/batch3/napispecdiffbatch3.cpp common/native_common.h)
target_link_libraries(napispecdiffbatch3ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(napispecdiffbatch4ndktest SHARED napispecdiff/batch4/napispecdiffbatch4.cpp common/native_common.h)
target_link_libraries(napispecdiffbatch4ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)


add_library(napicoveraddbatch1ndktest SHARED
    napicoveradd/batch1/napicoveraddbatch1.cpp
    napicoveradd/batch1/napicoveraddbatch1_extra.cpp
    common/native_common.h)
target_link_libraries(napicoveraddbatch1ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)


add_library(napicoveraddbatch2ndktest SHARED
    napicoveradd/batch2/napicoveraddbatch2.cpp
    napicoveradd/batch2/napicoveraddbatch2_extra.cpp
    common/native_common.h)
target_link_libraries(napicoveraddbatch2ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(napicoveraddbatch3ndktest SHARED napicoveradd/batch3/napicoveraddbatch3.cpp common/native_common.h)
target_link_libraries(napicoveraddbatch3ndktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)


add_library(napicoveraddbatch4ndktest SHARED
    napicoveradd/batch4/napicoveraddbatch4.cpp
    napicoveradd/batch4/napicoveraddbatch4_extra.cpp
    common/native_common.h)
target_link_libraries(napicoveraddbatch4ndktest PUBLIC securec libace_napi.z.so libhilog_ndk.z.so)

add_library(napicoveragesamplendktest SHARED napi_coverage_sample/napi_coverage_sample.cpp common/native_common.h)
target_link_libraries(napicoveragesamplendktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(malloccoveragesamplendktest SHARED malloc_coverage_sample/malloc_coverage_sample.cpp common/native_common.h)
target_link_libraries(malloccoveragesamplendktest PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(napiCovAsync SHARED napiCovAsync.cpp)
target_link_libraries(napiCovAsync PUBLIC libace_napi.z.so)
add_library(napiCovArkContext SHARED napiCovArkContext.cpp)
target_link_libraries(napiCovArkContext PUBLIC libace_napi.z.so)
add_library(napiCovArkRuntime SHARED napiCovArkRuntime.cpp)
target_link_libraries(napiCovArkRuntime PUBLIC libace_napi.z.so)
add_library(napiCovArray SHARED napiCovArray.cpp)
target_link_libraries(napiCovArray PUBLIC libace_napi.z.so)
add_library(napiCovArrayBuffer SHARED napiCovArrayBuffer.cpp)
target_link_libraries(napiCovArrayBuffer PUBLIC libace_napi.z.so)
add_library(napiCovBasicNum SHARED napiCovBasicNum.cpp)
target_link_libraries(napiCovBasicNum PUBLIC libace_napi.z.so)
add_library(napiCovBuffer SHARED napiCovBuffer.cpp)
target_link_libraries(napiCovBuffer PUBLIC libace_napi.z.so)
add_library(napiCovCallSiteInfo SHARED napiCovCallSiteInfo.cpp)
target_link_libraries(napiCovCallSiteInfo PUBLIC libace_napi.z.so)
add_library(napiCovClassWrap SHARED napiCovClassWrap.cpp)
target_link_libraries(napiCovClassWrap PUBLIC libace_napi.z.so)
add_library(napiCovCriticalSection SHARED napiCovCriticalSection.cpp)
target_link_libraries(napiCovCriticalSection PUBLIC libace_napi.z.so)
add_library(napiCovCustomAsync SHARED napiCovCustomAsync.cpp)
target_link_libraries(napiCovCustomAsync PUBLIC libace_napi.z.so)
add_library(napiCovDateBigInt SHARED napiCovDateBigInt.cpp)
target_link_libraries(napiCovDateBigInt PUBLIC libace_napi.z.so)
add_library(napiCovEnvLifeCycle SHARED napiCovEnvLifeCycle.cpp)
target_link_libraries(napiCovEnvLifeCycle PUBLIC libace_napi.z.so)
add_library(napiCovError SHARED napiCovError.cpp)
target_link_libraries(napiCovError PUBLIC libace_napi.z.so)
add_library(napiCovFastObj SHARED napiCovFastObj.cpp)
target_link_libraries(napiCovFastObj PUBLIC libace_napi.z.so)
add_library(napiCovFunction SHARED napiCovFunction.cpp)
target_link_libraries(napiCovFunction PUBLIC libace_napi.z.so)
add_library(napiCovLifeCycle SHARED napiCovLifeCycle.cpp)
target_link_libraries(napiCovLifeCycle PUBLIC libace_napi.z.so)
add_library(napiCovModuleLoad SHARED napiCovModuleLoad.cpp)
target_link_libraries(napiCovModuleLoad PUBLIC libace_napi.z.so)
add_library(napiCovObject SHARED napiCovObject.cpp)
target_link_libraries(napiCovObject PUBLIC libace_napi.z.so)
add_library(napiCovPrimitive SHARED napiCovPrimitive.cpp)
target_link_libraries(napiCovPrimitive PUBLIC libace_napi.z.so)
add_library(napiCovPromiseAsync SHARED napiCovPromiseAsync.cpp)
target_link_libraries(napiCovPromiseAsync PUBLIC libace_napi.z.so)
add_library(napiCovProperty SHARED napiCovProperty.cpp)
target_link_libraries(napiCovProperty PUBLIC libace_napi.z.so)
add_library(napiCovSendable SHARED napiCovSendable.cpp)
target_link_libraries(napiCovSendable PUBLIC libace_napi.z.so)
add_library(napiCovSerialization SHARED napiCovSerialization.cpp)
target_link_libraries(napiCovSerialization PUBLIC libace_napi.z.so)
add_library(napiCovString SHARED napiCovString.cpp)
target_link_libraries(napiCovString PUBLIC libace_napi.z.so)
add_library(napiCovStrongRef SHARED napiCovStrongRef.cpp)
target_link_libraries(napiCovStrongRef PUBLIC libace_napi.z.so)
add_library(napiCovThreadSafe SHARED napiCovThreadSafe.cpp)
target_link_libraries(napiCovThreadSafe PUBLIC libace_napi.z.so)
add_library(napiCovSpecDiffV8 SHARED napiCovSpecDiffV8.cpp)
target_link_libraries(napiCovSpecDiffV8 PUBLIC libace_napi.z.so)