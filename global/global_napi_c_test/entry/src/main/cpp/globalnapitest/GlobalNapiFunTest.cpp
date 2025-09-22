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

#include "napi/native_api.h"
#include <js_native_api_types.h>
#include <globalnapitest/GlobalNapiTest.h>
#include <vector>

EXTERN_C_START

static void InitPush1(std::vector<napi_property_descriptor>& desc)
{
    desc.push_back({"GetResourceManager", nullptr, GlobalNapiTest::GetResourceManager, nullptr, nullptr, nullptr,
                    napi_default, nullptr});
    desc.push_back({"GetMediaBase640100", nullptr, GlobalNapiTest::GetMediaBase640100, nullptr, nullptr, nullptr,
                    napi_default, nullptr});
    desc.push_back({"GetMediaBase640200", nullptr, GlobalNapiTest::GetMediaBase640200, nullptr, nullptr, nullptr,
                    napi_default, nullptr});
    desc.push_back({"GetMediaBase640300", nullptr, GlobalNapiTest::GetMediaBase640300, nullptr, nullptr, nullptr,
                    napi_default, nullptr});
    desc.push_back({"GetMediaBase64Data0100", nullptr, GlobalNapiTest::GetMediaBase64Data0100,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64Data0200", nullptr, GlobalNapiTest::GetMediaBase64Data0200,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
    desc.push_back({"GetMediaBase64Data0300", nullptr, GlobalNapiTest::GetMediaBase64Data0300,
                    nullptr, nullptr, nullptr, napi_default, nullptr});
}

static napi_value Init(napi_env env, napi_value exports)
{
    std::vector<napi_property_descriptor> desc;
    InitPush1(desc);
    napi_define_properties(env, exports, desc.size(), desc.data());
    return exports;
}
EXTERN_C_END
static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}