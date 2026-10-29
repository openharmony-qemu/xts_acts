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
#include <stdarg.h>
#include <wchar.h>
#include <dlfcn.h>

typedef int (*vsscanf_fn)(const char*, const char*, va_list);

static vsscanf_fn g_vsscanf = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_vsscanf = (vsscanf_fn)dlsym(RTLD_DEFAULT, "__isoc23_vsscanf");
}

static bool IsSymbolReady()
{
    return g_vsscanf != nullptr;
}

static int CallVsscanf(const char* s, const char* fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    int ret = g_vsscanf(s, fmt, ap);
    va_end(ap);
    return ret;
}

static napi_value Isoc23Vsscanf_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = CallVsscanf("10110", "%b", &dest);
    if (ret == 1 && dest == 22) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vsscanf_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int d1 = 0, d2 = 0;
    int ret = CallVsscanf("0b111 0x1F", "%i %i", &d1, &d2);
    if (ret == 2 && d1 == 7 && d2 == 31) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vsscanf_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = CallVsscanf("123456789", "%w8d", &dest);
    if (ret == 1 && dest == 12345678) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Vsscanf_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    char* dest = nullptr;
    int ret = CallVsscanf("hello", "%ms", &dest);
    if (ret == 1 && dest != nullptr && strcmp(dest, "hello") == 0) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) free(dest);
    return Ret(env, 1);
}

static napi_value Isoc23Vsscanf_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    float dest = 0.0f;
    int ret = CallVsscanf("nan(123)", "%f", &dest);
    if (ret == 1 && isnan(dest)) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vsscanf_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void* dest = (void*)0xDEAD;
    int ret = CallVsscanf("(nil)", "%p", &dest);
    if (ret == 1 && dest == nullptr) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vsscanf_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = CallVsscanf("abc", "%d", &dest);
    if (ret == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vsscanf_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int dest = 0;
    int ret = CallVsscanf("", "%d", &dest);
    if (ret == EOF) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vsscanf_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    char bad[2] = {(char)0xE4, 0};
    wchar_t wbuf[16] = {0};
    errno = 0;
    int ret = CallVsscanf(bad, "%ls", wbuf);
    if (ret == EOF || ret < 0) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23Vsscanf_0100", nullptr, Isoc23Vsscanf_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vsscanf_0200", nullptr, Isoc23Vsscanf_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vsscanf_0300", nullptr, Isoc23Vsscanf_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vsscanf_0400", nullptr, Isoc23Vsscanf_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vsscanf_0500", nullptr, Isoc23Vsscanf_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vsscanf_0600", nullptr, Isoc23Vsscanf_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vsscanf_0700", nullptr, Isoc23Vsscanf_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vsscanf_0800", nullptr, Isoc23Vsscanf_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vsscanf_0900", nullptr, Isoc23Vsscanf_0900,
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
    .nm_modname = "isoc23_vsscanf_test",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
