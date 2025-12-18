//
// Created on 2025/12/15.
//
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#include "PixleMapNativeTest.h"
#include <cstdlib>
#include <hilog/log.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <iostream>
#include <native_buffer/native_buffer.h>
#define LOG_TAG "PixelMapNativeCpp"
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
//enum class OH_PixelmapNative_AntiAliasingLevel : int32_t {
//    ANTI_ALIASING_NONE = 0,    // 无抗锯齿（性能最高，画质最差）
//    ANTI_ALIASING_LOW = 1,     // 低抗锯齿（平衡性能和画质）
//    ANTI_ALIASING_MEDIUM = 2,  // 中抗锯齿（推荐默认值）
//    ANTI_ALIASING_HIGH = 3     // 高抗锯齿（画质最好，性能消耗大）
//};
napi_value ClonePixelmapTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelmapNative_Clone start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelmapNative_Clone error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_PixelmapNative *pixelmap = nullptr;
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_200);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelmap);
    OH_PixelmapNative *dstPixelmap = nullptr;
    Image_ErrorCode code = OH_PixelmapNative_Clone(pixelmap, &dstPixelmap);
    switch (index)
    {
    case CASE_INDEX_1:
        code = OH_PixelmapNative_Clone(pixelmap, &dstPixelmap);
        LOGI("OH_PixelmapNative_Clone %{public}d", code);
        break;
    case CASE_INDEX_2:
        code = OH_PixelmapNative_Clone(pixelmap, nullptr);
        LOGI("OH_PixelmapNative_Clone %{public}d", code);
        break;
    case CASE_INDEX_3:
        code = OH_PixelmapNative_Clone(nullptr, &dstPixelmap);
        LOGI("OH_PixelmapNative_Clone %{public}d", code);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}
napi_value CreateCroppedAndScaledPixelMapTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap start");
    napi_value thisVar = nullptr;
    napi_value argValue[4] = {0};
    size_t argCount = 4;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_PixelmapNative *pixelmap = nullptr;
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_200);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelmap);
    OH_PixelmapNative *dstPixelmap = nullptr;
    Image_Region region = {
    .x = 10,          
    .y = 10,          
    .width = 100,      
    .height = 200      
    };
    Image_Scale scale = {0.5f, 0.5f};
    OH_PixelmapNative_AntiAliasingLevel level = OH_PixelmapNative_AntiAliasingLevel::OH_PixelmapNative_AntiAliasing_MEDIUM;
    Image_ErrorCode code = OH_PixelmapNative_CreateCroppedAndScaledPixelMap(pixelmap, &region, &scale, level, &dstPixelmap);
    switch (index)
    {
    case CASE_INDEX_1:
        OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_NV21);
        code = OH_PixelmapNative_CreateCroppedAndScaledPixelMap(pixelmap, &region, &scale, level, &dstPixelmap);
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap %{public}d", code);
        break;
    case CASE_INDEX_2:
        code = OH_PixelmapNative_CreateCroppedAndScaledPixelMap(nullptr, &region, &scale, level, &dstPixelmap);
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap %{public}d", code);
        break;
    case CASE_INDEX_3:
        code = OH_PixelmapNative_CreateCroppedAndScaledPixelMap(pixelmap, nullptr, &scale, level, &dstPixelmap);
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap %{public}d", code);
        break;
    case CASE_INDEX_4:
        code = OH_PixelmapNative_CreateCroppedAndScaledPixelMap(pixelmap, &region, nullptr, level, &dstPixelmap);
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap %{public}d", code);
        break;
    case CASE_INDEX_5:
        code = OH_PixelmapNative_CreateCroppedAndScaledPixelMap(pixelmap, &region, &scale, level, nullptr);
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap %{public}d", code);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}
napi_value CreatePixelmapFromSurfaceTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap error1");
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
    Image_ErrorCode code = OH_PixelmapNative_CreatePixelmapFromSurface(surfaceId, length, &pixelmap);
    switch (index)
    {
    case CASE_INDEX_1:
        code = OH_PixelmapNative_CreatePixelmapFromSurface(surfaceId, length, &pixelmap);
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap %{public}d", code);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}
napi_value CreatePixelmapFromNativeBufferTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelmapNative_CreatePixelmapFromNativeBuffer start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelmapNative_CreatePixelmapFromNativeBuffer error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_NativeBuffer_Config config {
        .width = 256,
        .height = 256,
        .format = NATIVEBUFFER_PIXEL_FMT_RGBA_8888, // 显式指定RGBA_8888格式
        .usage = NATIVEBUFFER_USAGE_CPU_READ  | NATIVEBUFFER_USAGE_CPU_WRITE , // 支持CPU读写
    };
    OH_NativeBuffer* nativeBuffer = OH_NativeBuffer_Alloc(&config);
    if (nativeBuffer == nullptr) {
        LOGI("OH_NativeBuffer_Alloc Failed");
    }
    OH_PixelmapNative* pixelmap = nullptr;
    Image_ErrorCode code = OH_PixelmapNative_CreatePixelmapFromNativeBuffer(nativeBuffer, &pixelmap);
    switch (index)
    {
    case CASE_INDEX_1:
        code = OH_PixelmapNative_CreatePixelmapFromNativeBuffer(nativeBuffer, &pixelmap);
        LOGI("OH_PixelmapNative_CreatePixelmapFromNativeBuffer %{public}d", code);
        break;
    case CASE_INDEX_2:
        code = OH_PixelmapNative_CreatePixelmapFromNativeBuffer(nullptr, &pixelmap);
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap %{public}d", code);
        break;
    case CASE_INDEX_3:
        code = OH_PixelmapNative_CreatePixelmapFromNativeBuffer(nativeBuffer, nullptr);
        LOGI("OH_PixelmapNative_CreateCroppedAndScaledPixelMap %{public}d", code);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}