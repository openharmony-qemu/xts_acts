//
// Created on 2026/1/8.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT_IMAGESOURCENATIVEGETIMAGEPROPERTYTEST_H
#define IMAGENDKSUPPLEMENT_IMAGESOURCENATIVEGETIMAGEPROPERTYTEST_H

#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value ImageSourceNativeGetImagePropertyLong(napi_env env, napi_callback_info info);
napi_value ImageSourceNativeGetImagePropertyShort(napi_env env, napi_callback_info info);
napi_value ImageSourceNativeGetImagePropertyDouble(napi_env env, napi_callback_info info);
napi_value ImageSourceGetImagePropertyArraySize(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif

