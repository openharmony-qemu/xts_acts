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
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cerrno>
#include <cmath>
#include <cwchar>
#include <dlfcn.h>

#define EXPECTED_BIN_22 22
#define EXPECTED_BIN_7 7
#define EXPECTED_W8D 12345678

typedef int (*SwscanfFn)(const wchar_t*, const wchar_t*, ...);

static SwscanfFn g_swscanf = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_swscanf = (SwscanfFn)dlsym(RTLD_DEFAULT, "__isoc23_swscanf");
}

static bool IsSymbolReady()
{
    return g_swscanf != nullptr;
}

static napi_value Isoc23Swscanf_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = g_swscanf(L"10110", L"%b", &dest);
    if (ret == 1 && dest == EXPECTED_BIN_22) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Swscanf_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = g_swscanf(L"0b111", L"%i", &dest);
    if (ret == 1 && dest == EXPECTED_BIN_7) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Swscanf_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = g_swscanf(L"123456789", L"%w8d", &dest);
    if (ret == 1 && dest == EXPECTED_W8D) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Swscanf_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    char* dest = nullptr;
    int ret = g_swscanf(L"hello world", L"%ms", &dest);
    if (ret == 1 && dest != nullptr && strcmp(dest, "hello") == 0) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) { free(dest); }
    return Ret(env, 1);
}

static napi_value Isoc23Swscanf_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    float dest = 0.0f;
    int ret = g_swscanf(L"nan(123)", L"%f", &dest);
    if (ret == 1 && isnan(dest)) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Swscanf_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void* dest = reinterpret_cast<void*>(0xDEAD);
    int ret = g_swscanf(L"(nil)", L"%p", &dest);
    if (ret == 1 && dest == nullptr) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Swscanf_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = g_swscanf(L"abc", L"%d", &dest);
    if (ret == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Swscanf_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = g_swscanf(L"", L"%d", &dest);
    if (ret == EOF) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Swscanf_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    char buf[64] = {0};
    errno = 0;
    int ret = g_swscanf(L"\x100000", L"%s", buf);
    if (ret == EOF || ret < 0) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Swscanf_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    wchar_t* dest = nullptr;
    int ret = g_swscanf(L"hello", L"%mls", &dest);
    if (ret == 1 && dest != nullptr) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) { free(dest); }
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23Swscanf_0100", nullptr, Isoc23Swscanf_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Swscanf_0200", nullptr, Isoc23Swscanf_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Swscanf_0300", nullptr, Isoc23Swscanf_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Swscanf_0400", nullptr, Isoc23Swscanf_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Swscanf_0500", nullptr, Isoc23Swscanf_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Swscanf_0600", nullptr, Isoc23Swscanf_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Swscanf_0700", nullptr, Isoc23Swscanf_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Swscanf_0800", nullptr, Isoc23Swscanf_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Swscanf_0900", nullptr, Isoc23Swscanf_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Swscanf_1000", nullptr, Isoc23Swscanf_1000,
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
    .nm_modname = "isoc23_swscanf_test",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
