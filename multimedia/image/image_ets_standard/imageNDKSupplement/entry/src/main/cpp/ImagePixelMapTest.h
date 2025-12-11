//
// Created on 2025/12/4.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT_IMAGEPIXELMAPTEST_H
#define IMAGENDKSUPPLEMENT_IMAGEPIXELMAPTEST_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value CreatePixelMapTest(napi_env env, napi_callback_info info);
napi_value CreatePixelMapWithStrideTest(napi_env env, napi_callback_info info);
napi_value CreateAlphaPixelMapTest(napi_env env, napi_callback_info info);
napi_value PixelMapGetImageInfoTest(napi_env env, napi_callback_info info);
napi_value PixelMapAccessPixelsTest(napi_env env, napi_callback_info info);
napi_value PixelMapUnAccessPixelsTest(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
