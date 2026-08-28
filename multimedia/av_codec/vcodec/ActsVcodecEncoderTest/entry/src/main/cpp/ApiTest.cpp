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
#include <hilog/log.h>

#include "include/OhosCommonTest.h"
#include "include/SecureMemory.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include "videoenc_sample.h"
#include <multimedia/player_framework/native_avcapability.h>
#include "videoenc_api11_sample.h"
#include <napi/native_api.h>
using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x0000
#define LOG_TAG "VCodecEncoderTest123"

static OH_AVCodec *venc_ = nullptr;
static OH_AVFormat *format = nullptr;

namespace {
constexpr uint32_t VIDEO_WIDTH_1080P = 1920;
constexpr uint32_t VIDEO_HEIGHT_1080P = 1080;
constexpr uint32_t DEFAULT_WIDTH = VIDEO_WIDTH_1080P;
constexpr uint32_t DEFAULT_HEIGHT = VIDEO_HEIGHT_1080P;
constexpr uint32_t CODEC_NAME_SIZE = 128;
constexpr uint32_t SLEEP_TIME_1S_US = 1000000;
constexpr uint32_t QUALITY_INVALID_101 = 101;
constexpr uint32_t BITRATE_100K = 100000;
constexpr uint32_t INVALID_INDEX_LARGE = 9999999;
constexpr uint32_t INVALID_INDEX_99999 = 99999;
char g_codecName[CODEC_NAME_SIZE] = {};
OH_AVCapability *cap = nullptr;
OHOS::Media::VEncSignal *signal_ = nullptr;

static void TestSetUpTestCase()
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap == nullptr) {
    } else {
    }
    const char *tmpCodecName = OH_AVCapability_GetName(cap);
    if (tmpCodecName != nullptr) {
        if (SecureMemcpy(g_codecName, sizeof(g_codecName), tmpCodecName, strlen(tmpCodecName)) != EOK) {
            cout << "memcpy failed" << endl;
        }
    } else {
    }
    cout << "codecname: " << g_codecName << endl;
}

void onError(OH_AVCodec *codec, int32_t errorCode, void *userData)
{
    cout << "Error errorCode=" << errorCode << endl;
};

void onStreamChanged(OH_AVCodec *codec, OH_AVFormat *fmt, void *userData)
{
    cout << "stream Changed" << endl;
};

void onNeedInputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, void *userData)
{
    VEncSignal *signal = static_cast<VEncSignal *>(userData);
    if (signal == nullptr) {
        return;
    }
    unique_lock<mutex> lock(signal->inMutex_);
    signal->inIdxQueue_.push(index);
    signal->inBufferQueue_.push(data);
    signal->inCond_.notify_all();
    cout << "need input data" << endl;
}

void onNewOutputData(OH_AVCodec *codec, uint32_t index, OH_AVMemory *data, OH_AVCodecBufferAttr *attr, void *userData)
{
    cout << "output data" << endl;
    VEncSignal *signal = static_cast<VEncSignal *>(userData);
    if (signal == nullptr) {
        return;
    }
    unique_lock<mutex> lock(signal->outMutex_);
    signal->outIdxQueue_.push(index);
    signal->attrQueue_.push(*attr);
    signal->outBufferQueue_.push(data);
    signal->outCond_.notify_all();
}
} // namespace

void TestTearDownApi()
{
    if (venc_ != nullptr) {
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
    }
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
        format = nullptr;
    }
}

static napi_value CreateIntInt32Result(napi_env env, int32_t value)
{
    napi_value result;
    napi_create_int32(env, value, &result);
    return result;
}

napi_value VideoEncodeIllegalPara0100Test(napi_env env, napi_callback_info info)
{
    venc_ = OH_VideoEncoder_CreateByMime(nullptr);
    if (venc_ != nullptr) { return CreateIntInt32Result(env, -1); }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara0200Test(napi_env env, napi_callback_info info)
{
    venc_ = OH_VideoEncoder_CreateByMime("");
    if (venc_ != nullptr) { return CreateIntInt32Result(env, -1); }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara0300Test(napi_env env, napi_callback_info info)
{
    venc_ = OH_VideoEncoder_CreateByName(nullptr);
    if (venc_ != nullptr) { return CreateIntInt32Result(env, -1); }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara0400Test(napi_env env, napi_callback_info info)
{
    venc_ = OH_VideoEncoder_CreateByName("");
    if (venc_ != nullptr) { return CreateIntInt32Result(env, -1); }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara0500Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Destroy(nullptr);
    if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara0600Test(napi_env env, napi_callback_info info)
{
    OH_AVCodecAsyncCallback cb_;
    cb_.onError = onError;
    cb_.onStreamChanged = onStreamChanged;
    cb_.onNeedInputData = onNeedInputData;
    cb_.onNeedOutputData = onNewOutputData;

    if (OH_VideoEncoder_SetCallback(nullptr, cb_, static_cast<void *>(signal_)) != AV_ERR_INVALID_VAL) {
        return CreateIntInt32Result(env, -1);
    }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara0700Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }

        OH_AVCodecAsyncCallback cb2_;
        cb2_.onError = nullptr;
        cb2_.onStreamChanged = nullptr;
        cb2_.onNeedInputData = nullptr;
        cb2_.onNeedOutputData = nullptr;
        if (OH_VideoEncoder_SetCallback(venc_, cb2_, static_cast<void *>(signal_)) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeIllegalPara0800Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        OH_AVCodecAsyncCallback cb_;
        cb_.onError = onError;
        cb_.onStreamChanged = onStreamChanged;
        cb_.onNeedInputData = onNeedInputData;
        cb_.onNeedOutputData = onNewOutputData;
        if (OH_VideoEncoder_SetCallback(venc_, cb_, nullptr) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeIllegalPara0900Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoEncoder_Configure(venc_, nullptr);
        if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeIllegalPara1100Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_BITRATE, BITRATE_100K);
        ret = OH_VideoEncoder_Configure(venc_, format);
        if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeIllegalPara1400Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Start(nullptr);
    if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara1500Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Stop(nullptr);
    if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara1600Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Flush(nullptr);
    if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara1700Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_Reset(nullptr);
    if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara1800Test(napi_env env, napi_callback_info info)
{
    format = OH_VideoEncoder_GetOutputDescription(nullptr);
    if (nullptr != format) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara1900Test(napi_env env, napi_callback_info info)
{
    venc_ = OH_VideoEncoder_CreateByName(g_codecName);
    if (OH_VideoEncoder_SetParameter(venc_, nullptr) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara2000Test(napi_env env, napi_callback_info info)
{
    format = OH_AVFormat_Create();
    if (format == nullptr) { return CreateIntInt32Result(env, -1); }
    (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    if (OH_VideoEncoder_SetParameter(nullptr, format) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara2100Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoEncoder_GetSurface(venc_, nullptr);
        if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeIllegalPara2200Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_FreeOutputData(nullptr, 0);
    if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara2300Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        if (OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (pixelFormatNum > 0) {
            OH_AVErrCode ret = AV_ERR_OK;
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();
            if (format == nullptr) { return CreateIntInt32Result(env, -1); }
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_HEIGHT);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            ret = OH_VideoEncoder_Configure(venc_, format);
            if (AV_ERR_OK != ret) { return CreateIntInt32Result(env, -1); }
            if (OH_VideoEncoder_Start(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            usleep(SLEEP_TIME_1S_US);
            ret = OH_VideoEncoder_FreeOutputData(venc_, INVALID_INDEX_LARGE);
            if (AV_ERR_INVALID_STATE != ret) { return CreateIntInt32Result(env, -1); }
            TestTearDownApi();
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeIllegalPara2400Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_NotifyEndOfStream(nullptr);
    if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}
napi_value VideoEncodeIllegalPara2500Test(napi_env env, napi_callback_info info)
{
    OH_AVErrCode ret = AV_ERR_OK;
    ret = OH_VideoEncoder_NotifyEndOfStream(nullptr);
    if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara2600Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_AVCodecBufferAttr attr;
        attr.pts = -1;
        attr.size = -1;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

        if (OH_VideoEncoder_PushInputData(venc_, 0, attr) !=
        AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeIllegalPara2700Test(napi_env env, napi_callback_info info)
{
    OH_AVCodecBufferAttr attr;
    attr.pts = 0;
    attr.size = 0;
    attr.offset = 0;
    attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    if (OH_VideoEncoder_PushInputData(nullptr, 0, attr) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeIllegalPara2800Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_AVCodecBufferAttr attr;
        attr.pts = 0;
        attr.size = 0;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        if (OH_VideoEncoder_PushInputData(nullptr, INVALID_INDEX_99999, attr) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeIllegalPara2900Test(napi_env env, napi_callback_info info)
{
    if (OH_VideoEncoder_GetInputDescription(nullptr) != nullptr) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeApi0100Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (nullptr == venc_) { return CreateIntInt32Result(env, -1); }
        OH_AVCodec *venc_2 = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (nullptr == venc_2) { return CreateIntInt32Result(env, -1); }
        OH_VideoEncoder_Destroy(venc_2);
        venc_2 = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi3100Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (nullptr == venc_) { return CreateIntInt32Result(env, -1); }
        OH_AVCodec *venc_2 = OH_VideoEncoder_CreateByName(g_codecName);
        if (nullptr == venc_2) { return CreateIntInt32Result(env, -1); }
        OH_VideoEncoder_Destroy(venc_2);
        venc_2 = nullptr;
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi0200Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }

        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi0300Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }

        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Start(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Start(venc_) != AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi0400Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }

        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Start(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Stop(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Stop(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi0500Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Start(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Stop(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Reset(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Reset(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeApi0600Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        signal_ = new VEncSignal();
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        OH_AVCodecAsyncCallback cb_;
        cb_.onError = onError;
        cb_.onStreamChanged = onStreamChanged;
        cb_.onNeedInputData = onNeedInputData;
        cb_.onNeedOutputData = onNewOutputData;
        if (OH_VideoEncoder_SetCallback(venc_, cb_, static_cast<void *>(signal_)) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }

        if (OH_VideoEncoder_Start(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        unique_lock<mutex> lock(signal_->inMutex_);
        signal_->inCond_.wait(lock, [] { return signal_->inIdxQueue_.size() > 1; });
        uint32_t index = signal_->inIdxQueue_.front();
        OH_AVCodecBufferAttr attr;
        attr.pts = 0;
        attr.size = 0;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;

        if (OH_VideoEncoder_PushInputData(venc_, index, attr) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        signal_->inIdxQueue_.pop();
        index = signal_->inIdxQueue_.front();
        if (OH_VideoEncoder_PushInputData(venc_, index, attr) !=
        AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        signal_->inIdxQueue_.pop();
        lock.unlock();
        OH_VideoEncoder_Stop(venc_);
        OH_VideoEncoder_Destroy(venc_);
        venc_ = nullptr;
        delete signal_;
        signal_ = nullptr;
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi0700Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Start(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Flush(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Flush(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi0800Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }

        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Start(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Stop(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Destroy(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        venc_ = nullptr;
        if (OH_VideoEncoder_Destroy(venc_) != AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi0900Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (nullptr == venc_) { return CreateIntInt32Result(env, -1); }
        OH_AVCodec *venc_2 = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (nullptr == venc_2) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_Destroy(venc_2) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        venc_2 = nullptr;
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi1000Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (nullptr == venc_) { return CreateIntInt32Result(env, -1); }
        OH_AVCodecAsyncCallback cb_;
        cb_.onError = onError;
        cb_.onStreamChanged = onStreamChanged;
        cb_.onNeedInputData = onNeedInputData;
        cb_.onNeedOutputData = onNewOutputData;
        if (OH_VideoEncoder_SetCallback(venc_, cb_, nullptr) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_SetCallback(venc_, cb_, nullptr) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi1100Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (nullptr == venc_) { return CreateIntInt32Result(env, -1); }
        format = OH_VideoEncoder_GetOutputDescription(venc_);
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        format = OH_VideoEncoder_GetOutputDescription(venc_);
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi1200Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }

        format = OH_AVFormat_Create();
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }

        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
        (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);

        if (OH_VideoEncoder_SetParameter(venc_, format) !=
        AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_SetParameter(venc_, format) !=
        AV_ERR_INVALID_STATE) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi1300Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        venc_ = OH_VideoEncoder_CreateByName(g_codecName);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        format = OH_VideoEncoder_GetInputDescription(venc_);
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_AVFormat_Destroy(format);
        format = OH_VideoEncoder_GetInputDescription(venc_);
        if (format == nullptr) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi1400Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
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
            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CQ) != true) {
                return CreateIntInt32Result(env, -1);
            }
            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, QUALITY_INVALID_101) != true) {
                return CreateIntInt32Result(env, -1);
            }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            if (OH_VideoEncoder_Configure(venc_, format) !=
            AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
            TestTearDownApi();
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApi1410Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
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
            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CQ) != true) {
                return CreateIntInt32Result(env, -1);
            }
            if (OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, -1) !=
            true) { return CreateIntInt32Result(env, -1); }
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            if (OH_VideoEncoder_Configure(venc_, format) !=
            AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
            TestTearDownApi();
            return CreateIntInt32Result(env, 0);
        }
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeSyncApi0010Test(napi_env env, napi_callback_info info)
{
    uint32_t index;
    if (OH_VideoEncoder_QueryInputBuffer(nullptr, &index, -1) !=
    AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSyncApi0020Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        if (OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (pixelFormatNum > 0) {
            uint32_t index;
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
            if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (OH_VideoEncoder_Prepare(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (OH_VideoEncoder_Start(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (OH_VideoEncoder_QueryInputBuffer(venc_, &index, INT64_MAX) !=
            AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            TestTearDownApi();
            return CreateIntInt32Result(env, 0);
        }
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSyncApi0030Test(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    const int32_t *pixelFormat = nullptr;
    uint32_t pixelFormatNum = 0;
    if (cap) {
        if (OH_AVCapability_GetVideoSupportedPixelFormats(cap, &pixelFormat, &pixelFormatNum) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (pixelFormatNum > 0) {
            uint32_t index;
            venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
            if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
            format = OH_AVFormat_Create();
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, pixelFormat[0]);
            (void)OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1);
            if (OH_VideoEncoder_Configure(venc_, format) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (OH_VideoEncoder_Prepare(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (OH_VideoEncoder_Start(venc_) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            if (OH_VideoEncoder_QueryInputBuffer(venc_, &index, INT64_MIN) !=
            AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
            TestTearDownApi();
            return CreateIntInt32Result(env, 0);
        }
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSyncApi0040Test(napi_env env, napi_callback_info info)
{
    if (OH_VideoEncoder_GetInputBuffer(nullptr, 1) != nullptr) { return CreateIntInt32Result(env, -1); }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSyncApi0050Test(napi_env env, napi_callback_info info)
{
    uint32_t index;
    if (OH_VideoEncoder_QueryOutputBuffer(nullptr, &index, -1) !=
    AV_ERR_INVALID_VAL) { return CreateIntInt32Result(env, -1); }
    TestTearDownApi();
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSyncApi0060Test(napi_env env, napi_callback_info info)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncOutputWaitTime = INT64_MAX;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSyncApi0070Test(napi_env env, napi_callback_info info)
{
    if (cap != nullptr) {
        auto vEncSample = make_unique<VEncAPI11Sample>();
        vEncSample->INP_DIR = "/data/storage/el2/base/files/media/1280_720_nv.yuv";
        vEncSample->enbleSyncMode = 1;
        vEncSample->syncOutputWaitTime = INT64_MIN;
        if (vEncSample->CreateVideoEncoder(g_codecName) != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->ConfigureVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        if (vEncSample->StartVideoEncoder() != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->WaitForEOS();
        if (vEncSample->errCount != AV_ERR_OK) { return CreateIntInt32Result(env, -1); }
        vEncSample->Release();
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeSyncApi0080Test(napi_env env, napi_callback_info info)
{
    if (OH_VideoEncoder_GetOutputBuffer(nullptr, 1) != nullptr) { return CreateIntInt32Result(env, -1); }
    return CreateIntInt32Result(env, 0);
}

napi_value VideoEncodeApiAdd0010(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoEncoder_FreeOutputData(venc_, -1);
        if (AV_ERR_INVALID_STATE != ret) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiAdd0020(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_AVCodecBufferAttr attr;
        attr.pts = -1;
        attr.size = -1;
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        ret = OH_VideoEncoder_PushInputData(venc_, -1, attr);
        if (AV_ERR_INVALID_VAL != ret) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiAdd0030(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoEncoder_PushInputBuffer(venc_, -1);
        if (AV_ERR_INVALID_STATE != ret) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiAdd0040(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoEncoder_PushInputParameter(venc_, -1);
        if (AV_ERR_OPERATE_NOT_PERMIT != ret) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiAdd0050(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVErrCode ret = AV_ERR_OK;
        venc_ = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
        if (venc_ == nullptr) { return CreateIntInt32Result(env, -1); }
        ret = OH_VideoEncoder_FreeOutputBuffer(venc_, -1);
        if (AV_ERR_INVALID_STATE != ret) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiDual0100(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        const char *mime = nullptr;
        OH_AVCodec *vencCodec = nullptr;
        if (OH_VideoEncoder_CreatePrimaryWithPreproc(mime, &vencCodec) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        if (vencCodec != nullptr) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiDual0200(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVCodec *vencCodec = nullptr;
        if (OH_VideoEncoder_CreatePrimaryWithPreproc(OH_AVCODEC_MIMETYPE_VIDEO_AVC, &vencCodec) != AV_ERR_OK) {
            return CreateIntInt32Result(env, -1);
        }
        if (vencCodec == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_VideoEncoder_Destroy(vencCodec);
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiDual0300(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVCodec *primaryVencCodec = nullptr;
        OH_AVCodec *vencCodec = nullptr;
        if (OH_VideoEncoder_CreateSecondaryFromPrimary(primaryVencCodec, &vencCodec) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        if (vencCodec != nullptr) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiDual0400(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVCodec *primaryVencCodec = nullptr;
        if (OH_VideoEncoder_CreatePrimaryWithPreproc(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, &primaryVencCodec) != AV_ERR_OK) {
                return CreateIntInt32Result(env, -1);
            }
        if (primaryVencCodec == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_AVCodec *vencCodec = nullptr;
        if (OH_VideoEncoder_CreateSecondaryFromPrimary(
            primaryVencCodec, &vencCodec) != AV_ERR_OK) {
                return CreateIntInt32Result(env, -1);
            }
        if (vencCodec == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_VideoEncoder_Destroy(vencCodec);
        OH_VideoEncoder_Destroy(primaryVencCodec);
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiDual0500(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        const char *mime = nullptr;
        OH_AVCodec *vencCodec = nullptr;
        if (OH_VideoEncoder_CreatePrimaryWithPreproc(nullptr, &vencCodec) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        if (vencCodec != nullptr) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiDual0600(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        OH_AVCodec *primaryVencCodec = nullptr;
        if (OH_VideoEncoder_CreatePrimaryWithPreproc(
            OH_AVCODEC_MIMETYPE_VIDEO_AVC, &primaryVencCodec) != AV_ERR_OK) {
                return CreateIntInt32Result(env, -1);
            }
        if (primaryVencCodec == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_AVCodec *secondaryVencCodec = nullptr;
        if (OH_VideoEncoder_CreateSecondaryFromPrimary(
            primaryVencCodec, &secondaryVencCodec) != AV_ERR_OK) {
                return CreateIntInt32Result(env, -1);
            }
        if (secondaryVencCodec == nullptr) { return CreateIntInt32Result(env, -1); }
        if (OH_VideoEncoder_CreateSecondaryFromPrimary(
            primaryVencCodec, &secondaryVencCodec) != AV_ERR_INVALID_VAL) {
                return CreateIntInt32Result(env, -1);
            }
        if (secondaryVencCodec == nullptr) { return CreateIntInt32Result(env, -1); }
        OH_AVCodec *thirdVencCodec = nullptr;
        if (OH_VideoEncoder_CreateSecondaryFromPrimary(
            primaryVencCodec, &thirdVencCodec) != AV_ERR_OPERATE_NOT_PERMIT) {
                return CreateIntInt32Result(env, -1);
            }
        OH_VideoEncoder_Destroy(secondaryVencCodec);
        OH_VideoEncoder_Destroy(thirdVencCodec);
        OH_VideoEncoder_Destroy(primaryVencCodec);
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiDual0700(napi_env env, napi_callback_info info)
{
    cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap) {
        const char *mime = "";
        OH_AVCodec *vencCodec = nullptr;
        if (OH_VideoEncoder_CreatePrimaryWithPreproc(mime, &vencCodec) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
        if (vencCodec != nullptr) { return CreateIntInt32Result(env, -1); }
        TestTearDownApi();
        return CreateIntInt32Result(env, 0);
    } else {
        return CreateIntInt32Result(env, 0);
    }
}

napi_value VideoEncodeApiDual0800(napi_env env, napi_callback_info info)
{
    const uint32_t lengths[] = {0, 255, 256};
    for (uint32_t len : lengths) {
        std::string mimeStr(len, 'a');
        OH_AVCodec *vencCodec = nullptr;
        if (OH_VideoEncoder_CreatePrimaryWithPreproc(mimeStr.c_str(),
        &vencCodec) != AV_ERR_INVALID_VAL) {
            return CreateIntInt32Result(env, -1);
        }
    }
    return CreateIntInt32Result(env, 0);
}

void InitApiTest()
{
    TestSetUpTestCase();
}
