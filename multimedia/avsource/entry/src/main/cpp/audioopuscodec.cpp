/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/native_audio_channel_layout.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <unistd.h>

#define FAIL (-1)
#define SUCCESS (0)

#define SAMPLE_RATE_8000   (8000)
#define SAMPLE_RATE_12000  (12000)
#define SAMPLE_RATE_16000  (16000)
#define SAMPLE_RATE_24000  (24000)
#define SAMPLE_RATE_48000  (48000)
#define SAMPLE_RATE_INVALID_LOW  (7999)
#define SAMPLE_RATE_INVALID_HIGH (48001)
#define CHANNEL_MONO   (1)
#define CHANNEL_STEREO (2)
#define CHANNEL_INVALID_ZERO  (0)
#define CHANNEL_INVALID_HIGH  (3)
#define BITRATE_6KBPS   (6000)
#define BITRATE_64KBPS  (64000)
#define BITRATE_BELOW_MIN (5999)
#define BITRATE_ABOVE_MAX (510001)
#define VALID_RATE_COUNT (5)
#define INVALID_RATE_COUNT (2)
#define COMBO_TEST_COUNT (9)

static napi_value NapiReturn(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static bool IsSupportOpus()
{
    return OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false) != nullptr;
}

static int32_t ConfigCheck(OH_AVCodec *codec, int32_t sampleRate, int32_t channel, int64_t bitrate)
{
    OH_AVFormat *fmt = OH_AVFormat_Create();
    OH_AVFormat_SetIntValue(fmt, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(fmt, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
    OH_AVFormat_SetIntValue(fmt, OH_MD_KEY_AUD_CHANNEL_COUNT, channel);
    if (bitrate > 0) {
        OH_AVFormat_SetLongValue(fmt, OH_MD_KEY_BITRATE, bitrate);
    }
    OH_AVErrCode ret = OH_AudioCodec_Configure(codec, fmt);
    OH_AudioCodec_Reset(codec);
    OH_AVFormat_Destroy(fmt);
    return (ret == AV_ERR_OK) ? 0 : 1;
}

static napi_value DecoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t valid[] = {SAMPLE_RATE_8000, SAMPLE_RATE_12000, SAMPLE_RATE_16000,
                           SAMPLE_RATE_24000, SAMPLE_RATE_48000};
        int32_t inv[] = {SAMPLE_RATE_INVALID_LOW, SAMPLE_RATE_INVALID_HIGH};
        int32_t err = 0;
        for (int32_t i = 0; i < VALID_RATE_COUNT; i++) {
            if (ConfigCheck(codec, valid[i], CHANNEL_MONO, 0) != 0) {
                err++;
            }
        }
        for (int32_t i = 0; i < INVALID_RATE_COUNT; i++) {
            if (ConfigCheck(codec, inv[i], CHANNEL_MONO, 0) == 0) {
                err++;
            }
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value DecoderChannelCountCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_MONO, 0) != 0) {
            err++;
        }
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_STEREO, 0) != 0) {
            err++;
        }
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_INVALID_ZERO, 0) == 0) {
            err++;
        }
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_INVALID_HIGH, 0) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value EncoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t valid[] = {SAMPLE_RATE_8000, SAMPLE_RATE_12000, SAMPLE_RATE_16000,
                           SAMPLE_RATE_24000, SAMPLE_RATE_48000};
        int32_t inv[] = {SAMPLE_RATE_INVALID_LOW, SAMPLE_RATE_INVALID_HIGH};
        int32_t err = 0;
        for (int32_t i = 0; i < VALID_RATE_COUNT; i++) {
            if (ConfigCheck(codec, valid[i], CHANNEL_MONO, BITRATE_64KBPS) != 0) {
                err++;
            }
        }
        for (int32_t i = 0; i < INVALID_RATE_COUNT; i++) {
            if (ConfigCheck(codec, inv[i], CHANNEL_MONO, BITRATE_64KBPS) == 0) {
                err++;
            }
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value EncoderChannelCountCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_MONO, BITRATE_64KBPS) != 0) {
            err++;
        }
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_STEREO, BITRATE_64KBPS) != 0) {
            err++;
        }
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_INVALID_ZERO, BITRATE_64KBPS) == 0) {
            err++;
        }
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_INVALID_HIGH, BITRATE_64KBPS) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value EncoderBitrateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        int64_t rates[] = {6000, 16000, 32000, 64000, 96000, 128000, 256000, 510000};
        for (auto br : rates) {
            if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_MONO, br) != 0) {
                err++;
            }
        }
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_MONO, BITRATE_BELOW_MIN) == 0) {
            err++;
        }
        if (ConfigCheck(codec, SAMPLE_RATE_48000, CHANNEL_MONO, BITRATE_ABOVE_MAX) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value EncoderBitrateSampleRateComboCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        int32_t r[] = {8000, 8000, 12000, 16000, 24000, 48000, 48000, 48000, 48000};
        int64_t b[] = {6000, 32000, 16000, 32000, 64000, 64000, 128000, 256000, 510000};
        for (int i = 0; i < COMBO_TEST_COUNT; i++) {
            if (ConfigCheck(codec, r[i], CHANNEL_MONO, b[i]) != 0) {
                err++;
            }
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value EncoderStereoSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t valid[] = {SAMPLE_RATE_8000, SAMPLE_RATE_12000, SAMPLE_RATE_16000,
                           SAMPLE_RATE_24000, SAMPLE_RATE_48000};
        int32_t err = 0;
        for (int32_t i = 0; i < VALID_RATE_COUNT; i++) {
            if (ConfigCheck(codec, valid[i], CHANNEL_STEREO, BITRATE_64KBPS) != 0) {
                err++;
            }
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value DecoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Opus");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Opus");
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value EncoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Opus");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Opus");
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"DecoderSampleRateCheck", nullptr, DecoderSampleRateCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DecoderChannelCountCheck", nullptr, DecoderChannelCountCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"EncoderSampleRateCheck", nullptr, EncoderSampleRateCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"EncoderChannelCountCheck", nullptr, EncoderChannelCountCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"EncoderBitrateCheck", nullptr, EncoderBitrateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"EncoderBitrateSampleRateComboCheck", nullptr, EncoderBitrateSampleRateComboCheck,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"EncoderStereoSampleRateCheck", nullptr, EncoderStereoSampleRateCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DecoderCreateByNameCheck", nullptr, DecoderCreateByNameCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"EncoderCreateByNameCheck", nullptr, EncoderCreateByNameCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libaudioopuscodec",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
