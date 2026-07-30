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
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include "videoenc_api11_sample.h"
#include "avcodec_codec_name.h"
#include "include/OhosCommonTest.h"
#include "hilog/log.h"
#include <napi/native_api.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "VcodecEncoderTest12"

namespace {
OH_AVCodec *venc_ = NULL;
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
OH_AVFormat *format = nullptr;
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t LTR_COUNT_2 = 2;
constexpr uint32_t LTR_COUNT_5 = 5;
constexpr uint32_t LTR_COUNT_10 = 10;
constexpr uint32_t LTR_COUNT_INVALID_11 = 11;
constexpr uint32_t LTR_INTERVAL_5 = 5;
constexpr uint32_t TEMPORAL_GOP_SIZE_2 = 2;
constexpr uint32_t TEMPORAL_GOP_SIZE_3 = 3;
constexpr uint32_t TEMPORAL_GOP_SIZE_4 = 4;
constexpr uint32_t TEMPORAL_GOP_SIZE_5 = 5;
constexpr uint32_t TEMPORAL_GOP_SIZE_6 = 6;
constexpr uint32_t TEMPORAL_GOP_SIZE_8 = 8;
constexpr uint32_t TEMPORAL_GOP_SIZE_9 = 9;
constexpr uint32_t TEMPORAL_GOP_SIZE_30 = 30;
constexpr uint32_t TEMPORAL_GOP_MODE_3 = 3;
const char *INP_DIR_720 = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
const char *g_inpDir720Array[16] = {
    "/data/storage/el2/base/files/media/1280_720_nv.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_1.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_2.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_3.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_7.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_10.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_13.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_4.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_8.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_11.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_14.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_5.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_9.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_12.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_15.yuv",
    "/data/storage/el2/base/files/media/1280_720_nv_6.yuv"
};
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr) {
        const char *tmpCodecName = OH_AVCapability_GetName(cap);
        if (tmpCodecName != nullptr &&
                SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != EOK) {
            cout << "memcpy failed" << endl;
        }
        cout << "codecname: " << g_codecName << endl;
    }
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap_hevc != nullptr) {
        const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
        if (tmpCodecNameHevc != nullptr &&
                SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc,
                strlen(tmpCodecNameHevc)) != EOK) {
            cout << "memcpy failed" << endl;
        }
        cout << "codecname_hevc: " << g_codecNameHEVC << endl;
    }
}
static void TearDownTestCase() {}
static void SetUp()
{
    OHOS::Media::ResetLtrStaticState();
}

static void TearDown()
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

napi_value VideoTemporalEncodeApi0020Test(napi_env env, napi_callback_info info)
{
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeApi0030Test(napi_env env, napi_callback_info info)
{
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0010Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    format = OH_AVCapability_GetFeatureProperties(cap, VIDEO_ENCODER_TEMPORAL_SCALABILITY);
    if (cap && format) {
        OH_AVFormat_Destroy(format);
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (!access("/system/lib64/media/", 0)) {
            auto vEncSample = make_unique<VEncAPI11Sample>();
            cout << "running on phone=========="<< endl;
            if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            vEncSample->TEMPORAL_ENABLE = true;
            if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) != AV_ERR_OK) {
                return CreateIntInt32Result(env, -1);
            }
            vEncSample->Release();
        } else {
            auto vEncSample = make_unique<VEncAPI11Sample>();
            cout << "running on rk=========="<< endl;
            if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            vEncSample->TEMPORAL_ENABLE = true;
            if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) != AV_ERR_OK) {
                return CreateIntInt32Result(env, -1);
            }
            vEncSample->Release();
        }

        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0020Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0020.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->TEMPORAL_ENABLE = false;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0030Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0030.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = false;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0040Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0040.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_DEFAULT = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 0;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0440Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0440.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_DEFAULT = true;
        int32_t temporalGopSize = 0;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0050Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0050.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0060Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0060.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;

        int32_t temporalGopSize = vEncSample->DEFAULT_FRAME_RATE-1;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0070Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0070.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0080Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0080.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = vEncSample->DEFAULT_FRAME_RATE-1;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0090Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0090.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0100Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0100.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0110Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0110.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_5;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0120Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0120.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_5;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0130Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0130.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_6;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0140Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0140.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_8;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0150Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0150.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_9;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0160Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0160.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = 12;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0170Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0170.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        vEncSample->enableForceIDR = true;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoTemporalEncodeFunction0180Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_TEMPORAL_ENCODE_FUNCTION_0180.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_CONFIG = true;
        vEncSample->TEMPORAL_JUMP_MODE = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_4;
        vEncSample->enableForceIDR = true;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value LTR_FUNC_001Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_001.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 0;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->Reset() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->ltrParam.ltrCount = LTR_COUNT_INVALID_11;
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value LTR_FUNC_002Test(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capa = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char* codecName = OH_AVCapability_GetName(capa);
    if (!strcmp(codecName, "OMX.hisi.video.encoder.hevc")) {
        if (OH_AVCapability_IsFeatureSupported(capa, VIDEO_ENCODER_LONG_TERM_REFERENCE) != true) {
            return CreateIntInt32Result(env, -1);
        }
    } else {
        if (OH_AVCapability_IsFeatureSupported(capa, VIDEO_ENCODER_LONG_TERM_REFERENCE) != false) {
            return CreateIntInt32Result(env, -1);
        }
    }
    return CreateIntInt32Result(env, 0);
}

napi_value LTR_FUNC_004Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_004.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = 1;
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

napi_value LTR_FUNC_005Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_005.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.useBadLtr = true;
        vEncSample->ltrParam.ltrCount = 1;
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

napi_value LTR_FUNC_006Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_006.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_10;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncSample->ltrParam.useLtrIndex = 1;
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

napi_value LTR_FUNC_007Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_007.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = false;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_10;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
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

napi_value LTR_FUNC_008Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_008.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_2;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncSample->ltrParam.useLtrIndex = 0;
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

napi_value LTR_FUNC_009Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_009.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->ltrParam.ltrCount = -1;
        vEncSample->SURF_INPUT = true;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->enableLTR = true;
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

napi_value LTR_FUNC_010Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_010.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableLTR = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_DEFAULT = true;
        int32_t temporalGopSize = 0;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value LTR_FUNC_011Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncApi11Sample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncApi11Sample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_011.h264";
        vEncApi11Sample->enableLTR = true;
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncApi11Sample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncApi11Sample->ltrParam.useLtrIndex = 1;
        if (vEncApi11Sample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncApi11Sample->WaitForEOS();
        if (vEncApi11Sample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncApi11Sample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value LTR_FUNC_012Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_012.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->ltrParam.useLtrIndex = 1;
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

napi_value LTR_FUNC_013Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncApi11Sample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncApi11Sample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_013.h265";
        vEncApi11Sample->enableLTR = true;
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncApi11Sample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncApi11Sample->ltrParam.useLtrIndex = 1;
        if (vEncApi11Sample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncApi11Sample->WaitForEOS();
        if (vEncApi11Sample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncApi11Sample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value LTR_FUNC_014Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/LTR_FUNC_014.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableLTR = true;
        vEncSample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncSample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        vEncSample->ltrParam.enableUseLtr = true;
        vEncSample->ltrParam.useLtrIndex = 1;
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

napi_value LTR_FUNC_015Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncApi11Sample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncApi11Sample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_015.h264";
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.markAndUseSelf = true;
        vEncApi11Sample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncApi11Sample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        if (vEncApi11Sample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncApi11Sample->WaitForEOS();
        if (vEncApi11Sample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncApi11Sample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value LTR_FUNC_016Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncApi11Sample = make_unique<VEncAPI11Sample>();
        vEncApi11Sample->INP_DIR = INP_DIR_720;
        vEncApi11Sample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncApi11Sample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncApi11Sample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncApi11Sample->DEFAULT_BITRATE_MODE = CBR;
        vEncApi11Sample->SURF_INPUT = false;
        vEncApi11Sample->DEFAULT_KEY_FRAME_INTERVAL = -1;
        vEncApi11Sample->OUT_DIR = "/data/test/media/LTR_FUNC_016.h265";
        vEncApi11Sample->ltrParam.enableUseLtr = true;
        vEncApi11Sample->ltrParam.markAndUseSelf = true;
        vEncApi11Sample->ltrParam.ltrCount = LTR_COUNT_5;
        vEncApi11Sample->ltrParam.ltrInterval = LTR_INTERVAL_5;
        if (vEncApi11Sample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncApi11Sample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncApi11Sample->WaitForEOS();
        if (vEncApi11Sample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncApi11Sample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction0100Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0100.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction0200Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0200.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction0300Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0300.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction0400Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0400.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_4;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction0500Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0500.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = false;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_5;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction0600Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0600.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction0700Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0700.h264";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_3;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction0800Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0800.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_2;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction0900Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_0900.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_4;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) !=
        AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoUniformlyEncodeFunction1000Test(napi_env env, napi_callback_info info)
{
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->OUT_DIR = "/data/test/media/VIDEO_UNIFORMLY_ENCODE_FUNCTION_1000.h265";
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        vEncSample->TEMPORAL_ENABLE = true;
        vEncSample->TEMPORAL_UNIFORMLY = true;
        int32_t temporalGopSize = TEMPORAL_GOP_SIZE_5;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder_Temporal(temporalGopSize) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}
void InitTemporalTest()
{
    SetUpTestCase();
}
