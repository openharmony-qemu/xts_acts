/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#include "AVCode/AVCode_Test.h"
#include "common/Common.h"
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/native_audio_channel_layout.h>

static bool IsSupportCodec(const char *mime)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(mime, true);
    if (capability != nullptr) {
        return true;
    }
    return false;
}

static OH_AVFormat* CreateDefaultAudioEncoderFormat()
{
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, PARAM_2);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, PARAM_44100);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_S16LE);
    return format;
}

static OH_AVFormat* CreateAudioEncoderFormat(int32_t sampleRate, int32_t channelCount,
    int32_t sampleFormat, int64_t channelLayout, int64_t bitrate = -1)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channelCount);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
    if (bitrate > 0) {
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, bitrate);
    }
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, sampleFormat);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, channelLayout);
    return format;
}

// ========== OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE ==========

napi_value AudioEncoderSetMaxInputBufferSize_Zero(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE, PARAM_0);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetMaxInputBufferSize_10M(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE, BUFFER_SIZE_10M);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

// ========== OH_MD_KEY_AUDIO_ENCODER_PTS_MODE ==========

napi_value AudioEncoderSetPTSMode_Default(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, OH_AUDIO_ENCODER_PTS_MODE_DEFAULT);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetPTSMode_ZeroStart(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, OH_AUDIO_ENCODER_PTS_MODE_ZERO_START);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetPTSMode_FirstInputStart(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, OH_AUDIO_ENCODER_PTS_MODE_FIRST_INPUT_START);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetPTSMode_InvalidValue3(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, PARAM_3);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetPTSMode_Negative(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, PARAM_NEGATIVE_1);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

// ========== OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT ==========

napi_value AudioEncoderSetSampleConvert_Enable(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, PARAM_1);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetSampleConvert_Disable(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, PARAM_0);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetSampleConvert_Default(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetSampleConvert_Invalid2(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, PARAM_2);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetSampleConvert_Negative(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, PARAM_NEGATIVE_1);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetSampleConvert_WithUnsupportedFormat(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, PARAM_0);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_S24LE);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_INVALID_VAL) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderSetSampleConvert_WithSupportedFormat(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateDefaultAudioEncoderFormat();
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, PARAM_1);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_S24LE);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

// ========== FLAC Encoder ==========

napi_value AudioEncoderFLAC_SetMaxInputBufferSize(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_FLAC;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_44100, PARAM_2, SAMPLE_S16LE, CH_LAYOUT_STEREO, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE, BUFFER_SIZE_10M);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderFLAC_SetPTSMode(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_FLAC;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_44100, PARAM_2, SAMPLE_S16LE, CH_LAYOUT_STEREO, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, OH_AUDIO_ENCODER_PTS_MODE_ZERO_START);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderFLAC_SetSampleConvert(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_FLAC;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_44100, PARAM_2, SAMPLE_S16LE, CH_LAYOUT_STEREO, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, PARAM_1);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

// ========== MP3 Encoder ==========

napi_value AudioEncoderMP3_SetMaxInputBufferSize(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_MPEG;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_44100, PARAM_2, SAMPLE_S16LE, CH_LAYOUT_STEREO, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE, BUFFER_SIZE_10M);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderMP3_SetPTSMode(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_MPEG;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_44100, PARAM_2, SAMPLE_S16LE, CH_LAYOUT_STEREO, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, OH_AUDIO_ENCODER_PTS_MODE_ZERO_START);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderMP3_SetSampleConvert(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_MPEG;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_44100, PARAM_2, SAMPLE_S16LE, CH_LAYOUT_STEREO, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, PARAM_1);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

// ========== OPUS Encoder ==========

napi_value AudioEncoderOPUS_SetMaxInputBufferSize(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_OPUS;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_48000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE, BUFFER_SIZE_10M);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderOPUS_SetPTSMode(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_OPUS;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_48000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, OH_AUDIO_ENCODER_PTS_MODE_ZERO_START);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderOPUS_SetSampleConvert(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_OPUS;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_48000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO, PARAM_128000);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, PARAM_1);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

// ========== AMRNB Encoder ==========

napi_value AudioEncoderAMRNB_SetMaxInputBufferSize(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_8000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO, PARAM_12200);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE, BUFFER_SIZE_10M);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderAMRNB_SetPTSMode(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_8000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO, PARAM_12200);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, OH_AUDIO_ENCODER_PTS_MODE_ZERO_START);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderAMRNB_SetSampleConvert(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_8000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO, PARAM_12200);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, 1);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

// ========== AMRWB Encoder ==========

napi_value AudioEncoderAMRWB_SetMaxInputBufferSize(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_16000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO, PARAM_23850);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE, BUFFER_SIZE_10M);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderAMRWB_SetPTSMode(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_16000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO, PARAM_23850);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, OH_AUDIO_ENCODER_PTS_MODE_ZERO_START);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderAMRWB_SetSampleConvert(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_16000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO, PARAM_23850);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, 1);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

// ========== G711mu Encoder ==========

napi_value AudioEncoderG711mu_SetMaxInputBufferSize(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_G711MU;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_8000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_MAX_INPUT_BUFFER_SIZE, BUFFER_SIZE_10M);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderG711mu_SetPTSMode(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_G711MU;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_8000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_PTS_MODE, OH_AUDIO_ENCODER_PTS_MODE_ZERO_START);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}

napi_value AudioEncoderG711mu_SetSampleConvert(napi_env env, napi_callback_info info)
{
    const char *mime = OH_AVCODEC_MIMETYPE_AUDIO_G711MU;
    if (!IsSupportCodec(mime)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
        if (codec == nullptr) {
            napi_value retValue = nullptr;
            napi_create_int32(env, 0, &retValue);
            return retValue;
        }
        OH_AudioCodec_Destroy(codec);
    }
    OH_AVCodec *codec = OH_AudioCodec_CreateByMime(mime, true);
    OH_AVFormat *format = CreateAudioEncoderFormat(PARAM_8000, PARAM_1, SAMPLE_S16LE, CH_LAYOUT_MONO);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_ENCODER_ENABLE_SAMPLE_FORMAT_CONVERT, 1);
    int32_t ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    OH_AudioCodec_Destroy(codec);
    napi_value retValue = nullptr;
    napi_create_int32(env, (ret == AV_ERR_OK) ? 0 : 1, &retValue);
    return retValue;
}
