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
#include <iostream>
#include <cstdio>
#include <string>
#include <vector>
#include <cstdint>

#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avcapability.h>
#include "include/VideoencApi11Sample.h"
#include "include/CommonToolTest.h"
#include "include/PtsApiTest.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
OH_AVCodec* g_venc = nullptr;
OH_AVCapability* g_capEnc = nullptr;
const char* CODEC_NAME = "";
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t DEFAULT_KEY_FRAME_INTERVAL = 2000;
constexpr uint32_t OHPRINTF_VALUE = 1024;
const char *INP_DIR_1080 = "/data/storage/el2/base/files/1080_1920_nv12.yuv";
const char *OUTPUT = "/data/storage/el2/base/files/1080_1920.h265";

constexpr uint32_t PTS_WIDTH = 1080;
constexpr uint32_t PTS_HEIGHT = 1920;
constexpr uint32_t PTS_BITRATE = 2200000;
constexpr uint32_t SQR = 3;

const std::vector<int64_t> PTS_TIMESTAMPS_EQUAL_BUFFER = {
    100000000, 100040000, 100080000, 100120000, 100160000, 100200000, 100240000,
    100280000, 100320000, 100360000, 100400000, 100440000, 100480000, 100520000
};
const std::vector<int64_t> PTS_TIMESTAMPS_VARIABLE_BUFFER = {
    100000000, 100080000, 100160000, 100240000, 100260000, 100280000, 100300000,
    100380000, 100460000, 100540000, 100560000, 100580000, 100600000, 100680000
};
const std::vector<int64_t> PTS_TIMESTAMPS_EQUAL_SURFACE = {
    100000000000, 100040000000, 100080000000, 100120000000, 100160000000, 100200000000, 100240000000,
    100280000000, 100320000000, 100360000000, 100400000000, 100440000000, 100480000000, 100520000000
};
const std::vector<int64_t> PTS_TIMESTAMPS_VARIABLE_SURFACE = {
    100000000000, 100080000000, 100160000000, 100240000000, 100260000000, 100280000000, 100300000000,
    100320000000, 100340000000, 100420000000, 100500000000, 100580000000, 100600000000, 100620000000
};
} // namespace

namespace OHOS {
namespace Media {
class HwEncApiNdkTest {
public:
    static void SetUpTestCase(void);
    static void TearDownTestCase(void);
    void SetUp(void);
    void TearDown(void);
};

namespace PtsApiTest {
void SetUpTestCase()
{
    g_capEnc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (g_capEnc != nullptr) {
        CODEC_NAME = OH_AVCapability_GetName(g_capEnc);
        cout << "CODEC_NAME: " << CODEC_NAME << endl;
    }
}
void TearDown()
{
    if (g_venc != NULL) {
        OH_VideoEncoder_Destroy(g_venc);
        g_venc = nullptr;
    }
}
} // PtsApiTest

napi_value VIDEO_HW_ENCODE_PTS_FUNC_001(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    VEncAPI11Sample::EncoderConfig config;
    config.width = PTS_WIDTH;
    config.height = PTS_HEIGHT;
    config.bitRate = PTS_BITRATE;
    config.bitrateMode = SQR;
    config.surfaceMode = false;
    vEncSample->timeList = PTS_TIMESTAMPS_EQUAL_BUFFER;
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = INP_DIR_1080;
    vEncSample->outDir = OUTPUT;
    vEncSample->defaultWidth = config.width;
    vEncSample->defaultHeight = config.height;
    vEncSample->defaultBitrateMode = config.bitrateMode;
    vEncSample->defaultMaxBitrate = config.bitRate;
    vEncSample->surfInput = config.surfaceMode;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    if (vEncSample->CreateVideoEncoder(CODEC_NAME) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_PTS_FUNC_002(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    VEncAPI11Sample::EncoderConfig config;
    config.width = PTS_WIDTH;
    config.height = PTS_HEIGHT;
    config.bitRate = PTS_BITRATE;
    config.bitrateMode = SQR;
    config.surfaceMode = false;
    vEncSample->timeList = PTS_TIMESTAMPS_EQUAL_BUFFER;
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = INP_DIR_1080;
    vEncSample->outDir = OUTPUT;
    vEncSample->defaultWidth = config.width;
    vEncSample->defaultHeight = config.height;
    vEncSample->defaultBitrateMode = config.bitrateMode;
    vEncSample->defaultMaxBitrate = config.bitRate;
    vEncSample->surfInput = config.surfaceMode;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    if (vEncSample->CreateVideoEncoder(CODEC_NAME) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_PTS_FUNC_003(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    VEncAPI11Sample::EncoderConfig config;
    config.width = PTS_WIDTH;
    config.height = PTS_HEIGHT;
    config.bitRate = PTS_BITRATE;
    config.bitrateMode = SQR;
    config.surfaceMode = false;
    vEncSample->timeList = PTS_TIMESTAMPS_VARIABLE_BUFFER;
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = INP_DIR_1080;
    vEncSample->outDir = OUTPUT;
    vEncSample->defaultWidth = config.width;
    vEncSample->defaultHeight = config.height;
    vEncSample->defaultBitrateMode = config.bitrateMode;
    vEncSample->defaultMaxBitrate = config.bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = config.surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    if (vEncSample->CreateVideoEncoder(CODEC_NAME) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_PTS_FUNC_004(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    VEncAPI11Sample::EncoderConfig config;
    config.width = PTS_WIDTH;
    config.height = PTS_HEIGHT;
    config.bitRate = PTS_BITRATE;
    config.bitrateMode = SQR;
    config.surfaceMode = true;
    vEncSample->timeList = PTS_TIMESTAMPS_EQUAL_SURFACE;
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = INP_DIR_1080;
    vEncSample->outDir = OUTPUT;
    vEncSample->defaultWidth = config.width;
    vEncSample->defaultHeight = config.height;
    vEncSample->defaultBitrateMode = config.bitrateMode;
    vEncSample->defaultMaxBitrate = config.bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = config.surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    if (vEncSample->CreateVideoEncoder(CODEC_NAME) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_PTS_FUNC_005(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    VEncAPI11Sample::EncoderConfig config;
    config.width = PTS_WIDTH;
    config.height = PTS_HEIGHT;
    config.bitRate = PTS_BITRATE;
    config.bitrateMode = SQR;
    config.surfaceMode = true;
    vEncSample->timeList = PTS_TIMESTAMPS_EQUAL_SURFACE;
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = INP_DIR_1080;
    vEncSample->outDir = OUTPUT;
    vEncSample->defaultWidth = config.width;
    vEncSample->defaultHeight = config.height;
    vEncSample->defaultBitrateMode = config.bitrateMode;
    vEncSample->defaultMaxBitrate = config.bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = config.surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    if (vEncSample->CreateVideoEncoder(CODEC_NAME) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_PTS_FUNC_006(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    VEncAPI11Sample::EncoderConfig config;
    config.width = PTS_WIDTH;
    config.height = PTS_HEIGHT;
    config.bitRate = PTS_BITRATE;
    config.bitrateMode = SQR;
    config.surfaceMode = true;
    vEncSample->timeList = PTS_TIMESTAMPS_VARIABLE_SURFACE;
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = INP_DIR_1080;
    vEncSample->outDir = OUTPUT;
    vEncSample->defaultWidth = config.width;
    vEncSample->defaultHeight = config.height;
    vEncSample->defaultBitrateMode = config.bitrateMode;
    vEncSample->defaultMaxBitrate = config.bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = config.surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    if (vEncSample->CreateVideoEncoder(CODEC_NAME) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}
} // namespace Media
} // namespace OHOS
