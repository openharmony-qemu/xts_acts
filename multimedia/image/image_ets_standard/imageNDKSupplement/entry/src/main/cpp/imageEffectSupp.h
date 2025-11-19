//
// Created on 2025/11/19.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef OHIMAGEEFFECTNDK_IMAGEEFFECTSUPP_H
#define OHIMAGEEFFECTNDK_IMAGEEFFECTSUPP_H

#include "napi/native_api.h"

#ifdef __cplusplus
extern "C" {
#endif
napi_value savePixelMapForPath(napi_env env, napi_callback_info info);
napi_value creatOutPixeMapForPath(napi_env env, napi_callback_info info);
napi_value OHImageEffectCreateSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectAddFilterSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectInsertFilterSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectRemoveFilterSupp(napi_env env, napi_callback_info info);
napi_value OHImageEffectReplaceFilterSupp(napi_env env, napi_callback_info info);


#ifdef __cplusplus
}
#endif
#endif 
