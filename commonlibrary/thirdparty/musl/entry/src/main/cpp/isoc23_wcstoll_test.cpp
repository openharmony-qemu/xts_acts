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

#define BIN_DIGIT_COUNT 64
#define BIN_PREFIX_LEN 2
#define EXPECTED_DEC_123 123
#define NULL_TERM_POS 66
#define WCHAR_BUF_SIZE 70

typedef long long (*WcstollFn)(const wchar_t *, wchar_t **, int);

static WcstollFn g_fn = nullptr;
static bool g_loaded = false;

static void LoadFunctions()
{
    if (g_loaded) { return; }
    g_loaded = true;
    void *h = dlopen("libc.so", RTLD_LAZY);
    if (h) {
        g_fn = (WcstollFn)dlsym(h, "__isoc23_wcstoll");
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

static napi_value Isoc23Wcstoll_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    wchar_t nptr[70];
    nptr[0] = L'0';
    nptr[1] = L'b';
    for (int i = 0; i < BIN_DIGIT_COUNT; i++) {
        nptr[BIN_PREFIX_LEN + i] = L'1';
    }
    nptr[NULL_TERM_POS] = L'\0';
    wchar_t *ep = nullptr;
    errno = 0;
    long long val = g_fn(nptr, &ep, 0);
    int err = errno;
    if (val == LLONG_MAX && err == ERANGE) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoll_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"0b";
    wchar_t *ep = nullptr;
    errno = 0;
    long long val = g_fn(nptr, &ep, 0);
    int err = errno;
    if (val == 0 && *ep == L'b' && err != EINVAL) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoll_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"-9223372036854775807";
    wchar_t *ep = nullptr;
    errno = 0;
    long long val = g_fn(nptr, &ep, 10);
    if (val == (LLONG_MIN + 1) && *ep == L'\0') {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoll_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"-99999999999999999999";
    wchar_t *ep = nullptr;
    errno = 0;
    long long val = g_fn(nptr, &ep, 10);
    int err = errno;
    if (val == LLONG_MIN && err == ERANGE) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoll_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"10";
    wchar_t *ep = nullptr;
    errno = 0;
    long long val = g_fn(nptr, &ep, 37);
    int err = errno;
    if (val == 0 && err == EINVAL) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoll_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"123abc";
    errno = 0;
    long long val = g_fn(nptr, nullptr, 10);
    if (val == EXPECTED_DEC_123) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Wcstoll_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    LoadFunctions();
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    const wchar_t *nptr = L"xyz";
    wchar_t *ep = nullptr;
    errno = 0;
    long long val = g_fn(nptr, &ep, 0);
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
        {"Isoc23Wcstoll_0100", nullptr, Isoc23Wcstoll_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoll_0200", nullptr, Isoc23Wcstoll_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoll_0300", nullptr, Isoc23Wcstoll_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoll_0400", nullptr, Isoc23Wcstoll_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoll_0500", nullptr, Isoc23Wcstoll_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoll_0600", nullptr, Isoc23Wcstoll_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Wcstoll_0700", nullptr, Isoc23Wcstoll_0700,
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
    .nm_modname = "isoc23_wcstoll_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
