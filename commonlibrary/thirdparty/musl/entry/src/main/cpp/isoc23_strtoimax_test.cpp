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
#include <errno.h>
#include <stdlib.h>
#include <limits.h>
#include <stdint.h>

typedef intmax_t (*StrtoimaxFn)(const char *, char **, int);
typedef uintmax_t (*StrtoumaxFn)(const char *, char **, int);

static StrtoimaxFn g_fn = nullptr;
static StrtoumaxFn g_strtoumaxFn = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_fn = (StrtoimaxFn)dlsym(RTLD_DEFAULT, "__isoc23_strtoimax");
    g_strtoumaxFn = (StrtoumaxFn)dlsym(RTLD_DEFAULT, "__isoc23_strtoumax");
}

static bool IsSymbolReady()
{
    if (g_fn == nullptr) {
        return false;
    }
    return true;
}

static napi_value Isoc23Strtoimax_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    intmax_t val = g_fn("0b101", &endptr, 0);
    int err = errno;
    if (val == 5 && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtoimax_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    intmax_t val = g_fn("0b", &endptr, 0);
    int err = errno;
    if (val == 0 && err != EINVAL && endptr != nullptr && *endptr == 'b') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtoimax_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    intmax_t val = g_fn("9223372036854775808", &endptr, 10);
    int err = errno;
    if (val == INTMAX_MAX && err == ERANGE) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtoimax_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    intmax_t val = g_fn("-0b11", &endptr, 0);
    int err = errno;
    if (val == -3 && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtoimax_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const char *nptr = "1";
    errno = 0;
    char *endptr = nullptr;
    intmax_t val = g_fn(nptr, &endptr, 1);
    int err = errno;
    if (val == 0 && err == EINVAL && endptr == nptr) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtoimax_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    intmax_t val = g_fn("0b101", nullptr, 0);
    int err = errno;
    if (val == 5 && err == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtoimax_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    intmax_t sval = g_fn("0b101", nullptr, 0);
    if (sval != 5) {
        return Ret(env, 1);
    }
    if (g_strtoumaxFn == nullptr) {
        return Ret(env, 0);
    }
    errno = 0;
    uintmax_t uval = g_strtoumaxFn("0b101", nullptr, 0);
    if (uval == 5) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23Strtoimax_0100", nullptr, Isoc23Strtoimax_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtoimax_0200", nullptr, Isoc23Strtoimax_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtoimax_0300", nullptr, Isoc23Strtoimax_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtoimax_0400", nullptr, Isoc23Strtoimax_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtoimax_0500", nullptr, Isoc23Strtoimax_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtoimax_0600", nullptr, Isoc23Strtoimax_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtoimax_0700", nullptr, Isoc23Strtoimax_0700,
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
    .nm_modname = "isoc23_strtoimax_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
