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
#include <iostream>
#include <string>
#include <napi/native_api.h>
#include <hilog/log.h>
#include <multimedia/video_processing_engine/video_processing.h>
#include <multimedia/player_framework/native_avformat.h>
#include "nocopyable.h"
#include "include/ApiTest.h"
#include "include/XComponentNotify.h"

using namespace std;
using namespace OHOS;

const char* const XCOMPONENT_NAME_ID = "AutoEffectTest001";
const char* const XCOMPONENT_NAME_ID2 = "AutoEffectTest002";
const int32_t ONE_THOUSAND_AND_TWENTY_FOUR = 1024;
const int32_t FIVE_THOUSAND = 5000;
constexpr unsigned int API_LOG_DOMAIN = 0xFF00;
const char* const API_LOG_TAG = "ActsAutoEffectNdkTest";
template <typename T>
void ApiLogResult(T ret, const char* funcName)
{
    (void)OH_LOG_Print(LOG_APP, LOG_INFO, API_LOG_DOMAIN, API_LOG_TAG,
        "%{public}s ret=%{public}d", funcName, static_cast<int32_t>(ret));
}

static napi_value CreateInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static uint32_t GetAisrType()
{
    return static_cast<uint32_t>(VIDEO_PROCESSING_TYPE_AUTOEFFECT_AISR);
}

static OH_AVFormat* CreateParam(int32_t enable, float strength)
{
    OH_AVFormat* param = OH_AVFormat_Create();
    if (param != nullptr) {
        OH_AVFormat_SetIntValue(param, VIDEO_AUTOEFFECT_ENABLE, enable);
        OH_AVFormat_SetFloatValue(param, VIDEO_AUTOEFFECT_AISR_STRENGTH, strength);
    }
    return param;
}

static void SetXComponentReady(bool ready)
{
    NotifyXComponentReady(ready);
}

static VideoProcessing_ErrorCode UseAutoEffectAndNotify(uint32_t type, bool enabled,
    const char* name)
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(type, enabled, name);
    if (ret == VIDEO_PROCESSING_SUCCESS) {
        SetCurrentXComponentName(name);
        SetXComponentReady(true);
        WaitForSurfaceReady(FIVE_THOUSAND);
    }
    return ret;
}

void InitApiTest() {}

void TestTearDownApi() {}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00100
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00100
 * @tc.desc   OH_VideoProcessing_UseAutoEffect入参name=NULL
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int32_t AutoEffectApiTest00100()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    VideoProcessing_ErrorCode ret = UseAutoEffectAndNotify(GetAisrType(), true, nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00200
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00200
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name=NULL
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int32_t AutoEffectApiTest00200()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    OH_AVFormat* param = CreateParam(1, 0.5f);
    if (param == nullptr) {
        return -1;
    }
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nullptr, param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00300
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00300
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param=NULL
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int32_t AutoEffectApiTest00300()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00400
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00400
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name=NULL和param=NULL
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectApiTest00400()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nullptr, nullptr);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00500
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00500
 * @tc.desc   OH_VideoProcessing_IsAutoEffectSupported入参type=0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectApiTest00500()
{
    bool ret = OH_VideoProcessing_IsAutoEffectSupported(0);
    if (ret != false) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00600
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00600
 * @tc.desc   OH_VideoProcessing_UseAutoEffect入参type=0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectApiTest00600()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    VideoProcessing_ErrorCode ret = UseAutoEffectAndNotify(0, true, XCOMPONENT_NAME_ID);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00700
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00700
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参type=0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectApiTest00700()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    UseAutoEffectAndNotify(0, true, XCOMPONENT_NAME_ID);
    OH_AVFormat* param = CreateParam(1, 0.5f);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetAutoEffectParam(0, XCOMPONENT_NAME_ID, param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00800
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00800
 * @tc.desc   OH_VideoProcessing_IsAutoEffectSupported入参type=uint32_max
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectApiTest00800()
{
    bool ret = OH_VideoProcessing_IsAutoEffectSupported(UINT32_MAX);
    if (ret != false) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00900
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00900
 * @tc.desc   OH_VideoProcessing_UseAutoEffect入参type=uint32_max
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectApiTest00900()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    VideoProcessing_ErrorCode ret = UseAutoEffectAndNotify(UINT32_MAX, true, XCOMPONENT_NAME_ID);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01000
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01000
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参type=uint32_max
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectApiTest01000()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    UseAutoEffectAndNotify(UINT32_MAX, true, XCOMPONENT_NAME_ID);
    OH_AVFormat* param = CreateParam(1, 0.5f);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetAutoEffectParam(UINT32_MAX, XCOMPONENT_NAME_ID, param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01100
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01100
 * @tc.desc   OH_VideoProcessing_IsAutoEffectSupported入参type=不支持的枚举
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectApiTest01100()
{
    uint32_t type = static_cast<uint32_t>(VIDEO_PROCESSING_TYPE_COLOR_SPACE_CONVERSION);
    bool ret = OH_VideoProcessing_IsAutoEffectSupported(type);
    if (ret != false) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01200
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01200
 * @tc.desc   OH_VideoProcessing_UseAutoEffect入参type=不支持的枚举
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectApiTest01200()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    uint32_t type = static_cast<uint32_t>(VIDEO_PROCESSING_TYPE_COLOR_SPACE_CONVERSION);
    VideoProcessing_ErrorCode ret = UseAutoEffectAndNotify(type, true, XCOMPONENT_NAME_ID);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01300
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01300
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参type=不支持的枚举
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest01300()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    uint32_t type = static_cast<uint32_t>(VIDEO_PROCESSING_TYPE_COLOR_SPACE_CONVERSION);
    UseAutoEffectAndNotify(type, true, XCOMPONENT_NAME_ID);
    OH_AVFormat* param = CreateParam(1, 0.5f);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetAutoEffectParam(type, XCOMPONENT_NAME_ID, param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01400
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01400
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name未经过UseAutoEffect注册
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest01400()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    OH_AVFormat* param = CreateParam(1, 0.5f);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), "unregistered_name", param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01500
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01500
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param不设置VIDEO_AUTOEFFECT_ENABLE
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest01500()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = OH_AVFormat_Create();
    OH_AVFormat_SetFloatValue(param, VIDEO_AUTOEFFECT_AISR_STRENGTH, 0.5f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01600
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01600
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param不设置VIDEO_AUTOEFFECT_AISR_STRENGTH
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest01600()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(param, VIDEO_AUTOEFFECT_ENABLE, 1);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01700
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01700
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_ENABLE=-1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest01700()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(-1, 0.5f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01800
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01800
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_ENABLE=2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest01800()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(2, 0.5f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01900
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01900
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=2
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest01900()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(1, 2.0f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02000
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02000
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=-1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest02000()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(1, -1.0f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_ERROR_INVALID_VALUE) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02100
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02100
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest02100()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(1, 0.0f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02200
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02200
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=0.5
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest02200()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(1, 0.5f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02300
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02300
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=1
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest02300()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(1, 1.0f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02500
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02500
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name=""
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest02500()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    const char* name = "";
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, name);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    SetCurrentXComponentName(name);
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(1, 0.5f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), name, param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02600
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02600
 * @tc.desc   OH_VideoProcessing_UseAutoEffect入参name是超长字符串
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest02600()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    string longName(ONE_THOUSAND_AND_TWENTY_FOUR, 'a');
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, longName.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    SetCurrentXComponentName(longName.c_str());
    PrepareXComponent();
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02700
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02700
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name是超长字符串
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest02700()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    string longName(ONE_THOUSAND_AND_TWENTY_FOUR, 'b');
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, longName.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    SetCurrentXComponentName(longName.c_str());
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(1, 0.5f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), longName.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02900
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02900
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name包含特殊字符
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest02900()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    const char* name = "test@#$%^&*()";
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, name);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    SetCurrentXComponentName(name);
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(1, 0.5f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), name, param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_03000
 * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_03000
 * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_ENABLE=0
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectApiTest03000()
{
    if (!OH_VideoProcessing_IsAutoEffectSupported(GetAisrType())) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(GetAisrType(), true, nameStr.c_str());
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    PrepareXComponent();
    OH_AVFormat* param = CreateParam(0, 0.5f);
    ret = OH_VideoProcessing_SetAutoEffectParam(GetAisrType(), nameStr.c_str(), param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        ApiLogResult(ret, __func__);
        return -1;
    }
    ApiLogResult(ret, __func__);
    return 0;
}

napi_value GetXComponentNameId(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_string_utf8(env, XCOMPONENT_NAME_ID, NAPI_AUTO_LENGTH, &result);
    return result;
}

napi_value GetXComponentNameId2(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_create_string_utf8(env, XCOMPONENT_NAME_ID2, NAPI_AUTO_LENGTH, &result);
    return result;
}
