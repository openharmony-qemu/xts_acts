/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <dlfcn.h>

typedef long (*strtol_fn)(const char *, char **, int);
typedef int (*sscanf_fn)(const char *, const char *, ...);

static strtol_fn g_strtol = nullptr;
static sscanf_fn g_sscanf = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static bool IsSymbolReady()
{
    return g_strtol != nullptr;
}

static napi_value Strtol_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const char *nptr = "0b101";
    const char *s = "0b101";

    errno = 0;
    long val = g_strtol(nptr, NULL, 0);

    int v = 0;
    int ret = g_sscanf ? g_sscanf(s, "%b", &v) : -1;

    if (val == 5 && ret == 1 && v == 5) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Strtol_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (g_sscanf == nullptr) {
        return Ret(env, 0);
    }
    const char *nptr = "0b101";

    int v = 0;
    int ret = g_sscanf("0b101", "%i", &v);

    errno = 0;
    long val = g_strtol(nptr, NULL, 0);

    if (ret == 1 && v == 5 && val == 5) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    g_strtol = (strtol_fn)dlsym(RTLD_DEFAULT, "__isoc23_strtol");
    g_sscanf = (sscanf_fn)dlsym(RTLD_DEFAULT, "__isoc23_sscanf");
    napi_property_descriptor desc[] = {
        {"Strtol_0100", nullptr, Strtol_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Strtol_0200", nullptr, Strtol_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "strtol_legacy_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
