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

#include <cstdint>
#include <js_native_api.h>
#include "napi/native_api.h"
#include <multimedia/image_framework/image_source_mdk.h>
#include <CommonUtilsTest.h>
#include "ImageSourceTest.h"
//#include "utils/common.h"
#define DEFAULT_VALUE 1.0
#define FIRST_MIDDLE_VALUE 0.5
#define SECOND_MIDDLE_VALUE 2.0
#define ABNORMAL_VALUE (-2.0)
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageSourceNDK"
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
#define LOG_PRINT_DOMAIN ArkUICapiTest::LOG_PRINT_DOMAIN
namespace {
    constexpr size_t SIZE_ZERO = 0;
    constexpr size_t SIZE_ONE = 1;
    constexpr size_t SIZE_TWO = 2;
    constexpr size_t SIZE_THREE = 3;
    constexpr size_t DEFAULT_STRING_SIZE = 64;
    constexpr uint32_t ARGS_FIRST = 0;
    constexpr uint32_t ARGS_SECOND = 1;
    constexpr uint32_t ARGS_THIRD = 2;
    constexpr uint32_t INVALID_FRAME_COUNT = 0;
    constexpr int8_t INT8_FALSE = 0;
    constexpr int8_t INT8_TRUE = 1;
    constexpr int32_t DEFAULT_INDEX = 0;
}

napi_value ImageSourceCreatTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    struct OhosImageSource *src;
    struct OhosImageSourceOps ops;
    napi_value imageSource = nullptr;
    ops.pixelFormat = 0;
    ops.size.height = 0;
    ops.size.width = 0;
    int32_t res;
    res = OH_ImageSource_Create(env, src, &ops, &imageSource);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value ImageSourceGetSupportedFormatsTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    struct OhosImageSourceSupportedFormat {
    char* format = nullptr;
    size_t size = 0;
    };
    int32_t res;
    res = OH_ImageSource_GetSupportedFormats(nullptr);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value ImageSourceCreateIncrementalTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    struct OhosImageSourceOps ops;
    ops.pixelFormat = 0;
    ops.size.height = 0;
    ops.size.width = 0;
    int32_t res;
    res = OH_ImageSource_CreateIncremental(env, nullptr, &ops, nullptr);
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}

napi_value ImageSourceInitNativeSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    ImageSourceNative *imageSourceNative_c = OH_ImageSource_InitNative(env, nullptr);
    napi_value ret;
    if (imageSourceNative_c == nullptr) {
        napi_get_undefined(env, &ret);
    }
    return ret;
}