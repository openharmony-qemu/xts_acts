/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include <cstdint>
#include <include/ActsAudioTestCommonTest.h>
#include "napi/native_api.h"

static constexpr int ARG_INDEX = 0;
static constexpr int DEFAULT_ARG = -1;
static constexpr int RESULT_ERROR = -1;

enum CaseNum {
    CASE_NUM_0 = 0,
    CASE_NUM_1,
    CASE_NUM_2,
    CASE_NUM_3,
    CASE_NUM_4,
    CASE_NUM_5
};
int32_t GetInt32ArgImpl(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    return defaultValue;
}

inline int32_t GetInt32Arg(napi_env env, napi_callback_info info, size_t index, int32_t defaultValue)
{
    return GetInt32ArgImpl(env, info, index, defaultValue);
}

template <typename Func> napi_value NapiTry(napi_env env, Func&& func)
{
    try {
        return func();
    } catch (const std::exception& e) {
        napi_throw_error(env, nullptr, e.what());
    } catch (...) {
        napi_throw_error(env, nullptr, "Unknown native error");
    }
    return nullptr;
}

static int32_t HandleLcaacEncoderConfigure(int32_t caseNum)
{
    OHOS::AudioCodeCapiEncoderNdkTest encoderTestObj;
    switch (caseNum) {
        case CASE_NUM_0:
            return encoderTestObj.EncoderConfigureLCAAC();
        default:
            return 0;
    }
}
static napi_value Encoder_Configure_LCAAC(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int32_t result = HandleLcaacEncoderConfigure(caseNum);
        napi_value resultValue = nullptr;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value Encoder_Configure_HEAAC(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = 0;
        OHOS::AudioCodeCapiEncoderNdkTest encoderTestObj;
        switch (caseNum) {
            case CASE_NUM_0:
                result = encoderTestObj.EncoderConfigureHEAAC();
                break;
            case CASE_NUM_1:
                result = encoderTestObj.EncoderConfigureHEAACv2();
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value Encoder_Configure_By_Cap(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = 0;
        OHOS::AudioCodeCapiEncoderNdkTest encoderTestObj;
        switch (caseNum) {
            case CASE_NUM_0:
                result = encoderTestObj.EncoderConfigureByCap();
                break;
            default:
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value Sample_Rate(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = 0;
        OHOS::AudioCodeCapiEncoderNdkTest encoderTestObj;
        switch (caseNum) {
            case CASE_NUM_0:
                result = encoderTestObj.SampleRate();
                break;
            default:
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value Channel_Count(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = 0;
        OHOS::AudioCodeCapiEncoderNdkTest encoderTestObj;
        switch (caseNum) {
            case CASE_NUM_0:
                result = encoderTestObj.ChannelCountV1();
                break;
            case CASE_NUM_1:
                result = encoderTestObj.ChannelCountV2();
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value Channel_Layout(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = 0;
        OHOS::AudioCodeCapiEncoderNdkTest encoderTestObj;
        switch (caseNum) {
            case CASE_NUM_0:
                result = encoderTestObj.ChannelLayoutV1();
                break;
            case CASE_NUM_1:
                result = encoderTestObj.ChannelLayoutV2();
                break;
        }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

static napi_value Aac_Profile(napi_env env, napi_callback_info info)
{
    return NapiTry(env, [&]() -> napi_value {
        int32_t caseNum = GetInt32Arg(env, info, ARG_INDEX, DEFAULT_ARG);
        int result = 0;
        OHOS::AudioCodeCapiEncoderNdkTest encoderTestObj;
        switch (caseNum) {
            case CASE_NUM_0:
                result = encoderTestObj.AacProfile();
                break;
            default:
                break;
                }
        napi_value resultValue;
        napi_create_int32(env, result, &resultValue);
        return resultValue;
    });
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "encoderConfigureLCAAC", nullptr, Encoder_Configure_LCAAC, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "encoderConfigureHEAAC", nullptr, Encoder_Configure_HEAAC, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "encoderConfigureByCap", nullptr, Encoder_Configure_By_Cap, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "sample_rate", nullptr, Sample_Rate, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "channel_count", nullptr, Channel_Count, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "channel_layout", nullptr, Channel_Layout, nullptr, nullptr, nullptr, napi_default, nullptr},
        { "aac_profile", nullptr, Aac_Profile, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
