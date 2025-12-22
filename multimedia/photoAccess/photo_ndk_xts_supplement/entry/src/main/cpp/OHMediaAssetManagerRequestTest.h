//
// Created on 2025/12/17.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#ifndef IMAGENDKSUPPLEMENT_OHMEDIAASSETMANAGERREQUESTTEST_H
#define IMAGENDKSUPPLEMENT_OHMEDIAASSETMANAGERREQUESTTEST_H

#include "napi/native_api.h"
#include "multimedia/media_library/media_asset_base_capi.h"
#include "multimedia/media_library/media_asset_capi.h"
#include "multimedia/image_framework/image/image_source_native.h"
#include "multimedia/media_library/media_access_helper_capi.h"
#include "multimedia/media_library/media_asset_change_request_capi.h"
#include "multimedia/media_library/media_asset_manager_capi.h"
#include "multimedia/media_library/moving_photo_capi.h"
#ifdef __cplusplus
extern "C" {
#endif
napi_value TestRequestImageForPath(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
