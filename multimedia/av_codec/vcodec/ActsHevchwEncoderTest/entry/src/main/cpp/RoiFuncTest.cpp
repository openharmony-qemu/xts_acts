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
#include <limits>
#include <unistd.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videobase.h>
#include "include/VideoencApi11Sample.h"
#include "include/CommonToolTest.h"
#include "include/RoiFuncTest.h"
#include "include/BframeFuncTest.h"
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ActsHevchwEncoderTestTag"

namespace {
OH_AVCodec *g_venc = nullptr;
OH_AVCapability *g_capHevc = nullptr;
OH_AVCapability *g_cap = nullptr;
const char *OUT_DIR = "/data/storage/el2/base/files/VIDEO_ENCODE_FILE_ROI.h265";
const char *CODEC_NAME = "";
const char *CODEC_HEVC = "";
constexpr int32_t SQR = 3; // CQ mode
constexpr uint32_t DEFAULT_WIDTH_1920 = 1920;
constexpr uint32_t DEFAULT_WIDTH_1080 = 1080;
constexpr uint32_t DEFAULT_HEIGHT_1080 = 1080;
constexpr uint32_t DEFAULT_HEIGHT_1920 = 1920;
} // namespace

namespace OHOS {
namespace Media {
class HwEncFuncRoiTest {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
    void InputFunc();
    void OutputFunc();
    void Release();
    int32_t Stop();

protected:
    static const char *INP_DIR_1920_30;
};


const char *INP_DIR_1920_30 = "/data/storage/el2/base/files/1920_1080_nv21.yuv";

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace RoiFuncTest {
void SetUpTestCase()
{
    g_cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (g_cap != nullptr) {
        CODEC_NAME = OH_AVCapability_GetName(g_cap);
        cout << "codecname: " << CODEC_NAME << endl;
    }
    g_capHevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (g_capHevc != nullptr) {
        CODEC_HEVC = OH_AVCapability_GetName(g_capHevc);
        cout << "codecname_hevc: " << CODEC_HEVC << endl;
    }
}
void TearDown()
{
    if (g_venc != NULL) {
        OH_VideoEncoder_Destroy(g_venc);
        g_venc = nullptr;
    }
    g_flagValue = true;
}
} // RoiFuncTest

napi_value VIDEO_HW_ENCODE_ROI_FUNC_001(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1920;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1080;
    vEncSample->roiInfo = "10,10-100,100=-8;100,1-200,200=-4;"
                  "300,350-430,440=-4;510,540-650,690=-4;"
                  "700,710-820,1000=-4";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->defaultBitrateMode = CBR;
    vEncSample->inpDir = INP_DIR_1920_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_002(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_VBR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1920;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1080;
    vEncSample->roiInfo = "440,1272-1080,1920=-51";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->defaultBitrateMode = VBR;
    vEncSample->inpDir = INP_DIR_1920_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_003(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "10,10-100,100=-4;100,100-200,200=-4;350,300-400,430=-4;540,510-690,650=51";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_004(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "0,0-500,500;500,500-600,600;600,500-700,600";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_005(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1920;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1080;
    vEncSample->roiInfo = "123456789123,123456789123-123456789-12345678912=-8";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1920_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_006(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "10,10-100,100=-8;100,10-200,200=-4;"
                    "300,350-430,440=-4;510,540-650,690=-4;"
                    "700,710-800,1000=-8";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->surfInput = true;
    vEncSample->defaultBitrateMode = CBR;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_007(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_VBR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "400,1272-1080,1920=-51";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->surfInput = true;
    vEncSample->defaultBitrateMode = VBR;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_008(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_CBR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "10,10-100,100=-4;100,100-200,200=-4;"
                    "350,300-400,430=-4;540,510-690,750=-8";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->surfInput = true;
    vEncSample->defaultBitrateMode = CBR;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_009(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "0,0-500,500;500,500-600,600;600,500-700,600";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->surfInput = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_010(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "123456789123,123456789123-123456789-12345678912=-8";
    vEncSample->outDir = OUT_DIR;
    vEncSample->surfInput = true;
    vEncSample->enableRoi = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_011(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_VBR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1920;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1080;
    vEncSample->roiInfo = "0,0-100,100=dqp:-6,slb:1";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->defaultBitrateMode = VBR;
    vEncSample->inpDir = INP_DIR_1920_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_012(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1920;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1080;
    vEncSample->roiInfo = "0,0-100,100=dqp:-6,slb:1;100,100-200,200=-10";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->inpDir = INP_DIR_1920_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_013(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1920;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1080;
    vEncSample->roiInfo = "0,0-100,100=slb:0";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->inpDir = INP_DIR_1920_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_014(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "0,0-100,100=dqp:-6";
    vEncSample->outDir = OUT_DIR;
    vEncSample->enableRoi = true;
    vEncSample->surfInput = true;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_015(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "0,0-100,100";
    vEncSample->outDir = OUT_DIR;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->CompleteRoiWorkflow(vEncSample->roiInfo) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_016(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "0,0-100,100=dqp:-6,slb:1";
    vEncSample->outDir = OUT_DIR;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->CompleteRoiWorkflow(vEncSample->roiInfo) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_017(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "0,0-100,100=dqp:-6,slb:1;100,100-200,200=dqp:-6;"
                    "200,200-300,300=slb:0;300,300-400,400";
    vEncSample->outDir = OUT_DIR;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->CompleteRoiWorkflow(vEncSample->roiInfo) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_FUNC_018(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(g_capHevc, BITRATE_MODE_SQR);
    if (!isSupported) { return CreateIntInt32Result(env, 0); }
    auto vEncSample = make_unique<VEncAPI11Sample>();
    vEncSample->defaultWidth = DEFAULT_WIDTH_1080;
    vEncSample->defaultHeight = DEFAULT_HEIGHT_1920;
    vEncSample->roiInfo = "0,0-100,100=-8;100,100-200,200=dqp:-6,slb:1";
    vEncSample->outDir = OUT_DIR;
    vEncSample->defaultBitrateMode = SQR;
    vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_NV12;
    vEncSample->inpDir = INP_DIR_1080_30;
    if (vEncSample->CreateVideoEncoder(CODEC_HEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    if (vEncSample->CompleteRoiWorkflow(vEncSample->roiInfo) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    vEncSample->WaitForEOS();
    if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_019(napi_env env, napi_callback_info info)
{
    OH_AVFormat *roiParam = OH_AVFormat_Create();
    if (roiParam == nullptr) { return CreateIntInt32Result(env, -1); }
    const char *roiString = "110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;"
                           "110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;"
                           "110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;110,110-120,120";
    char* roiStrCopy = strdup(roiString);
    int32_t top = 10;
    int32_t left = 10;
    int32_t bottom = 100;
    int32_t right = 100;
    int32_t dqp = -6;
    int32_t semLabel = OH_VIDEO_METADATA_ROI_SEM_LABEL_FACE;
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_TOP, top)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_LEFT, left)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_BOTTOM, bottom)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_RIGHT, right)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_DELTA_QP, dqp)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_SEM_LABEL, semLabel)) {
        return CreateIntInt32Result(env, -1);
    }
    OH_AVErrCode ret = OH_VideoMetadata_AppendRoiString(&roiStrCopy, roiParam);
    if (ret != AV_ERR_NO_MEMORY) { return CreateIntInt32Result(env, -1); }
    free(roiStrCopy);
    OH_AVFormat_Destroy(roiParam);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_020(napi_env env, napi_callback_info info)
{
    const char *roiString = "0,0-100,100=-8;100,100-200,200=dqp:-6,slb:1";
    char* roiStrCopy = strdup(roiString);
    OH_AVErrCode ret = OH_VideoMetadata_AppendRoiString(&roiStrCopy, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    free(roiStrCopy);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_021(napi_env env, napi_callback_info info)
{
    const char *roiString = "0,0-100,100=-8;100,100-200,200=dqp:-6,slb:1";
    OH_AVFormat *roiParam = OH_AVFormat_Create();
    char* roiStrCopy = strdup(roiString);
    if (roiParam == nullptr) {
        free(roiStrCopy);
        return CreateIntInt32Result(env, 0);
    }
    int32_t top = 10;
    int32_t left = 10;
    int32_t bottom = 100;
    int32_t right = 100;
    int32_t dqp = -6;
    int32_t semLabel = OH_VIDEO_METADATA_ROI_SEM_LABEL_FACE;
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_TOP, top)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_LEFT, left)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_BOTTOM, bottom)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_RIGHT, right)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_DELTA_QP, dqp)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_SEM_LABEL, semLabel)) {
        return CreateIntInt32Result(env, -1);
    }
    OH_AVErrCode ret = OH_VideoMetadata_AppendRoiString(&roiStrCopy, roiParam);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    free(roiStrCopy);
    OH_AVFormat_Destroy(roiParam);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_022(napi_env env, napi_callback_info info)
{
    uint32_t roiCount = 0;
    OH_AVErrCode ret = OH_VideoMetadata_GetRoiCount(nullptr, &roiCount);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_023(napi_env env, napi_callback_info info)
{
    const char *roiString = "0,0-100,100=-8;100,100-200,200=dqp:-6,slb:1";
    OH_AVErrCode ret = OH_VideoMetadata_GetRoiCount(roiString, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_024(napi_env env, napi_callback_info info)
{
    uint32_t roiCount = 0;
    int32_t capacity = 6;
    const char *roiString = "0,0-100,100=dqp:-6,slb:1";
    OH_AVFormat **roiFormats = (OH_AVFormat **)calloc(capacity, sizeof(OH_AVFormat *));
    OH_AVErrCode ret = OH_VideoMetadata_ParseRoiString(roiString, roiFormats, capacity, &roiCount);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    for (int32_t i = 0; i < capacity && i < roiCount; i++) {
        if (roiFormats[i]) {
            OH_AVFormat_Destroy(roiFormats[i]);
        }
    }
    free(roiFormats);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_025(napi_env env, napi_callback_info info)
{
    uint32_t *roiCount = nullptr;
    int32_t capacity = 6;
    OH_AVFormat **roiFormats = (OH_AVFormat **)calloc(capacity, sizeof(OH_AVFormat *));
    OH_AVErrCode ret = OH_VideoMetadata_ParseRoiString(nullptr, roiFormats, capacity, roiCount);
    if (ret == AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    free(roiFormats);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_026(napi_env env, napi_callback_info info)
{
    int32_t capacity = 6;
    const char *roiString = "0,0-100,100=dqp:-6,slb:1";
    OH_AVFormat **roiFormats = (OH_AVFormat **)calloc(capacity, sizeof(OH_AVFormat *));
    OH_AVErrCode ret = OH_VideoMetadata_ParseRoiString(roiString, roiFormats, capacity, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    free(roiFormats);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_027(napi_env env, napi_callback_info info)
{
    uint32_t *roiCount = nullptr;
    int32_t capacity = 100;
    const char *roiString = "0,0-100,100=dqp:-6,slb:1";
    OH_AVFormat **roiFormats = (OH_AVFormat **)calloc(capacity, sizeof(OH_AVFormat *));
    OH_AVErrCode ret = OH_VideoMetadata_ParseRoiString(roiString, nullptr, capacity, roiCount);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    free(roiFormats);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_028(napi_env env, napi_callback_info info)
{
    OH_AVFormat *roiParam = OH_AVFormat_Create();
    if (roiParam == nullptr) { return CreateIntInt32Result(env, 0); }
    int32_t top = 10;
    int32_t left = 10;
    int32_t bottom = 100;
    int32_t right = 100;
    int32_t dqp = -6;
    int32_t semLabel = OH_VIDEO_METADATA_ROI_SEM_LABEL_OTHER;
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_TOP, top)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_LEFT, left)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_BOTTOM, bottom)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_RIGHT, right)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_DELTA_QP, dqp)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_SEM_LABEL, semLabel)) {
        return CreateIntInt32Result(env, -1);
    }
    OH_AVFormat_Destroy(roiParam);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_029(napi_env env, napi_callback_info info)
{
    OH_AVFormat *roiParam = OH_AVFormat_Create();
    if (roiParam == nullptr) { return CreateIntInt32Result(env, 0); }
    OH_AVErrCode ret = OH_VideoMetadata_AppendRoiString(nullptr, roiParam);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    OH_AVFormat_Destroy(roiParam);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_030(napi_env env, napi_callback_info info)
{
    uint32_t roiCount = 0;
    const char *roiString = "0,0-100,100=-8;100,100-200,200=dqp:-6,slb:1";
    OH_AVErrCode ret = OH_VideoMetadata_GetRoiCount(roiString, &roiCount);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_031(napi_env env, napi_callback_info info)
{
    uint32_t roiCount = 0;
    const char *roiString = "";
    OH_AVErrCode ret = OH_VideoMetadata_GetRoiCount(roiString, &roiCount);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_032(napi_env env, napi_callback_info info)
{
    uint32_t roiCount = 0;
    int32_t capacity = 6;
    const char *roiString = "";
    OH_AVFormat **roiFormats = (OH_AVFormat **)calloc(capacity, sizeof(OH_AVFormat *));
    OH_AVErrCode ret = OH_VideoMetadata_ParseRoiString(roiString, roiFormats, capacity, &roiCount);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    for (int32_t i = 0; i < capacity && i < roiCount; i++) {
        if (roiFormats[i]) {
            OH_AVFormat_Destroy(roiFormats[i]);
        }
    }
    free(roiFormats);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_033(napi_env env, napi_callback_info info)
{
    OH_AVFormat *roiParam = OH_AVFormat_Create();
    if (roiParam == nullptr) { return CreateIntInt32Result(env, -1); }
    const char *roiString = "110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;"
                           "110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;"
                           "110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,1";
    char* roiStrCopy = strdup(roiString);
    int32_t top = 10;
    int32_t left = 10;
    int32_t bottom = 100;
    int32_t right = 100;
    int32_t dqp = -6;
    int32_t semLabel = OH_VIDEO_METADATA_ROI_SEM_LABEL_FACE;
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_TOP, top)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_LEFT, left)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_BOTTOM, bottom)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_RIGHT, right)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_DELTA_QP, dqp)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_SEM_LABEL, semLabel)) {
        return CreateIntInt32Result(env, -1);
    }
    OH_AVErrCode ret = OH_VideoMetadata_AppendRoiString(&roiStrCopy, roiParam);
    if (ret != AV_ERR_NO_MEMORY) { return CreateIntInt32Result(env, -1); }
    free(roiStrCopy);
    OH_AVFormat_Destroy(roiParam);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_034(napi_env env, napi_callback_info info)
{
    OH_AVFormat *roiParam = OH_AVFormat_Create();
    if (roiParam == nullptr) { return CreateIntInt32Result(env, -1); }
    const char *roiString = "110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;"
                           "110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;"
                           "110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,slb:0;110,110-120,120=dqp:-5,12";
    char* roiStrCopy = strdup(roiString);
    int32_t top = 10;
    int32_t left = 10;
    int32_t bottom = 100;
    int32_t right = 100;
    int32_t dqp = -6;
    int32_t semLabel = OH_VIDEO_METADATA_ROI_SEM_LABEL_FACE;
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_TOP, top)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_LEFT, left)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_BOTTOM, bottom)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_RIGHT, right)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_DELTA_QP, dqp)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_SEM_LABEL, semLabel)) {
        return CreateIntInt32Result(env, -1);
    }
    OH_AVErrCode ret = OH_VideoMetadata_AppendRoiString(&roiStrCopy, roiParam);
    if (ret != AV_ERR_NO_MEMORY) { return CreateIntInt32Result(env, -1); }
    free(roiStrCopy);
    OH_AVFormat_Destroy(roiParam);
    return CreateIntInt32Result(env, 0);
}

napi_value VIDEO_HW_ENCODE_ROI_API_035(napi_env env, napi_callback_info info)
{
    const char *roiString = "";
    OH_AVFormat *roiParam = OH_AVFormat_Create();
    char* roiStrCopy = strdup(roiString);
    if (roiParam == nullptr) {
        free(roiStrCopy);
        return CreateIntInt32Result(env, 0);
    }
    int32_t top = 10;
    int32_t left = 10;
    int32_t bottom = 100;
    int32_t right = 100;
    int32_t dqp = -6;
    int32_t semLabel = OH_VIDEO_METADATA_ROI_SEM_LABEL_FACE;
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_TOP, top)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_LEFT, left)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_BOTTOM, bottom)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_RIGHT, right)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_DELTA_QP, dqp)) {
        return CreateIntInt32Result(env, -1);
    }
    if (!OH_AVFormat_SetIntValue(roiParam, OH_MD_KEY_VIDEO_METADATA_ROI_SEM_LABEL, semLabel)) {
        return CreateIntInt32Result(env, -1);
    }
    OH_AVErrCode ret = OH_VideoMetadata_AppendRoiString(&roiStrCopy, roiParam);
    if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
    free(roiStrCopy);
    OH_AVFormat_Destroy(roiParam);
    return CreateIntInt32Result(env, 0);
}

} // namespace Media
} // namespace OHOS
