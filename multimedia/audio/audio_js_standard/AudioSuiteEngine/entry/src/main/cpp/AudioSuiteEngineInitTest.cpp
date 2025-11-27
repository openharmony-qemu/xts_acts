/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "include/AudioSuiteBaseTest.h"

static napi_value AudioSuiteEngineCreateTest_0001(napi_env env, napi_callback_info info)
{
    OH_AudioSuite_Result result = CreateAudioSuiteEngine();

    napi_value res;
    if (result == OH_AudioSuite_Result::AUDIOSUITE_SUCCESS) {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);
    } else {
        napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_FAIL), &res);
    }

    return res;
}

static napi_value AudioSuiteEngineCreateTest_0002(napi_env env, napi_callback_info info)
{
    LOG("OH_AudioSuiteEngine_Create ");

    napi_value res;
    napi_create_int32(env, static_cast<int32_t>(TestResult::TEST_PASS), &res);

    return res;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "AudioSuiteEngineCreateTest_0001", nullptr, AudioSuiteEngineCreateTest_0001,
        nullptr, nullptr, nullptr, napi_default, nullptr },
        { "AudioSuiteEngineCreateTest_0002", nullptr, AudioSuiteEngineCreateTest_0002,
        nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_modname = "audiosuiteenginetest",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
