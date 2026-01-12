//
// Created on 2026/1/5.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT_PIXELMAPNATIVECROP_H
#define IMAGENDKSUPPLEMENT_PIXELMAPNATIVECROP_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value PixelmapNativeCropTest(napi_env env, napi_callback_info info);
napi_value ConvertAlphaFormatTest(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
