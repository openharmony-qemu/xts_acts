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
#include <napi/native_api.h>

static OH_AVCodec *venc_ = nullptr;

namespace {
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
const char *INP_DIR_720 = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr double DEFAULT_FRAME_RATE = 30.0;
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

void TestTearDownGetparam()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
}

static void SetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != EOK) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname: " << g_codecName << endl;
    cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc)) != EOK) {
        cout << "memcpy failed" << endl;
    }
    cout << "codecname_hevc: " << g_codecNameHEVC << endl;
}
static void TearDownTestCase() {}
static void SetUp() {}
static void TearDown()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
}

napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

napi_value VideoEncodeMseQp0100Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE = DEFAULT_BITRATE;
        vEncSample->getQpMse = true;
        vEncSample->SURF_INPUT = false;
        vEncSample->OUT_DIR = "/data/test/media/qp_mse_0100.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeMseQp0200Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE = DEFAULT_BITRATE;
        vEncSample->getQpMse = true;
        vEncSample->SURF_INPUT = true;
        vEncSample->OUT_DIR = "/data/test/media/qp_mse_0200.h265";
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeMseQp0300Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE = DEFAULT_BITRATE;
        vEncSample->getQpMse = true;
        vEncSample->SURF_INPUT = false;
        vEncSample->OUT_DIR = "/data/test/media/qp_mse_0300.h265";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeMseQp0400Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_BITRATE = DEFAULT_BITRATE;
        vEncSample->getQpMse = true;
        vEncSample->SURF_INPUT = true;
        vEncSample->OUT_DIR = "/data/test/media/qp_mse_0400.h265";
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeRepeat0100Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_BITRATE_MODE = CBR;
        vEncSample->SURF_INPUT = true;
        vEncSample->enableRepeat = true;
        vEncSample->setMaxCount = true;
        vEncSample->DEFAULT_FRAME_AFTER = 0;
        vEncSample->DEFAULT_MAX_COUNT = -1;

        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        vEncSample->Release();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

static int32_t PreparePreProcess0100Sample(VEncAPI11Sample *vEncSample)
{
    vEncSample->runDualEncoder = true;
    vEncSample->INP_DIR = INP_DIR_720;
    vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0010_1.h264";
    vEncSample->OUT_DIR_SEC = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0010_2.h264";
    if (vEncSample->CreatePrimaryEncoder(OH_AVCODEC_MIMETYPE_VIDEO_AVC) != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->CreateSecondaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

static int32_t ConfigureSecondaryEncoderPreProcess0100(VEncAPI11Sample *vEncSample)
{
    vEncSample->SURF_INPUT = false;
    vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
    vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
    if (vEncSample->SwitchSecondaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    constexpr int32_t encDownsamplingWidth = 640;
    constexpr int32_t encDownsamplingHeight = 360;
    vEncSample->preProcessParameter.configEnable = true;
    vEncSample->preProcessParameter.enableDownsampling = true;
    vEncSample->preProcessParameter.downsamplingWidth = encDownsamplingWidth;
    vEncSample->preProcessParameter.downsamplingHeight = encDownsamplingHeight;
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->SetDualCallback() != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

static int32_t ConfigurePrimaryEncoderPreProcess0100(VEncAPI11Sample *vEncSample)
{
    vEncSample->SURF_INPUT = true;
    constexpr int32_t encDownWidth = 380;
    constexpr int32_t encDownHeight = 200;
    vEncSample->preProcessParameter.downsamplingWidth = encDownWidth;
    vEncSample->preProcessParameter.downsamplingHeight = encDownHeight;
    if (vEncSample->SwitchPrimaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->SetDualCallback() != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

static int32_t StartAndFinishPreProcess0100(VEncAPI11Sample *vEncSample)
{
    if (vEncSample->StartSecondaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) {
        return -1;
    }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

napi_value PreProcess0100(napi_env env, napi_callback_info info)
{
    if (cap == nullptr || !OH_AVCapability_IsFeatureSupported(cap, VIDEO_ENCODER_PREPROC_DOWNSAMPLING)) {
        return CreateIntInt32Result(env, 0);
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    if (PreparePreProcess0100Sample(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (ConfigureSecondaryEncoderPreProcess0100(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (ConfigurePrimaryEncoderPreProcess0100(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (StartAndFinishPreProcess0100(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    vEncSample->Release();
    return CreateIntInt32Result(env, 0);
}

static int32_t PreparePreProcess0200Sample(VEncAPI11Sample *vEncSample)
{
    vEncSample->runDualEncoder = true;
    vEncSample->INP_DIR = INP_DIR_720;
    vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0020_1.h265";
    vEncSample->OUT_DIR_SEC = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0020_2.h265";
    if (vEncSample->CreatePrimaryEncoder(OH_AVCODEC_MIMETYPE_VIDEO_HEVC) != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->CreateSecondaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

static int32_t ConfigureSecondaryEncoderPreProcess0200(VEncAPI11Sample *vEncSample)
{
    vEncSample->SURF_INPUT = false;
    vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
    vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
    if (vEncSample->SwitchSecondaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    constexpr int32_t encCropLeft = 100;
    constexpr int32_t encCropRight = 1199;
    constexpr int32_t encCropTop = 100;
    constexpr int32_t encCropBottom = 699;
    vEncSample->preProcessParameter.configEnable = true;
    vEncSample->preProcessParameter.enableCrop = true;
    vEncSample->preProcessParameter.cropLeft = encCropLeft;
    vEncSample->preProcessParameter.cropRight = encCropRight;
    vEncSample->preProcessParameter.cropTop = encCropTop;
    vEncSample->preProcessParameter.cropBottom = encCropBottom;
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->SetDualCallback() != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

static int32_t ConfigurePrimaryEncoderPreProcess0200(VEncAPI11Sample *vEncSample)
{
    vEncSample->SURF_INPUT = true;
    constexpr int32_t encCropLeft = 50;
    constexpr int32_t encCropRight = 999;
    constexpr int32_t encCropTop = 0;
    constexpr int32_t encCropBottom = 499;
    vEncSample->preProcessParameter.enableCrop = true;
    vEncSample->preProcessParameter.cropLeft = encCropLeft;
    vEncSample->preProcessParameter.cropRight = encCropRight;
    vEncSample->preProcessParameter.cropTop = encCropTop;
    vEncSample->preProcessParameter.cropBottom = encCropBottom;
    if (vEncSample->SwitchPrimaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->SetDualCallback() != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

static int32_t StartAndFinishPreProcess0200(VEncAPI11Sample *vEncSample)
{
    if (vEncSample->StartSecondaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) {
        return -1;
    }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

napi_value PreProcess0200(napi_env env, napi_callback_info info)
{
    if (cap_hevc == nullptr || !OH_AVCapability_IsFeatureSupported(cap_hevc, VIDEO_ENCODER_PREPROC_CROP)) {
        return CreateIntInt32Result(env, 0);
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    if (PreparePreProcess0200Sample(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (ConfigureSecondaryEncoderPreProcess0200(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (ConfigurePrimaryEncoderPreProcess0200(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (StartAndFinishPreProcess0200(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    vEncSample->Release();
    return CreateIntInt32Result(env, 0);
}

static int32_t PreparePreProcess0300Sample(VEncAPI11Sample *vEncSample)
{
    vEncSample->runDualEncoder = true;
    vEncSample->INP_DIR = INP_DIR_720;
    vEncSample->OUT_DIR = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0030_1.h264";
    vEncSample->OUT_DIR_SEC = "/data/storage/el2/base/files/media/VIDEO_ENCODE_PRE_PROCESS_0030_2.h264";
    if (vEncSample->CreatePrimaryEncoder(OH_AVCODEC_MIMETYPE_VIDEO_AVC) != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->CreateSecondaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

static int32_t ConfigureSecondaryEncoderPreProcess0300(VEncAPI11Sample *vEncSample)
{
    vEncSample->SURF_INPUT = false;
    vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
    vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
    if (vEncSample->SwitchSecondaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    constexpr double encDropFrameRate = 25.57;
    vEncSample->preProcessParameter.configEnable = true;
    vEncSample->preProcessParameter.enableDFrame = true;
    vEncSample->preProcessParameter.dropFrameRate = encDropFrameRate;
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->SetDualCallback() != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

static int32_t ConfigurePrimaryEncoderPreProcess0300(VEncAPI11Sample *vEncSample)
{
    vEncSample->SURF_INPUT = true;
    constexpr double encDropFrameNum = 15.89;
    vEncSample->preProcessParameter.enableDFrame = true;
    vEncSample->preProcessParameter.dropFrameRate = encDropFrameNum;
    if (vEncSample->SwitchPrimaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->SetDualCallback() != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

static int32_t StartAndFinishPreProcess0300(VEncAPI11Sample *vEncSample)
{
    if (vEncSample->StartSecondaryEncoder() != AV_ERR_OK) {
        return -1;
    }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) {
        return -1;
    }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

napi_value PreProcess0300Test(napi_env env, napi_callback_info info)
{
    if (cap == nullptr || !OH_AVCapability_IsFeatureSupported(cap, VIDEO_ENCODER_PREPROC_DOWNSAMPLING)) {
        return CreateIntInt32Result(env, 0);
    }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    if (PreparePreProcess0300Sample(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (ConfigureSecondaryEncoderPreProcess0300(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (ConfigurePrimaryEncoderPreProcess0300(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    if (StartAndFinishPreProcess0300(vEncSample.get()) != AV_ERR_OK) {
        return CreateIntInt32Result(env, -1);
    }
    vEncSample->Release();
    return CreateIntInt32Result(env, 0);
}

void InitGetparamTest()
{
    SetUpTestCase();
}