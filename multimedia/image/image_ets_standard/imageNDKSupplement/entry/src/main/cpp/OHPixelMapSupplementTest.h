//
// Created on 2025/12/8.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT__1__OHPIXELMAPSUPPLEMENTTEST_H
#define IMAGENDKSUPPLEMENT__1__OHPIXELMAPSUPPLEMENTTEST_H

#include "napi/native_api.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value OHPixelMapTranslateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHPixelMapRotateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeSetColorSpaceNativeSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeGetColorSpaceNativeSuppTest(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoSetAddrSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoGetAddrSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectBufferInfoCreateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterInfoCreateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHEffectFilterCreateSupplementTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeUnaccessPixelsSuppTest(napi_env env, napi_callback_info info);
napi_value CreateImageReceiverSupplementTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeAccessPixelsSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeCreateAlphaPixelmapSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeGetUniqueIdSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeIsReleasedSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeReadPixelsFromAreaSuppTest(napi_env env, napi_callback_info info);
napi_value OHPixelmapNativeWritePixelsToAreaSuppTest(napi_env env, napi_callback_info info);


#ifdef __cplusplus
}
#endif
#endif