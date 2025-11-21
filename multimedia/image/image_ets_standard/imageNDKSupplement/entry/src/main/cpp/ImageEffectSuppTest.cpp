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

#include "napi/native_api.h"
#include "utils/CommonUtilsTest.h"
#include "utils/PixelmapHelperTest.h"
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include "ImageEffectSuppTest.h"
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

napi_value OHImageEffectCreateSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_ImageEffect *imageEffect = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case CASE_INDEX_2:
        imageEffect = OH_ImageEffect_Create(nullptr);
        break;
    case CASE_INDEX_3:
        imageEffect = OH_ImageEffect_Create(IMAGE_NULL_STRING);
    default:
        break;
    }
    int code = IMAGE_EFFECT_CODE_401;
    if (imageEffect != nullptr) {
        OH_ImageEffect_Release(imageEffect);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectAddFilterSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        filter = OH_ImageEffect_AddFilter(nullptr, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        filter = OH_ImageEffect_AddFilter(imageEffect, nullptr);
        break;
    case CASE_INDEX_4:
        filter = OH_ImageEffect_AddFilter(imageEffect, IMAGE_NULL_STRING);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    int code = IMAGE_EFFECT_CODE_401;
    if (filter != nullptr) {
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectInsertFilterSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_EffectFilter *insertFilter = nullptr;
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    switch (index) {
    case CASE_INDEX_1:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, 1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        insertFilter = OH_ImageEffect_InsertFilter(nullptr, 0, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, -1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_4:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, 0, nullptr);
        break;
    case CASE_INDEX_5:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, 1, IMAGE_NULL_STRING);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    int status = IMAGE_EFFECT_CODE_401;
    if (insertFilter != nullptr) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHImageEffectRemoveFilterSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    int32_t result;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        result = OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CROP_FILTER);
        result = OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_CROP_FILTER);
        break;
    case CASE_INDEX_3:
        result = OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_4:
        result = OH_ImageEffect_RemoveFilter(imageEffect, IMAGE_NULL_STRING);
        break;
    case CASE_INDEX_5:
        result = OH_ImageEffect_RemoveFilter(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    int32_t status = IMAGE_EFFECT_CODE_401;
    if (result > 0) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHImageEffectReplaceFilterSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_EffectFilter *replaceFilter = nullptr;
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
    switch (index) {
    case CASE_INDEX_1:
        replaceFilter = OH_ImageEffect_ReplaceFilter(imageEffect, 0, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        replaceFilter = OH_ImageEffect_ReplaceFilter(nullptr, 0, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        replaceFilter = OH_ImageEffect_ReplaceFilter(imageEffect, -1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_4:
        replaceFilter = OH_ImageEffect_ReplaceFilter(imageEffect, 0, nullptr);
        break;
    case CASE_INDEX_5:
        replaceFilter = OH_ImageEffect_ReplaceFilter(imageEffect, 0, IMAGE_NULL_STRING);
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    int status = IMAGE_EFFECT_CODE_401;
    if (replaceFilter != nullptr) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}