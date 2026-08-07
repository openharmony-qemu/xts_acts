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
#include <filesystem>
#include <iostream>
#include "napi/native_api.h"
#include "include/CapTest.h"
#include "include/CommonTest.h"
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <unistd.h>

namespace {
OH_AVCodec *venc_ = NULL;
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
OH_AVFormat *format;
constexpr int MAX_ALLOWED_LTR_FRAME_COUNT = 10;
constexpr int ONE_HUNDRED = 100;
constexpr int FOUR = 4;
constexpr int ERROR_CODE_NEGATIVE_ONE = -1;
constexpr int SUCCESS_CODE = 0;
constexpr int ERROR_CODE_NEGATIVE_TWO = -2;

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}
} // namespace

namespace OHOS {
namespace Media {
class HwCapabilityNdkTest {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();
};

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

int SafeMemcpy(void* dst, size_t dstSize, const void* src, size_t len)
{
    if (!dst || !src) { return ERROR_CODE_NEGATIVE_ONE; }
    if (len == 0) { return SUCCESS_CODE; }
    if (len > dstSize) { return ERROR_CODE_NEGATIVE_TWO; }
    unsigned char* dstPtr = (unsigned char*)dst;
    const unsigned char* srcPtr = static_cast<const unsigned char*>(src);
    if (dstPtr == srcPtr) { return SUCCESS_CODE; }
    if (dstPtr < srcPtr) {
        for (size_t i = 0; i < len; ++i) { dstPtr[i] = srcPtr[i]; }
    } else if (dstPtr > srcPtr) {
        for (size_t i = len; i > 0; --i) { dstPtr[i - 1] = srcPtr[i - 1]; }
    }
    return SUCCESS_CODE;
}

void HwCapabilityNdkTest::SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (SafeMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != 0) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (SafeMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc,
        strlen(tmpCodecNameHevc)) != 0) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname_hevc: " << g_codecNameHEVC << endl;
}

void HwCapabilityNdkTest::TearDownTestCase() {}
void HwCapabilityNdkTest::SetUp() {}
void HwCapabilityNdkTest::TearDown()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
}
} // namespace Media
} // namespace OHOS

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00100
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi00100Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (capability) {
        if (OH_AVCapability_IsFeatureSupported(capability,
            static_cast<OH_AVCapabilityFeature>(FOUR)) != false) {
            return CreateIntInt32Result(env, -1);
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00200
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi00200Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (nullptr == capability) { return CreateIntInt32Result(env, -1); }
    if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00300
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value VideoTemporalEncodeApi00300Test(napi_env env, napi_callback_info info)
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability,
                VIDEO_ENCODER_TEMPORAL_SCALABILITY) < 0) {
                return CreateIntInt32Result(env, -1);
            }
        }
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability,
                VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
                return CreateIntInt32Result(env, -1);
            }
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00400
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi00400Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (nullptr == capability) { return CreateIntInt32Result(env, -1); }
    if (OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE)) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00500
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value VideoTemporalEncodeApi00500Test(napi_env env, napi_callback_info info)
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability,
                VIDEO_ENCODER_LONG_TERM_REFERENCE) < 0) {
                return CreateIntInt32Result(env, -1);
            }
        }
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (OH_AVCapability_IsFeatureSupported(capability,
                VIDEO_ENCODER_LONG_TERM_REFERENCE)) {
                return CreateIntInt32Result(env, -1);
            }
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00600
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi00600Test(napi_env env, napi_callback_info info)
{
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00700
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi00700Test(napi_env env, napi_callback_info info)
{
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00800
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value VideoTemporalEncodeApi00800Test(napi_env env, napi_callback_info info)
{
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_00900
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_00900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi00900Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (capability) {
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            static_cast<OH_AVCapabilityFeature>(FOUR))) {
            return CreateIntInt32Result(env, -1);
        }
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            static_cast<OH_AVCapabilityFeature>(-1))) {
            return CreateIntInt32Result(env, -1);
        }
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            static_cast<OH_AVCapabilityFeature>(ONE_HUNDRED))) {
            return CreateIntInt32Result(env, -1);
        }
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
            return CreateIntInt32Result(env, -1);
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01000
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi01000Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (nullptr == capability) { return CreateIntInt32Result(env, -1); }
    if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
        VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01100
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value VideoTemporalEncodeApi01100Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (capability) {
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            VIDEO_ENCODER_TEMPORAL_SCALABILITY)) {
            return CreateIntInt32Result(env, -1);
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01200
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi01200Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (nullptr == capability) { return CreateIntInt32Result(env, -1); }
    if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
        VIDEO_ENCODER_LONG_TERM_REFERENCE)) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01300
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value VideoTemporalEncodeApi01300Test(napi_env env, napi_callback_info info)
{
    if (!access("/system/lib64/media/", 0)) {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            format = OH_AVCapability_GetFeatureProperties(capability,
                VIDEO_ENCODER_LONG_TERM_REFERENCE);
            int ltrnum = 0;
            if (OH_AVFormat_GetIntValue(format,
                OH_FEATURE_PROPERTY_KEY_VIDEO_ENCODER_MAX_LTR_FRAME_COUNT, &ltrnum) < 0) {
                return CreateIntInt32Result(env, -1);
            }
            if (ltrnum > MAX_ALLOWED_LTR_FRAME_COUNT) {
                return CreateIntInt32Result(env, -1);
            }
        }
    } else {
        OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capability) {
            if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
                VIDEO_ENCODER_LONG_TERM_REFERENCE)) {
                return CreateIntInt32Result(env, -1);
            }
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01400
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi01400Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (capability) {
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            VIDEO_LOW_LATENCY)) {
            return CreateIntInt32Result(env, -1);
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01500
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
napi_value VideoTemporalEncodeApi01500Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (nullptr == capability) { return CreateIntInt32Result(env, -1); }
    if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
        VIDEO_LOW_LATENCY)) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01600
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
napi_value VideoTemporalEncodeApi01600Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (capability) {
        if (nullptr != OH_AVCapability_GetFeatureProperties(capability,
            VIDEO_LOW_LATENCY)) {
            return CreateIntInt32Result(env, -1);
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01700
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  Level2
 */
napi_value VideoTemporalEncodeApi01700Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(
        OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (capability) {
        const OH_NativeBuffer_Format *pixlFormats = nullptr;
        uint32_t pixlFormatNum = 0;
        if (AV_ERR_OK != OH_AVCapability_GetVideoSupportedNativeBufferFormats(
            capability, &pixlFormats, &pixlFormatNum)) {
            return CreateIntInt32Result(env, -1);
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01800
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  Level2
 */
napi_value VideoTemporalEncodeApi01800Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(
        OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    if (capability) {
        const OH_NativeBuffer_Format *pixlFormats = nullptr;
        uint32_t pixlFormatNum = 0;
        if (AV_ERR_INVALID_VAL != OH_AVCapability_GetVideoSupportedNativeBufferFormats(
            capability, &pixlFormats, &pixlFormatNum)) {
            return CreateIntInt32Result(env, -1);
        }
    }
    return CreateIntInt32Result(env, 0);
}

/**
 * @tc.name   SUB_VIDEO_TEMPORAL_ENCODE_API_01900
 * @tc.number SUB_VIDEO_TEMPORAL_ENCODE_API_01900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  Level2
 */
napi_value VideoTemporalEncodeApi01900Test(napi_env env, napi_callback_info info)
{
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = -1;
    if (AV_ERR_INVALID_VAL != OH_AVCapability_GetAudioSupportedSampleRateRanges(
        nullptr, &sampleRateRanges, &rangesNum)) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}
