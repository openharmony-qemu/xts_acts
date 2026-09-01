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
#include <vector>
#include <napi/native_api.h>
#include <hilog/log.h>
#include <multimedia/video_processing_engine/video_processing.h>
#include <multimedia/player_framework/native_avformat.h>
#include "nocopyable.h"
#include "include/FunctionTest.h"
#include "include/XComponentNotify.h"

using namespace std;
using namespace OHOS;

const char* const XCOMPONENT_NAME_ID = "AutoEffectTest001";
const char* const XCOMPONENT_NAME_ID2 = "AutoEffectTest002";

constexpr unsigned int FUNC_LOG_DOMAIN = 0xFF01;
const char* const FUNC_LOG_TAG = "ActsAutoEffectNdkTest";
const int32_t FIVE_THOUSAND = 5000;
const int32_t THREE = 3;
template <typename T>
void FuncLogFail(const char* method, T code, const char* funcName)
{
    (void)OH_LOG_Print(LOG_APP, LOG_ERROR, FUNC_LOG_DOMAIN, FUNC_LOG_TAG,
        "%{public}s %{public}s fail code=%{public}d", funcName, method, static_cast<int32_t>(code));
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

static const char* GetFuncName()
{
    return XCOMPONENT_NAME_ID;
}

static const char* GetFuncName2()
{
    return XCOMPONENT_NAME_ID2;
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
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, FUNC_LOG_DOMAIN, FUNC_LOG_TAG,
        "%{public}s UseAutoEffect ret=%{public}d", __func__, static_cast<int32_t>(ret)));
    if (ret == VIDEO_PROCESSING_SUCCESS) {
        SetCurrentXComponentName(name);
        SetXComponentReady(true);
        WaitForSurfaceReady(FIVE_THOUSAND);
    }
    return ret;
}

static void SetXComponentReady2(bool ready)
{
    NotifyXComponentReady2(ready);
}

static VideoProcessing_ErrorCode UseAutoEffectAndNotify2(uint32_t type, bool enabled,
    const char* name)
{
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(type, enabled, name);
    ((void)OH_LOG_Print(LOG_APP, LOG_INFO, FUNC_LOG_DOMAIN, FUNC_LOG_TAG,
        "%{public}s UseAutoEffect2 ret=%{public}d", __func__, static_cast<int32_t>(ret)));
    if (ret == VIDEO_PROCESSING_SUCCESS) {
        SetCurrentXComponentName2(name);
        SetXComponentReady2(true);
        WaitForSurfaceReady2(FIVE_THOUSAND);
    }
    return ret;
}

static int32_t TestSetParamSeries(uint32_t type, const char* name)
{
    const int32_t enables[] = {1, 0};
    const float strengths[] = {0.0f, 0.5f, 1.0f};
    for (size_t i = 0; i < sizeof(enables) / sizeof(enables[0]); i++) {
        for (size_t j = 0; j < sizeof(strengths) / sizeof(strengths[0]); j++) {
            OH_AVFormat* param = CreateParam(enables[i], strengths[j]);
            if (param == nullptr) {
                return -1;
            }
            VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetAutoEffectParam(type, name, param);
            OH_AVFormat_Destroy(param);
            if (ret != VIDEO_PROCESSING_SUCCESS) {
                return -1;
            }
        }
    }
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00100
 * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00100
 * @tc.desc   查询支持，完整功能流程，enable=true，设置参数(0/0.5/1)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int32_t AutoEffectFuncTest00100()
{
    uint32_t type = GetAisrType();
    if (!OH_VideoProcessing_IsAutoEffectSupported(type)) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    const char* name = nameStr.c_str();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(type, true, name);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("UseAutoEffect", ret, __func__);
        return -1;
    }
    PrepareXComponent();
    if (TestSetParamSeries(type, name) != 0) {
        FuncLogFail("SetAutoEffectParam", -1, __func__);
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00200
 * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00200
 * @tc.desc   查询支持，完整功能流程，enable=false，设置参数(0/0.5/1)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int32_t AutoEffectFuncTest00200()
{
    uint32_t type = GetAisrType();
    if (!OH_VideoProcessing_IsAutoEffectSupported(type)) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    const char* name = nameStr.c_str();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(type, false, name);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("UseAutoEffect", ret, __func__);
        return -1;
    }
    PrepareXComponent();
    if (TestSetParamSeries(type, name) == 0) {
        FuncLogFail("SetAutoEffectParam", -1, __func__);
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00300
 * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00300
 * @tc.desc   查询支持，错误流程，先SetAutoEffectParam再UseAutoEffect
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectFuncTest00300()
{
    uint32_t type = GetAisrType();
    if (!OH_VideoProcessing_IsAutoEffectSupported(type)) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    const char* name = nameStr.c_str();
    OH_AVFormat* param = CreateParam(1, 0.5f);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetAutoEffectParam(type, name, param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) {
        FuncLogFail("SetAutoEffectParam", ret, __func__);
        return -1;
    }
    ret = OH_VideoProcessing_UseAutoEffect(type, true, name);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("UseAutoEffect", ret, __func__);
        return -1;
    }
    PrepareXComponent();
    param = CreateParam(1, 0.5f);
    ret = OH_VideoProcessing_SetAutoEffectParam(type, name, param);
    OH_AVFormat_Destroy(param);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("SetAutoEffectParam", ret, __func__);
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00400
 * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00400
 * @tc.desc   查询支持，2个XComponent，A使能true，B使能false，设置参数(0/0.5/1)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int32_t AutoEffectFuncTest00400()
{
    uint32_t type = GetAisrType();
    if (!OH_VideoProcessing_IsAutoEffectSupported(type)) {
        return 0;
    }
    std::string nameAStr = GenerateXComponentName();
    const char* nameA = nameAStr.c_str();
    std::string nameBStr = GenerateXComponentName2();
    const char* nameB = nameBStr.c_str();
    if (OH_VideoProcessing_UseAutoEffect(type, true, nameA) != VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("UseAutoEffect", -1, __func__);
        return -1;
    }
    if (OH_VideoProcessing_UseAutoEffect(type, false, nameB) != VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("UseAutoEffect", -1, __func__);
        return -1;
    }
    PrepareXComponent();
    PrepareXComponent2();
    if (TestSetParamSeries(type, nameA) != 0) {
        FuncLogFail("SetAutoEffectParam nameA", -1, __func__);
        return -1;
    }
    if (TestSetParamSeries(type, nameB) == 0) {
        FuncLogFail("SetAutoEffectParam nameB", -1, __func__);
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00500
 * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00500
 * @tc.desc   查询支持，2个XComponent，A使能true，B使能true，设置参数(0/0.5/1)
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectFuncTest00500()
{
    uint32_t type = GetAisrType();
    if (!OH_VideoProcessing_IsAutoEffectSupported(type)) {
        return 0;
    }
    std::string nameAStr = GenerateXComponentName();
    const char* nameA = nameAStr.c_str();
    std::string nameBStr = GenerateXComponentName2();
    const char* nameB = nameBStr.c_str();
    if (OH_VideoProcessing_UseAutoEffect(type, true, nameA) != VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("UseAutoEffect", -1, __func__);
        return -1;
    }
    if (OH_VideoProcessing_UseAutoEffect(type, true, nameB) != VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("UseAutoEffect", -1, __func__);
        return -1;
    }
    PrepareXComponent();
    PrepareXComponent2();
    if (TestSetParamSeries(type, nameA) != 0) {
        FuncLogFail("SetAutoEffectParam nameA", -1, __func__);
        return -1;
    }
    if (TestSetParamSeries(type, nameB) != 0) {
        FuncLogFail("SetAutoEffectParam nameB", -1, __func__);
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00600
 * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00600
 * @tc.desc   查询不支持，调用UseAutoEffect预期返回错误码
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectFuncTest00600()
{
    uint32_t type = 0;
    if (OH_VideoProcessing_IsAutoEffectSupported(type)) {
        return 0;
    }
    const char* name = GetFuncName();
    VideoProcessing_ErrorCode ret = UseAutoEffectAndNotify(type, true, name);
    if (ret == VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("UseAutoEffect", ret, __func__);
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00700
 * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00700
 * @tc.desc   查询不支持，调用SetAutoEffectParam预期返回错误码
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectFuncTest00700()
{
    uint32_t type = 0;
    if (OH_VideoProcessing_IsAutoEffectSupported(type)) {
        return 0;
    }
    const char* name = GetFuncName();
    OH_AVFormat* param = CreateParam(1, 0.5f);
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_SetAutoEffectParam(type, name, param);
    OH_AVFormat_Destroy(param);
    if (ret == VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("SetAutoEffectParam", ret, __func__);
        return -1;
    }
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00800
 * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00800
 * @tc.desc   查询不支持，重复调用UseAutoEffect
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectFuncTest00800()
{
    uint32_t type = 0;
    if (OH_VideoProcessing_IsAutoEffectSupported(type)) {
        return 0;
    }
    const char* name = GetFuncName();
    for (int32_t i = 0; i < THREE; i++) {
        VideoProcessing_ErrorCode ret = UseAutoEffectAndNotify(type, true, name);
        if (ret == VIDEO_PROCESSING_SUCCESS) {
            FuncLogFail("UseAutoEffect", ret, __func__);
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00900
 * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00900
 * @tc.desc   查询支持，重复调用UseAutoEffect
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int32_t AutoEffectFuncTest00900()
{
    uint32_t type = GetAisrType();
    if (!OH_VideoProcessing_IsAutoEffectSupported(type)) {
        return 0;
    }
    std::string nameStr = GenerateXComponentName();
    const char* name = nameStr.c_str();
    VideoProcessing_ErrorCode ret = OH_VideoProcessing_UseAutoEffect(type, true, name);
    if (ret != VIDEO_PROCESSING_SUCCESS) {
        FuncLogFail("UseAutoEffect1", ret, __func__);
        return -1;
    }
    PrepareXComponent();
    ret = OH_VideoProcessing_UseAutoEffect(type, false, name);
    if (ret != VIDEO_PROCESSING_ERROR_OPERATION_NOT_PERMITTED) {
        FuncLogFail("UseAutoEffect2", ret, __func__);
        return -1;
    }
    return 0;
}
