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
#include <memory>
#include <unistd.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include "include/FuncTest.h"
#include "include/VideodecApi11SampleTest.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static OH_AVCapability* g_capMpeg4 = nullptr;
static string g_codecNameMpeg4 = "";

static const char* INP_DIR_1080_30 =
    "/data/storage/el2/base/haps/entry_test/files/mpeg4_main@level4_1920x1080_30.m4v";
static const int MPEG4_DEFAULT_WIDTH = 1920;
static const int MPEG4_DEFAULT_HEIGHT = 1080;
static const int MPEG4_DEFAULT_FRAME_RATE = 30;

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

static void InitMpeg4Capability()
{
    if (g_capMpeg4 == nullptr) {
        g_capMpeg4 = OH_AVCodec_GetCapabilityByCategory(
            OH_AVCODEC_MIMETYPE_VIDEO_MPEG4_PART2, false, SOFTWARE);
        if (g_capMpeg4 != nullptr) {
            g_codecNameMpeg4 = OH_AVCapability_GetName(g_capMpeg4);
            cout << "g_codecNameMpeg4: " << g_codecNameMpeg4 << endl;
        }
    }
}

void InitMpeg4Test()
{
    InitMpeg4Capability();
}

static void SetSampleCommonAttr(const shared_ptr<VDecAPI11Sample>& sample, uint32_t pixelFormat)
{
    sample->inpDir = INP_DIR_1080_30;
    sample->defaultWidth = MPEG4_DEFAULT_WIDTH;
    sample->defaultHeight = MPEG4_DEFAULT_HEIGHT;
    sample->defaultFrameRate = MPEG4_DEFAULT_FRAME_RATE;
    sample->enbleSyncMode = 1;
    sample->defualtPixelFormat = pixelFormat;
}

static napi_value RunSyncMpeg4DecodeTest(napi_env env, uint32_t pixelFormat)
{
    InitMpeg4Capability();
    if (g_capMpeg4 == nullptr) { return CreateIntInt32Result(env, 0); }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    SetSampleCommonAttr(vDecSample, pixelFormat);
    if (vDecSample->CreateVideoDecoder(g_codecNameMpeg4) != AV_ERR_OK) {
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

napi_value VideoDecodeSyncSwMpeg4Func00100Test(napi_env env, napi_callback_info info)
{
    (void)info;
    return RunSyncMpeg4DecodeTest(env, AV_PIXEL_FORMAT_NV12);
}

napi_value VideoDecodeSyncSwMpeg4Func00200Test(napi_env env, napi_callback_info info)
{
    (void)info;
    return RunSyncMpeg4DecodeTest(env, AV_PIXEL_FORMAT_NV21);
}

napi_value VideoDecodeSyncSwMpeg4Func00400Test(napi_env env, napi_callback_info info)
{
    (void)info;
    return RunSyncMpeg4DecodeTest(env, AV_PIXEL_FORMAT_RGBA);
}

napi_value VideoMpeg4SwdecBlankFrame00100Test(napi_env env, napi_callback_info info)
{
    (void)info;
    InitMpeg4Capability();
    if (g_capMpeg4 == nullptr) { return CreateIntInt32Result(env, 0); }
    if (access("/system/lib64/media/", 0) != 0) { return CreateIntInt32Result(env, 0); }
    auto vDecSample = make_shared<VDecAPI11Sample>();
    vDecSample->inpDir = INP_DIR_1080_30;
    vDecSample->defaultWidth = MPEG4_DEFAULT_WIDTH;
    vDecSample->defaultHeight = MPEG4_DEFAULT_HEIGHT;
    vDecSample->defaultFrameRate = MPEG4_DEFAULT_FRAME_RATE;
    vDecSample->enbleBlankFrame = 1;
    vDecSample->sfOutput = false;
    if (vDecSample->RunVideoDec(g_codecNameMpeg4) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    vDecSample->WaitForEOS();
    if (vDecSample->errCount != 0) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}
