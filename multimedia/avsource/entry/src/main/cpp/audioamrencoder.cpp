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
#define AMR_LIB_PATH "/system/lib64/libopencore_amr_alg.z.so"

static bool IsAmrLibAvailable()
{
    return access(AMR_LIB_PATH, F_OK) == 0;
}

// AMR-NB: fixed 8000 Hz, mono
#define AMRNB_SAMPLE_RATE       (8000)
#define AMRNB_SAMPLE_RATE_INVALID_LOW  (7999)
#define AMRNB_SAMPLE_RATE_INVALID_HIGH (8001)

// AMR-WB: fixed 16000 Hz, mono
#define AMRWB_SAMPLE_RATE       (16000)
#define AMRWB_SAMPLE_RATE_INVALID_LOW  (15999)
#define AMRWB_SAMPLE_RATE_INVALID_HIGH (16001)

// Channel counts
#define CHANNEL_MONO   (1)
#define CHANNEL_INVALID_ZERO  (0)
#define CHANNEL_INVALID_STEREO (2)

// AMR-NB bitrates (bps)
#define AMRNB_BITRATE_MR475  (4750)
#define AMRNB_BITRATE_MR515  (5150)
#define AMRNB_BITRATE_MR59   (5900)
#define AMRNB_BITRATE_MR67   (6700)
#define AMRNB_BITRATE_MR74   (7400)
#define AMRNB_BITRATE_MR795  (7950)
#define AMRNB_BITRATE_MR102  (10200)
#define AMRNB_BITRATE_MR122  (12200)

// AMR-WB bitrates (bps)
#define AMRWB_BITRATE_6600   (6600)
#define AMRWB_BITRATE_8850   (8850)
#define AMRWB_BITRATE_12650  (12650)
#define AMRWB_BITRATE_14250  (14250)
#define AMRWB_BITRATE_15850  (15850)
#define AMRWB_BITRATE_18250  (18250)
#define AMRWB_BITRATE_19850  (19850)
#define AMRWB_BITRATE_23050  (23050)
#define AMRWB_BITRATE_23850  (23850)

#define BITRATE_INVALID_LOW  (4749)
#define BITRATE_INVALID_HIGH (12201)

using namespace std;

static bool IsSupportAmrNb()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
    return capability != nullptr;
}

static bool IsSupportAmrNbEncoder()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true);
    return capability != nullptr;
}

static bool IsSupportAmrWb()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
    return capability != nullptr;
}

static bool IsSupportAmrWbEncoder()
{
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true);
    return capability != nullptr;
}

// ── AMR-NB Decoder: Sample Rate ───────────────────────────────────
static napi_value AmrNbDecoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrNb()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        // valid: 8000
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRNB_SAMPLE_RATE);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 7999
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRNB_SAMPLE_RATE_INVALID_LOW);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 8001
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRNB_SAMPLE_RATE_INVALID_HIGH);
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
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── AMR-NB Decoder: Channel Count ─────────────────────────────────
static napi_value AmrNbDecoderChannelCountCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrNb()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRNB_SAMPLE_RATE);
        // valid: mono
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
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
        // invalid: stereo
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_INVALID_STEREO);
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
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, false);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── AMR-NB Encoder: Bitrate ───────────────────────────────────────
static napi_value AmrNbEncoderBitrateCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrNbEncoder()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        int64_t validBitrates[] = {AMRNB_BITRATE_MR475, AMRNB_BITRATE_MR515, AMRNB_BITRATE_MR59,
                                   AMRNB_BITRATE_MR67,  AMRNB_BITRATE_MR74,  AMRNB_BITRATE_MR795,
                                   AMRNB_BITRATE_MR102, AMRNB_BITRATE_MR122};
        for (auto br : validBitrates) {
            OH_AVFormat *format = OH_AVFormat_Create();
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRNB_SAMPLE_RATE);
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
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRNB_SAMPLE_RATE);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, BITRATE_INVALID_LOW);
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
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── AMR-NB Encoder: Sample Rate Validation ────────────────────────
static napi_value AmrNbEncoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrNbEncoder()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        // valid: 8000
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRNB_SAMPLE_RATE);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, AMRNB_BITRATE_MR122);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 7999
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRNB_SAMPLE_RATE_INVALID_LOW);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 8001
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRNB_SAMPLE_RATE_INVALID_HIGH);
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
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_NB, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── AMR-WB Decoder: Sample Rate ───────────────────────────────────
static napi_value AmrWbDecoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrWb()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        // valid: 16000
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRWB_SAMPLE_RATE);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 15999
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRWB_SAMPLE_RATE_INVALID_LOW);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 16001
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRWB_SAMPLE_RATE_INVALID_HIGH);
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
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── AMR-WB Decoder: Channel Count ─────────────────────────────────
static napi_value AmrWbDecoderChannelCountCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrWb()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRWB_SAMPLE_RATE);
        // valid: mono
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
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
        // invalid: stereo
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_INVALID_STEREO);
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
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, false);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── AMR-WB Encoder: Bitrate ───────────────────────────────────────
static napi_value AmrWbEncoderBitrateCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrWbEncoder()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        int64_t validBitrates[] = {AMRWB_BITRATE_6600,  AMRWB_BITRATE_8850,  AMRWB_BITRATE_12650,
                                   AMRWB_BITRATE_14250, AMRWB_BITRATE_15850, AMRWB_BITRATE_18250,
                                   AMRWB_BITRATE_19850, AMRWB_BITRATE_23050, AMRWB_BITRATE_23850};
        for (auto br : validBitrates) {
            OH_AVFormat *format = OH_AVFormat_Create();
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRWB_SAMPLE_RATE);
            OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
            OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, br);
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
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── AMR-WB Encoder: Sample Rate Validation ────────────────────────
static napi_value AmrWbEncoderSampleRateCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrWbEncoder()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true);
        if (codec == nullptr) {
            napi_value r = nullptr;
            napi_create_int32(env, FAIL, &r);
            return r;
        }
        int32_t errNum = 0;
        OH_AVErrCode ret;
        // valid: 16000
        OH_AVFormat *format = OH_AVFormat_Create();
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRWB_SAMPLE_RATE);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, CHANNEL_MONO);
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, AMRWB_BITRATE_23850);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret != AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 15999
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRWB_SAMPLE_RATE_INVALID_LOW);
        ret = OH_AudioCodec_Configure(codec, format);
        if (ret == AV_ERR_OK) {
            errNum++;
        }
        OH_AudioCodec_Reset(codec);
        // invalid: 16001
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, AMRWB_SAMPLE_RATE_INVALID_HIGH);
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
        OH_AVCodec *codec = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AMR_WB, true);
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

// ── Create by name checks ─────────────────────────────────────────
static napi_value AmrNbDecoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrNb()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Amrnb");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Amrnb");
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AmrNbEncoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrNbEncoder()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Amrnb");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Amrnb");
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AmrWbDecoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrWb()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Amrwb");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Decoder.Audio.Amrwb");
        if (codec == nullptr) {
            backParam = SUCCESS;
        }
    }
    napi_value result = nullptr;
    napi_create_int32(env, backParam, &result);
    return result;
}

static napi_value AmrWbEncoderCreateByNameCheck(napi_env env, napi_callback_info info)
{
    if (!IsAmrLibAvailable()) {
        napi_value r = nullptr;
        napi_create_int32(env, SUCCESS, &r);
        return r;
    }
    int backParam = FAIL;
    if (IsSupportAmrWbEncoder()) {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Amrwb");
        if (codec != nullptr) {
            OH_AudioCodec_Destroy(codec);
            backParam = SUCCESS;
        }
    } else {
        OH_AVCodec *codec = OH_AudioCodec_CreateByName("OH.Media.Codec.Encoder.Audio.Amrwb");
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
