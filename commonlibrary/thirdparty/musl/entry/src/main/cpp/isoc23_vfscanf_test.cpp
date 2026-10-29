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
#include <unistd.h>

typedef int (*vfscanf_fn)(FILE*, const char*, va_list);
typedef int (*vsscanf_fn)(const char*, const char*, va_list);

static vfscanf_fn g_vfscanf = nullptr;
static vsscanf_fn g_vsscanf = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_vfscanf = (vfscanf_fn)dlsym(RTLD_DEFAULT, "__isoc23_vfscanf");
    g_vsscanf = (vsscanf_fn)dlsym(RTLD_DEFAULT, "__isoc23_vsscanf");
}

static bool IsSymbolReady()
{
    return g_vfscanf != nullptr;
}

static FILE* MakeStream(const char* content)
{
    int pfd[2];
    if (pipe(pfd) != 0) return nullptr;
    write(pfd[1], content, strlen(content));
    close(pfd[1]);
    FILE* f = fdopen(pfd[0], "r");
    if (!f) { close(pfd[0]); return nullptr; }
    return f;
}

static int CallVfscanf(FILE* stream, const char* fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    int ret = g_vfscanf(stream, fmt, ap);
    va_end(ap);
    return ret;
}

static int CallVsscanf(const char* s, const char* fmt, ...)
{
    va_list ap;
    va_start(ap, fmt);
    int ret = g_vsscanf(s, fmt, ap);
    va_end(ap);
    return ret;
}

static napi_value Isoc23Vfscanf_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("10110");
    if (!f) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = CallVfscanf(f, "%b", &dest);
    fclose(f);
    if (ret == 1 && dest == 22) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vfscanf_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("0b111");
    if (!f) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = CallVfscanf(f, "%i", &dest);
    fclose(f);
    if (ret == 1 && dest == 7) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vfscanf_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("123456789");
    if (!f) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = CallVfscanf(f, "%w8d", &dest);
    fclose(f);
    if (ret == 1 && dest == 12345678) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Vfscanf_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("hello");
    if (!f) {
        return Ret(env, 1);
    }
    char* dest = nullptr;
    int ret = CallVfscanf(f, "%ms", &dest);
    fclose(f);
    if (ret == 1 && dest != nullptr && strcmp(dest, "hello") == 0) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) free(dest);
    return Ret(env, 1);
}

static napi_value Isoc23Vfscanf_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("nan(0x2A)");
    if (!f) {
        return Ret(env, 1);
    }
    double dest = 0.0;
    int ret = CallVfscanf(f, "%lf", &dest);
    fclose(f);
    if (ret == 1 && isnan(dest)) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Vfscanf_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("(nil)");
    if (!f) {
        return Ret(env, 1);
    }
    void* dest = (void*)0xDEAD;
    int ret = CallVfscanf(f, "%p", &dest);
    fclose(f);
    if (ret == 1 && dest == nullptr) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vfscanf_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("abc");
    if (!f) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = CallVfscanf(f, "%d", &dest);
    fclose(f);
    if (ret == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vfscanf_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("");
    if (!f) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = CallVfscanf(f, "%d", &dest);
    fclose(f);
    if (ret == EOF) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vfscanf_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("42");
    if (!f) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = CallVfscanf(f, "%d", &dest);
    fclose(f);
    if (ret == 1 && dest == 42) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vfscanf_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (g_vsscanf == nullptr) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("0b111");
    if (!f) {
        return Ret(env, 1);
    }
    int d1 = 0, d2 = 0;
    int r1 = CallVfscanf(f, "%i", &d1);
    fclose(f);
    int r2 = CallVsscanf("0b111", "%i", &d2);
    if (r1 == 1 && r2 == 1 && d1 == 7 && d2 == 7) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Vfscanf_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("test");
    if (!f) {
        return Ret(env, 1);
    }
    char* dest = nullptr;
    int ret = CallVfscanf(f, "%ms", &dest);
    fclose(f);
    if (ret == 1 && dest != nullptr) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) free(dest);
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23Vfscanf_0100", nullptr, Isoc23Vfscanf_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_0200", nullptr, Isoc23Vfscanf_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_0300", nullptr, Isoc23Vfscanf_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_0400", nullptr, Isoc23Vfscanf_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_0500", nullptr, Isoc23Vfscanf_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_0600", nullptr, Isoc23Vfscanf_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_0700", nullptr, Isoc23Vfscanf_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_0800", nullptr, Isoc23Vfscanf_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_0900", nullptr, Isoc23Vfscanf_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_1000", nullptr, Isoc23Vfscanf_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Vfscanf_1100", nullptr, Isoc23Vfscanf_1100,
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
    .nm_modname = "isoc23_vfscanf_test",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
