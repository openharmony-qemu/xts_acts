/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <deviceinfo.h>
#include <string>
#include <cstring>
#include <hilog/log.h>
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;

static napi_value OHGetDiskSN(napi_env env, napi_callback_info info)
{
    char diskSn[256] = {0};
    int32_t ret = OH_GetDiskSN(diskSn);

    napi_value result = nullptr;
    napi_create_object(env, &result);

    napi_value codeValue = nullptr;
    napi_create_int32(env, ret, &codeValue);
    napi_set_named_property(env, result, "code", codeValue);

    napi_value diskSnValue = nullptr;
    napi_create_string_utf8(env, diskSn, NAPI_AUTO_LENGTH, &diskSnValue);
    napi_set_named_property(env, result, "diskSn", diskSnValue);

    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports) {
    napi_property_descriptor desc[] = {
        {"oHGetDiskSN", nullptr, OHGetDiskSN, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "libinitndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
