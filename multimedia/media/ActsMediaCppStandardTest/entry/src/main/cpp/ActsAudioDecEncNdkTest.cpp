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

#include <chrono>
#include <iostream>
#include <map>
#include <multimedia/player_framework/native_avcodec_audiodecoder.h>
#include <multimedia/player_framework/native_avcodec_audioencoder.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include <string>
#include <syscap_ndk.h>
#include <thread>
#include "include/ADecEncNdkSample.h"
#include "include/AudioInfoTest.h"

#include "include/ActsAudioDecEncNdkTest.h"

using namespace std;
using namespace OHOS;
using namespace OHOS::Media;

static uint32_t ES_AAC_48000_32_1[] = { 283, 336, 291, 405, 438, 411, 215, 215, 313, 270, 342, 641, 554, 545, 545,
                                        546, 541, 540, 542, 552, 537, 533, 498, 472, 445, 430, 445, 427, 414, 386,
                                        413, 370, 380, 401, 393, 369, 391, 367, 395, 396, 396, 385, 391, 384, 395,
                                        392, 386, 388, 384, 379, 376, 381, 375, 373, 349, 391, 357, 384, 395, 384,
                                        380, 386, 372, 386, 383, 378, 385, 385, 384, 342, 390, 379, 387, 386, 393,
                                        397, 362, 393, 394, 391, 383, 385, 377, 379, 381, 369, 375, 379, 346, 382,
                                        356, 361, 366, 394, 393, 385, 362, 406, 399, 384, 377, 385 };

static constexpr uint32_t ES_AAC_48000_32_1_Length = sizeof(ES_AAC_48000_32_1) / sizeof(uint32_t);
static const string MIME_TYPE_AAC = "audio/mp4a-latm";
static const string DECODER_AAC = "avdec_aac";
static const string ENCODER_AAC = "avenc_aac";
static constexpr uint32_t DEFAULT_SAMPLE_RATE = 44100;
static constexpr uint32_t DEFAULT_CHANNELS = 2;

static const char* READPATH = "/data/storage/el2/base/haps/entry_test/files/AAC_48000_32_1.aac";

static constexpr int EOS_WAIT_TIMEOUT_SEC = 90;
static constexpr int kWaitPollMs = 100;
static constexpr int kExpectedAudioFrameCount = 50;

static int WaitForEncEosWithTimeout(ADecEncNdkSample* sample, int timeoutSeconds)
{
    auto deadline = std::chrono::steady_clock::now() + std::chrono::seconds(timeoutSeconds);
    while (!sample->GetEncEosState()) {
        if (std::chrono::steady_clock::now() >= deadline) {
            cout << "WaitForEncEos: timeout after " << timeoutSeconds << "s" << endl;
            return -1;
        }
        std::this_thread::sleep_for(std::chrono::milliseconds(kWaitPollMs));
    }
    return 0;
}

static int StartEncDecWithParams(ADecEncNdkSample* sample, OH_AVFormat* format)
{
    if (sample->StartEnc() != AV_ERR_OK) {
        return -1;
    }
    if (sample->SetParameterEnc(format) != AV_ERR_OK) {
        return -1;
    }
    if (sample->StartDec() != AV_ERR_OK) {
        return -1;
    }
    if (sample->SetParameterDec(format) != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

static int WaitEosStopAndRelease(ADecEncNdkSample* sample)
{
    if (WaitForEncEosWithTimeout(sample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        return -1;
    }
    if (sample->StopDec() != AV_ERR_OK) {
        return -1;
    }
    if (sample->StopEnc() != AV_ERR_OK) {
        return -1;
    }
    if (sample->ReleaseDec() != AV_ERR_OK) {
        return -1;
    }
    if (sample->ReleaseEnc() != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

static int WaitEosResetAndRelease(ADecEncNdkSample* sample)
{
    if (WaitForEncEosWithTimeout(sample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        return -1;
    }
    if (sample->ResetEnc() != AV_ERR_OK) {
        return -1;
    }
    if (sample->ResetDec() != AV_ERR_OK) {
        return -1;
    }
    if (sample->ReleaseDec() != AV_ERR_OK) {
        return -1;
    }
    if (sample->ReleaseEnc() != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

static int WaitEosAndRelease(ADecEncNdkSample* sample)
{
    if (WaitForEncEosWithTimeout(sample, EOS_WAIT_TIMEOUT_SEC) != 0) {
        return -1;
    }
    if (sample->ReleaseDec() != AV_ERR_OK) {
        return -1;
    }
    if (sample->ReleaseEnc() != AV_ERR_OK) {
        return -1;
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

static int SetupAudioDecEncByName(ADecEncNdkSample* sample, OH_AVFormat* format, const map<string, int>& param)
{
    struct OH_AVCodec* audDec = sample->CreateAudioDecoderByName(DECODER_AAC);
    if (audDec == nullptr) {
        return -1;
    }
    if (sample->ConfigureDec(format) != AV_ERR_OK) {
        return -1;
    }
    OH_AVFormat* outDescDec = OH_AudioDecoder_GetOutputDescription(audDec);
    if (outDescDec == nullptr) {
        return -1;
    }
    if (!CheckDecDesc(param, outDescDec)) {
        return -1;
    }
    if (sample->PrepareDec() != AV_ERR_OK) {
        return -1;
    }
    struct OH_AVCodec* audEnc = sample->CreateAudioEncoderByName(ENCODER_AAC);
    if (audEnc == nullptr) {
        return -1;
    }
    if (sample->ConfigureEnc(format) != AV_ERR_OK) {
        return -1;
    }
    OH_AVFormat* outDescEnc = OH_AudioEncoder_GetOutputDescription(audEnc);
    if (outDescEnc == nullptr) {
        return -1;
    }
    if (!CheckDecDesc(param, outDescEnc)) {
        return -1;
    }
    if (sample->PrepareEnc() != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

static int SetupAudioDecEncByMime(ADecEncNdkSample* sample, OH_AVFormat* format)
{
    if (sample->ConfigureDec(format) != AV_ERR_OK) {
        return -1;
    }
    if (sample->PrepareDec() != AV_ERR_OK) {
        return -1;
    }
    if (sample->CreateAudioEncoderByMime(MIME_TYPE_AAC) == nullptr) {
        return -1;
    }
    if (sample->ConfigureEnc(format) != AV_ERR_OK) {
        return -1;
    }
    if (sample->PrepareEnc() != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

static int WaitDecEosThenFlushAndCheck(ADecEncNdkSample* sample)
{
    while (!sample->GetDecEosState()) {
    }
    if (sample->CalcuError() != AV_ERR_OK) {
        return -1;
    }
    if (sample->FlushDec() != AV_ERR_OK || sample->FlushEnc() != AV_ERR_OK) {
        return -1;
    }
    return 0;
}

static bool CanUseAudioCodec()
{
    return canIUse("SystemCapability.Multimedia.Media.CodecBase") &&
           canIUse("SystemCapability.Multimedia.Media.AudioDecoder") &&
           canIUse("SystemCapability.Multimedia.Media.AudioEncoder");
}

/**
 * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0100
 * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0100
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SubMultimediaMediaAudioDecEncFunction0100()
{
    if (!CanUseAudioCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0100 ignore" << endl;
        return AV_ERR_OK;
    }
    ADecEncNdkSample* aDecEncSample = new ADecEncNdkSample();

    map<string, int> AudioParam = {
        { OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS },
        { OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE },
        { OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE },
    };
    OH_AVFormat* audioFormat = OH_AVFormat_Create();
    if (audioFormat == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    if (!SetFormat(audioFormat, AudioParam)) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_SetStringValue(audioFormat, OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC);
    if (SetupAudioDecEncByName(aDecEncSample, audioFormat, AudioParam) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out1.aac");
    if (StartEncDecWithParams(aDecEncSample, audioFormat) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (WaitEosStopAndRelease(aDecEncSample) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_Destroy(audioFormat);
    int32_t calcuErr = aDecEncSample->CalcuError();
    delete aDecEncSample;
    return (calcuErr == AV_ERR_OK) ? AV_ERR_OK : -1;
}

/**
 * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0200
 * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0200
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SubMultimediaMediaAudioDecEncFunction0200()
{
    if (!CanUseAudioCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0200 ignore" << endl;
        return AV_ERR_OK;
    }
    ADecEncNdkSample* aDecEncSample = new ADecEncNdkSample();
    if (aDecEncSample->CreateAudioDecoderByMime(MIME_TYPE_AAC) == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat* audioFormat = OH_AVFormat_Create();
    if (audioFormat == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_TRACK_TYPE, MEDIA_TYPE_AUD);
    if (SetupAudioDecEncByMime(aDecEncSample, audioFormat) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out2.aac");
    if (aDecEncSample->StartEnc() != AV_ERR_OK || aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (WaitEosResetAndRelease(aDecEncSample) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_Destroy(audioFormat);
    int32_t calcuErr = aDecEncSample->CalcuError();
    delete aDecEncSample;
    return (calcuErr == AV_ERR_OK) ? AV_ERR_OK : -1;
}

/**
 * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0300
 * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0300
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SubMultimediaMediaAudioDecEncFunction0300()
{
    if (!CanUseAudioCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0300 ignore" << endl;
        return AV_ERR_OK;
    }
    ADecEncNdkSample* aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoderByMime(MIME_TYPE_AAC);
    if (audDec == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat* audioFormat = OH_AVFormat_Create();
    if (audioFormat == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_PROFILE, AAC_PROFILE_LC);

    if (aDecEncSample->ConfigureDec(audioFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->PrepareDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoderByMime(MIME_TYPE_AAC);
    if (audEnc == nullptr) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->ConfigureEnc(audioFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->PrepareEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out3.aac");

    if (aDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (WaitEosAndRelease(aDecEncSample) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    audDec = nullptr;
    audEnc = nullptr;
    OH_AVFormat_Destroy(audioFormat);
    audioFormat = nullptr;
    int32_t calcuErr = aDecEncSample->CalcuError();
    delete aDecEncSample;
    if (calcuErr != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

/**
 * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0400
 * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0400
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SubMultimediaMediaAudioDecEncFunction0400()
{
    if (!CanUseAudioCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0400 ignore" << endl;
        return AV_ERR_OK;
    }
    ADecEncNdkSample* aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoderByMime(MIME_TYPE_AAC);
    if (audDec == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat* audioFormat = OH_AVFormat_Create();
    if (audioFormat == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    if (aDecEncSample->ConfigureDec(audioFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->PrepareDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoderByMime(MIME_TYPE_AAC);
    if (audEnc == nullptr) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->ConfigureEnc(audioFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->PrepareEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out4.aac");
    aDecEncSample->SetEosState(false);

    if (aDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    /* Loop exits when encoder output callback increments frame count to kExpectedAudioFrameCount. */
    while (aDecEncSample->GetFrameCount() < kExpectedAudioFrameCount) {
    };
    if (aDecEncSample->FlushDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->FlushEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->ReRead();
    aDecEncSample->ResetDecParam();
    aDecEncSample->ResetEncParam();
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out4_2.aac");
    aDecEncSample->SetEosState(true);
    if (aDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }

    if (WaitEosAndRelease(aDecEncSample) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    audDec = nullptr;
    audEnc = nullptr;
    OH_AVFormat_Destroy(audioFormat);
    audioFormat = nullptr;
    int32_t calcuErr = aDecEncSample->CalcuError();
    delete aDecEncSample;
    if (calcuErr != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

/**
 * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0500
 * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0500
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SubMultimediaMediaAudioDecEncFunction0500()
{
    if (!CanUseAudioCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0500 ignore" << endl;
        return AV_ERR_OK;
    }
    ADecEncNdkSample* aDecEncSample = new ADecEncNdkSample();
    if (aDecEncSample->CreateAudioDecoderByMime(MIME_TYPE_AAC) == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat* audioFormat = OH_AVFormat_Create();
    if (audioFormat == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    if (SetupAudioDecEncByMime(aDecEncSample, audioFormat) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetEosState(false);
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out5.aac");
    if (aDecEncSample->StartEnc() != AV_ERR_OK || aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (WaitDecEosThenFlushAndCheck(aDecEncSample) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->ReRead();
    aDecEncSample->ResetDecParam();
    aDecEncSample->ResetEncParam();
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out5_2.aac");
    aDecEncSample->SetEosState(true);
    if (aDecEncSample->StartEnc() != AV_ERR_OK || aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (WaitEosAndRelease(aDecEncSample) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_Destroy(audioFormat);
    int32_t calcuErr = aDecEncSample->CalcuError();
    delete aDecEncSample;
    return (calcuErr == AV_ERR_OK) ? AV_ERR_OK : -1;
}

/**
 * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0600
 * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0600
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SubMultimediaMediaAudioDecEncFunction0600()
{
    if (!CanUseAudioCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0600 ignore" << endl;
        return AV_ERR_OK;
    }
    ADecEncNdkSample* aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoderByMime(MIME_TYPE_AAC);
    if (audDec == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat* audioFormat = OH_AVFormat_Create();
    if (audioFormat == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    if (aDecEncSample->ConfigureDec(audioFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->PrepareDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoderByMime(MIME_TYPE_AAC);
    if (audEnc == nullptr) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->ConfigureEnc(audioFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->PrepareEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out6.aac");
    aDecEncSample->SetEosState(false);

    if (aDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    /* Loop exits when encoder output callback increments frame count to kExpectedAudioFrameCount. */
    while (aDecEncSample->GetFrameCount() < kExpectedAudioFrameCount) {
    };
    if (aDecEncSample->StopDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->StopEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->ReRead();
    aDecEncSample->ResetDecParam();
    aDecEncSample->ResetEncParam();
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out6_2.aac");
    aDecEncSample->SetEosState(true);
    if (aDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->CalcuError() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }

    if (WaitEosAndRelease(aDecEncSample) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    audDec = nullptr;
    audEnc = nullptr;
    OH_AVFormat_Destroy(audioFormat);
    audioFormat = nullptr;
    int32_t calcuErr = aDecEncSample->CalcuError();
    delete aDecEncSample;
    if (calcuErr != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}

/**
 * @tc.name   SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0700
 * @tc.number SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0700
 * @tc.desc   Basic function test
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL1
 */
int SubMultimediaMediaAudioDecEncFunction0700()
{
    if (!CanUseAudioCodec()) {
        cout << "codec not support, ignore SUB_MULTIMEDIA_MEDIA_AUDIO_DEC_ENC_FUNCTION_0700 ignore" << endl;
        return AV_ERR_OK;
    }
    ADecEncNdkSample* aDecEncSample = new ADecEncNdkSample();

    struct OH_AVCodec* audDec = aDecEncSample->CreateAudioDecoderByMime(MIME_TYPE_AAC);
    if (audDec == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat* audioFormat = OH_AVFormat_Create();
    if (audioFormat == nullptr) {
        delete aDecEncSample;
        return -1;
    }
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_CHANNEL_COUNT, DEFAULT_CHANNELS);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUD_SAMPLE_RATE, DEFAULT_SAMPLE_RATE);
    OH_AVFormat_SetIntValue(audioFormat, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, AudioStandard::SAMPLE_S16LE);
    if (aDecEncSample->ConfigureDec(audioFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->PrepareDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }

    struct OH_AVCodec* audEnc = aDecEncSample->CreateAudioEncoderByMime(MIME_TYPE_AAC);
    if (audEnc == nullptr) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->ConfigureEnc(audioFormat) != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->PrepareEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    aDecEncSample->SetReadPath(READPATH, ES_AAC_48000_32_1, ES_AAC_48000_32_1_Length);
    aDecEncSample->SetEosState(false);
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out7.aac");

    if (aDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    while (!aDecEncSample->GetDecEosState()) {
    };
    if (aDecEncSample->StopDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->FlushEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->CalcuError() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }

    aDecEncSample->ReRead();
    aDecEncSample->ResetDecParam();
    aDecEncSample->ResetEncParam();
    aDecEncSample->SetSavePath("/data/storage/el2/base/files/AAC_48000_32_1_out7_2.aac");
    aDecEncSample->SetEosState(true);
    if (aDecEncSample->StartEnc() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    if (aDecEncSample->StartDec() != AV_ERR_OK) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }

    if (WaitEosAndRelease(aDecEncSample) != 0) {
        OH_AVFormat_Destroy(audioFormat);
        delete aDecEncSample;
        return -1;
    }
    audDec = nullptr;
    audEnc = nullptr;
    OH_AVFormat_Destroy(audioFormat);
    audioFormat = nullptr;
    int32_t calcuErr = aDecEncSample->CalcuError();
    delete aDecEncSample;
    if (calcuErr != AV_ERR_OK) {
        return -1;
    }
    return AV_ERR_OK;
}
