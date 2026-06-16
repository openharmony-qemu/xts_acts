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

#define AMRNB_RATE   (8000)
#define AMRWB_RATE   (16000)
#define CHANNEL_MONO (1)
#define CHANNEL_INVALID_ZERO (0)
#define CHANNEL_INVALID_TWO  (2)
#define AMRNB_BITRATE_MAX    (12200)
#define AMRNB_BITRATE_BELOW_MIN (4749)
#define AMRWB_BITRATE_MAX    (23850)

static napi_value NapiReturn(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
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

static bool IsSupportCodec(const char *mime, bool isEncoder)
{
    return OH_AVCodec_GetCapability(mime, isEncoder) != nullptr;
}

static napi_value AmrNbDecoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        if (ConfigCheck(codec, AMRNB_RATE, CHANNEL_MONO, 0) != 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRNB_RATE - 1, CHANNEL_MONO, 0) == 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRNB_RATE + 1, CHANNEL_MONO, 0) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrNbDecoderChannelCountCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        if (ConfigCheck(codec, AMRNB_RATE, CHANNEL_MONO, 0) != 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRNB_RATE, CHANNEL_INVALID_ZERO, 0) == 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRNB_RATE, CHANNEL_INVALID_TWO, 0) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrNbEncoderBitrateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        int64_t br[] = {4750, 5150, 5900, 6700, 7400, 7950, 10200, 12200};
        for (auto b : br) {
            if (ConfigCheck(codec, AMRNB_RATE, CHANNEL_MONO, b) != 0) {
                err++;
            }
        }
        if (ConfigCheck(codec, AMRNB_RATE, CHANNEL_MONO, AMRNB_BITRATE_BELOW_MIN) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrNbEncoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        if (ConfigCheck(codec, AMRNB_RATE, CHANNEL_MONO, AMRNB_BITRATE_MAX) != 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRNB_RATE - 1, CHANNEL_MONO, AMRNB_BITRATE_MAX) == 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRNB_RATE + 1, CHANNEL_MONO, AMRNB_BITRATE_MAX) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrWbDecoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        if (ConfigCheck(codec, AMRWB_RATE, CHANNEL_MONO, 0) != 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRWB_RATE - 1, CHANNEL_MONO, 0) == 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRWB_RATE + 1, CHANNEL_MONO, 0) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrWbDecoderChannelCountCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        if (ConfigCheck(codec, AMRWB_RATE, CHANNEL_MONO, 0) != 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRWB_RATE, CHANNEL_INVALID_ZERO, 0) == 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRWB_RATE, CHANNEL_INVALID_TWO, 0) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrWbEncoderBitrateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        int64_t br[] = {6600, 8850, 12650, 14250, 15850, 18250, 19850, 23050, 23850};
        for (auto b : br) {
            if (ConfigCheck(codec, AMRWB_RATE, CHANNEL_MONO, b) != 0) {
                err++;
            }
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrWbEncoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true);
        if (codec == nullptr) {
            return NapiReturn(env, FAIL);
        }
        int32_t err = 0;
        if (ConfigCheck(codec, AMRWB_RATE, CHANNEL_MONO, AMRWB_BITRATE_MAX) != 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRWB_RATE - 1, CHANNEL_MONO, AMRWB_BITRATE_MAX) == 0) {
            err++;
        }
        if (ConfigCheck(codec, AMRWB_RATE + 1, CHANNEL_MONO, AMRWB_BITRATE_MAX) == 0) {
            err++;
        }
        OH_AudioCodec_Destroy(codec);
        if (err == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true);
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrNbDecoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Amrnb");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Amrnb");
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrNbEncoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Amrnb");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Amrnb");
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrWbDecoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Amrwb");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Amrwb");
        if (c == nullptr) {
            backParam = SUCCESS;
        }
    }
    return NapiReturn(env, backParam);
}

static napi_value AmrWbEncoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    int backParam = FAIL;
    if (IsSupportCodec(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true)) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Amrwb");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *c = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Amrwb");
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
        {"AmrNbDecoderSampleRateCheck", nullptr, AmrNbDecoderSampleRateCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AmrNbDecoderChannelCountCheck", nullptr, AmrNbDecoderChannelCountCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AmrNbEncoderBitrateCheck", nullptr, AmrNbEncoderBitrateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AmrNbEncoderSampleRateCheck", nullptr, AmrNbEncoderSampleRateCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AmrWbDecoderSampleRateCheck", nullptr, AmrWbDecoderSampleRateCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AmrWbDecoderChannelCountCheck", nullptr, AmrWbDecoderChannelCountCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AmrWbEncoderBitrateCheck", nullptr, AmrWbEncoderBitrateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"AmrWbEncoderSampleRateCheck", nullptr, AmrWbEncoderSampleRateCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AmrNbDecoderCreateByNameCheck", nullptr, AmrNbDecoderCreateByNameCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AmrNbEncoderCreateByNameCheck", nullptr, AmrNbEncoderCreateByNameCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AmrWbDecoderCreateByNameCheck", nullptr, AmrWbDecoderCreateByNameCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"AmrWbEncoderCreateByNameCheck", nullptr, AmrWbEncoderCreateByNameCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
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
    .nm_modname = "libaudioamrencoder",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
