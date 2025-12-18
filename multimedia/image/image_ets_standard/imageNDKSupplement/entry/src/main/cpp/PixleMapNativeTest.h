//
// Created on 2025/12/15.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT_PIXLEMAPNATIVETEST_H
#define IMAGENDKSUPPLEMENT_PIXLEMAPNATIVETEST_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value ClonePixelmapTest(napi_env env, napi_callback_info info);
napi_value CreateCroppedAndScaledPixelMapTest(napi_env env, napi_callback_info info);
napi_value CreatePixelmapFromSurfaceTest(napi_env env, napi_callback_info info);
napi_value CreatePixelmapFromNativeBufferTest(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
