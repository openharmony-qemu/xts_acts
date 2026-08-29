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
#include <limits>
#include <cfloat>
#include <iostream>
#include <memory>
#include "SecureMemory.h"
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include "videoenc_sample.h"
#include "videoenc_api11_sample.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videobase.h>
#include "avcodec_codec_name.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "include/OhosCommonTest.h"
#include <hilog/log.h>
#include <napi/native_api.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "EncoderSetparamTest12"

static OH_AVCodec *venc_ = nullptr;

namespace {
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
const char *INP_DIR_720 = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t FRAME_RATE_10 = 10;
constexpr uint32_t QP_MAX_200 = 200;
constexpr uint32_t EXPECTED_FRAME_COUNT_25 = 25;
constexpr uint32_t COLOR_PRIMARIES_100 = 100;
constexpr uint32_t TRANSFER_CHARACTERISTICS_10000 = 10000;
constexpr uint32_t MATRIX_COEFFICIENTS_10000 = 10000;
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

void TestTearDownSetparam()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
}

static void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr) {
        const char *tmpCodecName = OH_AVCapability_GetName(cap);
        if (tmpCodecName != nullptr) {
            if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != EOK) {
                cout << "memcpy failed" << endl;
            }
            cout << "codecname: " << g_codecName << endl;
        } else {
        }
    } else {
    }
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr) {
        const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
        if (tmpCodecNameHevc != nullptr) {
            if (SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc,
                strlen(tmpCodecNameHevc)) != EOK) {
                cout << "memcpy failed" << endl;
            }
            cout << "codecname_hevc: " << g_codecNameHEVC << endl;
        } else {
        }
    } else {
    }
}
static void TearDownTestCase() {}
static void TestSetUp() {}
static void TestTearDown()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
}

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

napi_value RESET_BITRATE_001Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, -1);
        if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, LONG_MAX);
        if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_BITRATE_002Test(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc") && isSupported) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE >> 1);
        if (vEncSample->SetParameter(format) == AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_BITRATE_003Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_BITRATE_004Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_BITRATE_005Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_BITRATE_006Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_BITRATE_007Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, -1);
        if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, LONG_MAX);
        if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_BITRATE_008Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE >> 1);
        if (vEncSample->SetParameter(format) == AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_BITRATE_009Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_BITRATE_010Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_BITRATE_011Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_BITRATE_012Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetBitrate = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_FRAMERATE_001Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, -1.0);
        if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_FRAMERATE_012Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
        if (isSupported) {
            vEncSample->INP_DIR = INP_DIR_720;
            vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
            vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
            vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
            vEncSample->DEFAULT_BITRATE_MODE = CQ;
            if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat *format = OH_AVFormat_Create();
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, -1.0);
            if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_Destroy(format);
            vEncSample->WaitForEOS();
            if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            vEncSample->Release();
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}
napi_value RESET_FRAMERATE_013Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
        if (isSupported) {
            vEncSample->INP_DIR = INP_DIR_720;
            vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
            vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
            vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
            vEncSample->DEFAULT_BITRATE_MODE = CQ;
            if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat *format = OH_AVFormat_Create();
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DBL_MAX);
            if (vEncSample->SetParameter(format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_Destroy(format);
            vEncSample->WaitForEOS();
            if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            vEncSample->Release();
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}
napi_value RESET_FRAMERATE_014Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DBL_MAX);
        if (vEncSample->SetParameter(format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}
napi_value RESET_FRAMERATE_002Test(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc") && isSupported) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_r_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_FRAMERATE_003Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_r_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_FRAMERATE_004Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_r_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_FRAMERATE_005Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_r_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_FRAMERATE_006Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_r_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_FRAMERATE_007Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->OUT_DIR = "/data/test/media/CQ_1s_r_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_FRAMERATE_008Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_-1_r_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_FRAMERATE_009Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_KEY_FRAME_INTERVAL = 0;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_0_r_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_FRAMERATE_010Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/cbr_1s_r_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_FRAMERATE_011Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetFrameRate = true;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->OUT_DIR = "/data/test/media/vbr_1s_r_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value RESET_QP_001Test(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc") && isSupported) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, -1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, -1);
        if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, QP_MAX_200);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, QP_MAX_200);
        if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}
napi_value RESET_QP_002Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, -1);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, -1);
        if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MAX, QP_MAX_200);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_QP_MIN, QP_MAX_200);
        if (vEncSample->SetParameter(format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_003Test(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc") && isSupported) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_b_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_004Test(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc") && isSupported) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_005Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_b_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_006Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_007Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_b_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_008Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_009Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_b_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_010Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cq_qp_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_011Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_b_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_012Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/cbr_qp_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_013Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchBufferParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_b_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value RESET_QP_014Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = FRAME_RATE_10;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->enableAutoSwitchParam = true;
        vEncSample->needResetQP = true;
        vEncSample->switchParamsTimeSec = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_qp_.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_PROFILE_001Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN;
        vEncSample->OUT_DIR = "/data/test/media/pq_vivid.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_PROFILE_002Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = HEVC_PROFILE_MAIN_10;
        vEncSample->OUT_DIR = "/data/test/media/pq_vivid.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_PROFILE_003Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = AVC_PROFILE_HIGH;
        vEncSample->OUT_DIR = "/data/test/media/SET_PROFILE_003.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_PROFILE_004Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = AVC_PROFILE_MAIN;
        vEncSample->OUT_DIR = "/data/test/media/SET_PROFILE_004.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_PROFILE_005Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_PROFILE = AVC_PROFILE_BASELINE;
        vEncSample->OUT_DIR = "/data/test/media/SET_PROFILE_005.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_RANGE_FLAG_001Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_fullrange.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_RANGE_FLAG_002Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->OUT_DIR = "/data/test/media/vbr_fullrange.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_COLORSPACE_001Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_cs.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_COLORSPACE_002Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_cs.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_FORCE_IDR_001Test(napi_env env, napi_callback_info info)
{
    if (!g_codecNameHEVC[0] || strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        return CreateIntInt32Result(env, 0);
    }
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableForceIDR = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_i.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value SET_FORCE_IDR_002Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableForceIDR = true;
        vEncSample->OUT_DIR = "/data/test/media/vbr_i.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value COLORSPACE_CONFIG_001Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARIES_100;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTICS_10000;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENTS_10000;
        vEncSample->OUT_DIR = "/data/test/media/vbr_i.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_002Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT709;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_BT709;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT709;
        vEncSample->OUT_DIR = "/data/test/media/bt_709_h264.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_003Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 1;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT709;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_BT709;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT709;
        vEncSample->OUT_DIR = "/data/test/media/bt_709_h265.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_004Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 0;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT2020;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_PQ;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_NCL;
        vEncSample->OUT_DIR = "/data/test/media/bt_2020_PQ_h265.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_005Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 0;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_BT2020;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_HLG;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_NCL;
        vEncSample->OUT_DIR = "/data/test/media/bt_2020_HLG_h265.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_006Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->DEFAULT_RANGE_FLAG = 0;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_COLOR_PRIMARIES = COLOR_PRIMARY_P3D65;
        vEncSample->DEFAULT_TRANSFER_CHARACTERISTICS = TRANSFER_CHARACTERISTIC_PQ;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_NCL;
        vEncSample->OUT_DIR = "/data/test/media/bt_2020_P3D65_h265.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_001Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_IDENTITY;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_002Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_UNSPECIFIED;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_003Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_FCC;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_004Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT601_625;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_005Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT601_525;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_006Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_SMPTE_ST240;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_007Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_YCGCO;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_008Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_BT2020_CL;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_009Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_SMPTE_ST2085;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_010Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_CHROMATICITY_NCL;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_011Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_CHROMATICITY_CL;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value COLORSPACE_CONFIG_ADD_012Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->enableColorSpaceParams = true;
        vEncSample->DEFAULT_MATRIX_COEFFICIENTS = MATRIX_COEFFICIENT_ICTCP;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value FRAMENUM_JUDGMENT_001Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecName, "OMX.hisi.video.encoder.avc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CQ);
        if (isSupported) {
            vEncSample->INP_DIR = INP_DIR_720;
            vEncSample->OUT_DIR = "/data/test/media/1280_720_nv.h264";
            vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
            vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
            vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
            vEncSample->DEFAULT_BITRATE_MODE = CQ;
            if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            vEncSample->WaitForEOS();
            if (vEncSample->outCount != EXPECTED_FRAME_COUNT_25) { return CreateIntInt32Result(env, -1); }
            if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            vEncSample->Release();
            return CreateIntInt32Result(env, 0);
        }
    }
    return CreateIntInt32Result(env, 0);
}

napi_value FRAMENUM_JUDGMENT_002Test(napi_env env, napi_callback_info info)
{
    if (!g_codecNameHEVC[0] || strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        return CreateIntInt32Result(env, 0);
    }
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->OUT_DIR = "/data/test/media/EN_1280_720_nv.h265";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CQ;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->outCount != EXPECTED_FRAME_COUNT_25) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

void InitSetparamTest()
{
    SetUpTestCase();
}

napi_value LOWPOWER_SETPARAM_001Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->OUT_DIR = "/data/test/media/lowpower_setparam_cbr_hevc.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_WITH_LOWPOWER_CAMERA, 1);
        if (vEncSample->SetParameter(format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value LOWPOWER_SETPARAM_002Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->OUT_DIR = "/data/test/media/lowpower_setparam_vbr_avc.h264";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_WITH_LOWPOWER_CAMERA, 0);
        if (vEncSample->SetParameter(format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value LOWPOWER_SETPARAM_003Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE_MODE = VBR;
        vEncSample->OUT_DIR = "/data/test/media/lowpower_setparam_vbr_hevc.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat *format = OH_AVFormat_Create();
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_WITH_LOWPOWER_CAMERA, -1);
        if (vEncSample->SetParameter(format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}
