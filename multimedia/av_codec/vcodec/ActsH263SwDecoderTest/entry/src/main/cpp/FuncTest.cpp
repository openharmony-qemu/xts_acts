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

#include "include/FuncTest.h"
#include <string>
#include <iostream>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include "include/videodec_api11_sample.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avformat.h>
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "H263swDecoderTest12"

#ifdef SUPPORT_DRM
#include "native_mediakeysession.h"
#include "native_mediakeysystem.h"
#endif

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static OH_AVCapability *g_cap263 = nullptr;
static string g_codecName263 = "";
static OH_AVCapability *g_cap264 = nullptr;
static string g_codecName264 = "";

constexpr uint32_t FRAMESIZE90 = 90;
constexpr uint32_t FRAMESIZE75 = 75;
constexpr uint32_t VIDEO_WIDTH_128 = 128;
constexpr uint32_t VIDEO_HEIGHT_96 = 96;
constexpr uint32_t VIDEO_WIDTH_20 = 20;
constexpr uint32_t VIDEO_HEIGHT_20 = 20;
constexpr uint32_t VIDEO_FRAME_RATE_30 = 30;

void InitH263Capability()
{
    if (g_cap263 == nullptr) {
        g_cap263 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_H263, false, SOFTWARE);
        if (g_cap263 != nullptr) {
            g_codecName263 = OH_AVCapability_GetName(g_cap263);
            cout << "g_codecName263: " << g_codecName263 << endl;
        }
    }
    if (g_cap264 == nullptr) {
        g_cap264 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
        if (g_cap264 != nullptr) {
            g_codecName264 = OH_AVCapability_GetName(g_cap264);
            cout << "g_codecName264: " << g_codecName264 << endl;
        }
    }
}

int VideoDecodeSyncSw263Func0010Test()
{
    OH_LOG_INFO(LOG_APP, "[0010] Test start");
    InitH263Capability();
    if (g_cap263 == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[0010] g_cap263 is nullptr");
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->INP_DIR = "/data/storage/el2/base/files/media/profile0_level10_I_128x96.h263";
    vDecSample->DEFAULT_WIDTH = VIDEO_WIDTH_128;
    vDecSample->DEFAULT_HEIGHT = VIDEO_HEIGHT_96;
    vDecSample->DEFAULT_FRAME_RATE = VIDEO_FRAME_RATE_30;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV12;
    
    OH_LOG_INFO(LOG_APP, "[0010] CreateVideoDecoder");
    if (vDecSample->CreateVideoDecoder(g_codecName263) != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[0010] CreateVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0010] ConfigureVideoDecoder");
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[0010] ConfigureVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0010] StartSyncVideoDecoder");
    if (vDecSample->StartSyncVideoDecoder() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[0010] StartSyncVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0010] WaitForEOS");
    vDecSample->WaitForEOS();
    
    OH_LOG_INFO(LOG_APP, "[0010] Check results: errCount=%{public}d, outFrameCount=%{public}d, expected=%{public}d",
        vDecSample->errCount, vDecSample->outFrameCount, FRAMESIZE90);
    
    if (vDecSample->errCount != 0) {
        OH_LOG_ERROR(LOG_APP, "[0010] errCount != 0");
        return -1;
    }
    if (vDecSample->outFrameCount != FRAMESIZE90) {
        OH_LOG_ERROR(LOG_APP, "[0010] outFrameCount mismatch");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0010] Test PASS");
    return 0;
}

int VideoDecodeSyncSw263Func0020Test()
{
    OH_LOG_INFO(LOG_APP, "[0020] Test start");
    InitH263Capability();
    if (g_cap263 == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[0020] g_cap263 is nullptr");
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->INP_DIR = "/data/storage/el2/base/files/media/profile0_level10_I_128x96.h263";
    vDecSample->DEFAULT_WIDTH = VIDEO_WIDTH_128;
    vDecSample->DEFAULT_HEIGHT = VIDEO_HEIGHT_96;
    vDecSample->DEFAULT_FRAME_RATE = VIDEO_FRAME_RATE_30;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_NV21;
    
    OH_LOG_INFO(LOG_APP, "[0020] CreateVideoDecoder");
    if (vDecSample->CreateVideoDecoder(g_codecName263) != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[0020] CreateVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0020] ConfigureVideoDecoder");
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[0020] ConfigureVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0020] StartSyncVideoDecoder");
    if (vDecSample->StartSyncVideoDecoder() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[0020] StartSyncVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0020] WaitForEOS");
    vDecSample->WaitForEOS();
    
    OH_LOG_INFO(LOG_APP, "[0020] Check results: errCount=%{public}d, outFrameCount=%{public}d, expected=%{public}d",
        vDecSample->errCount, vDecSample->outFrameCount, FRAMESIZE90);
    
    if (vDecSample->errCount != 0) {
        OH_LOG_ERROR(LOG_APP, "[0020] errCount != 0");
        return -1;
    }
    if (vDecSample->outFrameCount != FRAMESIZE90) {
        OH_LOG_ERROR(LOG_APP, "[0020] outFrameCount mismatch");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0020] Test PASS");
    return 0;
}

int VideoDecodeSyncSw263Func0040Test()
{
    OH_LOG_INFO(LOG_APP, "[0040] Test start");
    InitH263Capability();
    if (g_cap263 == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[0040] g_cap263 is nullptr");
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->INP_DIR = "/data/storage/el2/base/files/media/profile0_level10_I_128x96.h263";
    vDecSample->DEFAULT_WIDTH = VIDEO_WIDTH_128;
    vDecSample->DEFAULT_HEIGHT = VIDEO_HEIGHT_96;
    vDecSample->DEFAULT_FRAME_RATE = VIDEO_FRAME_RATE_30;
    vDecSample->enbleSyncMode = 1;
    vDecSample->defualtPixelFormat = AV_PIXEL_FORMAT_RGBA;
    
    OH_LOG_INFO(LOG_APP, "[0040] CreateVideoDecoder");
    if (vDecSample->CreateVideoDecoder(g_codecName263) != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[0040] CreateVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0040] ConfigureVideoDecoder");
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[0040] ConfigureVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0040] StartSyncVideoDecoder");
    if (vDecSample->StartSyncVideoDecoder() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[0040] StartSyncVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0040] WaitForEOS");
    vDecSample->WaitForEOS();
    
    OH_LOG_INFO(LOG_APP, "[0040] Check results: errCount=%{public}d, outFrameCount=%{public}d, expected=%{public}d",
        vDecSample->errCount, vDecSample->outFrameCount, FRAMESIZE90);
    
    if (vDecSample->errCount != 0) {
        OH_LOG_ERROR(LOG_APP, "[0040] errCount != 0");
        return -1;
    }
    if (vDecSample->outFrameCount != FRAMESIZE90) {
        OH_LOG_ERROR(LOG_APP, "[0040] outFrameCount mismatch");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[0040] Test PASS");
    return 0;
}

int VideoDecodeSw263BlankFrame0010Test()
{
    OH_LOG_INFO(LOG_APP, "[BlankFrame] Test start");
    InitH263Capability();
    if (g_cap263 == nullptr) {
        OH_LOG_ERROR(LOG_APP, "[BlankFrame] g_cap263 is nullptr");
        return 0;
    }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->INP_DIR = "/data/storage/el2/base/files/media/20x20.h263";
    vDecSample->DEFAULT_WIDTH = VIDEO_WIDTH_20;
    vDecSample->DEFAULT_HEIGHT = VIDEO_HEIGHT_20;
    vDecSample->DEFAULT_FRAME_RATE = VIDEO_FRAME_RATE_30;
    vDecSample->enbleBlankFrame = 1;
    
    OH_LOG_INFO(LOG_APP, "[BlankFrame] CreateVideoDecoder");
    if (vDecSample->CreateVideoDecoder("OH.Media.Codec.Decoder.Video.H263") != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[BlankFrame] CreateVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[BlankFrame] ConfigureVideoDecoder");
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[BlankFrame] ConfigureVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[BlankFrame] SetVideoDecoderCallback");
    if (vDecSample->SetVideoDecoderCallback() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[BlankFrame] SetVideoDecoderCallback failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[BlankFrame] StartVideoDecoder");
    if (vDecSample->StartVideoDecoder() != AV_ERR_OK) {
        OH_LOG_ERROR(LOG_APP, "[BlankFrame] StartVideoDecoder failed");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[BlankFrame] WaitForEOS");
    vDecSample->WaitForEOS();
    
    OH_LOG_INFO(LOG_APP,
                "[BlankFrame] Check results: errCount=%{public}d, outFrameCount=%{public}d, expected=%{public}d",
                vDecSample->errCount, vDecSample->outFrameCount, FRAMESIZE75);
    
    if (vDecSample->errCount != 0) {
        OH_LOG_ERROR(LOG_APP, "[BlankFrame] errCount != 0");
        return -1;
    }
    if (vDecSample->outFrameCount != FRAMESIZE75) {
        OH_LOG_ERROR(LOG_APP, "[BlankFrame] outFrameCount mismatch");
        return -1;
    }
    
    OH_LOG_INFO(LOG_APP, "[BlankFrame] Test PASS");
    return 0;
}