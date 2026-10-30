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
#include <cwchar>
#include <climits>

#define EXPECTED_BIN_5 5
#define EXPECTED_NEG_5 (-5)
#define EXPECTED_DEC_42 42

typedef unsigned long (*WcstoulFn)(const wchar_t *, wchar_t **, int);

static WcstoulFn g_fn = nullptr;
static bool g_loaded = false;

static void LoadFunctions()
{
    if (g_loaded) { return; }
    g_loaded = true;
    void *h = dlopen("libc.so", RTLD_LAZY);
    if (h) {
        g_fn = (WcstoulFn)dlsym(h, "__isoc23_wcstoul");
    }
}

static bool IsSymbolReady()
{
    return g_fn != nullptr;
}

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static napi_value Isoc23Wcstoul_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"0b101";
    wchar_t *ep = nullptr;
    errno = 0;
    unsigned long val = g_fn(nptr, &ep, 0);
    if (val == static_cast<unsigned long>(EXPECTED_BIN_5) && *ep == L'\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoul_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"0b";
    wchar_t *ep = nullptr;
    errno = 0;
    unsigned long val = g_fn(nptr, &ep, 0);
    int err = errno;
    if (val == 0 && *ep == L'b' && err != EINVAL) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoul_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"-5";
    wchar_t *ep = nullptr;
    errno = 0;
    unsigned long val = g_fn(nptr, &ep, 10);
    if (val == static_cast<unsigned long>(EXPECTED_NEG_5) && *ep == L'\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoul_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"999999999999999999999999";
    wchar_t *ep = nullptr;
    errno = 0;
    unsigned long val = g_fn(nptr, &ep, 10);
    int err = errno;
    if (val == ULONG_MAX && err == ERANGE) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoul_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"10";
    wchar_t *ep = nullptr;
    errno = 0;
    unsigned long val = g_fn(nptr, &ep, 1);
    int err = errno;
    if (val == 0 && err == EINVAL) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoul_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"42xyz";
    errno = 0;
    unsigned long val = g_fn(nptr, nullptr, 0);
    if (val == static_cast<unsigned long>(EXPECTED_DEC_42)) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoul_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"abc";
    wchar_t *ep = nullptr;
    errno = 0;
    unsigned long val = g_fn(nptr, &ep, 0);
    int err = errno;
    if (val == 0 && ep == nptr && err == EINVAL) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23Wcstoul_0100", nullptr, Isoc23Wcstoul_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoul_0200", nullptr, Isoc23Wcstoul_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoul_0300", nullptr, Isoc23Wcstoul_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoul_0400", nullptr, Isoc23Wcstoul_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoul_0500", nullptr, Isoc23Wcstoul_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoul_0600", nullptr, Isoc23Wcstoul_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoul_0700", nullptr, Isoc23Wcstoul_0700,
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
    .nm_modname = "isoc23_wcstoul_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
