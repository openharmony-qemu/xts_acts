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
#include <hilog/log.h>


#include <multimedia/image_framework/image_receiver_mdk.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include "OHPixelMapSupplementTest.h"

#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageEffectNDK"
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



napi_value CreatePixelMapTest(napi_env env, napi_callback_info info) 
{
    napi_value udfVar = nullptr;
    napi_value pixelMap = nullptr;

    struct OhosPixelMapCreateOps createOps;
    createOps.width = 4;
    createOps.height = 6;
    createOps.pixelFormat = 9;
    createOps.alphaType = 0;
    size_t bufferSize = createOps.width * createOps.height * 4;
    void *buff = malloc(bufferSize);
    if (buff == nullptr) {
        return udfVar;
    }

    char *cc = (char *)buff;
    for (int i = 0; i < 96; i++) {
        *(cc++) = (char)i;
    }
    int32_t res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
    free(buff);
    if (res != IMAGE_RESULT_SUCCESS || pixelMap == nullptr) {
        return udfVar;
    }
    return pixelMap;
}

napi_value OHPixelMapTranslateSupplementTest(napi_env env, napi_callback_info info) 
{
    LOGI("OHPixelMapTranslateSupplementTest start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OHPixelMapTranslateSupplementTest error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);

    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    NativePixelMap *native = OH_PixelMap_InitNativePixelMap(env, CreatePixelMapTest(env, info));
    if (native == nullptr) {
        LOGI("OHPixelMapTranslateSupplementTest error2");
        return result;
    }
    int32_t imageResult;
    float x = 50;
    float y = 50;
    switch (index) {
    case CASE_INDEX_1:
        imageResult = OH_PixelMap_Translate(native, x, y);
        break;
    case CASE_INDEX_2:
        imageResult = OH_PixelMap_Translate(nullptr, x, y);
        break;
    case CASE_INDEX_3:
        x = -50;
        y = -50;
        imageResult = OH_PixelMap_Translate(native, x, y);
        break;    
    default:
        break;
    }
    LOGI("OHPixelMapTranslateSupplementTest 值：%{public}d  %{public}d ", x, y, imageResult);
    napi_value ret;
    napi_create_int32(env, imageResult, &ret);
    return ret;
}

napi_value OHPixelMapRotateSupplementTest(napi_env env, napi_callback_info info) 
{
    LOGI("OHPixelMapRotateSupplementTest start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OHPixelMapRotateSupplementTest error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);

    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    NativePixelMap *native = OH_PixelMap_InitNativePixelMap(env, CreatePixelMapTest(env, info));
    if (native == nullptr) {
        LOGI("OHPixelMapRotateSupplementTest error2");
        return result;
    }
    int32_t imageResult;
    float angle = 90;
    switch (index) {
    case CASE_INDEX_1:
        imageResult = OH_PixelMap_Rotate(native, angle);
        break;
    case CASE_INDEX_2:
        imageResult = OH_PixelMap_Rotate(nullptr, angle);
        break;
    case CASE_INDEX_3:
        angle = 180;
        imageResult = OH_PixelMap_Rotate(native, angle);
        break;    
    default:
        break;
    }
    LOGI("OHPixelMapRotateSupplementTest 值：%{public}d  %{public}d ", angle, imageResult);
    napi_value ret;
    napi_create_int32(env, imageResult, &ret);
    return ret;
}

napi_value OHEffectFilterCreateSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        filter = OH_EffectFilter_Create(nullptr);
        break;
    default:
        break;
    }
    int code = IMAGE_EFFECT_CODE_401;
    if (filter != nullptr) {
        OH_EffectFilter_Release(filter);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoCreateSupplementTest(napi_env env, napi_callback_info info)
{
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    OH_EffectFilterInfo_Release(filterInfo);
    napi_value ret;
    int status = -1;
    if (filterInfo != nullptr) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHEffectBufferInfoCreateSupplementTest(napi_env env, napi_callback_info info)
{
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_value ret;
    int status = -1;
    if (bufferInfo != nullptr) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}


napi_value OHEffectBufferInfoSetAddrSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *addr = malloc(IMAGE_EFFECT_1000);
    switch (index) {
    case CASE_INDEX_1:
        break;
    case CASE_INDEX_2:
        bufferInfo = nullptr;
        break;
    case CASE_INDEX_3:
        addr = nullptr;
        break;
    case CASE_INDEX_4:
        addr = nullptr;
        bufferInfo = nullptr;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetAddr(bufferInfo, addr);
    free(addr);
    OH_EffectBufferInfo_Release(bufferInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetAddrSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    napi_value ret;
    napi_create_int32(env, code, &ret);
    
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    void *setAddr = malloc(IMAGE_EFFECT_1000);
    void *retAddr = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectBufferInfo_SetAddr(bufferInfo, setAddr);
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        if (retAddr != setAddr) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        code = OH_EffectBufferInfo_GetAddr(bufferInfo, &retAddr);
        break;
    case CASE_INDEX_3:
        code = OH_EffectBufferInfo_GetAddr(nullptr, &retAddr);
        break;
    default:
        break;
    }
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value CreateImageReceiverSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    struct OhosImageReceiverInfo receiverInfo;
    int32_t returnValue;
    napi_value receiver = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_Image_Receiver_CreateImageReceiver(env, receiverInfo, &receiver);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}


napi_value OHPixelmapNativeSetColorSpaceNativeSuppTest(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    
    OH_PixelmapNative *pixelmap = nullptr;
    OH_NativeColorSpaceManager *setColorSpaceNative = nullptr;
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_PixelmapNative_SetColorSpaceNative(pixelmap, setColorSpaceNative);
        break;
    default:
        break;
    }
    OH_PixelmapNative_Release(pixelmap);
    int code = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        code = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}

napi_value OHPixelmapNativeGetColorSpaceNativeSuppTest(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    napi_value ret;
    OH_PixelmapNative *pixelmap = nullptr;
    OH_NativeColorSpaceManager *getColorSpaceNative = nullptr;
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        returnValue = OH_PixelmapNative_GetColorSpaceNative(pixelmap, &getColorSpaceNative);
        break;
    default:
        break;
    }
    OH_PixelmapNative_Release(pixelmap);
   
    napi_create_int32(env, returnValue, &ret);
    return ret;
}

napi_value OHPixelmapNativeUnaccessPixelsSuppTest(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_PixelmapNative *pixelmap = nullptr;
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        returnValue = OH_PixelmapNative_UnaccessPixels(pixelmap);
        break;
    default:
        break;
    }
    OH_PixelmapNative_Release(pixelmap);
   
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHPixelmapNativeAccessPixelsSuppTest(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_PixelmapNative *pixelmap = nullptr;
    void *addr = nullptr; 
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        pixelmap = nullptr; 
        returnValue = OH_PixelmapNative_AccessPixels(pixelmap, &addr);
        break;
    default:
        break;
    }
    
    OH_PixelmapNative_Release(pixelmap); 
   
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHPixelmapNativeCreateAlphaPixelmapSuppTest(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_PixelmapNative *srcPixelmap = nullptr;    
    OH_PixelmapNative *dstPixelmap = nullptr;  
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        srcPixelmap = nullptr;
        returnValue = OH_PixelmapNative_CreateAlphaPixelmap(srcPixelmap, &dstPixelmap);
        break;
    default:
        break;
    }

    OH_PixelmapNative_Release(srcPixelmap); 
   
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHPixelmapNativeGetUniqueIdSuppTest(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status napiStatus = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t testIndex = 0;
    napiStatus = napi_get_value_int32(env, args[0], &testIndex);
    
    OH_PixelmapNative* pixelmap = nullptr; 
    uint32_t uniqueId = 0;                 
    Image_ErrorCode returnValue;  
    
    switch (testIndex) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        returnValue = OH_PixelmapNative_GetUniqueId(pixelmap, &uniqueId);
        break;
    default:
        break;
    }

    OH_PixelmapNative_Release(pixelmap); 
   
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHPixelmapNativeIsReleasedSuppTest(napi_env env, napi_callback_info info) 
{

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status napiStatus = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t testIndex = 0;
    napiStatus = napi_get_value_int32(env, args[0], &testIndex);
    
    OH_PixelmapNative* pixelmap = nullptr;
    bool isReleased = false;
    Image_ErrorCode returnValue;  
    
    switch (testIndex) {
    case CASE_INDEX_1:
        pixelmap = nullptr;
        returnValue = OH_PixelmapNative_IsReleased(pixelmap, &isReleased);
        break;
    default:
        break;
    }

    OH_PixelmapNative_Release(pixelmap); 
   
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value OHPixelmapNativeReadPixelsFromAreaSuppTest(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status napiStatus = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index = 0;
    napiStatus = napi_get_value_int32(env, args[0], &index);

    OH_PixelmapNative* pixelmap = nullptr;
    Image_PositionArea *area = nullptr;
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_PixelmapNative_ReadPixelsFromArea(pixelmap, area);
        break;
    default:
        break;
    }
    
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

napi_value OHPixelmapNativeWritePixelsToAreaSuppTest(napi_env env, napi_callback_info info) 
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_status napiStatus = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index = 0;
    napiStatus = napi_get_value_int32(env, args[0], &index);

    OH_PixelmapNative* pixelmap = nullptr;
    Image_PositionArea *area = nullptr;
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_PixelmapNative_WritePixelsToArea(pixelmap, area);
        break;
    default:
        break;
    }
    
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}