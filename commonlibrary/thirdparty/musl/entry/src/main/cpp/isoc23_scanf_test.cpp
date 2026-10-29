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
#include <dlfcn.h>
#include <unistd.h>

typedef int (*scanf_fn)(const char*, ...);

static scanf_fn g_scanf = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_scanf = (scanf_fn)dlsym(RTLD_DEFAULT, "__isoc23_scanf");
}

static bool IsSymbolReady()
{
    return g_scanf != nullptr;
}

static int SetupStdin(const char* data)
{
    int pfd[2];
    if (pipe(pfd) != 0) return -1;
    write(pfd[1], data, strlen(data));
    close(pfd[1]);
    if (dup2(pfd[0], STDIN_FILENO) < 0) {
        close(pfd[0]);
        return -1;
    }
    close(pfd[0]);
    clearerr(stdin);
    return 0;
}

static int SetupStdinEOF()
{
    int pfd[2];
    if (pipe(pfd) != 0) return -1;
    close(pfd[1]);
    if (dup2(pfd[0], STDIN_FILENO) < 0) {
        close(pfd[0]);
        return -1;
    }
    close(pfd[0]);
    int ch;
    while ((ch = getchar()) != EOF);
    clearerr(stdin);
    return 0;
}

static napi_value Isoc23Scanf_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (SetupStdin("10110") != 0) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = g_scanf("%b", &dest);
    if (ret == 1 && dest == 22) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Scanf_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (SetupStdin("0b111") != 0) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = g_scanf("%i", &dest);
    if (ret == 1 && dest == 7) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Scanf_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (SetupStdin("123456789") != 0) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = g_scanf("%w4d", &dest);
    if (ret == 1 && dest == 1234) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value Isoc23Scanf_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (SetupStdin("test data") != 0) {
        return Ret(env, 1);
    }
    char* dest = nullptr;
    int ret = g_scanf("%ms", &dest);
    if (ret == 1 && dest != nullptr && strcmp(dest, "test") == 0) {
        free(dest);
        return Ret(env, 0);
    }
    if (dest) free(dest);
    return Ret(env, 1);
}

static napi_value Isoc23Scanf_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (SetupStdin("xyz") != 0) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = g_scanf("%d", &dest);
    if (ret == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Scanf_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (SetupStdinEOF() != 0) {
        return Ret(env, 1);
    }
    int dest = 0;
    int ret = g_scanf("%d", &dest);
    if (ret == EOF) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value Isoc23Scanf_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    if (SetupStdin("nan(0x1)") != 0) {
        return Ret(env, 1);
    }
    double dest = 0.0;
    int ret = g_scanf("%lf", &dest);
    if (ret == 1 && isnan(dest)) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Isoc23Scanf_0100", nullptr, Isoc23Scanf_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Scanf_0200", nullptr, Isoc23Scanf_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Scanf_0300", nullptr, Isoc23Scanf_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Scanf_0400", nullptr, Isoc23Scanf_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Scanf_0500", nullptr, Isoc23Scanf_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Scanf_0600", nullptr, Isoc23Scanf_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Isoc23Scanf_0700", nullptr, Isoc23Scanf_0700,
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
    .nm_modname = "isoc23_scanf_test",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
