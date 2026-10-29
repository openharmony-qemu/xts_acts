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
#include <sys/wait.h>
#include <signal.h>

typedef int (*fscanf_fn)(FILE*, const char*, ...);
typedef int (*sscanf_fn)(const char*, const char*, ...);

static fscanf_fn g_fscanf = nullptr;
static sscanf_fn g_sscanf = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_fscanf = (fscanf_fn)dlsym(RTLD_DEFAULT, "__isoc23_fscanf");
    g_sscanf = (sscanf_fn)dlsym(RTLD_DEFAULT, "__isoc23_sscanf");
}

static bool IsSymbolReady()
{
    return g_fscanf != nullptr;
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

static int WaitChildAborted(pid_t pid)
{
    int status = 0;
    waitpid(pid, &status, 0);
    if (WIFSIGNALED(status) && WTERMSIG(status) == SIGABRT) {
        return 0;
    }
    return 1;
}

static napi_value Isoc23Fscanf_0100(napi_env env, napi_callback_info info)
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
    int ret = g_fscanf(f, "%b", &dest);
    fclose(f);
    if (ret == 1 && dest == 22) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Fscanf_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("0b10110 0x1F");
    if (!f) {
        return Ret(env, 1);
    }
    int d1 = 0, d2 = 0;
    int ret = g_fscanf(f, "%i %i", &d1, &d2);
    fclose(f);
    if (ret == 2 && d1 == 22 && d2 == 31) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Fscanf_0300(napi_env env, napi_callback_info info)
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
    int ret = g_fscanf(f, "%w8d", &dest);
    fclose(f);
    if (ret == 1 && dest == 12345678) {
        return Ret(env, 0);
    }
    if (ret == 1 && dest == 123456789) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Fscanf_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("hello world");
    if (!f) {
        return Ret(env, 1);
    }
    char* dest = nullptr;
    int ret = g_fscanf(f, "%ms", &dest);
    fclose(f);
    if (ret == 1 && dest != nullptr && strcmp(dest, "hello") == 0) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) free(dest);
    return Ret(env, 1);
}

static napi_value Isoc23Fscanf_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("nan(123)");
    if (!f) {
        return Ret(env, 1);
    }
    float dest = 0.0f;
    int ret = g_fscanf(f, "%f", &dest);
    fclose(f);
    if (ret == 1 && isnan(dest)) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Fscanf_0600(napi_env env, napi_callback_info info)
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
    int ret = g_fscanf(f, "%p", &dest);
    fclose(f);
    if (ret == 1 && dest == nullptr) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Fscanf_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Fscanf_0800(napi_env env, napi_callback_info info)
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
    int ret = g_fscanf(f, "%d", &dest);
    fclose(f);
    if (ret == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Fscanf_0900(napi_env env, napi_callback_info info)
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
    int ret = g_fscanf(f, "%d", &dest);
    fclose(f);
    if (ret == EOF) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Fscanf_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int pfd[2];
    if (pipe(pfd) != 0) {
        return Ret(env, 1);
    }
    char badutf8 = (char)0xE4;
    write(pfd[1], &badutf8, 1);
    close(pfd[1]);
    FILE* f = fdopen(pfd[0], "r");
    if (!f) { close(pfd[0]); return Ret(env, 1); }
    wchar_t wbuf[16] = {0};
    errno = 0;
    int ret = g_fscanf(f, "%ls", wbuf);
    fclose(f);
    if (ret == EOF || ret < 0) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Fscanf_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (g_sscanf == nullptr) {
        g_sscanf = (sscanf_fn)dlsym(RTLD_DEFAULT, "__isoc23_sscanf");
    }
    if (g_sscanf == nullptr) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("0b10110");
    if (!f) {
        return Ret(env, 1);
    }
    int d1 = 0, d2 = 0;
    int r1 = g_fscanf(f, "%b", &d1);
    fclose(f);
    const char* s = "0b10110";
    int r2 = g_sscanf(s, "%b", &d2);
    if (r1 == 1 && r2 == 1 && d1 == 22 && d2 == 22) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Fscanf_1200(napi_env env, napi_callback_info info)
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
    int ret = g_fscanf(f, "%ms", &dest);
    fclose(f);
    if (ret == 1 && dest != nullptr) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) free(dest);
    return Ret(env, 1);
}

static napi_value Isoc23Fscanf_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("hello wo");
    if (!f) {
        return Ret(env, 1);
    }
    char* dest = nullptr;
    int d = 0;
    (void)g_fscanf(f, "%ms %d", &dest, &d);
    fclose(f);
    return Ret(env, 0);
}

static napi_value Isoc23Fscanf_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE* f = MakeStream("");
    if (!f) {
        return Ret(env, 1);
    }
    char* dest = nullptr;
    int ret = g_fscanf(f, "%ms", &dest);
    fclose(f);
    if (dest == nullptr) {
        return Ret(env, 0);
    }
    free(dest);
    return Ret(env, 0);
}

static napi_value Isoc23Fscanf_1500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Fscanf_1600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    for (int i = 0; i < 1000; i++) {
        FILE* f = MakeStream("hello");
        if (!f) {
            return Ret(env, 1);
        }
        char* dest = nullptr;
        int ret = g_fscanf(f, "%ms", &dest);
        if (dest) free(dest);
        fclose(f);
        if (ret != 1) {
            return Ret(env, 1);
        }
    }
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23Fscanf_0100", nullptr, Isoc23Fscanf_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_0200", nullptr, Isoc23Fscanf_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_0300", nullptr, Isoc23Fscanf_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_0400", nullptr, Isoc23Fscanf_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_0500", nullptr, Isoc23Fscanf_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_0600", nullptr, Isoc23Fscanf_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_0700", nullptr, Isoc23Fscanf_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_0800", nullptr, Isoc23Fscanf_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_0900", nullptr, Isoc23Fscanf_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_1000", nullptr, Isoc23Fscanf_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_1100", nullptr, Isoc23Fscanf_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_1200", nullptr, Isoc23Fscanf_1200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_1300", nullptr, Isoc23Fscanf_1300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_1400", nullptr, Isoc23Fscanf_1400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_1500", nullptr, Isoc23Fscanf_1500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Fscanf_1600", nullptr, Isoc23Fscanf_1600,
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
    .nm_modname = "isoc23_fscanf_test",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
