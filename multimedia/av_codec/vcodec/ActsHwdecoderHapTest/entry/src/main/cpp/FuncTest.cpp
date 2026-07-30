/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <string>
#include "VideoDecNdkSample.h"
#include "include/CommonTool.h"
#include "hilog/log.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "dwl"

#define MAX_THREAD 16

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
const char* INP_DIR_720_30 = "/data/storage/el2/base/files/1280_720_30_10Mb.h264";
const char* INP_DIR_1080_30 = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";

static OH_AVCapability* cap = nullptr;
static OH_AVCapability* cap_hevc = nullptr;
static OH_AVRange heightRange;
static OH_AVRange widthRange;
static OH_AVErrCode ret = AV_ERR_OK;
static string g_codecName = "";
static string g_codecNameHEVC = "";
constexpr int32_t DEFAULT_WIDTH = 1920;
constexpr int32_t DEFAULT_HEIGHT = 1080;
constexpr int32_t DEFAULT_FRAME_RATE = 30;
constexpr int32_t DEFAULT_REPEAT_START_STOP_BEFORE_EOS = 5;
constexpr int32_t UHD_RESOLUTION[2] = { 3840, 2160 };
constexpr int32_t HD_RESOLUTION[2] = { 1104, 622 };
} // namespace

static void TestSetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    g_codecName = OH_AVCapability_GetName(cap);
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    g_codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
    cout << "g_codecNameHEVC: " << g_codecNameHEVC << endl;
    ret = OH_AVCapability_GetVideoHeightRange(cap, &heightRange);
    cout << "minval=" << heightRange.minVal << "  maxval=" << heightRange.maxVal << endl;
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, heightRange.maxVal, &widthRange);
    cout << "minval=" << widthRange.minVal << "  maxval=" << widthRange.maxVal << endl;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0200
 * @tc.number VIDEO_HWDEC_FUNCTION_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecFunction0200Test()
{
    OH_AVCodec* vdec_ = OH_VideoDecoder_CreateByName("OMX.h264.decode.111.222.333");
    if (nullptr != vdec_) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0300
 * @tc.number VIDEO_HWDEC_FUNCTION_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VideoHwdecFunction0300Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    if (AV_ERR_OK != vDecSample->RunVideoDec(g_codecName)) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0400
 * @tc.number VIDEO_HWDEC_FUNCTION_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VideoHwdecFunction0400Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->sfOutput = true;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    if (AV_ERR_OK != vDecSample->RunVideoDecSurface(g_codecName)) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0700
 * @tc.number VIDEO_HWDEC_FUNCTION_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecFunction0700Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0800
 * @tc.number VIDEO_HWDEC_FUNCTION_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecFunction0800Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    vDecSample->beforeEosInput = true;
    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_0900
 * @tc.number VIDEO_HWDEC_FUNCTION_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecFunction0900Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    vDecSample->beforeEosInputInput = true;
    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1000
 * @tc.number VIDEO_HWDEC_FUNCTION_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecFunction1000Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    vDecSample->afterEosDestroyCodec = false;
    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    if (AV_ERR_OK != vDecSample->Reset()) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1100
 * @tc.number VIDEO_HWDEC_FUNCTION_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecFunction1100Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    vDecSample->afterEosDestroyCodec = false;
    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1200
 * @tc.number VIDEO_HWDEC_FUNCTION_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecFunction1200Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    vDecSample->repeatStartStopBeforeEos = DEFAULT_REPEAT_START_STOP_BEFORE_EOS;
    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1300
 * @tc.number VIDEO_HWDEC_FUNCTION_1300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecFunction1300Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    vDecSample->repeatStartFlushBeforeEos = DEFAULT_REPEAT_START_STOP_BEFORE_EOS;
    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1400
 * @tc.number VIDEO_HWDEC_FUNCTION_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecFunction1400Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_720_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1600
 * @tc.number VIDEO_HWDEC_FUNCTION_1600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecFunction1600Test()
{
    if (cap_hevc) {
        shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
        vDecSample->inpDir = "/data/storage/el2/base/files/1920_1080_20M_30.h265";
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecNameHEVC)) { return -1; }
        if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
        if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
        if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
        vDecSample->WaitForEOS();
        if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FUNCTION_1700
 * @tc.number VIDEO_HWDEC_FUNCTION_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecFunction1700Test()
{
    if (g_codecName.find("hisi") != string::npos) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->inpDir = "/data/storage/el2/base/files/resolutionChange.h264";
        vDecSample->defaultWidth = HD_RESOLUTION[0];
        vDecSample->defaultHeight = HD_RESOLUTION[1];
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->sfOutput = false;
        if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
        if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
        if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
        if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
        vDecSample->WaitForEOS();
        if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    } else {
        cout << "hardware encoder is rk,skip." << endl;
    }
    return 0;
}
/**
 * @tc.name   SURF_CHANGE_FUNC_001
 * @tc.number SURF_CHANGE_FUNC_001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SurfChangeFunc001Test()
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = true;
    vDecSample->autoSwitchSurface = true;
    vDecSample->afterEosDestroyCodec = false;
    vDecSample->sleepOnFPS = true;
    if (AV_ERR_OK != vDecSample->RunVideoDecSurface(g_codecName)) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    if (AV_ERR_OK != vDecSample->Reset()) { return -1; }
    if (AV_ERR_INVALID_STATE != vDecSample->SwitchSurface()) { return -1; }
    if (AV_ERR_OK != vDecSample->Release()) { return -1; }
    return 0;
}
/**
 * @tc.name   SURF_CHANGE_FUNC_002
 * @tc.number SURF_CHANGE_FUNC_002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SurfChangeFunc002Test()
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = true;
    vDecSample->autoSwitchSurface = true;
    vDecSample->sleepOnFPS = true;
    if (AV_ERR_OK != vDecSample->RunVideoDecSurface(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->Flush()) { return -1; }
    if (AV_ERR_OK != vDecSample->SwitchSurface()) { return -1; }
    if (AV_ERR_OK != vDecSample->Stop()) { return -1; }
    return 0;
}
/**
 * @tc.name   SURF_CHANGE_FUNC_003
 * @tc.number SURF_CHANGE_FUNC_003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SurfChangeFunc003Test()
{
    shared_ptr<VDecNdkSample> vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = false;
    vDecSample->CreateSurface();
    if (AV_ERR_OK != vDecSample->RunVideoDec(g_codecName)) { return -1; }
    if (AV_ERR_OPERATE_NOT_PERMIT != vDecSample->SwitchSurface()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}
/**
 * @tc.name   SURF_CHANGE_FUNC_004
 * @tc.number SURF_CHANGE_FUNC_004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int SurfChangeFunc004Test()
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->sfOutput = true;
    vDecSample->autoSwitchSurface = true;
    vDecSample->sleepOnFPS = true;
    if (AV_ERR_OK != vDecSample->RunVideoDecSurface(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->RepeatCallSetSurface()) { return -1; }
    vDecSample->WaitForEOS();
    return 0;
}

/**
 * @tc.name   OUTPUT_DECS_FUNC_001
 * @tc.number OUTPUT_DECS_FUNC_001
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OutputDecsFunc001Test()
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = "/data/storage/el2/base/files/1920x1080.h264";
    vDecSample->defaultWidth = DEFAULT_WIDTH;
    vDecSample->defaultHeight = DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->needCheckOutputDesc = true;
    vDecSample->expectCropTop = 0;
    vDecSample->expectCropBottom = DEFAULT_HEIGHT - 1;
    vDecSample->expectCropLeft = 0;
    vDecSample->expectCropRight = DEFAULT_WIDTH - 1;

    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    OH_LOG_ERROR(LOG_APP, "dwl CreateVideoDecoder sucess");
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    OH_LOG_ERROR(LOG_APP, "dwl ConfigureVideoDecoder sucess");
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    OH_LOG_ERROR(LOG_APP, "dwl SetVideoDecoderCallback sucess");
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    OH_LOG_ERROR(LOG_APP, "dwl StartVideoDecoder sucess");
    vDecSample->WaitForEOS();
    OH_LOG_ERROR(LOG_APP, "dwl WaitForEOS sucess");
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    OH_LOG_ERROR(LOG_APP, "dwl errCount sucess");
    return 0;
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_002
 * @tc.number OUTPUT_DECS_FUNC_002
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OutputDecsFunc002Test()
{
    if (cap_hevc) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->inpDir = "/data/storage/el2/base/files/1920x1080.h265";
        vDecSample->defaultWidth = DEFAULT_WIDTH;
        vDecSample->defaultHeight = DEFAULT_HEIGHT;
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->needCheckOutputDesc = true;
        vDecSample->expectCropTop = 0;
        vDecSample->expectCropBottom = DEFAULT_HEIGHT - 1;
        vDecSample->expectCropLeft = 0;
        vDecSample->expectCropRight = DEFAULT_WIDTH - 1;

        if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecNameHEVC)) { return -1; }
        if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
        if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
        if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
        vDecSample->WaitForEOS();
        if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    }
    return 0;
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_003
 * @tc.number OUTPUT_DECS_FUNC_003
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OutputDecsFunc003Test()
{
    if (cap) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->inpDir = "/data/storage/el2/base/files/3840x2160.h264";
        if ((widthRange.maxVal >= UHD_RESOLUTION[0]) && (heightRange.maxVal >= UHD_RESOLUTION[1])) {
            vDecSample->defaultWidth = UHD_RESOLUTION[0];
            vDecSample->defaultHeight = UHD_RESOLUTION[1];
            vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
            vDecSample->needCheckOutputDesc = true;
            vDecSample->expectCropTop = 0;
            vDecSample->expectCropBottom = UHD_RESOLUTION[1] - 1;
            vDecSample->expectCropLeft = 0;
            vDecSample->expectCropRight = UHD_RESOLUTION[0] - 1;
            if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
            if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
            if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
            if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
            vDecSample->WaitForEOS();
            if (AV_ERR_OK != vDecSample->errCount) { return -1; }
        }
    }
    return 0;
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_004
 * @tc.number OUTPUT_DECS_FUNC_004
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OutputDecsFunc004Test()
{
    if (cap_hevc) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->inpDir = "/data/storage/el2/base/files/3840x2160.h265";
        vDecSample->defaultWidth = UHD_RESOLUTION[0];
        vDecSample->defaultHeight = UHD_RESOLUTION[1];
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->needCheckOutputDesc = true;
        vDecSample->expectCropTop = 0;
        vDecSample->expectCropBottom = UHD_RESOLUTION[1] - 1;
        vDecSample->expectCropLeft = 0;
        vDecSample->expectCropRight = UHD_RESOLUTION[0] - 1;

        if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecNameHEVC)) { return -1; }
        if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
        if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
        if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
        vDecSample->WaitForEOS();
        if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    }
    return 0;
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_005
 * @tc.number OUTPUT_DECS_FUNC_005
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OutputDecsFunc005Test()
{
    auto vDecSample = make_shared<VDecNdkSample>();
    vDecSample->inpDir = "/data/storage/el2/base/files/1104x622.h265";
    vDecSample->defaultWidth = HD_RESOLUTION[0];
    vDecSample->defaultHeight = HD_RESOLUTION[1];
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->needCheckOutputDesc = true;
    vDecSample->expectCropTop = 0;
    vDecSample->expectCropBottom = HD_RESOLUTION[1] - 1;
    vDecSample->expectCropLeft = 0;
    vDecSample->expectCropRight = HD_RESOLUTION[0] - 1;

    if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
    if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
    if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
    if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
    vDecSample->WaitForEOS();
    if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    return 0;
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_006
 * @tc.number OUTPUT_DECS_FUNC_006
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OutputDecsFunc006Test()
{
    if (cap_hevc) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->inpDir = "/data/storage/el2/base/files/1104x622.h265";
        vDecSample->defaultWidth = HD_RESOLUTION[0];
        vDecSample->defaultHeight = HD_RESOLUTION[1];
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->needCheckOutputDesc = true;
        vDecSample->expectCropTop = 0;
        vDecSample->expectCropBottom = HD_RESOLUTION[1] - 1;
        vDecSample->expectCropLeft = 0;
        vDecSample->expectCropRight = HD_RESOLUTION[0] - 1;

        if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecNameHEVC)) { return -1; }
        if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
        if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
        if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
        vDecSample->WaitForEOS();
        if (AV_ERR_OK != vDecSample->errCount) { return -1; }
    }
    return 0;
}
/**
 * @tc.name   OUTPUT_DECS_FUNC_007
 * @tc.number OUTPUT_DECS_FUNC_007
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int OutputDecsFunc007Test()
{
    if ((g_codecName.find("hisi") != string::npos) && (cap)) {
        auto vDecSample = make_shared<VDecNdkSample>();
        vDecSample->inpDir = "/data/storage/el2/base/files/resolutionChange.h264";
        vDecSample->defaultWidth = HD_RESOLUTION[0];
        vDecSample->defaultHeight = HD_RESOLUTION[1];
        vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
        vDecSample->isResChangeStream = true;
        vDecSample->expectCropTop = 0;
        vDecSample->expectCropBottom = HD_RESOLUTION[1] - 1;
        vDecSample->expectCropLeft = 0;
        vDecSample->expectCropRight = HD_RESOLUTION[0] - 1;

        if (AV_ERR_OK != vDecSample->CreateVideoDecoder(g_codecName)) { return -1; }
        if (AV_ERR_OK != vDecSample->ConfigureVideoDecoder()) { return -1; }
        if (AV_ERR_OK != vDecSample->SetVideoDecoderCallback()) { return -1; }
        if (AV_ERR_OK != vDecSample->StartVideoDecoder()) { return -1; }
        vDecSample->WaitForEOS();
    } else {
        cout << "hardware encoder is rk,skip." << endl;
    }
    return 0;
}

void InitFuncTest()
{
    TestSetUpTestCase();
}