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
#include <iostream>D
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
namespace OHOS {
namespace Media {

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
} // namespace

namespace ApiTest {
// SetUpTestCase: Called before all test cases
void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    g_codecName = OH_AVCapability_GetName(cap);
    cout << "g_codecName: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
    g_codecNameHEVC = OH_AVCapability_GetName(cap_hevc);
    cout << "g_codecNameHEVC: " << g_codecNameHEVC << endl;
}
// SetUp: Called before each test cases
void SetUp()
{
    signal_ = new VDecSignal();
}
// TearDown: Called after each test cases
void TearDown()
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
} // namespace ApiTest

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
int VIDEO_HWDEC_ILLEGAL_PARA_0100()
{
    vdec_ = OH_VideoDecoder_CreateByMime(NULL);
    ASSERT_EQ(nullptr, vdec_);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0200()
{
    vdec_ = OH_VideoDecoder_CreateByName(NULL);
    ASSERT_EQ(nullptr, vdec_);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3300
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_3300()
{
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetCallback(NULL, cb_, static_cast<void*>(signal_)));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1800
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1800()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    OH_AVCodecAsyncCallback cb2_;
    cb2_.onError = NULL;
    cb2_.onStreamChanged = NULL;
    cb2_.onNeedInputData = NULL;
    cb2_.onNeedOutputData = NULL;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb2_, static_cast<void*>(signal_)));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0300
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0300()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0400
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0400()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Destroy(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0500
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0500()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(vdec_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1400()
{
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(NULL, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5000
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_5000()
{
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    string widthStr = "width";
    (void)OH_AVFormat_SetIntValue(format, widthStr.c_str(), DEFAULT_WIDTH);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(NULL, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_5100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_5100()
{
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Configure(NULL, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0600
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0600()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Start(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0700
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0700()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Stop(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0800
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0800()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Flush(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_0900
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_0900()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Reset(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1000
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1000()
{
    ASSERT_EQ(nullptr, OH_VideoDecoder_GetOutputDescription(NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1100()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetParameter(vdec_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_4100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_4100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_4100()
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoDecoder_Prepare(nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1500
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1500()
{
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetParameter(NULL, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1200()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_SetSurface(vdec_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1300
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1300()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1600
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1600()
{
    vdec_ = OH_VideoDecoder_CreateByName(INVALID_CODEC_NAME.c_str());
    ASSERT_EQ(nullptr, vdec_);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_1700()
{
    vdec_ = OH_VideoDecoder_CreateByMime(INVALID_CODEC_NAME.c_str());
    ASSERT_EQ(nullptr, vdec_);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_1700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2200()
{
    bool isValid = false;
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoDecoder_IsValid(nullptr, &isValid);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);
    ret = OH_VideoDecoder_IsValid(vdec_, nullptr);
    ASSERT_EQ(AV_ERR_INVALID_VAL, ret);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2500
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2500()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_RenderOutputData(NULL, 0));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2600
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2600()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_RenderOutputData(vdec_, 0));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2700
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2700()
{
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_FreeOutputData(NULL, 0));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2800
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2800()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_FreeOutputData(vdec_, 0));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_2900
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_2900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_2900()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_FreeOutputData(vdec_, -1));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3000
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_3000()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());

    OH_AVCodecBufferAttr attr;
    attr.pts = -1;
    attr.size = -1;
    attr.offset = -1;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(vdec_, 0, attr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3100
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_3100()
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(NULL, -1, attr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_ILLEGAL_PARA_3200
 * @tc.number VIDEO_HWDEC_ILLEGAL_PARA_3200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_ILLEGAL_PARA_3200()
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_PushInputData(NULL, 0, attr));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0100
 * @tc.number VIDEO_HWDEC_API_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0100()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(vdec_, nullptr);
    OH_AVCodec* vdec_2 = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(vdec_2, nullptr);
    OH_VideoDecoder_Destroy(vdec_2);
    vdec_2 = nullptr;
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0200
 * @tc.number VIDEO_HWDEC_API_0200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0200()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_Configure(vdec_, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0300
 * @tc.number VIDEO_HWDEC_API_0300
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0300()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_Start(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0400
 * @tc.number VIDEO_HWDEC_API_0400
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0400()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0500
 * @tc.number VIDEO_HWDEC_API_0500
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0500()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Reset(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Reset(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0600
 * @tc.number VIDEO_HWDEC_API_0600
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0600()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);
    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VDecNeedInputData;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, static_cast<void*>(signal_)));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    for (int i = 0; i < 2; i++) {
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
            ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_PushInputData(vdec_, index, attr));
        } else {
            ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_PushInputData(vdec_, 0, attr));
        }
    }
    OH_VideoDecoder_Destroy(vdec_);
    vdec_ = nullptr;
    signal_->inIdxQueue_.pop();
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0700
 * @tc.number VIDEO_HWDEC_API_0700
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0700()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Flush(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Flush(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0800
 * @tc.number VIDEO_HWDEC_API_0800
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0800()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Configure(vdec_, format));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Start(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Stop(vdec_));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_Destroy(vdec_));
    vdec_ = nullptr;
    ASSERT_EQ(AV_ERR_INVALID_VAL, OH_VideoDecoder_Destroy(vdec_));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_0900
 * @tc.number VIDEO_HWDEC_API_0900
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_0900()
{
    vdec_ = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(vdec_, nullptr);
    OH_AVCodec* vdec_2 = OH_VideoDecoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    ASSERT_NE(vdec_2, nullptr);
    OH_VideoDecoder_Destroy(vdec_2);
    vdec_2 = nullptr;
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_1000
 * @tc.number VIDEO_HWDEC_API_1000
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_1000()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = VdecError;
    cb_.onStreamChanged = VdecFormatChanged;
    cb_.onNeedInputData = VdecInputDataReady;
    cb_.onNeedOutputData = VdecOutputDataReady;
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, NULL));
    ASSERT_EQ(AV_ERR_OK, OH_VideoDecoder_SetCallback(vdec_, cb_, NULL));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_1100
 * @tc.number VIDEO_HWDEC_API_1100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_1100()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    format = OH_VideoDecoder_GetOutputDescription(vdec_);
    ASSERT_NE(nullptr, format);
    format = OH_VideoDecoder_GetOutputDescription(vdec_);
    ASSERT_NE(nullptr, format);
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_API_1200
 * @tc.number VIDEO_HWDEC_API_1200
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_API_1200()
{
    vdec_ = OH_VideoDecoder_CreateByName(g_codecName.c_str());
    ASSERT_NE(nullptr, vdec_);

    format = OH_AVFormat_Create();
    ASSERT_NE(nullptr, format);

    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);

    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_SetParameter(vdec_, format));
    ASSERT_EQ(AV_ERR_INVALID_STATE, OH_VideoDecoder_SetParameter(vdec_, format));
    return SUCCESS_CODE;
}

/**
 * @tc.name   VIDEO_HWDEC_CAP_API_0100
 * @tc.number VIDEO_HWDEC_CAP_API_0100
 * @tc.desc   function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL2
 */
int VIDEO_HWDEC_CAP_API_0100()
{
    cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false);
    ASSERT_NE(cap, nullptr);
    return SUCCESS_CODE;
}

} // namespace Media
} // namespace OHOS