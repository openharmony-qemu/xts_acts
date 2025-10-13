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
#include <cstdint>
#include <fstream>
#include <multimedia/player_framework/avcodec_audio_channel_layout.h>
#include <multimedia/player_framework/media_types.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <multimedia/player_framework/native_avbuffer_info.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_audiodecoder.h>
#include <multimedia/player_framework/native_avcodec_audioencoder.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_averrors.h>
#include <multimedia/player_framework/native_avsource.h>
#include <mutex>
#include <ohaudio/native_audiostreambuilder.h>
#include <queue>

napi_value EnumAACPROFILEHE(napi_env env, napi_callback_info info)
{
    // 通过codec name创建编码器。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    const char *name = OH_AVCapability_GetName(capability);
    OH_AVCodec *audioEnc_ = OH_AudioCodec_CreateByName(name);
    // 配置音频采样率（必须）
    constexpr uint32_t defaultSampleRate = PARAM_44100;
    // 配置音频码率（必须）
    constexpr uint64_t defaultBitrate = PARAM_32000;
    // 配置音频声道数（必须）
    constexpr uint32_t defaultChannelCount = PARAM_2;
    // 配置音频位深（必须）
    constexpr OH_BitsPerSample SAMPLE_FORMAT = OH_BitsPerSample::SAMPLE_S16LE;
    // 配置AAC profile（可选，默认值：AAC_PROFILE_LC，其他可选值：AAC_PROFILE_HE、AAC_PROFILE_HE_V2）
    constexpr int32_t aacProfile = OH_AACProfile::AAC_PROFILE_HE;
    OH_AVFormat *format = OH_AVFormat_Create();
    // 写入format
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, defaultSampleRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, defaultBitrate);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, defaultChannelCount);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_FORMAT);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, aacProfile);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, 1); // 同步模式配置。
    // 配置编码器
    int32_t setResult = OH_AudioCodec_Configure(audioEnc_, format);
    napi_value retValue;
    if (setResult == AV_ERR_OK) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile1(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_SIMPLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile2(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_MAIN, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile3(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_SNR_SCALABLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile4(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_SPATIALLY_SCALABLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile5(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_HIGH, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile6(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG2_PROFILE_422, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile7(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_SIMPLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile8(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_SIMPLE_SCALABLE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile9(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_CORE, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile10(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_MAIN, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile11(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG2, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_N_BIT, 1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile12(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_HYBRID, MPEG4_LEVEL_2);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile13(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res =
        OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_BASIC_ANIMATED_TEXTURE, MPEG4_LEVEL_2);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile14(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_SCALABLE_TEXTURE, MPEG4_LEVEL_1);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile15(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_SIMPLE_FA, MPEG4_LEVEL_2);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile16(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res =
        OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_REAL_TIME_SIMPLE, MPEG4_LEVEL_4);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile17(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_CORE_SCALABLE, MPEG4_LEVEL_3);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile18(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY,
                                                           MPEG4_LEVEL_3);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile19(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_CORE, MPEG4_LEVEL_2);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile20(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res =
        OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_SCALABLE_TEXTURE, MPEG4_LEVEL_3);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}

napi_value EnumMPEGProfile21(napi_env env, napi_callback_info info)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_MPEG4, false, SOFTWARE);
    bool res = OH_AVCapability_AreProfileAndLevelSupported(capability, MPEG4_PROFILE_ADVANCED_SIMPLE, MPEG4_LEVEL_5);
    napi_value retValue;
    if (res) {
        napi_create_int32(env, 0, &retValue);
    } else {
        napi_create_int32(env, 1, &retValue);
    }
    return retValue;
}
