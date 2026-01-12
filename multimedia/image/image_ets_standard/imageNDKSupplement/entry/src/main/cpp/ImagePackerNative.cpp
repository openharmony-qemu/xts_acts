//
// Created on 2026/1/5.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#include "ImagePackerNative.h"
#include <cstdlib>
#include <cstring>
#include <hilog/log.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#define LOG_TAG "ImagePackerNativeCpp"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define PARAM_960000 960000
#define PARAM_200 200
#define PARAM_300 300
napi_value DecodingOptionsReleaseTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_DecodingOptions_Release start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_DecodingOptions_Release error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_DecodingOptions *options = nullptr;
    OH_DecodingOptions_Create(&options);
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_DecodingOptions_Release(nullptr);
        LOGI("OH_DecodingOptions_Release %{public}d", errorCode);
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    return result;
}
napi_value CreatePixelmapFromSurfaceWithTransformationTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    char surfaceId[256];
    size_t uuidLen = 0;
    napi_get_value_string_utf8(env, argValue[1], surfaceId, sizeof(surfaceId), &uuidLen);
    LOGI("surface ID %{public}s", surfaceId);
    size_t length = strlen(surfaceId);
    LOGI("strlen字节长度： %{public}d", length);
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode errorCode = IMAGE_SUCCESS;
    switch (index) {
        case CASE_INDEX_1:
            errorCode = OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation(surfaceId, length, true, &pixelmap);
            LOGI("OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation returned: %{public}d", errorCode);
            break;
        case CASE_INDEX_2:
            errorCode = OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation(surfaceId, length, false, &pixelmap);
            LOGI("OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation returned: %{public}d", errorCode);
            break;
        case CASE_INDEX_3:
            errorCode = OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation(nullptr, length, false, &pixelmap);
            LOGI("OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation returned: %{public}d", errorCode);
            break;
        case CASE_INDEX_4:
            errorCode = OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation(nullptr, -1, false, &pixelmap);
            LOGI("OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation returned: %{public}d", errorCode);
            break;
        case CASE_INDEX_5:
            errorCode = OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation(surfaceId, length, false, nullptr);
            LOGI("OH_PixelmapNative_CreatePixelmapFromSurfaceWithTransformation returned: %{public}d", errorCode);
            break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    return result;
}