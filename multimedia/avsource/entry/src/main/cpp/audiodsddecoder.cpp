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
#include <multimedia/player_framework/native_avcodec_audiobase.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <multimedia/player_framework/native_averrors.h>
#include <cstdint>

#define FAIL (-1)
#define SUCCESS (0)

/**
 * The sample rate of a DSD stream is reported to the audio decoder as DSD bit rate / 8,
 * for example DSD64: 2822400 / 8 = 352800.
 */
#define DSD_SAMPLE_RATE_DSD64  (352800)
#define DSD_SAMPLE_RATE_DSD128 (705600)
#define DSD_SAMPLE_RATE_DSD256 (1411200)
#define DSD_SAMPLE_RATE_INVALID_ZERO (0)
#define DSD_SAMPLE_RATE_INVALID_NEGATIVE (-1)

/**
 * A DSD stream carries 1 to 6 channels.
 */
#define CHANNEL_MONO (1)
#define CHANNEL_STEREO (2)
#define CHANNEL_MAX (6)
#define CHANNEL_INVALID_ZERO (0)
#define CHANNEL_INVALID_ABOVE_MAX (7)

#define DSD_TYPE_COUNT (3)
#define DSD_TYPE_INVALID_COUNT (4)
#define DSD_VALID_RATE_COUNT (3)
#define DSD_INVALID_RATE_COUNT (2)

static napi_value NapiReturn(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static bool IsSupportDsd()
{
    return OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_DSD, false) != nullptr;
}

static OH_AVCodec *CreateDsdDecoder()
{
    return OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_DSD, false);
}

/**
 * Product without DSD support: the test passes only when the decoder cannot be created either,
 * so an unsupported product still reports a clean result instead of a false failure.
 */
static int32_t CheckUnsupported()
{
    OH_AVCodec *codec = CreateDsdDecoder();
    if (codec == nullptr) {
        return SUCCESS;
    }
    OH_AudioCodec_Destroy(codec);
    return FAIL;
}

/**
 * Configure the DSD decoder. The DSD codec type key is optional, setDsdCodecType decides whether
 * OH_MD_KEY_AUDIO_DSD_CODEC_TYPE is written into the format, so that both the default value (0)
 * and an explicit value can be verified.
 */
static OH_AVErrCode ConfigureDsd(OH_AVCodec *codec, int32_t dsdCodecType, bool setDsdCodecType,
                                 int32_t channelCount, int32_t sampleRate)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        return AV_ERR_NO_MEMORY;
    }
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, OH_BitsPerSample::SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channelCount);
    if (setDsdCodecType) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_DSD_CODEC_TYPE, dsdCodecType);
    }
    OH_AVErrCode ret = OH_AudioCodec_Configure(codec, format);
    OH_AVFormat_Destroy(format);
    return ret;
}

/**
 * One independent configure round trip: success means the decoder accepted the parameters.
 */
static int32_t SingleConfigureCheck(int32_t dsdCodecType, bool setDsdCodecType,
                                    int32_t channelCount, int32_t sampleRate)
{
    OH_AVCodec *codec = CreateDsdDecoder();
    if (codec == nullptr) {
        return FAIL;
    }
    OH_AVErrCode configureRet = ConfigureDsd(codec, dsdCodecType, setDsdCodecType, channelCount, sampleRate);
    OH_AudioCodec_Reset(codec);
    OH_AudioCodec_Destroy(codec);
    return (configureRet == AV_ERR_OK) ? SUCCESS : FAIL;
}

/**
 * No OH_MD_KEY_AUDIO_DSD_CODEC_TYPE set: the decoder uses the documented default value
 * OH_AVCODEC_DSD_CODEC_LSBF_PLANAR (0) and must be configurable.
 */
static napi_value DsdCodecTypeDefaultCheck(napi_env env, napi_callback_info info)
{
    if (!IsSupportDsd()) {
        return NapiReturn(env, CheckUnsupported());
    }
    return NapiReturn(env, SingleConfigureCheck(OH_AVCODEC_DSD_CODEC_LSBF_PLANAR, false,
                                                CHANNEL_STEREO, DSD_SAMPLE_RATE_DSD64));
}

/**
 * OH_AVCODEC_DSD_CODEC_LSBF_PLANAR (0): dsf container, LSB first and flat layout.
 */
static napi_value DsdCodecTypeLsbFirstPlanarCheck(napi_env env, napi_callback_info info)
{
    if (!IsSupportDsd()) {
        return NapiReturn(env, CheckUnsupported());
    }
    return NapiReturn(env, SingleConfigureCheck(OH_AVCODEC_DSD_CODEC_LSBF_PLANAR, true,
                                                CHANNEL_STEREO, DSD_SAMPLE_RATE_DSD64));
}

/**
 * OH_AVCODEC_DSD_CODEC_MSBF_PLANAR (1): dsf container, MSB first and flat layout.
 */
static napi_value DsdCodecTypeMsbFirstPlanarCheck(napi_env env, napi_callback_info info)
{
    if (!IsSupportDsd()) {
        return NapiReturn(env, CheckUnsupported());
    }
    return NapiReturn(env, SingleConfigureCheck(OH_AVCODEC_DSD_CODEC_MSBF_PLANAR, true,
                                                CHANNEL_STEREO, DSD_SAMPLE_RATE_DSD64));
}

/**
 * OH_AVCODEC_DSD_CODEC_MSBF (2): dff container, MSB first and interleaved.
 */
static napi_value DsdCodecTypeMsbFirstCheck(napi_env env, napi_callback_info info)
{
    if (!IsSupportDsd()) {
        return NapiReturn(env, CheckUnsupported());
    }
    return NapiReturn(env, SingleConfigureCheck(OH_AVCODEC_DSD_CODEC_MSBF, true,
                                                CHANNEL_STEREO, DSD_SAMPLE_RATE_DSD64));
}

/**
 * Every value of OH_AVCodec_DSDCodecType must be accepted when it is combined with the
 * upper and lower channel limit of a DSD stream, and a channel count outside [1, 6] must be
 * rejected for every type.
 */
static napi_value DsdCodecTypeChannelRangeCheck(napi_env env, napi_callback_info info)
{
    if (!IsSupportDsd()) {
        return NapiReturn(env, CheckUnsupported());
    }
    OH_AVCodec *codec = CreateDsdDecoder();
    if (codec == nullptr) {
        return NapiReturn(env, FAIL);
    }
    int32_t types[DSD_TYPE_COUNT] = {OH_AVCODEC_DSD_CODEC_LSBF_PLANAR, OH_AVCODEC_DSD_CODEC_MSBF_PLANAR,
                                     OH_AVCODEC_DSD_CODEC_MSBF};
    int32_t validChannels[2] = {CHANNEL_MONO, CHANNEL_MAX};
    int32_t invalidChannels[2] = {CHANNEL_INVALID_ZERO, CHANNEL_INVALID_ABOVE_MAX};
    int32_t err = 0;
    for (int32_t i = 0; i < DSD_TYPE_COUNT; i++) {
        for (int32_t j = 0; j < 2; j++) {
            if (ConfigureDsd(codec, types[i], true, validChannels[j], DSD_SAMPLE_RATE_DSD64) != AV_ERR_OK) {
                err++;
            }
            OH_AudioCodec_Reset(codec);
        }
        for (int32_t j = 0; j < 2; j++) {
            if (ConfigureDsd(codec, types[i], true, invalidChannels[j], DSD_SAMPLE_RATE_DSD64) == AV_ERR_OK) {
                err++;
            }
            OH_AudioCodec_Reset(codec);
        }
    }
    OH_AudioCodec_Destroy(codec);
    return NapiReturn(env, (err == 0) ? SUCCESS : FAIL);
}

/**
 * Every value of OH_AVCodec_DSDCodecType must be accepted with a positive sample rate, and an
 * invalid sample rate must be rejected. The sample rate of a DSD64/128/256 stream is 352800,
 * 705600 and 1411200 respectively.
 */
static napi_value DsdCodecTypeSampleRateCheck(napi_env env, napi_callback_info info)
{
    if (!IsSupportDsd()) {
        return NapiReturn(env, CheckUnsupported());
    }
    OH_AVCodec *codec = CreateDsdDecoder();
    if (codec == nullptr) {
        return NapiReturn(env, FAIL);
    }
    int32_t types[DSD_TYPE_COUNT] = {OH_AVCODEC_DSD_CODEC_LSBF_PLANAR, OH_AVCODEC_DSD_CODEC_MSBF_PLANAR,
                                     OH_AVCODEC_DSD_CODEC_MSBF};
    int32_t validRates[DSD_VALID_RATE_COUNT] = {DSD_SAMPLE_RATE_DSD64, DSD_SAMPLE_RATE_DSD128,
                                                DSD_SAMPLE_RATE_DSD256};
    int32_t invalidRates[DSD_INVALID_RATE_COUNT] = {DSD_SAMPLE_RATE_INVALID_ZERO, DSD_SAMPLE_RATE_INVALID_NEGATIVE};
    int32_t err = 0;
    for (int32_t i = 0; i < DSD_TYPE_COUNT; i++) {
        for (int32_t j = 0; j < DSD_VALID_RATE_COUNT; j++) {
            if (ConfigureDsd(codec, types[i], true, CHANNEL_STEREO, validRates[j]) != AV_ERR_OK) {
                err++;
            }
            OH_AudioCodec_Reset(codec);
        }
        for (int32_t j = 0; j < DSD_INVALID_RATE_COUNT; j++) {
            if (ConfigureDsd(codec, types[i], true, CHANNEL_STEREO, invalidRates[j]) == AV_ERR_OK) {
                err++;
            }
            OH_AudioCodec_Reset(codec);
        }
    }
    OH_AudioCodec_Destroy(codec);
    return NapiReturn(env, (err == 0) ? SUCCESS : FAIL);
}

/**
 * Values outside OH_AVCodec_DSDCodecType are undefined, the decoder may reject them or fall back
 * to the default type, but the decoder instance must survive every attempt: on the fallback path
 * it stays usable, on the rejection path a valid configuration is still accepted afterwards.
 */
static napi_value DsdCodecTypeOutOfRangeCheck(napi_env env, napi_callback_info info)
{
    if (!IsSupportDsd()) {
        return NapiReturn(env, CheckUnsupported());
    }
    OH_AVCodec *codec = CreateDsdDecoder();
    if (codec == nullptr) {
        return NapiReturn(env, FAIL);
    }
    int32_t invalidTypes[DSD_TYPE_INVALID_COUNT] = {3, 255, -1, INT32_MAX};
    int32_t err = 0;
    for (int32_t i = 0; i < DSD_TYPE_INVALID_COUNT; i++) {
        OH_AVErrCode configureRet = ConfigureDsd(codec, invalidTypes[i], true, CHANNEL_STEREO,
                                                DSD_SAMPLE_RATE_DSD64);
        if (configureRet == AV_ERR_OK) {
            /* accepted: the default type was used, the decoder must still be resettable */
            if (OH_AudioCodec_Reset(codec) != AV_ERR_OK) {
                err++;
            }
            continue;
        }
        /* rejected: the instance must not be broken, a valid configuration still has to work */
        OH_AudioCodec_Reset(codec);
        if (ConfigureDsd(codec, OH_AVCODEC_DSD_CODEC_MSBF_PLANAR, true, CHANNEL_STEREO,
                         DSD_SAMPLE_RATE_DSD64) != AV_ERR_OK) {
            err++;
        }
        OH_AudioCodec_Reset(codec);
    }
    OH_AudioCodec_Destroy(codec);
    return NapiReturn(env, (err == 0) ? SUCCESS : FAIL);
}

/**
 * OH_MD_KEY_AUDIO_DSD_CODEC_TYPE is an int32_t key: every OH_AVCodec_DSDCodecType value has to
 * survive a set/get round trip without being normalized or clamped.
 */
static napi_value DsdCodecTypeFormatKeyCheck(napi_env env, napi_callback_info info)
{
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        return NapiReturn(env, FAIL);
    }
    int32_t types[DSD_TYPE_COUNT] = {OH_AVCODEC_DSD_CODEC_LSBF_PLANAR, OH_AVCODEC_DSD_CODEC_MSBF_PLANAR,
                                     OH_AVCODEC_DSD_CODEC_MSBF};
    int32_t err = 0;
    for (int32_t i = 0; i < DSD_TYPE_COUNT; i++) {
        if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_DSD_CODEC_TYPE, types[i])) {
            err++;
        }
        int32_t value = FAIL;
        if (!OH_AVFormat_GetIntValue(format, OH_MD_KEY_AUDIO_DSD_CODEC_TYPE, &value)) {
            err++;
        }
        if (value != types[i]) {
            err++;
        }
    }
    /* the last written value must be the one that is read back */
    if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_DSD_CODEC_TYPE, OH_AVCODEC_DSD_CODEC_LSBF_PLANAR)) {
        err++;
    }
    int32_t lastValue = FAIL;
    if (!OH_AVFormat_GetIntValue(format, OH_MD_KEY_AUDIO_DSD_CODEC_TYPE, &lastValue)) {
        err++;
    }
    if (lastValue != OH_AVCODEC_DSD_CODEC_LSBF_PLANAR) {
        err++;
    }
    OH_AVFormat_Destroy(format);
    return NapiReturn(env, (err == 0) ? SUCCESS : FAIL);
}

/**
 * DSD is a decoding only codec: the decoder capability and the decoder instance must be available
 * together, no encoder capability may be reported for the DSD MIME type, and an unsupported product
 * has to fail the creation gracefully.
 */
static napi_value DsdCapabilityAndCreateCheck(napi_env env, napi_callback_info info)
{
    int32_t err = 0;
    OH_AVCapability *decoderCapability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_DSD, false);
    OH_AVCapability *encoderCapability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_DSD, true);
    if (encoderCapability != nullptr) {
        err++;
    }
    OH_AVCodec *decoder = CreateDsdDecoder();
    if (decoderCapability == nullptr) {
        if (decoder != nullptr) {
            OH_AudioCodec_Destroy(decoder);
            err++;
        }
    } else if (decoder == nullptr) {
        err++;
    } else {
        bool isValid = false;
        if (OH_AudioCodec_IsValid(decoder, &isValid) != AV_ERR_OK || !isValid) {
            err++;
        }
        OH_AudioCodec_Destroy(decoder);
    }
    return NapiReturn(env, (err == 0) ? SUCCESS : FAIL);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"DsdCodecTypeDefaultCheck", nullptr, DsdCodecTypeDefaultCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DsdCodecTypeLsbFirstPlanarCheck", nullptr, DsdCodecTypeLsbFirstPlanarCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DsdCodecTypeMsbFirstPlanarCheck", nullptr, DsdCodecTypeMsbFirstPlanarCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DsdCodecTypeMsbFirstCheck", nullptr, DsdCodecTypeMsbFirstCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DsdCodecTypeOutOfRangeCheck", nullptr, DsdCodecTypeOutOfRangeCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DsdCodecTypeFormatKeyCheck", nullptr, DsdCodecTypeFormatKeyCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DsdCodecTypeChannelRangeCheck", nullptr, DsdCodecTypeChannelRangeCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DsdCodecTypeSampleRateCheck", nullptr, DsdCodecTypeSampleRateCheck, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"DsdCapabilityAndCreateCheck", nullptr, DsdCapabilityAndCreateCheck, nullptr, nullptr,
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
    .nm_modname = "libaudiodsddecoder",
    .nm_priv = ((void *)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
