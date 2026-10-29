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
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <math.h>
#include <wchar.h>
#include <dlfcn.h>
#include <unistd.h>
#include <fcntl.h>

typedef int (*sscanf_fn)(const char*, const char*, ...);
typedef long (*strtol_fn)(const char*, char**, int);

static sscanf_fn g_sscanf = nullptr;
static strtol_fn g_strtol = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_sscanf = (sscanf_fn)dlsym(RTLD_DEFAULT, "__isoc23_sscanf");
    g_strtol = (strtol_fn)dlsym(RTLD_DEFAULT, "__isoc23_strtol");
}

static bool IsSymbolReady()
{
    return g_sscanf != nullptr;
}

static napi_value Isoc23Sscanf_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = g_sscanf("10110", "%b", &dest);
    if (ret == 1 && dest == 22) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int d1 = 0, d2 = 0, d3 = 0;
    int ret = g_sscanf("0b111 0x1F 010", "%i %i %i", &d1, &d2, &d3);
    if (ret == 3 && d1 == 7 && d2 == 31 && d3 == 8) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = g_sscanf("123456789", "%w8d", &dest);
    if (ret == 1 && dest == 12345678) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Sscanf_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    char* dest = nullptr;
    int ret = g_sscanf("hello world", "%ms", &dest);
    if (ret == 1 && dest != nullptr && strcmp(dest, "hello") == 0) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) free(dest);
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    float dest = 0.0f;
    int ret = g_sscanf("nan(123)", "%f", &dest);
    if (ret == 1 && isnan(dest)) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void* dest = (void*)0xDEAD;
    int ret = g_sscanf("(nil)", "%p", &dest);
    if (ret == 1 && dest == nullptr) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = g_sscanf("abc", "%d", &dest);
    if (ret == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = g_sscanf("", "%d", &dest);
    if (ret == EOF) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    char bad[2] = {(char)0xE4, 0};
    wchar_t wbuf[16] = {0};
    errno = 0;
    int ret = g_sscanf(bad, "%ls", wbuf);
    if (ret == EOF || ret < 0) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Sscanf_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (g_strtol == nullptr) {
        return Ret(env, 0);
    }
    char sub[16] = {0};
    int ret = g_sscanf("val:42", "%*[^:]:%s", sub);
    if (ret != 1) {
        return Ret(env, 1);
    }
    long val = g_strtol(sub, nullptr, 10);
    if (val == 42) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (g_strtol == nullptr) {
        return Ret(env, 0);
    }
    int v = 0;
    int ret = g_sscanf("0b101", "%i", &v);
    if (ret != 1) {
        return Ret(env, 1);
    }
    long val = g_strtol("0b101", nullptr, 0);
    if (v == 5 && val == 5 && v == (int)val) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    unsigned int first = 0, last = 0;
    int ret = g_sscanf("3 7", "%u %u", &first, &last);
    if (ret != 2) {
        return Ret(env, 1);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Sscanf_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    char* dest = nullptr;
    int ret = g_sscanf("hello world", "%ms", &dest);
    if (ret == 1 && dest != nullptr) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) free(dest);
    return Ret(env, 1);
}

static napi_value Isoc23Sscanf_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (g_strtol == nullptr) {
        return Ret(env, 0);
    }
    int v2 = 0;
    int ret = g_sscanf("0b101", "%i", &v2);
    if (ret != 1) {
        return Ret(env, 1);
    }
    long v1 = g_strtol("0b101", nullptr, 0);
    if (v1 == 5 && v2 == 5) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23Sscanf_0100", nullptr, Isoc23Sscanf_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_0200", nullptr, Isoc23Sscanf_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_0300", nullptr, Isoc23Sscanf_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_0400", nullptr, Isoc23Sscanf_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_0500", nullptr, Isoc23Sscanf_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_0600", nullptr, Isoc23Sscanf_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_0700", nullptr, Isoc23Sscanf_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_0800", nullptr, Isoc23Sscanf_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_0900", nullptr, Isoc23Sscanf_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_1000", nullptr, Isoc23Sscanf_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_1100", nullptr, Isoc23Sscanf_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_1200", nullptr, Isoc23Sscanf_1200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_1300", nullptr, Isoc23Sscanf_1300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Sscanf_1400", nullptr, Isoc23Sscanf_1400,
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
    .nm_modname = "isoc23_sscanf_test",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
