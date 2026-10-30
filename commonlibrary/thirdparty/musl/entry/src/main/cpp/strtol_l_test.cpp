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

#define EXPECTED_DEC_123 123
#define EXPECTED_HEX_FF 255
#define EXPECTED_OCTAL_777 511
#define EXPECTED_BIN_5 5

typedef long (*StrtolLFn)(const char *, char **, int, void *);
typedef long (*StrtolFn)(const char *, char **, int);

static StrtolLFn g_fn = nullptr;
static StrtolFn g_isoc23StrtolFn = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_fn = (StrtolLFn)dlsym(RTLD_DEFAULT, "strtol_l");
    g_isoc23StrtolFn = (StrtolFn)dlsym(RTLD_DEFAULT, "__isoc23_strtol");
}

static bool IsSymbolReady()
{
    if (g_fn == nullptr) {
        return false;
    }
    return true;
}

static napi_value StrtolL_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("0b101", &endptr, 0, nullptr);
    int err = errno;
    if (val == 0 && err != EINVAL && endptr != nullptr && *endptr == 'b') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value StrtolL_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("0xff", &endptr, 0, nullptr);
    int err = errno;
    if (val == EXPECTED_HEX_FF && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value StrtolL_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("0777", &endptr, 0, nullptr);
    int err = errno;
    if (val == EXPECTED_OCTAL_777 && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value StrtolL_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("123", &endptr, 10, nullptr);
    int err = errno;
    if (val == EXPECTED_DEC_123 && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value StrtolL_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("999999999999999999999", &endptr, 10, nullptr);
    int err = errno;
    if (val == LONG_MAX && err == ERANGE) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value StrtolL_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("0b", &endptr, 0, nullptr);
    int err = errno;
    if (val == 0 && err != EINVAL && endptr != nullptr && *endptr == 'b') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value StrtolL_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *ep1 = nullptr;
    long lval = g_fn("0b101", &ep1, 0, nullptr);
    if (!(lval == 0 && ep1 != nullptr && *ep1 == 'b')) {
        return Ret(env, 1);
    }
    if (g_isoc23StrtolFn == nullptr) {
        return Ret(env, 0);
    }
    errno = 0;
    char *ep2 = nullptr;
    long cval = g_isoc23StrtolFn("0b101", &ep2, 0);
    if (cval == EXPECTED_BIN_5 && ep2 != nullptr && *ep2 == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value StrtolL_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    long lval = g_fn("0b101", nullptr, 0, nullptr);
    if (lval != 0) {
        return Ret(env, 1);
    }
    if (g_isoc23StrtolFn == nullptr) {
        return Ret(env, 0);
    }
    errno = 0;
    long cval = g_isoc23StrtolFn("0b101", nullptr, 0);
    if (cval == EXPECTED_BIN_5) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value StrtolL_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr1 = nullptr;
    long val1 = g_fn("0b101", &endptr1, 0, reinterpret_cast<void*>(1));
    if (!(val1 == 0 && endptr1 != nullptr && *endptr1 == 'b')) {
        return Ret(env, 1);
    }
    errno = 0;
    char *endptr2 = nullptr;
    long val2 = g_fn("0b101", &endptr2, 0, nullptr);
    if (val2 == 0 && endptr2 != nullptr && *endptr2 == 'b') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"StrtolL_0100", nullptr, StrtolL_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StrtolL_0200", nullptr, StrtolL_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StrtolL_0300", nullptr, StrtolL_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StrtolL_0400", nullptr, StrtolL_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StrtolL_0500", nullptr, StrtolL_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StrtolL_0600", nullptr, StrtolL_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StrtolL_0700", nullptr, StrtolL_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StrtolL_0800", nullptr, StrtolL_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StrtolL_0900", nullptr, StrtolL_0900,
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
    .nm_modname = "strtol_l_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
