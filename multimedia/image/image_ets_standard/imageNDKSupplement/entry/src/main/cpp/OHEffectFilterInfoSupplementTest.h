//
// Created on 2025/12/5.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT__1__OHEFFECTFILTERINFOSUPPLEMENTTEST_H
#define IMAGENDKSUPPLEMENT__1__OHEFFECTFILTERINFOSUPPLEMENTTEST_H

#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value OHEffectFilterInfoSetFilterNameSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoGetFilterNameSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoSetSupportedBufferTypesSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoGetSupportedBufferTypesSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoSetSupportedFormatsSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoGetSupportedFormatsSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoReleaseSupplementTest(napi_env env, napi_callback_info info);

#ifdef __cplusplus
}
#endif
#endif