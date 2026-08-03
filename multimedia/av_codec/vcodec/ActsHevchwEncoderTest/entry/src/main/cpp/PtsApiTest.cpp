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
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_01_sqr_buffer.txt";
    VEncAPI11Sample::EncoderConfig config;
    vEncSample->LoadTimeStampData(timeStampFilePath, config);
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = INP_DIR_1080;
    vEncSample->outDir = OUTPUT;
    vEncSample->defaultWidth = config.width;
    vEncSample->defaultHeight = config.height;
    vEncSample->defaultBitrateMode = config.bitrateMode;
    vEncSample->defaultMaxBitrate = config.bitRate;
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
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_04_sqr_buffer.txt";
    VEncAPI11Sample::EncoderConfig config;
    vEncSample->LoadTimeStampData(timeStampFilePath, config);
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
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_07_sqr_buffer.txt";
    VEncAPI11Sample::EncoderConfig config;
    vEncSample->LoadTimeStampData(timeStampFilePath, config);
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
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_01_sqr_surface.txt";
    VEncAPI11Sample::EncoderConfig config;
    vEncSample->LoadTimeStampData(timeStampFilePath, config);
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
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_04_sqr_surface.txt";
    VEncAPI11Sample::EncoderConfig config;
    vEncSample->LoadTimeStampData(timeStampFilePath, config);
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
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_07_sqr_surface.txt";
    VEncAPI11Sample::EncoderConfig config;
    vEncSample->LoadTimeStampData(timeStampFilePath, config);
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
