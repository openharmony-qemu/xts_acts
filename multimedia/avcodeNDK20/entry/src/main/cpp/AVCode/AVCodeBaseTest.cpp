/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "AVCode/AVCode_Test.h"
#include "common/Common.h"
#include <cstdint>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avmuxer.h>
#include <multimedia/player_framework/native_cencinfo.h>
#include <hilog/log.h>

napi_value OH_AVCLevelTest1(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_1;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest2(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_1b;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest3(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_11;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest4(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_12;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest5(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_13;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest6(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_2;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest7(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_21;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest8(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_22;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest9(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_3;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest10(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_31;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest11(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_32;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest12(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_4;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest13(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_41;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest14(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_42;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest15(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_5;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest16(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_51;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest17(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_52;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest18(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_6;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest19(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_61;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCLevelTest20(napi_env env, napi_callback_info info)
{
    OH_AVCLevel leve = AVC_LEVEL_62;
    int32_t profile = 1;
    bool setResult = OH_AVCapability_AreProfileAndLevelSupported(nullptr, profile, leve);
    napi_value retValue;
    napi_create_int32(env, setResult == true ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest1(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_1;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest2(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_2;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest3(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_21;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest4(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_3;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest5(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_31;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest6(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_4;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest7(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_41;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest8(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_5;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest9(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_51;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest10(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_52;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest11(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_6;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest12(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_61;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_HEVCLevelTest13(napi_env env, napi_callback_info info)
{
    int32_t leve = HEVC_LEVEL_62;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest1(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_1;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest2(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_2;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest3(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_21;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest4(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_3;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest5(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_31;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest6(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_4;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest7(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_41;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest8(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_5;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest9(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_51;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest10(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_52;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest11(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_6;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest12(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_61;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest13(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_62;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest14(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_63;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VVCLevelTest15(napi_env env, napi_callback_info info)
{
    int32_t leve = VVC_LEVEL_155;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level1(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_0;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level2(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_0B;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level3(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_1;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level4(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_2;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 1, &retValue);
    } else {
        napi_create_int32(env, 0, &retValue);
    }
    return retValue;
}

napi_value OH_MPEG4Level5(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_3;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level6(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_3B;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    if (setResult == AV_ERR_INVALID_VAL) {
        napi_create_int32(env, 1, &retValue);
    } else {
        napi_create_int32(env, 0, &retValue);
    }
    return retValue;
}

napi_value OH_MPEG4Level7(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_4;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level8(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_4A;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level9(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_5;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_MPEG4Level10(napi_env env, napi_callback_info info)
{
    int32_t leve = MPEG4_LEVEL_6;
    int32_t profile = 1;
    const int32_t *levels = &leve;
    uint32_t levelsNum = -1;
    OH_AVErrCode setResult = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, profile, &levels, &levelsNum);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_DestroyTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Destroy(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_SetCallbackTest(napi_env env, napi_callback_info info)
{
    struct OH_AVCodecAsyncCallback callback;
    OH_AVErrCode setResult = OH_VideoDecoder_SetCallback(nullptr, callback, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_RegisterCallbackTest(napi_env env, napi_callback_info info)
{
    struct OH_AVCodecCallback callback;
    OH_AVErrCode setResult = OH_VideoDecoder_RegisterCallback(nullptr, callback, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_SetSurfaceTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_SetSurface(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_StartTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Start(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_StopTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Stop(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_FlushTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Flush(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_ResetTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_Reset(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_SetParameterTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_SetParameter(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_PushInputDataTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVCodecBufferAttr attr;
    OH_AVErrCode setResult = OH_VideoDecoder_PushInputData(nullptr, index, attr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_RenderOutputDataTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_RenderOutputData(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_FreeOutputDataTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_FreeOutputData(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_PushInputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_PushInputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_RenderOutputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_RenderOutputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_RenderOutputBufferAtTimeTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    int64_t renderTimestampNs = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_RenderOutputBufferAtTime(nullptr, index, renderTimestampNs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_FreeOutputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_FreeOutputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_QueryInputBufferTest(napi_env env, napi_callback_info info)
{
    int64_t timeoutUs = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_QueryInputBuffer(nullptr, nullptr, timeoutUs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_QueryOutputBufferTest(napi_env env, napi_callback_info info)
{
    int64_t timeoutUs = 1;
    OH_AVErrCode setResult = OH_VideoDecoder_QueryOutputBuffer(nullptr, nullptr, timeoutUs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoDecoder_SetDecryptionConfigTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoDecoder_SetDecryptionConfig(nullptr, nullptr, true);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_SetCallbackTest(napi_env env, napi_callback_info info)
{
    OH_AVCodecAsyncCallback callback;
    OH_AVErrCode setResult = OH_VideoEncoder_SetCallback(nullptr, callback, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_RegisterCallbackTest(napi_env env, napi_callback_info info)
{
    OH_AVCodecCallback callback;
    OH_AVErrCode setResult = OH_VideoEncoder_RegisterCallback(nullptr, callback, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_RegisterParameterCallbackTest(napi_env env, napi_callback_info info)
{
    OH_VideoEncoder_OnNeedInputParameter onInputParameter;
    OH_AVErrCode setResult = OH_VideoEncoder_RegisterParameterCallback(nullptr, onInputParameter, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_PrepareTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoEncoder_Prepare(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_SetParameterTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoEncoder_SetParameter(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_PushInputDataTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVCodecBufferAttr attr;
    OH_AVErrCode setResult = OH_VideoEncoder_PushInputData(nullptr, index, attr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_PushInputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_PushInputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_PushInputParameterTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_PushInputParameter(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_FreeOutputBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t index = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_FreeOutputBuffer(nullptr, index);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_QueryInputBufferTest(napi_env env, napi_callback_info info)
{
    int64_t timeoutUs = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_QueryInputBuffer(nullptr, nullptr, timeoutUs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_QueryOutputBufferTest(napi_env env, napi_callback_info info)
{
    int64_t timeoutUs = 1;
    OH_AVErrCode setResult = OH_VideoEncoder_QueryOutputBuffer(nullptr, nullptr, timeoutUs);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_VideoEncoder_IsValidTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_VideoEncoder_IsValid(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_DestroyTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVDemuxer_Destroy(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_SelectTrackByIDTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVDemuxer_SelectTrackByID(nullptr, trackIndex);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_UnselectTrackByIDTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVDemuxer_UnselectTrackByID(nullptr, trackIndex);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_ReadSampleTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVDemuxer_ReadSample(nullptr, trackIndex, nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_ReadSampleBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVDemuxer_ReadSampleBuffer(nullptr, trackIndex, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_SeekToTimeTest(napi_env env, napi_callback_info info)
{
    int64_t millisecond = 1;
    OH_AVSeekMode mode = SEEK_MODE_NEXT_SYNC;
    OH_AVErrCode setResult = OH_AVDemuxer_SeekToTime(nullptr, millisecond, mode);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_SetMediaKeySystemInfoCallbackTest(napi_env env, napi_callback_info info)
{
    DRM_MediaKeySystemInfoCallback callback;
    OH_AVErrCode setResult = OH_AVDemuxer_SetMediaKeySystemInfoCallback(nullptr, callback);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallbackTest(napi_env env, napi_callback_info info)
{
    Demuxer_MediaKeySystemInfoCallback callback;
    OH_AVErrCode setResult = OH_AVDemuxer_SetDemuxerMediaKeySystemInfoCallback(nullptr, callback);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVDemuxer_GetMediaKeySystemInfoTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVDemuxer_GetMediaKeySystemInfo(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVMuxer_WriteSampleBufferTest(napi_env env, napi_callback_info info)
{
    uint32_t trackIndex = 1;
    OH_AVErrCode setResult = OH_AVMuxer_WriteSampleBuffer(nullptr, trackIndex, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVSource_DestroyTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVSource_Destroy(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_DestroyTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVCencInfo_Destroy(nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetAlgorithmTest(napi_env env, napi_callback_info info)
{
    DrmCencAlgorithm algo = DRM_ALG_CENC_UNENCRYPTED;
    OH_AVErrCode setResult = OH_AVCencInfo_SetAlgorithm(nullptr, algo);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetKeyIdAndIvTest(napi_env env, napi_callback_info info)
{
    uint32_t keyIdLen = 1;
    uint32_t ivLen = 1;
    OH_AVErrCode setResult = OH_AVCencInfo_SetKeyIdAndIv(nullptr, nullptr, keyIdLen, nullptr, ivLen);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetSubsampleInfoTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVCencInfo_SetSubsampleInfo(nullptr, 1, 1, 1, 1, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetModeTest(napi_env env, napi_callback_info info)
{
    DrmCencInfoMode mode = DRM_CENC_INFO_KEY_IV_SUBSAMPLES_SET;
    OH_AVErrCode setResult = OH_AVCencInfo_SetMode(nullptr, mode);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

napi_value OH_AVCencInfo_SetAVBufferTest(napi_env env, napi_callback_info info)
{
    OH_AVErrCode setResult = OH_AVCencInfo_SetAVBuffer(nullptr, nullptr);
    napi_value retValue;
    napi_create_int32(env, setResult == AV_ERR_INVALID_VAL ? 1 : 0, &retValue);
    return retValue;
}

