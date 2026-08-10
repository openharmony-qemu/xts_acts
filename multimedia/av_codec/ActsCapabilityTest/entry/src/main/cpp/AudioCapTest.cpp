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
#include <string>
#include "napi/native_api.h"
#include "include/AudioCapTest.h"
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcapability.h>

using namespace std;

namespace {

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

bool CheckSampleRate(int32_t *sampleRateList, uint32_t sampleRateNum,
                     OH_AVRange *sampleRateRanges, uint32_t rangesNum)
{
    bool inFlags = false;
    for (uint32_t i = 0; i < sampleRateNum; i++) {
        for (uint32_t j = 0; j < rangesNum; j++) {
            if (sampleRateList[i] >= sampleRateRanges[j].minVal &&
                sampleRateList[i] <= sampleRateRanges[j].maxVal) {
                inFlags = true;
                break;
            }
        }
        if (!inFlags) {
            return false;
        }
    }
    return true;
}

} // namespace

/**
 * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00100
 * @tc.number SUB_AUDIO_CAPABILITY_TEST_00100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value AudioCapAbility00100Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    if (capability != nullptr) { return CreateIntInt32Result(env, 0); }
    int32_t sampleRateList[] = {7350, 8000, 11025, 12000, 16000, 22050, 24000,
                                32000, 44100, 48000, 64000, 88200, 96000};
    uint32_t sampleRateNum = 13;
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(
        capability, &sampleRateRanges, &rangesNum);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    if (result != true) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00200
 * @tc.number SUB_AUDIO_CAPABILITY_TEST_00200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value AudioCapAbility00200Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    if (capability == nullptr) { return CreateIntInt32Result(env, -1); }
    int32_t sampleRateList[] = {7350, 8000, 11025, 12000, 16000, 22050, 24000,
                                32000, 44100, 48000, 64000, 88200, 96000};
    uint32_t sampleRateNum = 13;
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(
        capability, &sampleRateRanges, &rangesNum);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    if (result != true) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00300
 * @tc.number SUB_AUDIO_CAPABILITY_TEST_00300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value AudioCapAbility00300Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, true);
    if (capability == nullptr) { return CreateIntInt32Result(env, -1); }
    int32_t sampleRateList[] = {8000, 16000, 22050, 24000, 32000, 44100, 48000, 88200, 96000};
    uint32_t sampleRateNum = 9;
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(
        capability, &sampleRateRanges, &rangesNum);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    if (result != true) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00400
 * @tc.number SUB_AUDIO_CAPABILITY_TEST_00400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value AudioCapAbility00400Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_FLAC, false);
    if (capability == nullptr) { return CreateIntInt32Result(env, -1); }
    int32_t sampleRateList[] = {8000, 384000};
    uint32_t sampleRateNum = 2;
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(
        capability, &sampleRateRanges, &rangesNum);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    if (result != true) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00500
 * @tc.number SUB_AUDIO_CAPABILITY_TEST_00500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value AudioCapAbility00500Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_VORBIS, false);
    if (capability == nullptr) { return CreateIntInt32Result(env, -1); }
    int32_t sampleRateList[] = {8000, 11025, 12000, 16000, 22050, 24000,
                                32000, 44100, 48000, 64000, 88200, 96000};
    uint32_t sampleRateNum = 12;
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(
        capability, &sampleRateRanges, &rangesNum);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    if (result != true) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00600
 * @tc.number SUB_AUDIO_CAPABILITY_TEST_00600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value AudioCapAbility00600Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, true);
    if (capability == nullptr) { return CreateIntInt32Result(env, -1); }
    int32_t sampleRateList[] = {8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000};
    uint32_t sampleRateNum = 9;
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(
        capability, &sampleRateRanges, &rangesNum);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    if (result != true) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00700
 * @tc.number SUB_AUDIO_CAPABILITY_TEST_00700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value AudioCapAbility00700Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_MPEG, false);
    if (capability == nullptr) { return CreateIntInt32Result(env, -1); }
    int32_t sampleRateList[] = {8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000};
    uint32_t sampleRateNum = 9;
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(
        capability, &sampleRateRanges, &rangesNum);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    bool result = CheckSampleRate(sampleRateList, sampleRateNum, sampleRateRanges, rangesNum);
    if (result != true) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_AUDIO_CAPABILITY_TEST_00800
 * @tc.number SUB_AUDIO_CAPABILITY_TEST_00800
 * @tc.desc   check nullptr
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value AudioCapAbility00800Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    if (capability == nullptr) { return CreateIntInt32Result(env, -1); }
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(
        nullptr, &sampleRateRanges, &rangesNum);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, nullptr, &rangesNum);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(
        capability, &sampleRateRanges, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}
