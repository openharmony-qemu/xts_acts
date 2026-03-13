/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/ActsVideoDecEncNdkTest.h"
#include <chrono>
#include <cmath>
#include <iostream>
#include <map>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avformat.h>
#include <string>
#include <syscap_ndk.h>
#include <thread>
#include "include/VDecEncNdkSample.h"

static const char* READPATH = "/data/storage/el2/base/haps/entry_test/files/out_320_240_10s.h264";

namespace {
OH_AVCapability* cap_avc = nullptr;
bool g_capAvcResult = false;
OH_AVCapability* cap_mpeg4 = nullptr;
bool g_capM4Result = false;
} // namespace

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

namespace {
const string MIME_TYPE_AVC = "video/avc";
const string MIME_TYPE_MPEG4 = "video/mp4v-es";
constexpr uint32_t DEFAULT_WIDTH = 320;
constexpr uint32_t DEFAULT_HEIGHT = 240;
constexpr uint32_t DEFAULT_PIXELFORMAT = 2;
constexpr double DEFAULT_FRAMERATE = 60;

static constexpr int EOS_WAIT_TIMEOUT_SEC = 90;

static int WaitForEncEosWithTimeout(VDecEncNdkSample* sample, int timeoutSeconds)
{
    auto deadline = std::chrono::steady_clock::now() + std::chrono::seconds(timeoutSeconds);
    while (!sample->GetEncEosState()) {
        if (std::chrono::steady_clock::now() >= deadline) {
            cout << "WaitForEncEos: timeout after " << timeoutSeconds << "s" << endl;
            return -1;
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
    return 0;
}

static bool CheckDecDesc(map<string, int> InDesc, OH_AVFormat* OutDesc)
{
    int32_t out;
    for (const auto& t : InDesc) {
        bool res = OH_AVFormat_GetIntValue(OutDesc, t.first.c_str(), &out);
        cout << "key: " << t.first << "; out: " << out << endl;
        if (!res) {
            cout << "OH_AVFormat_GetIntValue Fail. key:" << t.first << endl;
            return false;
        }
        if (out != t.second) {
            cout << "OH_AVFormat_GetIntValue error. key: " << t.first << "; expect: " << t.second << ", actual: " << out
                 << endl;
            return false;
        }
        out = 0;
    }

    double dout;
    bool res = OH_AVFormat_GetDoubleValue(OutDesc, OH_MD_KEY_FRAME_RATE, &dout);
    if (!res || abs(dout - DEFAULT_FRAMERATE) > 1e-6) {
        cout << "OH_AVFormat_GetDoubleValue error. key: " << OH_MD_KEY_FRAME_RATE << endl;
    }
    return true;
}

static bool SetFormat(struct OH_AVFormat* format, map<string, int> mediaDescription)
{
    const char* key;
    for (const auto& t : mediaDescription) {
        key = t.first.c_str();
        if (not OH_AVFormat_SetIntValue(format, key, t.second)) {
            cout << "OH_AV_FormatPutIntValue Fail. format key: " << t.first << ", value: " << t.second << endl;
            return false;
        }
    }
    return true;
}

static struct OH_AVFormat* createFormat()
{
    OH_AVFormat* DefaultFormat = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(DefaultFormat, OH_MD_KEY_WIDTH, DEFAULT_WIDTH);
    OH_AVFormat_SetIntValue(DefaultFormat, OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT);
    OH_AVFormat_SetIntValue(DefaultFormat, OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIXELFORMAT);
    OH_AVFormat_SetDoubleValue(DefaultFormat, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAMERATE);
    OH_AVFormat_SetStringValue(DefaultFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    return DefaultFormat;
}

static bool CanUseVideoCodec()
{
    return canIUse("SystemCapability.Multimedia.Media.CodecBase") &&
           canIUse("SystemCapability.Multimedia.Media.VideoDecoder") &&
           canIUse("SystemCapability.Multimedia.Media.VideoEncoder");
}

static void InitCapabilities()
{
    cap_avc = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    if (cap_avc) {
        g_capAvcResult = true;
    }
    cap_mpeg4 = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, true, HARDWARE);
    if (cap_mpeg4) {
        g_capM4Result = true;
    }
}
} // namespace

static constexpr int kExpectedVideoFrameCount = 100;

static int GetSurfaceAndStartVideoDecEnc(VDecEncNdkSample* sample, OH_AVFormat* /* format */)
{
    if (sample->GetSurface() != AV_ERR_OK) {
        return -1;
    }
    if (sample->SetOutputSurface() != AV_ERR_OK) {
        return -1;
    }
    if (sample->PrepareEnc() != AV_ERR_OK) {
        return -1;
    }
    if (sample->PrepareDec() != AV_ERR_OK) {
        return -1;
    }
    if (sample->StartEnc() != AV_ERR_OK) {
        return -1;
    }
    if (sample->StartDec() != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

static int ConfigureAndStartVideoDecEnc(VDecEncNdkSample* sample, OH_AVFormat* format)
{
    if (sample->ConfigureDec(format) != AV_ERR_OK) {
        return -1;
    }
    if (sample->ConfigureEnc(format) != AV_ERR_OK) {
        return -1;
    }
    return GetSurfaceAndStartVideoDecEnc(sample, format);
}

static int CreateVideoDecEncAvcAndSetPaths(VDecEncNdkSample* sample, const char* savePath, bool noEos = false)
{
    if (sample->CreateVideoDecoderByMime(MIME_TYPE_AVC) == nullptr) {
        return -1;
    }
    if (sample->CreateVideoEncoderByMime(MIME_TYPE_AVC) == nullptr) {
        return -1;
    }
    sample->SetReadPath(READPATH);
    sample->SetSavePath(savePath);
    if (noEos) {
        sample->SetEosState(false);
    }
    return 0;
}

static int WaitDecEosThenStopFlushEncAndCheck(VDecEncNdkSample* sample, OH_AVFormat* /* format */)
{
    while (!sample->GetDecEosState()) {
    }
    if (sample->StopDec() != AV_ERR_OK) {
        return -1;
    }
    if (sample->FlushEnc() != AV_ERR_OK) {
        return -1;
    }
    return (sample->CalcuError() == AV_ERR_OK) ? 0 : -1;
}

static int WaitEncEosThenStopAndRelease(VDecEncNdkSample* sample)
{
    if (WaitForEncEosWithTimeout(sample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        return -1;
    }
    if (sample->StopDec() != AV_ERR_OK || sample->StopEnc() != AV_ERR_OK) {
        return -1;
    }
    if (sample->ReleaseEnc() != AV_ERR_OK || sample->ReleaseDec() != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

int SubMultimediaMediaVideoDecEncFunction0100()
{
    InitCapabilities();
    if (!CanUseVideoCodec() || !g_capAvcResult || !g_capM4Result) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0100 ignore" << endl;
        return AV_ERR_OK;
    }
    VDecEncNdkSample* vDecEncSample = new VDecEncNdkSample();
    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    if (videoDec == nullptr) {
        delete vDecEncSample;
        return -1;
    }

    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_MPEG4);
    videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    if (videoEnc == nullptr) {
        delete vDecEncSample;
        return -1;
    }
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetSavePath("/data/storage/el2/base/files/video_001.h264");

    OH_AVFormat* VideoFormat = OH_AVFormat_Create();
    if (VideoFormat == nullptr) {
        delete vDecEncSample;
        return -1;
    }
    map<string, int> VideoParam = {
        { OH_MD_KEY_WIDTH, DEFAULT_WIDTH },
        { OH_MD_KEY_HEIGHT, DEFAULT_HEIGHT },
        { OH_MD_KEY_PIXEL_FORMAT, DEFAULT_PIXELFORMAT },
    };
    if (!SetFormat(VideoFormat, VideoParam)) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_TRACK_TYPE, MEDIA_TYPE_VID);
    OH_AVFormat_SetDoubleValue(VideoFormat, OH_MD_KEY_FRAME_RATE, DEFAULT_FRAMERATE);

    if (vDecEncSample->ConfigureDec(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat* outDescDec = OH_VideoDecoder_GetOutputDescription(videoDec);
    if (outDescDec == nullptr) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (!CheckDecDesc(VideoParam, outDescDec)) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    if (vDecEncSample->ConfigureEnc(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat* outDescEnc = OH_VideoEncoder_GetOutputDescription(videoEnc);
    if (outDescEnc == nullptr) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    if (GetSurfaceAndStartVideoDecEnc(vDecEncSample, VideoFormat) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    if (WaitForEncEosWithTimeout(vDecEncSample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StopDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StopEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ReleaseEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    videoEnc = nullptr;
    if (vDecEncSample->ReleaseDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    int ret = vDecEncSample->CalcuError();
    delete vDecEncSample;
    if (ret != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

int SubMultimediaMediaVideoDecEncFunction0200()
{
    InitCapabilities();
    if (!CanUseVideoCodec() || !g_capAvcResult) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0200 ignore" << endl;
        return AV_ERR_OK;
    }
    VDecEncNdkSample* vDecEncSample = new VDecEncNdkSample();

    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    if (videoDec == nullptr) {
        delete vDecEncSample;
        return -1;
    }
    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    if (videoEnc == nullptr) {
        delete vDecEncSample;
        return -1;
    }
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetSavePath("/data/storage/el2/base/files/video_002.h264");

    OH_AVFormat* VideoFormat = createFormat();
    if (vDecEncSample->ConfigureDec(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, CBR);
    if (vDecEncSample->ConfigureEnc(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->GetSurface() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->SetOutputSurface() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->PrepareEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->PrepareDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->SetParameterEnc(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->SetParameterDec(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    if (WaitForEncEosWithTimeout(vDecEncSample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ResetDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ResetEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ReleaseEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    videoEnc = nullptr;
    if (vDecEncSample->ReleaseDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    int ret = vDecEncSample->CalcuError();
    delete vDecEncSample;
    if (ret != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

int SubMultimediaMediaVideoDecEncFunction0300()
{
    InitCapabilities();
    if (!CanUseVideoCodec() || !g_capAvcResult) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0300 ignore" << endl;
        return AV_ERR_OK;
    }
    VDecEncNdkSample* vDecEncSample = new VDecEncNdkSample();
    if (CreateVideoDecEncAvcAndSetPaths(vDecEncSample, "/data/storage/el2/base/files/video_003.h264") != 0) {
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat* VideoFormat = createFormat();
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_PROFILE, AVC_PROFILE_BASELINE);

    if (ConfigureAndStartVideoDecEnc(vDecEncSample, VideoFormat) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    if (WaitForEncEosWithTimeout(vDecEncSample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ReleaseEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ReleaseDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat_Destroy(VideoFormat);
    int ret = vDecEncSample->CalcuError();
    delete vDecEncSample;
    return (ret == AV_ERR_OK) ? AV_ERR_OK : -1;
}

int SubMultimediaMediaVideoDecEncFunction0400()
{
    InitCapabilities();
    if (!CanUseVideoCodec() || !g_capAvcResult) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0400 ignore" << endl;
        return AV_ERR_OK;
    }
    VDecEncNdkSample* vDecEncSample = new VDecEncNdkSample();
    if (CreateVideoDecEncAvcAndSetPaths(vDecEncSample, "/data/storage/el2/base/files/video_004.h264", true) != 0) {
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat* VideoFormat = createFormat();
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_PROFILE, AVC_PROFILE_HIGH);

    if (ConfigureAndStartVideoDecEnc(vDecEncSample, VideoFormat) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    while (vDecEncSample->GetFrameCount() < kExpectedVideoFrameCount) {
    };
    if (vDecEncSample->FlushDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->FlushEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    vDecEncSample->ReRead();
    vDecEncSample->ResetDecParam();
    vDecEncSample->ResetEncParam();
    vDecEncSample->SetEosState(true);
    vDecEncSample->SetSavePath("/data/storage/el2/base/files/video_004_2.h264");

    if (vDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    if (WaitForEncEosWithTimeout(vDecEncSample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ReleaseEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ReleaseDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat_Destroy(VideoFormat);
    int ret = vDecEncSample->CalcuError();
    delete vDecEncSample;
    return (ret == AV_ERR_OK) ? AV_ERR_OK : -1;
}

int SubMultimediaMediaVideoDecEncFunction0500()
{
    InitCapabilities();
    if (!CanUseVideoCodec() || !g_capAvcResult) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0500 ignore" << endl;
        return AV_ERR_OK;
    }
    VDecEncNdkSample* vDecEncSample = new VDecEncNdkSample();

    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    if (videoDec == nullptr) {
        delete vDecEncSample;
        return -1;
    }
    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    if (videoEnc == nullptr) {
        delete vDecEncSample;
        return -1;
    }
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetEosState(false);
    vDecEncSample->SetSavePath("/data/storage/el2/base/files/video_005.h264");

    OH_AVFormat* VideoFormat = createFormat();
    OH_AVFormat_SetIntValue(VideoFormat, OH_MD_KEY_PROFILE, AVC_PROFILE_MAIN);

    if (vDecEncSample->ConfigureDec(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ConfigureEnc(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->GetSurface() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->SetOutputSurface() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->PrepareEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->PrepareDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    while (!vDecEncSample->GetDecEosState()) {
    };
    if (vDecEncSample->CalcuError() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->FlushDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->FlushEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    vDecEncSample->ReRead();
    vDecEncSample->ResetDecParam();
    vDecEncSample->ResetEncParam();
    vDecEncSample->SetSavePath("/data/storage/el2/base/files/video_005_2.h264");
    vDecEncSample->SetEosState(true);
    if (vDecEncSample->CalcuError() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    if (WaitForEncEosWithTimeout(vDecEncSample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ReleaseEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    videoEnc = nullptr;
    if (vDecEncSample->ReleaseDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    int ret = vDecEncSample->CalcuError();
    delete vDecEncSample;
    if (ret != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

int SubMultimediaMediaVideoDecEncFunction0600()
{
    InitCapabilities();
    if (!CanUseVideoCodec() || !g_capAvcResult) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0600 ignore" << endl;
        return AV_ERR_OK;
    }
    VDecEncNdkSample* vDecEncSample = new VDecEncNdkSample();

    struct OH_AVCodec* videoDec = vDecEncSample->CreateVideoDecoderByMime(MIME_TYPE_AVC);
    if (videoDec == nullptr) {
        delete vDecEncSample;
        return -1;
    }
    struct OH_AVCodec* videoEnc = vDecEncSample->CreateVideoEncoderByMime(MIME_TYPE_AVC);
    if (videoEnc == nullptr) {
        delete vDecEncSample;
        return -1;
    }
    vDecEncSample->SetReadPath(READPATH);
    vDecEncSample->SetEosState(false);
    vDecEncSample->SetSavePath("/data/storage/el2/base/files/video_006.h264");

    OH_AVFormat* VideoFormat = createFormat();
    if (vDecEncSample->ConfigureDec(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ConfigureEnc(VideoFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->GetSurface() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->SetOutputSurface() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->PrepareEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->PrepareDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    while (vDecEncSample->GetFrameCount() < kExpectedVideoFrameCount) {
    };
    if (vDecEncSample->StopDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StopEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    vDecEncSample->ReRead();
    vDecEncSample->ResetDecParam();
    vDecEncSample->ResetEncParam();
    vDecEncSample->SetEosState(true);
    vDecEncSample->SetSavePath("/data/storage/el2/base/files/video_006_2.h264");
    if (vDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }

    if (WaitForEncEosWithTimeout(vDecEncSample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StopDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->StopEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (vDecEncSample->ReleaseEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    videoEnc = nullptr;
    if (vDecEncSample->ReleaseDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    videoDec = nullptr;
    OH_AVFormat_Destroy(VideoFormat);
    VideoFormat = nullptr;
    int ret = vDecEncSample->CalcuError();
    delete vDecEncSample;
    if (ret != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

int SubMultimediaMediaVideoDecEncFunction0700()
{
    InitCapabilities();
    if (!CanUseVideoCodec() || !g_capAvcResult) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_VIDEO_DEC_ENC_FUNCTION_0700 ignore" << endl;
        return AV_ERR_OK;
    }
    VDecEncNdkSample* vDecEncSample = new VDecEncNdkSample();
    if (CreateVideoDecEncAvcAndSetPaths(vDecEncSample, "/data/storage/el2/base/files/video_007.h264", true) != 0) {
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat* VideoFormat = createFormat();
    if (ConfigureAndStartVideoDecEnc(vDecEncSample, VideoFormat) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (WaitDecEosThenStopFlushEncAndCheck(vDecEncSample, VideoFormat) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    vDecEncSample->ReRead();
    vDecEncSample->ResetDecParam();
    vDecEncSample->ResetEncParam();
    vDecEncSample->SetSavePath("/data/storage/el2/base/files/video_007_2.h264");
    vDecEncSample->SetEosState(true);
    if (vDecEncSample->StartEnc() != AV_ERR_OK || vDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    if (WaitEncEosThenStopAndRelease(vDecEncSample) != 0) {
        OH_AVFormat_Destroy(VideoFormat);
        delete vDecEncSample;
        return -1;
    }
    OH_AVFormat_Destroy(VideoFormat);
    int ret = vDecEncSample->CalcuError();
    delete vDecEncSample;
    return (ret == AV_ERR_OK) ? AV_ERR_OK : -1;
}
