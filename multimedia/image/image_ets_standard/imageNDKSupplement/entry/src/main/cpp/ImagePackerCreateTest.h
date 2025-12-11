//
// Created on 2025/12/1.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT_IMAGEPACKERCREATETEST_H
#define IMAGENDKSUPPLEMENT_IMAGEPACKERCREATETEST_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value ImagePackerCreateTest(napi_env env, napi_callback_info info);
napi_value ImagePackerInitNativeTest(napi_env env, napi_callback_info info);
napi_value ImagePackerPackToDataTest(napi_env env, napi_callback_info info);
napi_value ImagePackerPackToFileTest(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
