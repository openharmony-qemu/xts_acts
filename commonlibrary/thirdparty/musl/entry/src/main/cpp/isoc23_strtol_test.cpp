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

typedef long (*StrtolFn)(const char *, char **, int);
typedef unsigned long (*StrtoulFn)(const char *, char **, int);

static StrtolFn g_fn = nullptr;
static StrtoulFn g_strtoulFn = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_fn = (StrtolFn)dlsym(RTLD_DEFAULT, "__isoc23_strtol");
    g_strtoulFn = (StrtoulFn)dlsym(RTLD_DEFAULT, "__isoc23_strtoul");
}

static bool IsSymbolReady()
{
    if (g_fn == nullptr) {
        return false;
    }
    return true;
}

static napi_value Isoc23Strtol_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("0b101", &endptr, 0);
    int err = errno;
    if (val == 5 && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("0B101", &endptr, 2);
    int err = errno;
    if (val == 5 && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("0b", &endptr, 0);
    int err = errno;
    if (val == 0 && err != EINVAL && endptr != nullptr && *endptr == 'b') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("999999999999999999999", &endptr, 10);
    int err = errno;
    if (val == LONG_MAX && err == ERANGE) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("-0b11", &endptr, 0);
    int err = errno;
    if (val == -3 && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const char *nptr = "10";
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn(nptr, &endptr, 1);
    int err = errno;
    if (val == 0 && err == EINVAL && endptr == nptr) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const char *nptr = "";
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn(nptr, &endptr, 0);
    int err = errno;
    if (val == 0 && err == EINVAL && endptr == nptr) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    long val = g_fn("123", nullptr, 10);
    int err = errno;
    if (val == 123 && err == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    long sval = g_fn("-1", nullptr, 10);
    if (sval != -1) {
        return Ret(env, 1);
    }
    if (g_strtoulFn == nullptr) {
        return Ret(env, 0);
    }
    errno = 0;
    unsigned long uval = g_strtoulFn("-1", nullptr, 10);
    if (uval == (unsigned long)ULONG_MAX) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr = nullptr;
    long val = g_fn("0b101", &endptr, 16);
    int err = errno;
    if (val == 0xB101 && err == 0 && endptr != nullptr && *endptr == '\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Strtol_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    char *endptr1 = nullptr;
    long val1 = g_fn("0b101abc", &endptr1, 0);
    if (!(val1 == 5 && endptr1 != nullptr && *endptr1 == 'a')) {
        return Ret(env, 1);
    }
    errno = 0;
    char *endptr2 = nullptr;
    long val2 = g_fn("0b", &endptr2, 0);
    if (!(val2 == 0 && endptr2 != nullptr && *endptr2 == 'b')) {
        return Ret(env, 1);
    }
    errno = 0;
    char *endptr3 = nullptr;
    long val3 = g_fn("0b101", &endptr3, 0);
    if (!(val3 == 5 && endptr3 != nullptr && *endptr3 == '\0')) {
        return Ret(env, 1);
    }
    errno = 0;
    char *endptr4 = nullptr;
    long val4 = g_fn("-0b101", &endptr4, 0);
    if (!(val4 == -5 && endptr4 != nullptr && *endptr4 == '\0')) {
        return Ret(env, 1);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Strtol_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23Strtol_0100", nullptr, Isoc23Strtol_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_0200", nullptr, Isoc23Strtol_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_0300", nullptr, Isoc23Strtol_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_0400", nullptr, Isoc23Strtol_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_0500", nullptr, Isoc23Strtol_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_0600", nullptr, Isoc23Strtol_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_0700", nullptr, Isoc23Strtol_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_0800", nullptr, Isoc23Strtol_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_0900", nullptr, Isoc23Strtol_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_1000", nullptr, Isoc23Strtol_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_1100", nullptr, Isoc23Strtol_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Strtol_1200", nullptr, Isoc23Strtol_1200,
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
    .nm_modname = "isoc23_strtol_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
