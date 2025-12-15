
#ifndef OHIMAGEEFFECTNDK_IMAGEEFFECTFILTERSUPP_H
#define OHIMAGEEFFECTNDK_IMAGEEFFECTFILTERSUPP_H

#include "napi/native_api.h"

#ifdef __cplusplus
extern "C" {
#endif
napi_value OHEffectFilterCreateSupp(napi_env env, napi_callback_info info);
napi_value OHEffectFilterLookUpFiltersSupp(napi_env env, napi_callback_info info);
napi_value OHEffectFilterLookUpFiltersNullptrSupp(napi_env env, napi_callback_info info);
napi_value OHEffectFilterSetValueSupp(napi_env env, napi_callback_info info);
napi_value OHEffectFilterGetValueSupp(napi_env env, napi_callback_info info);
napi_value OHEffectFilterRegisterSupp(napi_env env, napi_callback_info info);
napi_value OHEffectFilterLookupFilterInfoSupp(napi_env env, napi_callback_info info);
napi_value OHEffectFilterReleaseSupp(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif 
