/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <string>
#include <iostream>
#include <memory>
#include "SecureMemory.h"
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include "videoenc_sample.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include "avcodec_codec_name.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "include/OhosCommonTest.h"
#include <napi/native_api.h>

static OH_AVCodec *venc_ = nullptr;
static OH_AVFormat *format = nullptr;

namespace {
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t FRAME_RATE_30_INT = 30;
constexpr uint32_t DEFAULT_QUALITY = 30;
constexpr uint32_t MAX_PROFILE_NUM = 3;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
const char *INP_DIR_720 = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
constexpr uint32_t SECOND = 1000;
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr uint32_t MAX_QUALITY = 100;
constexpr uint32_t NO_SUPPORT_MODE = 100;
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != EOK) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname: " << g_codecName << endl;

    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc,
                 strlen(tmpCodecNameHevc)) != EOK) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname: " << g_codecNameHEVC << endl;
}

void TestTearDownFunc2()
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

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

napi_value VideoEncodeCapability5100Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_IsVideoSizeSupported(cap, 0, DEFAULT_HEIGHT) !=
        false) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability5200Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_IsVideoSizeSupported(cap, DEFAULT_WIDTH, 0) !=
        false) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability5300Test(napi_env env, napi_callback_info info)
{
    if (OH_AVCapability_IsVideoSizeSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT) != false) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability5400Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_IsVideoSizeSupported(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT) != true) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability5500Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRange(nullptr, &range);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability5600Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoFrameRateRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability5700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoFrameRateRange(cap, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (0 >= range.minVal) { return CreateIntInt32Result(env, -1); }
        if (0 >= range.maxVal) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability5800Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability5900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6000Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, 0, DEFAULT_HEIGHT, &range);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6100Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, DEFAULT_WIDTH, 0, &range);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6200Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoFrameRateRangeForSize(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        if (0 >= range.minVal) { return CreateIntInt32Result(env, -1); }
        if (0 >= range.maxVal) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6300Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(cap, 0, DEFAULT_HEIGHT, FRAME_RATE_30_INT) != false) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6400Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(cap, DEFAULT_WIDTH, 0, FRAME_RATE_30_INT) != false) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6500Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0) != false) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6600Test(napi_env env, napi_callback_info info)
{
    if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(
        nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, FRAME_RATE_30_INT) != false) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(
            cap, DEFAULT_WIDTH, DEFAULT_HEIGHT, FRAME_RATE_30_INT) != true) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6800Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(nullptr, &pixelFormat, &pixelFormatNum);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability6900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t pixelFormatNum = 0;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(cap, nullptr, &pixelFormatNum);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7000Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *pixelFormat = nullptr;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7100Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *pixelFormat = nullptr;
        uint32_t pixelFormatNum = 0;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum);
        if (pixelFormat == nullptr) { return CreateIntInt32Result(env, -1); }
        if (pixelFormatNum <= 0) { return CreateIntInt32Result(env, -1); }
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        for (int i = 0; i < pixelFormatNum; i++) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();
            if (format == nullptr) { return CreateIntInt32Result(env, -1); }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            if (pixelFormat[i] < 0) { return CreateIntInt32Result(env, -1); }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
            if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_Destroy(format);
            OH_VideoEncoder_Destroy(venc_);
        }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA + AV_PIXEL_FORMAT_RGBA);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_UNSUPPORT) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7200Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    ret = OH_AVCapability_GetSupportedProfiles(nullptr, &profiles, &profileNum);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7300Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t profileNum = 0;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetSupportedProfiles(cap, nullptr, &profileNum);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7400Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetSupportedProfiles(cap, &profiles, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7500Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *profiles = nullptr;
        uint32_t profileNum = 0;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetSupportedProfiles(cap, &profiles, &profileNum);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (profiles == nullptr) { return CreateIntInt32Result(env, -1); }
        if (profileNum != MAX_PROFILE_NUM) { return CreateIntInt32Result(env, -1); }
        for (int i = 0; i < profileNum; i++) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();
            if (format == nullptr) { return CreateIntInt32Result(env, -1); }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
            if (profiles[i] < 0) { return CreateIntInt32Result(env, -1); }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profiles[i]);
            ret = OH_VideoEncoder_Configure(venc_, format);
            if (ret != AV_ERR_OK) {
                cout << profiles[i] << " profile cant configure" << endl;
            }
            if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_Destroy(format);
            OH_VideoEncoder_Destroy(venc_);
        }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, AVC_PROFILE_MAIN + AVC_PROFILE_MAIN);
        if (OH_VideoEncoder_Configure(venc_, format) !=
        AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7600Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    ret = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, AVC_PROFILE_BASELINE, &levels, &levelNum);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        uint32_t levelNum = 0;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, 1, &levels, &levelNum);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7800Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        uint32_t levelNum = 0;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, AVC_PROFILE_BASELINE, nullptr, &levelNum);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability7900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, AVC_PROFILE_BASELINE, &levels, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability8000Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        const int32_t *levels = nullptr;
        uint32_t levelNum = 0;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetSupportedLevelsForProfile(cap, AVC_PROFILE_BASELINE, &levels, &levelNum);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (levels == nullptr) { return CreateIntInt32Result(env, -1); }
        if (levelNum <= 0) { return CreateIntInt32Result(env, -1); }
        for (int i = 0; i < levelNum; i++) {
            if (levels[i] < 0) { return CreateIntInt32Result(env, -1); }
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability8100Test(napi_env env, napi_callback_info info)
{
    if (OH_AVCapability_AreProfileAndLevelSupported(nullptr, AVC_PROFILE_BASELINE, 1) != false) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability8200Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_AreProfileAndLevelSupported(cap, 1, 1) != false) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability8300Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_AreProfileAndLevelSupported(cap, AVC_PROFILE_BASELINE, 1) != true) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability0100Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc) {
        if (OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true) ==
        nullptr) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability0200Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc) {
        if (OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE) == nullptr) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability0300Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc) {
        if (cap_hevc == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_IsHardware(cap_hevc) != true) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability0400Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc) {
        if (cap_hevc == nullptr) { return CreateIntInt32Result(env, -1); }
        const char *name = OH_AVCapability_GetName(cap_hevc);
        if (name == nullptr) { return CreateIntInt32Result(env, -1); }
        if (0 >= strlen(name)) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}


napi_value VideoEncodeHevcCapability0500Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;

        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }

        ret = OH_AVCapability_GetEncoderBitrateRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability0600Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap_hevc == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderBitrateRange(cap_hevc, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        cout << "max val " << range.maxVal << "  min val " << range.minVal << endl;
        if (0 > range.minVal) { return CreateIntInt32Result(env, -1); }
        if (0 >= range.maxVal) { return CreateIntInt32Result(env, -1); }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, range.minVal - 1);
        if (OH_VideoEncoder_Configure(venc_, format) !=
        AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, range.maxVal + 1);
        if (OH_VideoEncoder_Configure(venc_, format) !=
        AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability0700Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc) {
        if (cap_hevc == nullptr) { return CreateIntInt32Result(env, -1); }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_CBR);
        if (isSupported != true) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CBR);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_VideoEncoder_Destroy(venc_);
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_VBR);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability5200Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc) {
        if (cap_hevc == nullptr) { return CreateIntInt32Result(env, -1); }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap_hevc, BITRATE_MODE_VBR);
        if (isSupported != true) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_VBR);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability5300Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc) {
        OH_AVCapability *capa = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
        if (capa == nullptr) { return CreateIntInt32Result(env, -1); }
        if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();
            if (format == nullptr) { return CreateIntInt32Result(env, -1); }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, DEFAULT_QUALITY);
            bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capa, BITRATE_MODE_CQ);
            if (isSupported != true) { return CreateIntInt32Result(env, -1); }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CQ);
            if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            TestTearDownFunc2();
        } else {
            bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capa, BITRATE_MODE_CQ);
            if (isSupported != false) { return CreateIntInt32Result(env, -1); }
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability5400Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc) {
        if (cap_hevc == nullptr) { return CreateIntInt32Result(env, -1); }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, NO_SUPPORT_MODE);
        if (OH_VideoEncoder_Configure(venc_, format) !=
        AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability0800Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderQualityRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability0900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderQualityRange(cap, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (0 != range.minVal) { return CreateIntInt32Result(env, -1); }
        if (MAX_QUALITY != range.maxVal) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability1000Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderComplexityRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability1100Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderComplexityRange(cap, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability1200Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthAlignment(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability1300Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        int32_t alignment = 0;
        ret = OH_AVCapability_GetVideoWidthAlignment(cap, &alignment);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (alignment < 0) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability1400Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightAlignment(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability1500Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        int32_t alignment = 0;
        ret = OH_AVCapability_GetVideoHeightAlignment(cap, &alignment);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (alignment < 0) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability1600Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, DEFAULT_WIDTH, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability1700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, 0, &range);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability1900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap, DEFAULT_HEIGHT, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeHevcCapability2000Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap, 0, &range);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability2100Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap, DEFAULT_WIDTH, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        if (0 > range.minVal) { return CreateIntInt32Result(env, -1); }
        if (0 >= range.maxVal) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability2200Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability2300Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRange(cap, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        if (0 > range.minVal) { return CreateIntInt32Result(env, -1); }
        if (0 >= range.maxVal) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability2400Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability2500Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRange(cap, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
        if (0 > range.minVal) { return CreateIntInt32Result(env, -1); }
        if (0 >= range.maxVal) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability2600Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange widthRange;
        OH_AVRange heightRange;
        SecureMemset(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        SecureMemset(&heightRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRange(cap, &heightRange);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRange(cap, &widthRange);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (0 > heightRange.minVal) { return CreateIntInt32Result(env, -1); }
        if (0 >= heightRange.maxVal) { return CreateIntInt32Result(env, -1); }
        if (0 > widthRange.minVal) { return CreateIntInt32Result(env, -1); }
        if (0 >= widthRange.maxVal) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability2700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_IsVideoSizeSupported(cap, 0, DEFAULT_HEIGHT) !=
        false) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability2800Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_IsVideoSizeSupported(cap, DEFAULT_WIDTH, 0) !=
        false) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability2900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_IsVideoSizeSupported(cap, DEFAULT_WIDTH, DEFAULT_HEIGHT) != true) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeHevcCapability3000Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoFrameRateRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSetMaxFrameDelayCount0100Test(napi_env env, napi_callback_info info)
{
    if (cap && !access("/system/lib64/libav_codec_hevc_parser.z.so", 0)) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_MAX_FRAME_DELAY_COUNT, -1);
        if (OH_VideoEncoder_Configure(venc_, format) !=
        AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSetMaxFrameDelayCount0200Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc && !access("/system/lib64/libav_codec_hevc_parser.z.so", 0)) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_MAX_FRAME_DELAY_COUNT, -1);
        if (OH_VideoEncoder_Configure(venc_, format) !=
        AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSetMaxFrameDelayCount0300Test(napi_env env, napi_callback_info info)
{
    if (cap && !access("/system/lib64/libav_codec_hevc_parser.z.so", 0)) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_MAX_FRAME_DELAY_COUNT, MAX_PROFILE_NUM);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSetMaxFrameDelayCount0400Test(napi_env env, napi_callback_info info)
{
    if (cap_hevc && !access("/system/lib64/libav_codec_hevc_parser.z.so", 0)) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_MAX_FRAME_DELAY_COUNT, MAX_PROFILE_NUM);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc2();
    }
    return CreateIntInt32Result(env, 0);
}
void InitFuncTest2()
{
    SetUpTestCase();
}
