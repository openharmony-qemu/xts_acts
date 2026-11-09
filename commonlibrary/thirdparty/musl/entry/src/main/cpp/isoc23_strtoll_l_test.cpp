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
#include <dlfcn.h>
#include <cerrno>
#include <cstdlib>
#include <climits>

#define EXPECTED_BIN_10 10
#define EXPECTED_HEX_FF 255

typedef long long (*StrtollLFn)(const char *, char **, int, void *);

static StrtollLFn g_fn = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_fn = (StrtollLFn)dlsym(RTLD_DEFAULT, "__isoc23_strtoll_l");
}

static bool IsSymbolReady()
{
    if (g_fn == nullptr) {
        return false;
    }
    return true;
}

static napi_value Isoc23StrtollL_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long long val = g_fn("0b1010", &endptr, 0, nullptr);
    int err = errno;
    if (val == EXPECTED_BIN_10 && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23StrtollL_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr1 = nullptr;
    long long val1 = g_fn("0xff", &endptr1, 0, nullptr);
    if (!(val1 == EXPECTED_HEX_FF && endptr1 != nullptr && *endptr1 == '\0')) {
        return Ret(env, 1);
    }
    errno = 0;
    char *endptr2 = nullptr;
    long long val2 = g_fn("0xff", &endptr2, 0, reinterpret_cast<void*>(1));
    if (val2 == EXPECTED_HEX_FF && endptr2 != nullptr && *endptr2 == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23StrtollL_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long long val = g_fn("0b", &endptr, 0, nullptr);
    int err = errno;
    if (val == 0 && err != EINVAL && endptr != nullptr && *endptr == 'b') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23StrtollL_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long long val = g_fn("9223372036854775808", &endptr, 10, nullptr);
    int err = errno;
    if (val == LLONG_MAX && err == ERANGE) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23StrtollL_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const char *nptr = "1";
    errno = 0;
    char *endptr = nullptr;
    long long val = g_fn(nptr, &endptr, 1, nullptr);
    int err = errno;
    if (val == 0 && err == EINVAL && endptr == nptr) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23StrtollL_0100", nullptr, Isoc23StrtollL_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23StrtollL_0200", nullptr, Isoc23StrtollL_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23StrtollL_0300", nullptr, Isoc23StrtollL_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23StrtollL_0400", nullptr, Isoc23StrtollL_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23StrtollL_0500", nullptr, Isoc23StrtollL_0500,
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
    .nm_modname = "isoc23_strtoll_l_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
