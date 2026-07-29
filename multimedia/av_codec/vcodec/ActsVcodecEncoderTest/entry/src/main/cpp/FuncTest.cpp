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
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include "videoenc_sample.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include "avcodec_codec_name.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "include/OhosCommonTest.h"
#include "SecureMemory.h"
#include <napi/native_api.h>

static OH_AVCodec *venc_ = nullptr;
static OH_AVFormat *format = nullptr;

namespace {
OH_AVCapability *cap = nullptr;
OH_AVCapability *cap_hevc = nullptr;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t DEFAULT_BITRATE = 1000000;
constexpr double DEFAULT_FRAME_RATE = 30.0;
constexpr uint32_t DEFAULT_QUALITY = 30;
constexpr uint32_t MAX_PROFILE_NUM = 3;
char g_codecName[CODEC_NAME_SIZE] = {};
char g_codecNameHEVC[CODEC_NAME_SIZE] = {};
const char *INP_DIR_720 = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
constexpr uint32_t SECOND = 1000;
constexpr uint32_t DEFAULT_WIDTH = 1280;
constexpr uint32_t DEFAULT_HEIGHT = 720;
constexpr uint32_t MAX_QUALITY = 100;
constexpr uint32_t NO_SUPPORT_MODE = 100;
constexpr uint32_t MAX_INSTANCES_HISI = 16;
constexpr uint32_t TEST_QUALITY_VALUE = 60;
constexpr uint32_t FRAME_RATE_60 = 60;
constexpr uint32_t SLEEP_TIME_US = 1000000;
constexpr uint32_t INVALID_INDEX = 9999999;
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static bool InitAVCCodecName()
{
    if (cap == nullptr) {
        cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    }
    if (cap == nullptr) {
        return false;
    }
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (tmpCodecName == nullptr) {
        return false;
    }
    if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName) + 1) != EOK) {
        return false;
    }
    return true;
}

static bool InitHEVCCodecName()
{
    if (cap_hevc == nullptr) {
        cap_hevc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    }
    if (cap_hevc == nullptr) {
        return false;
    }
    const char *tmpCodecNameHevc = OH_AVCapability_GetName(cap_hevc);
    if (tmpCodecNameHevc == nullptr) {
        return false;
    }
    if (SecureMemcpy(g_codecNameHEVC, sizeof(g_codecNameHEVC), tmpCodecNameHevc, strlen(tmpCodecNameHevc) + 1) != EOK) {
        return false;
    }
    return true;
}

static void TestSetUpTestCase()
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

void TestTearDownFunc()
{
    if (venc_ != NULL) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
}

static int TestIFrameIntervalConfig(const char *mimeType, int32_t intervalValue)
{
    venc_ = OH_VideoEncoder_CreateByMime(mimeType);
    if (venc_ == nullptr) { return -1; }
    
    format = OH_AVFormat_Create();
    if (format == nullptr) { return -1; }
    
    bool setResult = OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, intervalValue);
    if (setResult != true) { return -1; }
    
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVErrCode configResult = OH_VideoEncoder_Configure(venc_, format);
    if (configResult != AV_ERR_OK) { return -1; }
    
    OH_AVFormat_Destroy(format);
    format = nullptr;
    
    OH_VideoEncoder_Destroy(venc_);
    venc_ = nullptr;
    
    return 0;
}

static int TestProfileConfig(const char *mimeType, int32_t pixelFormat,
    int32_t profileValue, OH_AVErrCode expectedResult)
{
    venc_ = OH_VideoEncoder_CreateByMime(mimeType);
    if (venc_ == nullptr) { return -1; }
    format = OH_AVFormat_Create();
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profileValue);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat);
    if (OH_VideoEncoder_Configure(venc_, format) != expectedResult) { return -1; }
    OH_AVFormat_Destroy(format);
    format = nullptr;
    OH_VideoEncoder_Destroy(venc_);
    venc_ = nullptr;
    return 0;
}

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

napi_value VideoEncodeFunction0100Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction0300Test(napi_env env, napi_callback_info info)
{
    venc_ = OH_VideoEncoder_CreateByName("aabbccdd");
    if (venc_ != nullptr) { return CreateIntInt32Result(env, -1); }
    TestTearDownFunc();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeFunction0400Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (!InitAVCCodecName()) {
            return CreateIntInt32Result(env, -1);
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction0500Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (!InitAVCCodecName()) {
            return CreateIntInt32Result(env, -1);
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction0600Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (!InitAVCCodecName()) {
            return CreateIntInt32Result(env, -1);
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enableForceIDR = true;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction0700Test(napi_env env, napi_callback_info info)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        if (OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();
            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 1) != true) { return CreateIntInt32Result(env, -1); }
            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES,
                OH_ColorPrimary::COLOR_PRIMARY_BT709) != true) {
                return CreateIntInt32Result(env, -1);
            }
            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                                                    OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_LINEAR) != true) {
                return CreateIntInt32Result(env, -1);
            }
            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                                                    OH_MatrixCoefficient::MATRIX_COEFFICIENT_YCGCO) != true) {
                return CreateIntInt32Result(env, -1);
            }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction0800Test(napi_env env, napi_callback_info info)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        if (OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (pixelFormatNum > 0) {
            if(TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, SECOND) == -1) {
                return CreateIntInt32Result(env, -1);
            }
            if(TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, -1) == -1) {
                return CreateIntInt32Result(env, -1);
            }
            if(TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, 0) == -1) {
                return CreateIntInt32Result(env, -1);
            }
            if(TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, INT_MAX) == -1) {
                return CreateIntInt32Result(env, -1);
            }
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction0810Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        if(TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, SECOND) == -1) {
            return CreateIntInt32Result(env, -1);
        }
        if(TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, -1) == -1) {
            return CreateIntInt32Result(env, -1);
        }
        if(TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, 0) == -1) {
            return CreateIntInt32Result(env, -1);
        }
        if(TestIFrameIntervalConfig(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, INT_MAX) == -1) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction0900Test(napi_env env, napi_callback_info info)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        if (OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (pixelFormatNum > 0) {
            if (TestProfileConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0],
                AVC_PROFILE_BASELINE, AV_ERR_OK) == -1) {
                    return CreateIntInt32Result(env, -1);
                }
            if (TestProfileConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0],
                AVC_PROFILE_HIGH, AV_ERR_OK) == -1) {
                    return CreateIntInt32Result(env, -1);
                }
            if (TestProfileConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0],
                AVC_PROFILE_MAIN, AV_ERR_OK) == -1) {
                    return CreateIntInt32Result(env, -1);
                }
            if (TestProfileConfig(OH_AVCODEC_MIMETYPE_VIDEO_AVC, pixelFormat[0],
                AVC_PROFILE_MAIN + AVC_PROFILE_MAIN, AV_ERR_INVALID_VAL) == -1) {
                    return CreateIntInt32Result(env, -1);
                }
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction1000Test(napi_env env, napi_callback_info info)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        if (OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();

            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR) != true) {
                return CreateIntInt32Result(env, -1);
            }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction1100Test(napi_env env, napi_callback_info info)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        if (OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();
            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR) != true) {
                return CreateIntInt32Result(env, -1);
            }
            if (OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE) != true) {
                return CreateIntInt32Result(env, -1);
            }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
            return CreateIntInt32Result(env, 0);
        }
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction1400Test(napi_env env, napi_callback_info info)
{
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        if (OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (pixelFormatNum > 0) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();

            if (OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, FRAME_RATE_60) != true) {
                return CreateIntInt32Result(env, -1);
            }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction1600Test(napi_env env, napi_callback_info info)
{
    InitHEVCCodecName();
    if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CQ) != true) {
            return CreateIntInt32Result(env, -1);
        }
        if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, TEST_QUALITY_VALUE) != true) {
            return CreateIntInt32Result(env, -1);
        }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_YUVI420);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeFunction1700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        const char *tmpCodecName = OH_AVCapability_GetName(cap);
        if (tmpCodecName != nullptr && strlen(tmpCodecName) > 0) {
            if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName) + 1) != EOK) {
                return CreateIntInt32Result(env, -1);
            }
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->enable_random_eos = true;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction1800Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        if (!InitHEVCCodecName()) {
            return CreateIntInt32Result(env, -1);
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction2000Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        if (!InitHEVCCodecName()) {
            return CreateIntInt32Result(env, -1);
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/test.rgba";
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->DEFAULT_PIX_FMT = AV_PIXEL_FORMAT_RGBA;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeFunction1900Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        if (!InitHEVCCodecName()) {
            return CreateIntInt32Result(env, -1);
        }
        auto vEncSample = make_unique<VEncNdkSample>();
        vEncSample->INP_DIR = INP_DIR_720;
        vEncSample->DEFAULT_WIDTH = DEFAULT_WIDTH;
        vEncSample->DEFAULT_HEIGHT = DEFAULT_HEIGHT;
        vEncSample->DEFAULT_FRAME_RATE = DEFAULT_FRAME_RATE;
        vEncSample->SURF_INPUT = true;
        if (vEncSample->CreateVideoEncoder(g_codecNameHEVC) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->SetVideoEncoderCallback() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability0100Test(napi_env env, napi_callback_info info)
{
    const char *p = nullptr;
    if (OH_AVCodec_GetCapability(p, true) != nullptr) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability0200Test(napi_env env, napi_callback_info info)
{
    if (OH_AVCodec_GetCapability("", true) != nullptr) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability0300Test(napi_env env, napi_callback_info info)
{
    if (OH_AVCodec_GetCapability("notexist", true) != nullptr) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability0400Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true) == nullptr) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability0500Test(napi_env env, napi_callback_info info)
{
    if (OH_AVCodec_GetCapabilityByCategory("", true, HARDWARE) != nullptr) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}
napi_value VideoEncodeCapability9900Test(napi_env env, napi_callback_info info)
{
    if (OH_AVCodec_GetCapabilityByCategory(nullptr, true, HARDWARE) != nullptr) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability0600Test(napi_env env, napi_callback_info info)
{
    if (OH_AVCodec_GetCapabilityByCategory("notexist", true, HARDWARE) != nullptr) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability0700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE) == nullptr) {
            return CreateIntInt32Result(env, -1);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability0800Test(napi_env env, napi_callback_info info)
{
    if (OH_AVCapability_IsHardware(nullptr) != false) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability0900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_AVCapability_IsHardware(cap) != true) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability1000Test(napi_env env, napi_callback_info info)
{
    const char *name = OH_AVCapability_GetName(nullptr);
    if (nullptr == name) { return CreateIntInt32Result(env, -1); }
    if (0 != strlen(name)) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability1100Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        const char *name = OH_AVCapability_GetName(cap);
        if (nullptr == name) { return CreateIntInt32Result(env, -1); }
        if (0 >= strlen(name)) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability1200Test(napi_env env, napi_callback_info info)
{
    int32_t maxSupportedInstance = OH_AVCapability_GetMaxSupportedInstances(nullptr);
    if (0 != maxSupportedInstance) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability1300Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        string codecName = OH_AVCapability_GetName(cap);
        if (codecName == "OMX.hisi.video.encoder.avc") {
            if (OH_AVCapability_GetMaxSupportedInstances(cap) != MAX_INSTANCES_HISI) { return CreateIntInt32Result(env, -1); }
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability1310Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }

        string codecName = OH_AVCapability_GetName(cap);
        if (codecName == "OMX.hisi.video.encoder.hevc") {
            if (OH_AVCapability_GetMaxSupportedInstances(cap) != MAX_INSTANCES_HISI) { return CreateIntInt32Result(env, -1); }
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability1400Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetEncoderBitrateRange(nullptr, &range);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}


napi_value VideoEncodeCapability1500Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;

        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }

        ret = OH_AVCapability_GetEncoderBitrateRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability1700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderBitrateRange(cap, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        cout << "max val " << range.maxVal << "  min val " << range.minVal << endl;
        if (0 > range.minVal) { return CreateIntInt32Result(env, -1); }
        if (0 >= range.maxVal) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability1800Test(napi_env env, napi_callback_info info)
{
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(nullptr, BITRATE_MODE_CBR);
    if (isSupported != false) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability1900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_CBR);
        if (true != isSupported) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CBR);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability8400Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

        bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(cap, BITRATE_MODE_VBR);
        if (true != isSupported) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_VBR);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        format = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability8500Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVCapability *capa = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
        if (capa == nullptr) { return CreateIntInt32Result(env, -1); }
        if (!strcmp(g_codecNameHEVC, "OMX.hisi.video.encoder.hevc")) {
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();
            if (format == nullptr) { return CreateIntInt32Result(env, -1); }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
            (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, DEFAULT_QUALITY);
            bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capa, BITRATE_MODE_CQ);
            if (true != isSupported) { return CreateIntInt32Result(env, -1); }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, BITRATE_MODE_CQ);
            if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_Destroy(format);
            format = nullptr;
            OH_VideoEncoder_Destroy(venc_);
            venc_ = nullptr;
        } else {
            bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capa, BITRATE_MODE_CQ);
            if (false != isSupported) { return CreateIntInt32Result(env, -1); }
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability8600Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        (void)OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAME_RATE);
        (void)OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, DEFAULT_BITRATE);

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, NO_SUPPORT_MODE);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability2000Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetEncoderQualityRange(nullptr, &range);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability2100Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_AVCapability_GetEncoderQualityRange(nullptr, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability2200Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderQualityRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability2300Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderQualityRange(cap, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (0 != range.minVal) { return CreateIntInt32Result(env, -1); }
        if (MAX_QUALITY != range.maxVal) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability2400Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_AVCapability_GetEncoderComplexityRange(nullptr, nullptr);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability2500Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetEncoderComplexityRange(nullptr, &range);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability2700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderComplexityRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability2800Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetEncoderComplexityRange(cap, &range);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability3100Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthAlignment(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability3200Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoWidthAlignment(nullptr, &alignment);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability3300Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        int32_t alignment = 0;
        ret = OH_AVCapability_GetVideoWidthAlignment(cap, &alignment);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (0 > alignment) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability3400Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightAlignment(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability3500Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    int32_t alignment = 0;
    ret = OH_AVCapability_GetVideoHeightAlignment(nullptr, &alignment);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability3600Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        int32_t alignment = 0;
        ret = OH_AVCapability_GetVideoHeightAlignment(cap, &alignment);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (0 > alignment) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability3700Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(nullptr, DEFAULT_WIDTH, &range);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability3800Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, DEFAULT_WIDTH, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability3900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRangeForHeight(cap, 0, &range);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability4100Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(nullptr, DEFAULT_HEIGHT, &range);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability4200Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap, DEFAULT_HEIGHT, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability4300Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange range;
        SecureMemset(&range, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRangeForWidth(cap, 0, &range);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability4500Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoWidthRange(nullptr, &range);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability4600Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability4800Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    OH_AVRange range;
    ret = OH_AVCapability_GetVideoHeightRange(nullptr, &range);
    if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeCapability4900Test(napi_env env, napi_callback_info info)
{
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRange(cap, nullptr);
        if (ret != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeCapability9800Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        OH_AVRange widthRange;
        OH_AVRange heightRange;
        SecureMemset(&widthRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        SecureMemset(&heightRange, sizeof(OH_AVRange), 0, sizeof(OH_AVRange));
        if (cap == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoHeightRange(cap, &heightRange);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        ret = OH_AVCapability_GetVideoWidthRange(cap, &widthRange);
        if (ret != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeFunction0200Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap && InitAVCCodecName()) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        TestTearDownFunc();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

void InitFuncTest()
{
    TestSetUpTestCase();
}
