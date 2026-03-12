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
OH_AVCodec* gVenc = nullptr;
OH_AVCapability* g_capEnc = nullptr;
const char* CODEC_NAME = "";
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t DEFAULT_KEY_FRAME_INTERVAL = 2000;
} // namespace

namespace OHOS {
namespace Media {
class HwEncApiNdkTest {
public:
    // SetUpTestCase: Called before all test cases
    static void SetUpTestCase(void);
    // TearDownTestCase: Called after all test case
    static void TearDownTestCase(void);
    // SetUp: Called before each test cases
    void SetUp(void);
    // TearDown: Called after each test cases
    void TearDown(void);
};

namespace PtsApiTest {
void SetUpTestCase()
{
    g_capEnc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    CODEC_NAME = OH_AVCapability_GetName(g_capEnc);
    cout << "CODEC_NAME: " << CODEC_NAME << endl;
}
void TearDown()
{
    if (gVenc != NULL) {
        OH_VideoEncoder_Destroy(gVenc);
        gVenc = nullptr;
    }
}
} // PtsApiTest

/**
 * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_001
 * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HW_ENCODE_PTS_FUNC_001()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_01_sqr_buffer.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir,
        outputDir, width, height,
        bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = input;
    vEncSample->OUT_DIR = output;
    vEncSample->defaultWidth = width;
    vEncSample->defaultHeight = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->defaultMaxBitrate = bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

/**
 * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_002
 * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HW_ENCODE_PTS_FUNC_002()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_04_sqr_buffer.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir,
        outputDir, width, height,
        bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = input;
    vEncSample->OUT_DIR = output;
    vEncSample->defaultWidth = width;
    vEncSample->defaultHeight = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->defaultMaxBitrate = bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

/**
 * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_003
 * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HW_ENCODE_PTS_FUNC_003()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_07_sqr_buffer.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir, outputDir, width, height,
     bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = input;
    vEncSample->OUT_DIR = output;
    vEncSample->defaultWidth = width;
    vEncSample->defaultHeight = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->defaultMaxBitrate = bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

/**
 * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_004
 * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HW_ENCODE_PTS_FUNC_004()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_01_sqr_surface.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir,
        outputDir, width, height,
        bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = input;
    vEncSample->OUT_DIR = output;
    vEncSample->defaultWidth = width;
    vEncSample->defaultHeight = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->defaultMaxBitrate = bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

/**
 * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_005
 * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HW_ENCODE_PTS_FUNC_005()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_04_sqr_surface.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir,
        outputDir, width, height,
        bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = input;
    vEncSample->OUT_DIR = output;
    vEncSample->defaultWidth = width;
    vEncSample->defaultHeight = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->defaultMaxBitrate = bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}

/**
 * @tc.name   VIDEO_HW_ENCODE_PTS_FUNC_006
 * @tc.number VIDEO_HW_ENCODE_PTS_FUNC_006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VIDEO_HW_ENCODE_PTS_FUNC_006()
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capEnc, BITRATE_MODE_SQR);
    if (!isSupported) {
        return 0;
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    string timeStampFilePath = "/data/storage/el2/base/files/xtscase_07_sqr_surface.txt";
    string inputDir = "";
    string outputDir = "";
    uint32_t width = 0;
    uint32_t height = 0;
    uint32_t bitrateMode = 0;
    uint32_t bitRate = 0;
    bool surfaceMode = false;
    vEncSample->LoadTimeStampData(timeStampFilePath, inputDir,
        outputDir, width, height,
        bitrateMode, bitRate, surfaceMode);
    char *input = new char[1024];
    char *output = new char[1024];
    snprintf(input, 1024, "%s", inputDir.c_str());
    snprintf(output, 1024, "%s", outputDir.c_str());
    vEncSample->maxbiteEnable = true;
    vEncSample->inpDir = input;
    vEncSample->OUT_DIR = output;
    vEncSample->defaultWidth = width;
    vEncSample->defaultHeight = height;
    vEncSample->DEFAULT_BITRATE_MODE = bitrateMode;
    vEncSample->defaultMaxBitrate = bitRate;
    vEncSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vEncSample->surfInput = surfaceMode;
    vEncSample->defaultKeyFrameInterval = DEFAULT_KEY_FRAME_INTERVAL;
    vEncSample->enablePTSBasedRateControl = true;
    EXPECT_EQ(AV_ERR_OK, vEncSample->CreateVideoEncoder(CODEC_NAME));
    EXPECT_EQ(AV_ERR_OK, vEncSample->SetVideoEncoderCallback());
    EXPECT_EQ(AV_ERR_OK, vEncSample->ConfigureVideoEncoder());
    EXPECT_EQ(AV_ERR_OK, vEncSample->StartVideoEncoder());
    vEncSample->WaitForEOS();
    EXPECT_EQ(AV_ERR_OK, vEncSample->errCount);
    return 0;
}
} // namespace Media
} // namespace OHOS