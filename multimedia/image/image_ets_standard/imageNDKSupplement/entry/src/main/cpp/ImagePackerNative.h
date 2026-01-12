//
// Created on 2026/1/5.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT_IMAGEPACKERNATIVE_H
#define IMAGENDKSUPPLEMENT_IMAGEPACKERNATIVE_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value OHImagePackerNativeCreateTest(napi_env env, napi_callback_info info);
napi_value PackToDataFromImageSourceTest(napi_env env, napi_callback_info info);
napi_value DecodingOptionsReleaseTest(napi_env env, napi_callback_info info);
napi_value CreatePixelmapFromSurfaceWithTransformationTest(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
