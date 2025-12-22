/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "OHPixelmapNativeCreatePixelmapNativeTest.h"
#include <cstdlib>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image_mdk.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)
#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"
#define CUSTOM_FILTER "CustomCrop"
#define IMAGE_NULL_STRING ""
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8
#define CASE_INDEX_9 9
#define CASE_INDEX_10 10
#define CASE_INDEX_11 11
#define IMAGE_EFFECT_2 2
#define IMAGE_EFFECT_100 100
#define IMAGE_EFFECT_100F 100.f
#define IMAGE_EFFECT_50F 50.f
#define IMAGE_EFFECT_100D 100.0
#define IMAGE_EFFECT_1000 1000
#define IMAGE_EFFECT_1024 1024
#define IMAGE_EFFECT_1048576 1048576
#define IMAGE_EFFECT_1073741824 1073741824
#define IMAGE_EFFECT_1080 1080
#define IMAGE_EFFECT_1920 1920
#define IMAGE_EFFECT_4090 4090
#define IMAGE_EFFECT_5120 5120
#define IMAGE_EFFECT_CODE_401 401
#define IMAGE_EFFECT_1722514390000 1722514390000
#define LOG_DOMAIN 0x0000
#define LOG_TAG "OHImageSizeTestNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))


napi_value OHPixelmapNativeCreatePixelmapNativeTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    LOGI("get index %{public}d", index);
    napi_get_value_int32(env, args[0], &index);
    uint8_t *data = nullptr;
    size_t dataLength = 0;
    const int HEIGHT = 300;
    const int WIDTH = 200;
    for (int i = 0; i < dataLength; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *ops;
    OH_PixelmapInitializationOptions_Create(&ops);
    OH_PixelmapInitializationOptions_SetWidth(ops, WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(ops, HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(ops, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(ops, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        data[96000];
        dataLength = 96000;
        ops = nullptr;
        code =
            OH_PixelmapNative_CreatePixelmapUsingAllocator(data, dataLength, ops, IMAGE_ALLOCATOR_MODE_AUTO, &pixelMap);
        break;
    case CASE_INDEX_2:
        dataLength = 96000;
        data = nullptr;
        code =
            OH_PixelmapNative_CreatePixelmapUsingAllocator(data, dataLength, ops, IMAGE_ALLOCATOR_MODE_AUTO, &pixelMap);
        break;
    case CASE_INDEX_3:
        data[96000];
        dataLength = -96000;
        code =
            OH_PixelmapNative_CreatePixelmapUsingAllocator(data, dataLength, ops, IMAGE_ALLOCATOR_MODE_AUTO, &pixelMap);
        break;
    default:
        break;
    }
    OH_PixelmapNative_Release(pixelMap);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}
napi_value OHPixelmapNativeGetArgbPixelsTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    LOGI("get index %{public}d", index);
    napi_get_value_int32(env, args[0], &index);
    const int HEIGHT = 30;
    const int WIDTH = 20;
    uint8_t data[2400];
    size_t dataSize = 2400;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    Image_ErrorCode code;
    OH_Pixelmap_InitializationOptions *ops;
    code = OH_PixelmapInitializationOptions_Create(&ops);
    LOGI("get 2 %{public}d", code);
    code = OH_PixelmapInitializationOptions_SetWidth(ops, WIDTH);
    LOGI("get 3 %{public}d", code);
    code = OH_PixelmapInitializationOptions_SetHeight(ops, HEIGHT);
    LOGI("get 4 %{public}d", code);
    code = OH_PixelmapInitializationOptions_SetPixelFormat(ops, PIXEL_FORMAT_BGRA_8888);
    LOGI("get 5 %{public}d", code);
    code = OH_PixelmapInitializationOptions_SetAlphaType(ops, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    LOGI("get 6 %{public}d", code);
    OH_PixelmapNative *pixelmap = nullptr;
    code = OH_PixelmapNative_CreatePixelmap(data, dataSize, ops, &pixelmap);
    LOGI("get 7 %{public}d", code);
    uint8_t *buffer;
    size_t bufferSize = 0;
    Image_ErrorCode errcode;
    switch (index) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        buffer[10000];
        bufferSize = 1920 * 1080 * 4;
        buffer = (uint8_t *)malloc(bufferSize);
        LOGI("get buffer");
        errcode = OH_PixelmapNative_GetArgbPixels(pixelmap, buffer, &bufferSize);
        break;
    case CASE_INDEX_2:
        buffer = nullptr;
        bufferSize = 1920 * 1080 * 4;
        errcode = OH_PixelmapNative_GetArgbPixels(pixelmap, buffer, &bufferSize);
        break;
    case CASE_INDEX_3:
        buffer[10000];
        bufferSize = 1920 * 1080 * 4;
        buffer = (uint8_t *)malloc(bufferSize);
        errcode = OH_PixelmapNative_GetArgbPixels(pixelmap, buffer, nullptr);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errcode, &result);
    return result;
}
napi_value OHPixelmapNativeToSdrTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    LOGI("get index %{public}d", index);
    napi_get_value_int32(env, args[0], &index);
    const int HEIGHT = 30;
    const int WIDTH = 20;
    uint8_t data[2400];
    size_t dataSize = 2400;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *ops;
    OH_PixelmapInitializationOptions_Create(&ops);
    OH_PixelmapInitializationOptions_SetWidth(ops, WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(ops, HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(ops, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(ops, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelmap = nullptr;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, ops, &pixelmap);
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_PixelmapNative_ToSdr(pixelmap);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}
napi_value PixelmapNativeCreateEmptyPixelmapUsingAllocator(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    LOGI("get index %{public}d", index);
    napi_get_value_int32(env, args[0], &index);
    uint8_t *data = nullptr;
    size_t dataLength = 0;
    const int HEIGHT = 300;
    const int WIDTH = 200;
    for (int i = 0; i < dataLength; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *ops; 
    OH_PixelmapInitializationOptions_Create(&ops);
    OH_PixelmapInitializationOptions_SetWidth(ops, WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(ops, HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(ops, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(ops, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        ops = nullptr;
        code =OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator(ops, IMAGE_ALLOCATOR_MODE_AUTO, &pixelMap);
        break;
    case CASE_INDEX_2:
        code =OH_PixelmapNative_CreateEmptyPixelmapUsingAllocator(ops, IMAGE_ALLOCATOR_MODE_AUTO, &pixelMap);
        break;
    default:
        break;
    }
    OH_PixelmapNative_Release(pixelMap);
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}