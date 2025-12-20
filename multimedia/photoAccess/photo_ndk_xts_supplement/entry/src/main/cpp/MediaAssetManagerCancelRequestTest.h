//
// Created on 2025/12/10.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT_MEDIAASSETMANAGERCANCELREQUESTTEST_H
#define IMAGENDKSUPPLEMENT_MEDIAASSETMANAGERCANCELREQUESTTEST_H
#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value MediaAssetManagerCancelRequestTest(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
