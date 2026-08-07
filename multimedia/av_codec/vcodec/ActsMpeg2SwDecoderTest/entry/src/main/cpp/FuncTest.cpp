/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
#include <memory>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include "include/FuncTest.h"
#include "include/videodec_api11_sample.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static OH_AVCapability* g_capMpeg2 = nullptr;
static string g_codecNameMpeg2 = "";

static const int MPEG2_DEFAULT_WIDTH = 1920;
static const int MPEG2_DEFAULT_HEIGHT = 1080;
static const int MPEG2_DEFAULT_FRAME_RATE = 30;

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static void InitMpeg2Capability()
{
    if (g_capMpeg2 == nullptr) {
        g_capMpeg2 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
        if (g_capMpeg2 != nullptr) {
            g_codecNameMpeg2 = OH_AVCapability_GetName(g_capMpeg2);
            cout << "g_codecNameMpeg2: " << g_codecNameMpeg2 << endl;
        }
    }
}

void InitMpeg2Test()
{
    InitMpeg2Capability();
}

static void SetSampleCommonAttr(const shared_ptr<VDecAPI11Sample>& sample, uint32_t pixelFormat)
{
    sample->inpDir = MPEG2_INPUT_FILE_PATH;
    sample->defaultWidth = MPEG2_DEFAULT_WIDTH;
    sample->defaultHeight = MPEG2_DEFAULT_HEIGHT;
    sample->defaultFrameRate = MPEG2_DEFAULT_FRAME_RATE;
    sample->enbleSyncMode = 1;
    sample->defualtPixelFormat = pixelFormat;
}

static napi_value RunSyncDecodeTest(napi_env env, uint32_t pixelFormat)
{
    InitMpeg2Capability();
    if (g_capMpeg2 == nullptr) { return CreateIntInt32Result(env, 0); }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    SetSampleCommonAttr(vDecSample, pixelFormat);
    if (vDecSample->CreateVideoDecoder(g_codecNameMpeg2) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (vDecSample->ConfigureVideoDecoder() != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (vDecSample->StartSyncVideoDecoder() != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoDecodeSyncSwMpeg2Func00100Test(napi_env env, napi_callback_info info)
{
    (void)info;
    return RunSyncDecodeTest(env, AV_PIXEL_FORMAT_NV12);
}

napi_value VideoDecodeSyncSwMpeg2Func00200Test(napi_env env, napi_callback_info info)
{
    (void)info;
    return RunSyncDecodeTest(env, AV_PIXEL_FORMAT_NV21);
}

napi_value VideoDecodeSyncSwMpeg2Func00400Test(napi_env env, napi_callback_info info)
{
    (void)info;
    return RunSyncDecodeTest(env, AV_PIXEL_FORMAT_RGBA);
}

napi_value VideoDecodeBlankFrame00100Test(napi_env env, napi_callback_info info)
{
    (void)info;
    InitMpeg2Capability();
    if (g_capMpeg2 == nullptr) { return CreateIntInt32Result(env, 0); }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = MPEG2_INPUT_FILE_PATH;
    vDecSample->defaultWidth = MPEG2_DEFAULT_WIDTH;
    vDecSample->defaultHeight = MPEG2_DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = MPEG2_DEFAULT_FRAME_RATE;
    vDecSample->enbleBlankFrame = 1;
    if (vDecSample->CreateVideoDecoder(g_codecNameMpeg2) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoDecodeBlankAdd00100Test(napi_env env, napi_callback_info info)
{
    (void)info;
    InitMpeg2Capability();
    if (g_capMpeg2 == nullptr) { return CreateIntInt32Result(env, 0); }
    OH_AVCapability* cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
    if (!OH_AVCapability_AreProfileAndLevelSupported(cap, MPEG2_PROFILE_SIMPLE, MPEG2_LEVEL_LOW)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(cap, MPEG2_PROFILE_MAIN, MPEG2_LEVEL_MAIN)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(
        cap, MPEG2_PROFILE_SNR_SCALABLE, MPEG2_LEVEL_HIGH_1440)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(
        cap, MPEG2_PROFILE_SPATIALLY_SCALABLE, MPEG2_LEVEL_HIGH)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(cap, MPEG2_PROFILE_HIGH, MPEG2_LEVEL_HIGH)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVCapability_AreProfileAndLevelSupported(cap, MPEG2_PROFILE_422, MPEG2_LEVEL_HIGH)) {
        return CreateIntInt32Result(env, -1);
    }
    return CreateIntInt32Result(env, 0);
}
