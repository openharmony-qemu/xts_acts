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

#include <atomic>
#include <cstdio>
#include <fstream>
#include <iostream>
#include <mutex>
#include <queue>
#include <string>
#include <thread>

#include "VideoDecApi11Sample.h"
#include "VideoDecNdkSample.h"

#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include "include/CommonTool.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
OH_AVCodec* vdec_ = NULL;
OH_AVCapability* cap = nullptr;
OH_AVCapability* cap_hevc = nullptr;
VDecSignal* signal_;
const string INVALID_CODEC_NAME = "avdec_h264";
string g_codecName;
string g_codecNameHEVC;
OH_AVFormat* format;
constexpr uint32_t DEFAULT_WIDTH = 1920;
constexpr uint32_t DEFAULT_HEIGHT = 1080;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t HD_WIDTH = 1280;
constexpr uint32_t HD_HEIGHT = 720;
constexpr uint32_t MAX_SUPPORTED_INSTANCES_EXPECTED = 6;
constexpr int32_t LOOP_COUNT_TWO = 2;
} // namespace

// SetUpTestCase: Called before all test cases
static void TestSetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    g_codecName = OH_AVCapability_GetName(cap);
    cout << "g_codecName: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    g_codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
    cout << "g_codecNameHEVC: " << g_codecNameHEVC << endl;
}
// SetUp: Called before each test cases
static bool TestSetUp()
{
    signal_ = new VDecSignal();
    return signal_ != nullptr;
}
// TearDown: Called after each test cases
static void TestTearDownApi()
{
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
    if (signal_) {
        delete signal_;
        signal_ = nullptr;
    }
    if (vdec_ != NULL) {
        OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }
}
struct ApiTestGuard {
    bool ok = false;
    ApiTestGuard() { ok = TestSetUp(); }
    ~ApiTestGuard() { TestTearDownApi(); }
};

void VDecNeedInputData(OH_AVCodec* codec, uint32_t index, OH_AVMemory* data, void* userData)
{
    cout << "VDecNeedInputData  index:" << index << endl;
    VDecSignal* signal = static_cast<VDecSignal*>(userData);
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inCond_.notify_all();
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara0100Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByMime(NULL);
    if (vdec_ != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara0200Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(NULL);
    if (vdec_ != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3300
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara3300Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    if (OH_VideoDecoder_SetCallback(NULL, cb_, static_cast<void*>(signal_)) != AV_ERR_INVALID_VAL) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1800
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara1800Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }

    OH_AVCodecAsyncCallback cb2_;
    cb2_.onError = NULL;
    cb2_.onStreamChanged = NULL;
    cb2_.onNeedInputData = NULL;
    cb2_.onNeedOutputData = NULL;
    if (OH_VideoDecoder_SetCallback(vdec_, cb2_, static_cast<void*>(signal_)) != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0300
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara0300Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    if (OH_VideoDecoder_SetCallback(vdec_, cb_, NULL) != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0400
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara0400Test()
{
    if (OH_VideoDecoder_Destroy(NULL) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0500
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara0500Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }
    if (OH_VideoDecoder_Configure(vdec_, NULL) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara1400Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }
    if (OH_VideoDecoder_Configure(NULL, format) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5000
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara5000Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }
    string widthStr = "width";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    if (OH_VideoDecoder_Configure(NULL, format) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara5100Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    if (OH_VideoDecoder_Configure(NULL, format) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0600
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara0600Test()
{
    if (OH_VideoDecoder_Start(NULL) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0700
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara0700Test()
{
    if (OH_VideoDecoder_Stop(NULL) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0800
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara0800Test()
{
    if (OH_VideoDecoder_Flush(NULL) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0900
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara0900Test()
{
    if (OH_VideoDecoder_Reset(NULL) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1000
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara1000Test()
{
    if (OH_VideoDecoder_GetOutputDescription(NULL) != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara1100Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_SetParameter(vdec_, NULL) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_4100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_4100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara4100Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoDecoder_Prepare(nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1500
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara1500Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    if (OH_VideoDecoder_SetParameter(NULL, format) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara1200Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_SetSurface(vdec_, NULL) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1300
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara1300Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1600
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara1600Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(INVALID_CODEC_NAME.c_str());
    if (vdec_ != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara1700Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByMime(INVALID_CODEC_NAME.c_str());
    if (vdec_ != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara2200Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    bool isValid = false;
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoDecoder_IsValid(nullptr, &isValid);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }
    ret = OH_VideoDecoder_IsValid(vdec_, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2500
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara2500Test()
{
    if (OH_VideoDecoder_RenderOutputData(NULL, 0) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2600
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara2600Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_RenderOutputData(vdec_, 0) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2700
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara2700Test()
{
    if (OH_VideoDecoder_FreeOutputData(NULL, 0) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2800
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara2800Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_FreeOutputData(vdec_, 0) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2900
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara2900Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_FreeOutputData(vdec_, -1) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3000
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara3000Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());

    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    if (OH_VideoDecoder_PushInputData(vdec_, 0, attr) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara3100Test()
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    if (OH_VideoDecoder_PushInputData(NULL, -1, attr) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecIllegalPara3200Test()
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    if (OH_VideoDecoder_PushInputData(NULL, 0, attr) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0100
 * @tc.number VIDEO_HWDEC_API_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi0100Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }
    OH_AVCodec* vdec_2 = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_2 == nullptr) { return -1; }
    OH_VideoDecoder_Destroy(vdec_2);
    vdec_2 = nullptr;
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0200
 * @tc.number VIDEO_HWDEC_API_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi0200Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }

    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0300
 * @tc.number VIDEO_HWDEC_API_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi0300Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }

    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Start(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Start(vdec_) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0400
 * @tc.number VIDEO_HWDEC_API_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi0400Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }

    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Start(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Stop(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Stop(vdec_) != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0500
 * @tc.number VIDEO_HWDEC_API_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi0500Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }

    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Start(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Stop(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Reset(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Reset(vdec_) != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0600
 * @tc.number VIDEO_HWDEC_API_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi0600Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }
    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VDecNeedInputData;
    if (OH_VideoDecoder_SetCallback(vdec_, cb_, static_cast<void*>(signal_)) != AV_ERR_OK) {
        return -1;
    }
    if (OH_VideoDecoder_Start(vdec_) != AV_ERR_OK) { return -1; }
    for (int i = 0; i < LOOP_COUNT_TWO; i++) {
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, []() { return signal_->inIdxQueue_.size() > 0; });
        uint32_t index = signal_->inIdxQueue_.front();
        OH_AVCodecBufferAttr attr;
        attr.pts = 0;
        attr.size = 0;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        cout << "OH_VideoDecoder_PushInputData  index:" << index << endl;
        if (i == 0) {
            if (OH_VideoDecoder_PushInputData(vdec_, index, attr) != AV_ERR_OK) { return -1; }
        } else {
            if (OH_VideoDecoder_PushInputData(vdec_, 0, attr) != AV_ERR_INVALID_STATE) { return -1; }
        }
    }
    OH_VideoDecoder_Destroy(vdec_);
    vdec_ = nullptr;
    signal_->inIdxQueue_.pop();
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0700
 * @tc.number VIDEO_HWDEC_API_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi0700Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }

    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Start(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Flush(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Flush(vdec_) != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0800
 * @tc.number VIDEO_HWDEC_API_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi0800Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }

    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Start(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Stop(vdec_) != AV_ERR_OK) { return -1; }
    int32_t destroyRet = OH_VideoDecoder_Destroy(vdec_);
    vdec_ = nullptr;
    if (destroyRet != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Destroy(vdec_) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0900
 * @tc.number VIDEO_HWDEC_API_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi0900Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (vdec_ == nullptr) { return -1; }
    OH_AVCodec* vdec_2 = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (vdec_2 == nullptr) { return -1; }
    OH_VideoDecoder_Destroy(vdec_2);
    vdec_2 = nullptr;
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_1000
 * @tc.number VIDEO_HWDEC_API_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi1000Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    if (OH_VideoDecoder_SetCallback(vdec_, cb_, NULL) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_SetCallback(vdec_, cb_, NULL) != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_1100
 * @tc.number VIDEO_HWDEC_API_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi1100Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    format = OH_VideoDecoder_GetOutputDescription(vdec_);
    if (format == nullptr) { return -1; }
    OH_AVFormat_Destroy(format);
    format = nullptr;
    format = OH_VideoDecoder_GetOutputDescription(vdec_);
    if (format == nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_1200
 * @tc.number VIDEO_HWDEC_API_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApi1200Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }

    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    if (OH_VideoDecoder_SetParameter(vdec_, format) != AV_ERR_INVALID_STATE) { return -1; }
    if (OH_VideoDecoder_SetParameter(vdec_, format) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0100
 * @tc.number VIDEO_HWDEC_CAP_API_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi0100Test()
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false);
    if (cap == nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0200
 * @tc.number VIDEO_HWDEC_CAP_API_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi0200Test()
{
    cap = OH_AVCodec_GetCapability(nullptr, false);
    if (cap != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0300
 * @tc.number VIDEO_HWDEC_CAP_API_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi0300Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (cap == nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0400
 * @tc.number VIDEO_HWDEC_CAP_API_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi0400Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(nullptr, false, HARDWARE);
    if (cap != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0500
 * @tc.number VIDEO_HWDEC_CAP_API_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi0500Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (cap == nullptr) { return -1; }
    if (!OH_AVCapability_IsHardware(cap)) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0600
 * @tc.number VIDEO_HWDEC_CAP_API_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi0600Test()
{
    if (OH_AVCapability_IsHardware(nullptr)) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0700
 * @tc.number VIDEO_HWDEC_CAP_API_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi0700Test()
{
    if (OH_AVCapability_GetMaxSupportedInstances(nullptr) != 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0800
 * @tc.number VIDEO_HWDEC_CAP_API_0800
 * @tc.desc   function test, 不同平台解码器数量不一致, 改为不校验具体数量
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi0800Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (cap == nullptr) { return -1; }
    string codecName = OH_AVCapability_GetName(cap);
    if (codecName == "OMX.hisi.video.decoder.avc") {
        if (OH_AVCapability_GetMaxSupportedInstances(cap) <= 1) { return -1; }
    } else {
        if (OH_AVCapability_GetMaxSupportedInstances(cap) != MAX_SUPPORTED_INSTANCES_EXPECTED) {
            return -1;
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0900
 * @tc.number VIDEO_HWDEC_CAP_API_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi0900Test()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (cap == nullptr) { return -1; }
    if (g_codecName != OH_AVCapability_GetName(cap)) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1000
 * @tc.number VIDEO_HWDEC_CAP_API_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi1000Test()
{
    const char* name = OH_AVCapability_GetName(nullptr);
    if (name == nullptr) { return -1; }
    if (strlen(name) != 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3100
 * @tc.number VIDEO_HWDEC_CAP_API_3100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi3100Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3200
 * @tc.number VIDEO_HWDEC_CAP_API_3200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi3200Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(nullptr, &alignment);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3300
 * @tc.number VIDEO_HWDEC_CAP_API_3300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi3300Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(capability, &alignment);
    cout << "WidthAlignment " << alignment << endl;
    if (ret != AV_ERR_OK) { return -1; }
    if (alignment < 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3400
 * @tc.number VIDEO_HWDEC_CAP_API_3400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi3400Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3500
 * @tc.number VIDEO_HWDEC_CAP_API_3500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi3500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(nullptr, &alignment);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3600
 * @tc.number VIDEO_HWDEC_CAP_API_3600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi3600Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(capability, &alignment);
    cout << "HeightAlignment " << alignment << endl;
    if (ret != AV_ERR_OK) { return -1; }
    if (alignment < 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3700
 * @tc.number VIDEO_HWDEC_CAP_API_3700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi3700Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(nullptr, DEFAULT_HEIGHT, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3800
 * @tc.number VIDEO_HWDEC_CAP_API_3800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi3800Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_3900
 * @tc.number VIDEO_HWDEC_CAP_API_3900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi3900Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, 0, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4000
 * @tc.number VIDEO_HWDEC_CAP_API_4000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4000Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, DEFAULT_HEIGHT, &range);
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    if (ret != AV_ERR_OK) { return -1; }
    if (range.minVal < 0) { return -1; }
    if (range.maxVal <= 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4100
 * @tc.number VIDEO_HWDEC_CAP_API_4100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4100Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(nullptr, DEFAULT_WIDTH, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4200
 * @tc.number VIDEO_HWDEC_CAP_API_4200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4200Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4300
 * @tc.number VIDEO_HWDEC_CAP_API_4300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4300Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, 0, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4400
 * @tc.number VIDEO_HWDEC_CAP_API_4400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4400Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, DEFAULT_WIDTH, &range);
    if (ret != AV_ERR_OK) { return -1; }
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    if (range.minVal < 0) { return -1; }
    if (range.maxVal <= 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4500
 * @tc.number VIDEO_HWDEC_CAP_API_4500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoWidthRange(nullptr, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4600
 * @tc.number VIDEO_HWDEC_CAP_API_4600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4600Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoWidthRange(capability, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4700
 * @tc.number VIDEO_HWDEC_CAP_API_4700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4700Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoWidthRange(capability, &range);
    if (ret != AV_ERR_OK) { return -1; }
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    if (range.minVal < 0) { return -1; }
    if (range.maxVal <= 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4800
 * @tc.number VIDEO_HWDEC_CAP_API_4800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4800Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoHeightRange(nullptr, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_4900
 * @tc.number VIDEO_HWDEC_CAP_API_4900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi4900Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoHeightRange(capability, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5000
 * @tc.number VIDEO_HWDEC_CAP_API_5000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5000Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange widthRange;
    OH_AVRange heightRange;
    SafeMemcpy(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
    if (ret != AV_ERR_OK) { return -1; }
    cout << "minval=" << heightRange.minVal << "  maxval=" << heightRange.maxVal << endl;
    if (heightRange.minVal < 0) { return -1; }
    if (heightRange.maxVal <= 0) { return -1; }
    ret = OH_AVCapability_GetVideoWidthRange(capability, &widthRange);
    if (ret != AV_ERR_OK) { return -1; }
    if (widthRange.minVal < 0) { return -1; }
    if (widthRange.maxVal <= 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1700
 * @tc.number VIDEO_HWDEC_CAP_API_1700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi1700Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange widthRange;
    OH_AVRange heightRange;
    SafeMemcpy(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
        if (ret != AV_ERR_OK) { return -1; }
        cout << "minval=" << heightRange.minVal << "  maxval=" << heightRange.maxVal << endl;
        if (heightRange.minVal < 0) { return -1; }
        if (heightRange.maxVal <= 0) { return -1; }
        ret = OH_AVCapability_GetVideoWidthRange(capability, &widthRange);
        if (ret != AV_ERR_OK) { return -1; }
        if (widthRange.minVal < 0) { return -1; }
        if (widthRange.maxVal <= 0) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5100
 * @tc.number VIDEO_HWDEC_CAP_API_5100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5100Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    if (OH_AVCapability_IsVideoSizeSupported(capability, 0, DEFAULT_HEIGHT)) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5200
 * @tc.number VIDEO_HWDEC_CAP_API_5200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5200Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    if (OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, 0)) { return -1; }
    return 0;
}
/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5300
 * @tc.number VIDEO_HWDEC_CAP_API_5300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5300Test()
{
    if (OH_AVCapability_IsVideoSizeSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT)) { return -1; }
    return 0;
}
/**
 * @tc.name   VIDEO_HWDEC_CAP_API_9400
 * @tc.number VIDEO_HWDEC_CAP_API_9400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi9400Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    OH_AVRange heightRange;
    OH_AVRange widthRange;
    if (OH_AVCapability_GetVideoHeightRange(capability, &heightRange) != AV_ERR_OK) { return -1; }
    if (OH_AVCapability_GetVideoWidthRange(capability, &widthRange) != AV_ERR_OK) { return -1; }
    if (OH_AVCapability_IsVideoSizeSupported(capability, widthRange.maxVal + 1, heightRange.maxVal + 1)) {
        return -1;
    }
    return 0;
}
/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5400
 * @tc.number VIDEO_HWDEC_CAP_API_5400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5400Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    if (!OH_AVCapability_IsVideoSizeSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5500
 * @tc.number VIDEO_HWDEC_CAP_API_5500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRange(nullptr, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5600
 * @tc.number VIDEO_HWDEC_CAP_API_5600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5600Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5700
 * @tc.number VIDEO_HWDEC_CAP_API_5700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5700Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
    if (ret != AV_ERR_OK) { return -1; }
    if (range.minVal < 0) { return -1; }
    if (range.maxVal <= 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1600
 * @tc.number VIDEO_HWDEC_CAP_API_1600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi1600Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetVideoFrameRateRange(capability, &range);
        if (ret != AV_ERR_OK) { return -1; }
        if (range.minVal < 0) { return -1; }
        if (range.maxVal <= 0) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5800
 * @tc.number VIDEO_HWDEC_CAP_API_5800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5800Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_5900
 * @tc.number VIDEO_HWDEC_CAP_API_5900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi5900Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6000
 * @tc.number VIDEO_HWDEC_CAP_API_6000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6000Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, 0, DEFAULT_HEIGHT, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6100
 * @tc.number VIDEO_HWDEC_CAP_API_6100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6100Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, 0, &range);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6200
 * @tc.number VIDEO_HWDEC_CAP_API_6200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6200Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    OH_AVRange heightRange;
    OH_AVRange widthRange;
    SafeMemcpy(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
    cout << "minval=" << heightRange.minVal << "  maxval=" << heightRange.maxVal << endl;
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, heightRange.maxVal, &widthRange);
    cout << "minval=" << widthRange.minVal << "  maxval=" << widthRange.maxVal << endl;
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, HD_WIDTH, HD_HEIGHT, &range);
    if (ret != AV_ERR_OK) { return -1; }
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    if (range.minVal < 0) { return -1; }
    if (range.maxVal <= 0) { return -1; }
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, &range);
    if (ret != AV_ERR_OK) { return -1; }
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    if (range.minVal < 0) { return -1; }
    if (range.maxVal <= 0) { return -1; }
    ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, widthRange.maxVal, heightRange.maxVal, &range);
    if (ret != AV_ERR_OK) { return -1; }
    cout << "minval=" << range.minVal << "  maxval=" << range.maxVal << endl;
    if (range.minVal < 0) { return -1; }
    if (range.maxVal <= 0) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6300
 * @tc.number VIDEO_HWDEC_CAP_API_6300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6300Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, 0, DEFAULT_HEIGHT, DEFAULT_FRAME_RATE)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6400
 * @tc.number VIDEO_HWDEC_CAP_API_6400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6400Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, 0, DEFAULT_FRAME_RATE)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6500
 * @tc.number VIDEO_HWDEC_CAP_API_6500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6500Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6600
 * @tc.number VIDEO_HWDEC_CAP_API_6600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6600Test()
{
    if (OH_AVCapability_AreVideoSizeAndFrameRateSupported(nullptr, DEFAULT_WIDTH, DEFAULT_HEIGHT, DEFAULT_FRAME_RATE)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6700
 * @tc.number VIDEO_HWDEC_CAP_API_6700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6700Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    if (!OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, DEFAULT_WIDTH, DEFAULT_HEIGHT,
        DEFAULT_FRAME_RATE)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6800
 * @tc.number VIDEO_HWDEC_CAP_API_6800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6800Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(nullptr, &pixelFormat, &pixelFormatNum);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_6900
 * @tc.number VIDEO_HWDEC_CAP_API_6900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi6900Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, nullptr, &pixelFormatNum);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7000
 * @tc.number VIDEO_HWDEC_CAP_API_7000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7000Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* pixelFormat = nullptr;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7100
 * @tc.number VIDEO_HWDEC_CAP_API_7100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7100Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
    if (pixelFormat == nullptr) { return -1; }
    if (pixelFormatNum <= 0) { return -1; }
    if (ret != AV_ERR_OK) { return -1; }
    for (int i = 0; i < pixelFormatNum; i++) {
        vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (vdec_ == nullptr) { return -1; }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return -1; }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        if (pixelFormat[i] < 0) { return -1; }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
        if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoDecoder_Destroy(vdec_);
        vdec_ = nullptr;
    }
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (vdec_ == nullptr) { return -1; }
    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA + AV_PIXEL_FORMAT_RGBA);
    if (OH_VideoDecoder_Configure(vdec_, format) == AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1200
 * @tc.number VIDEO_HWDEC_CAP_API_1200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi1200Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormat, &pixelFormatNum);
        if (pixelFormat == nullptr) { return -1; }
        if (pixelFormatNum <= 0) { return -1; }
        if (ret != AV_ERR_OK) { return -1; }
        for (int i = 0; i < pixelFormatNum; i++) {
            vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
            if (vdec_ == nullptr) { return -1; }
            format = OH_AVFormat_Create();
            if (format == nullptr) { return -1; }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            if (pixelFormat[i] < 0) { return -1; }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[i]);
            if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoDecoder_Destroy(vdec_);
            vdec_ = nullptr;
        }
        vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
        if (vdec_ == nullptr) { return -1; }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return -1; }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_RGBA + AV_PIXEL_FORMAT_RGBA);
        if (OH_VideoDecoder_Configure(vdec_, format) == AV_ERR_OK) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7200
 * @tc.number VIDEO_HWDEC_CAP_API_7200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7200Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    ret = OH_AVCapability_GetSupportedProfiles(nullptr, &profiles, &profileNum);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7300
 * @tc.number VIDEO_HWDEC_CAP_API_7300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7300Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetSupportedProfiles(capability, nullptr, &profileNum);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7400
 * @tc.number VIDEO_HWDEC_CAP_API_7400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7400Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7500
 * @tc.number VIDEO_HWDEC_CAP_API_7500
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7500Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    if (ret != AV_ERR_OK) { return -1; }
    if (profileNum <= 0) { return -1; }
    if (profiles == nullptr) { return -1; }
    for (int i = 0; i < profileNum; i++) {
        if (profiles[i] < 0) { return -1; }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1300
 * @tc.number VIDEO_HWDEC_CAP_API_1300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi1300Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability) {
        ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
        if (ret != AV_ERR_OK) { return -1; }
        if (profileNum <= 0) { return -1; }
        if (profiles == nullptr) { return -1; }
        for (int i = 0; i < profileNum; i++) {
            if (profiles[i] < 0) { return -1; }
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7600
 * @tc.number VIDEO_HWDEC_CAP_API_7600
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7600Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    ret = OH_AVCapability_GetSupportedLevelsForProfile(nullptr, AVC_PROFILE_BASELINE, &levels, &levelNum);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7700
 * @tc.number VIDEO_HWDEC_CAP_API_7700
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7700Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, 1, &levels, &levelNum);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7800
 * @tc.number VIDEO_HWDEC_CAP_API_7800
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7800Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    uint32_t levelNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, AVC_PROFILE_BASELINE, nullptr, &levelNum);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_7900
 * @tc.number VIDEO_HWDEC_CAP_API_7900
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi7900Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, AVC_PROFILE_BASELINE, &levels, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_8000
 * @tc.number VIDEO_HWDEC_CAP_API_8000
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi8000Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    const int32_t* profiles = nullptr;
    uint32_t profileNum = 0;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    if (ret != AV_ERR_OK) { return -1; }
    if (profileNum <= 0) { return -1; }
    if (profiles == nullptr) { return -1; }
    for (int i = 0; i < profileNum; i++) {
        if (profiles[i] < 0) { return -1; }
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[i], &levels, &levelNum);
        if (ret != AV_ERR_OK) { return -1; }
        if (levels == nullptr) { return -1; }
        if (levelNum <= 0) { return -1; }
        for (int j = 0; j < levelNum; j++) {
            if (levels[j] < 0) { return -1; }
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_1400
 * @tc.number VIDEO_HWDEC_CAP_API_1400
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi1400Test()
{
    OH_AVErrCode ret = AV_ERR_OK;
    const int32_t* levels = nullptr;
    uint32_t levelNum = 0;
    uint32_t profileNum = 0;
    const int32_t* profiles = nullptr;
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    if (capability == nullptr) { return 0; }
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    if (ret != AV_ERR_OK) { return -1; }
    if (profileNum <= 0) { return -1; }
    if (profiles == nullptr) { return -1; }
    for (int i = 0; i < profileNum; i++) {
        if (profiles[i] < 0) { return -1; }
        ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[i], &levels, &levelNum);
        if (ret != AV_ERR_OK) { return -1; }
        if (levels == nullptr) { return -1; }
        if (levelNum <= 0) { return -1; }
        for (int j = 0; j < levelNum; j++) {
            if (levels[j] < 0) { return -1; }
        }
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_8100
 * @tc.number VIDEO_HWDEC_CAP_API_8100
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi8100Test()
{
    if (OH_AVCapability_AreProfileAndLevelSupported(nullptr, AVC_PROFILE_BASELINE, 1)) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_8200
 * @tc.number VIDEO_HWDEC_CAP_API_8200
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi8200Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    if (OH_AVCapability_AreProfileAndLevelSupported(capability, 1, 1)) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_8300
 * @tc.number VIDEO_HWDEC_CAP_API_8300
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecCapApi8300Test()
{
    OH_AVCapability* capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capability == nullptr) { return -1; }
    if (!OH_AVCapability_AreProfileAndLevelSupported(capability, AVC_PROFILE_BASELINE, 1)) {
        return -1;
    }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_ATTIME_API_0010
 * @tc.number VIDEO_HWDEC_ATTIME_API_0010
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int VideoHwdecAttimeApi0010Test()
{
    shared_ptr<VDecAPI11Sample> vDecSample = make_shared<VDecAPI11Sample>();
    const char* INP_DIR_720_30 = "/data/storage/el2/base/files/1280_720_30_10Mb.h264";
    vDecSample->inpDir = INP_DIR_720_30;
    vDecSample->sfOutput = true;
    vDecSample->defaultWidth = HD_WIDTH;
    vDecSample->defaultHeight = HD_HEIGHT;
    vDecSample->defaultFrameRate = DEFAULT_FRAME_RATE;
    vDecSample->rsAtTime = true;
    vDecSample->isAPI = true;
    if (vDecSample->RunVideoDecSurface(g_codecName) != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0010
 * @tc.number VIDEO_DECODE_SYNC_API_0010
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoDecodeSyncApi0010Test()
{
    uint32_t index;
    if (OH_VideoDecoder_QueryInputBuffer(nullptr, &index, -1) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0020
 * @tc.number VIDEO_DECODE_SYNC_API_0020
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoDecodeSyncApi0020Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    uint32_t index;
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (vdec_ == nullptr) { return -1; }
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Prepare(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Start(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_QueryInputBuffer(vdec_, &index, INT64_MAX) != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0030
 * @tc.number VIDEO_DECODE_SYNC_API_0030
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoDecodeSyncApi0030Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    uint32_t index;
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (vdec_ == nullptr) { return -1; }
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Prepare(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Start(vdec_) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_QueryInputBuffer(vdec_, &index, INT64_MIN) != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0040
 * @tc.number VIDEO_DECODE_SYNC_API_0040
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoDecodeSyncApi0040Test()
{
    if (OH_VideoDecoder_GetInputBuffer(nullptr, 1) != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0050
 * @tc.number VIDEO_DECODE_SYNC_API_0050
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoDecodeSyncApi0050Test()
{
    uint32_t index;
    if (OH_VideoDecoder_QueryOutputBuffer(nullptr, &index, -1) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0060
 * @tc.number VIDEO_DECODE_SYNC_API_0060
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoDecodeSyncApi0060Test()
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->enableSyncMode = 1;
    vDecSample->syncOutputWaitTime = INT64_MAX;
    vDecSample->inpDir = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";
    if (vDecSample->CreateVideoDecoder(g_codecName) != AV_ERR_OK) { return -1; }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) { return -1; }
    if (vDecSample->StartVideoDecoder() != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0070
 * @tc.number VIDEO_DECODE_SYNC_API_0070
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoDecodeSyncApi0070Test()
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->enableSyncMode = 1;
    vDecSample->syncOutputWaitTime = INT64_MIN;
    vDecSample->inpDir = "/data/storage/el2/base/files/1920_1080_10_30Mb.h264";
    if (vDecSample->CreateVideoDecoder(g_codecName) != AV_ERR_OK) { return -1; }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) { return -1; }
    if (vDecSample->StartVideoDecoder() != AV_ERR_OK) { return -1; }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != AV_ERR_OK) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_DECODE_SYNC_API_0080
 * @tc.number VIDEO_DECODE_SYNC_API_0080
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoDecodeSyncApi0080Test()
{
    if (OH_VideoDecoder_GetOutputBuffer(nullptr, 1) != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FORMAT_API_0010
 * @tc.number VIDEO_HWDEC_FORMAT_API_0010
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VideoHwdecFormatApi0010Test()
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    OH_AVCapability_GetVideoSupportedNativeBufferFormats(
        nullptr, &(vDecSample->pixlFormats), &(vDecSample->pixlFormatNum));
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_FORMAT_API_0020
 * @tc.number VIDEO_HWDEC_FORMAT_API_0020
 * @tc.desc   api test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
int VideoHwdecFormatApi0020Test()
{
    auto vDecSample = make_shared<VDecAPI11Sample>();
    const char* avcodecMimeType = OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
    OH_AVCapability* capability = OH_AVCodec_GetCapability(avcodecMimeType, false);
    OH_AVCapability_GetVideoSupportedNativeBufferFormats(capability, &(vDecSample->pixlFormats), nullptr);
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_ADD_0010
 * @tc.number VIDEO_HWDEC_API_ADD_0010
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApiAdd0010Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (vdec_ == nullptr) { return -1; }
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
    if (OH_VideoDecoder_Configure(vdec_, format) != AV_ERR_OK) { return -1; }
    if (OH_VideoDecoder_Prepare(vdec_) != AV_ERR_OK) { return -1; }
    uint32_t index = 0;
    if (OH_VideoDecoder_QueryOutputBuffer(vdec_, &index, 0) != AV_ERR_INVALID_STATE) { return -1; }
    OH_VideoDecoder_Destroy(vdec_);
    vdec_ = nullptr;
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_ADD_0020
 * @tc.number VIDEO_HWDEC_API_ADD_0020
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApiAdd0020Test()
{
    if (OH_AVBuffer_GetNativeBuffer(nullptr) != nullptr) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_ADD_0030
 * @tc.number VIDEO_HWDEC_API_ADD_0030
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApiAdd0030Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_DISPOSABLE;
    if (OH_VideoDecoder_PushInputData(vdec_, 0, attr) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

/**
 * @tc.name   VIDEO_HWDEC_API_ADD_0040
 * @tc.number VIDEO_HWDEC_API_ADD_0040
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VideoHwdecApiAdd0040Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_INCOMPLETE_FRAME;
    if (OH_VideoDecoder_PushInputData(vdec_, 0, attr) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

int VideoHwdecApiAdd0050Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_INCOMPLETE_FRAME;
    if (OH_VideoDecoder_PushInputData(vdec_, -1, attr) != AV_ERR_INVALID_VAL) { return -1; }
    return 0;
}

int VideoHwdecApiAdd0060Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_RenderOutputData(vdec_, -1) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

int VideoHwdecApiAdd0070Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_PushInputBuffer(vdec_, -1) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

int VideoHwdecApiAdd0080Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_RenderOutputBuffer(vdec_, -1) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

int VideoHwdecApiAdd0090Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    const int64_t kInvalidTimestamp = -100000000;
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_RenderOutputBufferAtTime(vdec_, -1, kInvalidTimestamp) != AV_ERR_INVALID_STATE) {
        return -1;
    }
    return 0;
}

int VideoHwdecApiAdd0100Test()
{
    ApiTestGuard guard;
    if (!guard.ok) { return -1; }
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    if (OH_VideoDecoder_FreeOutputBuffer(vdec_, -1) != AV_ERR_INVALID_STATE) { return -1; }
    return 0;
}

void InitApiTest()
{
    TestSetUpTestCase();
}
