/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include "OHAuxiliaryPictureNativeCreateTest.h"
#include <cstdint>
#include <cstring>
#include <hilog/log.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <memory>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/picture_native.h>

#define LOG_DOMAIN 0x0000
#undef LOG_TAG
#define LOG_TAG "AuxiliaryPictureNativeCreateCpp"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

#define CASE_INDEX_1 1
#define CASE_INDEX_2 2

namespace {
    constexpr int32_t BUFFER_LENGTH = 255900;
    constexpr int32_t SIZE_WIDTH = 820;
    constexpr int32_t SIZE_HEIGHT = 312;
}

napi_value AuxiliaryPictureNativeCreateTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_AuxiliaryPictureNative_Create start");
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < 1 ||
        args[0] == nullptr) {
        LOGE("AuxiliaryPictureNativeCreateTest invalid args");
        napi_value errResult = nullptr;
        napi_create_int32(env, static_cast<int32_t>(IMAGE_BAD_PARAMETER), &errResult);
        return errResult;
    }
    int32_t index = 0;
    napi_get_value_int32(env, args[0], &index);
    LOGI("get argValue %{public}d", index);

    Image_AuxiliaryPictureType auxType = Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP;
    const char *typeDesc = "default";
    switch (index) {
    case CASE_INDEX_1:
        auxType = Image_AuxiliaryPictureType::OH_IMAGE_NATIVEMODULE_AUXILIARY_PICTURE_TYPE_OXY_MAP;
        typeDesc = "OXY_MAP";
        break;
    case CASE_INDEX_2:
        auxType = Image_AuxiliaryPictureType::OH_IMAGE_NATIVEMODULE_AUXILIARY_PICTURE_TYPE_MEL_MAP;
        typeDesc = "MEL_MAP";
        break;
    default:
        LOGE("invalid index %{public}d", index);
        napi_value errResult = nullptr;
        napi_create_int32(env, static_cast<int32_t>(IMAGE_BAD_PARAMETER), &errResult);
        return errResult;
    }

    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    if (color == nullptr) {
        LOGE("allocate buffer failed");
        napi_value errResult = nullptr;
        napi_create_int32(env, static_cast<int32_t>(IMAGE_BAD_PARAMETER), &errResult);
        return errResult;
    }
    size_t dataLength = static_cast<size_t>(BUFFER_LENGTH) * sizeof(uint32_t);
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;

    OH_AuxiliaryPictureNative *auxiliaryPicture = nullptr;
    Image_ErrorCode errCode =
        OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength, &size,
                                         auxType, &auxiliaryPicture);
    LOGI("OH_AuxiliaryPictureNative_Create type=%{public}s errCode=%{public}d", typeDesc, errCode);

    if (errCode == IMAGE_SUCCESS && auxiliaryPicture != nullptr) {
        Image_AuxiliaryPictureType getType = Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP;
        Image_ErrorCode getTypeRet = OH_AuxiliaryPictureNative_GetType(auxiliaryPicture, &getType);
        LOGI("OH_AuxiliaryPictureNative_GetType ret=%{public}d type=%{public}d", getTypeRet,
             static_cast<int32_t>(getType));
        OH_AuxiliaryPictureNative_Release(auxiliaryPicture);
        auxiliaryPicture = nullptr;
    }

    napi_value result = nullptr;
    napi_create_int32(env, static_cast<int32_t>(errCode), &result);
    return result;
}