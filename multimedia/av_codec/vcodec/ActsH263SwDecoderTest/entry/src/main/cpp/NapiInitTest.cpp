/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
#include "include/FuncTest.h"
#include <vector>
#include <functional>

EXTERN_C_START

static napi_property_descriptor XL(const char *functionName, napi_callback func)
{
    return {functionName, nullptr, func, nullptr, nullptr, nullptr, napi_default, nullptr};
}

static void InitPush1(std::vector<napi_property_descriptor> &desc)
{
    desc.push_back(XL("VideoDecodeSyncSw263Func0010Test", VideoDecodeSyncSw263Func0010Test));
    desc.push_back(XL("VideoDecodeSyncSw263Func0020Test", VideoDecodeSyncSw263Func0020Test));
    desc.push_back(XL("VideoDecodeSyncSw263Func0040Test", VideoDecodeSyncSw263Func0040Test));
    desc.push_back(XL("VideoDecodeSw263BlankFrame0010Test", VideoDecodeSw263BlankFrame0010Test));
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
    .nm_modname = "h263swdecoder_test",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
