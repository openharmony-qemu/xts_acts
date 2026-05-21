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
#include <unistd.h>

#define FAIL (-1)
#define SUCCESS (0)
#define OPUS_LIB_PATH "/system/lib64/libopus_codec.z.so"

static bool IsOpusLibAvailable()
{
    return access(OPUS_LIB_PATH, F_OK) == 0;
}

// Opus sample rates
#define SAMPLE_RATE_8000   (8000)
#define SAMPLE_RATE_12000  (12000)
#define SAMPLE_RATE_16000  (16000)
#define SAMPLE_RATE_24000  (24000)
#define SAMPLE_RATE_48000  (48000)
#define SAMPLE_RATE_INVALID_LOW  (7999)
#define SAMPLE_RATE_INVALID_HIGH (48001)
#define SAMPLE_RATE_ZERO   (0)

// Channel counts
#define CHANNEL_MONO   (1)
#define CHANNEL_STEREO (2)
#define CHANNEL_INVALID_ZERO  (0)
#define CHANNEL_INVALID_HIGH  (3)

// Bitrates (bps)
#define BITRATE_6KBPS   (6000)
#define BITRATE_16KBPS  (16000)
#define BITRATE_32KBPS  (32000)
#define BITRATE_64KBPS  (64000)
#define BITRATE_96KBPS  (96000)
#define BITRATE_128KBPS (128000)
#define BITRATE_256KBPS (256000)
#define BITRATE_510KBPS (510000)
#define BITRATE_INVALID_LOW  (5999)
#define BITRATE_INVALID_HIGH (510001)
#define BITRATE_ZERO    (0)

using namespace std;

static bool IsSupportOpus()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
    return capability != nullptr;
}

// ── Decoder: Sample Rate ──────────────────────────────────────────
static napi_value DecoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    if (!IsOpusLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        int32_t validRates[] = {SAMPLE_RATE_8000, SAMPLE_RATE_12000, SAMPLE_RATE_16000,
                                SAMPLE_RATE_24000, SAMPLE_RATE_48000};
        for (auto rate : validRates) {
            OH_AVFormat *format = OH_AVFormat_Create();
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, rate);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
            ret = OH_AudioCodec_Configure(codec, format);
            if (ret != AV_ERR_OK) {
                errNum++;
            }
            OH_AudioCodec_Reset(codec);
            OH_AVFormat_Destroy(format);
        }
        // invalid rates
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE_INVALID_LOW);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE_INVALID_HIGH);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AVFormat_Destroy(format);
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── Decoder: Channel Count ────────────────────────────────────────
static napi_value DecoderChannelCountCheck(napi_env env, napi_callback_info info)
{
    if (!IsOpusLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        // valid: mono
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE_48000);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // valid: stereo
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_STEREO);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 0 channels
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_INVALID_ZERO);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 3 channels
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_INVALID_HIGH);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AVFormat_Destroy(format);
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, false);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── Encoder: Sample Rate ──────────────────────────────────────────
static napi_value EncoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    if (!IsOpusLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        int32_t validRates[] = {SAMPLE_RATE_8000, SAMPLE_RATE_12000, SAMPLE_RATE_16000,
                                SAMPLE_RATE_24000, SAMPLE_RATE_48000};
        for (auto rate : validRates) {
            OH_AVFormat *format = OH_AVFormat_Create();
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, rate);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
            OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITRATE_64KBPS);
            ret = OH_AudioCodec_Configure(codec, format);
            if (ret != AV_ERR_OK) {
                errNum++;
            }
            OH_AudioCodec_Reset(codec);
            OH_AVFormat_Destroy(format);
        }
        // invalid rate
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE_INVALID_LOW);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITRATE_64KBPS);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE_INVALID_HIGH);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AVFormat_Destroy(format);
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── Encoder: Channel Count ────────────────────────────────────────
static napi_value EncoderChannelCountCheck(napi_env env, napi_callback_info info)
{
    if (!IsOpusLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE_48000);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITRATE_64KBPS);
        // valid: mono
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // valid: stereo
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_STEREO);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 0
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_INVALID_ZERO);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 3
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_INVALID_HIGH);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AVFormat_Destroy(format);
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── Encoder: Bitrate ──────────────────────────────────────────────
static napi_value EncoderBitrateCheck(napi_env env, napi_callback_info info)
{
    if (!IsOpusLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        int64_t validBitrates[] = {BITRATE_6KBPS, BITRATE_16KBPS, BITRATE_32KBPS,
                                   BITRATE_64KBPS, BITRATE_96KBPS, BITRATE_128KBPS,
                                   BITRATE_256KBPS, BITRATE_510KBPS};
        for (auto br : validBitrates) {
            OH_AVFormat *format = OH_AVFormat_Create();
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE_48000);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
            OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, br);
            ret = OH_AudioCodec_Configure(codec, format);
            if (ret != AV_ERR_OK) {
                errNum++;
            }
            OH_AudioCodec_Reset(codec);
            OH_AVFormat_Destroy(format);
        }
        // invalid bitrate
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, SAMPLE_RATE_48000);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITRATE_INVALID_LOW);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITRATE_INVALID_HIGH);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AVFormat_Destroy(format);
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── Encoder: Bitrate + Sample Rate Combination ────────────────────
static napi_value EncoderBitrateSampleRateComboCheck(napi_env env, napi_callback_info info)
{
    if (!IsOpusLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        struct Combo { int32_t rate; int64_t bitrate; };
        Combo combos[] = {
            {SAMPLE_RATE_8000,  BITRATE_6KBPS},
            {SAMPLE_RATE_8000,  BITRATE_32KBPS},
            {SAMPLE_RATE_12000, BITRATE_16KBPS},
            {SAMPLE_RATE_16000, BITRATE_32KBPS},
            {SAMPLE_RATE_24000, BITRATE_64KBPS},
            {SAMPLE_RATE_48000, BITRATE_64KBPS},
            {SAMPLE_RATE_48000, BITRATE_128KBPS},
            {SAMPLE_RATE_48000, BITRATE_256KBPS},
            {SAMPLE_RATE_48000, BITRATE_510KBPS},
        };
        for (auto &c : combos) {
            OH_AVFormat *format = OH_AVFormat_Create();
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, c.rate);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
            OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, c.bitrate);
            ret = OH_AudioCodec_Configure(codec, format);
            if (ret != AV_ERR_OK) {
                errNum++;
            }
            OH_AudioCodec_Reset(codec);
            OH_AVFormat_Destroy(format);
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── Encoder: Stereo + Different Rates ─────────────────────────────
static napi_value EncoderStereoSampleRateCheck(napi_env env, napi_callback_info info)
{
    if (!IsOpusLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportOpus()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        int32_t validRates[] = {SAMPLE_RATE_8000, SAMPLE_RATE_12000, SAMPLE_RATE_16000,
                                SAMPLE_RATE_24000, SAMPLE_RATE_48000};
        for (auto rate : validRates) {
            OH_AVFormat *format = OH_AVFormat_Create();
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, rate);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_STEREO);
            OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITRATE_64KBPS);
            ret = OH_AudioCodec_Configure(codec, format);
            if (ret != AV_ERR_OK) {
                errNum++;
            }
            OH_AudioCodec_Reset(codec);
            OH_AVFormat_Destroy(format);
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
        OH_AudioCodec_Destroy(codec);
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_OPUS, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── Create by name (Decoder) ──────────────────────────────────────
static napi_value DecoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    if (!IsOpusLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportOpus()) {
        int32_t errNum = 0;
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Opus");
        if (codec == nullptr) {
            errNum++;
        } else {
            OH_AudioCodec_Destroy(codec);
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Opus");
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── Create by name (Encoder) ──────────────────────────────────────
static napi_value EncoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    if (!IsOpusLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportOpus()) {
        int32_t errNum = 0;
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Opus");
        if (codec == nullptr) {
            errNum++;
        } else {
            OH_AudioCodec_Destroy(codec);
        }
        if (errNum == 0) {
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Opus");
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── NAPI Module Registration ──────────────────────────────────────
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"DecoderSampleRateCheck", nullptr, DecoderSampleRateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"DecoderChannelCountCheck", nullptr, DecoderChannelCountCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"EncoderSampleRateCheck", nullptr, EncoderSampleRateCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"EncoderChannelCountCheck", nullptr, EncoderChannelCountCheck, nullptr, nullptr, nullptr,
         napi_default, nullptr},
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
