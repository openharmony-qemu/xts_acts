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
#include <unistd.h>
#include <cerrno>

#ifndef PAGE_SIZE
#define PAGE_SIZE 4096
#endif

typedef int (*GetpagesizeFn)(void);

static GetpagesizeFn g_getpagesize = nullptr;
static GetpagesizeFn g_aliasGetpagesize = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_getpagesize = (GetpagesizeFn)dlsym(RTLD_DEFAULT, "__getpagesize");
    g_aliasGetpagesize = (GetpagesizeFn)dlsym(RTLD_DEFAULT, "getpagesize");
}

static bool IsSymbolReady()
{
    return g_getpagesize != nullptr;
}

static napi_value Getpagesize_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int val = g_getpagesize();
    return Ret(env, (val > 0) ? 0 : 1);
}

static napi_value Getpagesize_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int val = g_getpagesize();
    return Ret(env, ((val & (val - 1)) == 0) ? 0 : 1);
}

static napi_value Getpagesize_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int val = g_getpagesize();
    long sc = sysconf(_SC_PAGESIZE);
    return Ret(env, (val == (int)sc) ? 0 : 1);
}

static napi_value Getpagesize_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int v1 = g_getpagesize();
    int v2 = g_getpagesize();
    return Ret(env, (v1 == v2) ? 0 : 1);
}

static napi_value Getpagesize_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    int before = errno;
    (void)g_getpagesize();
    int after = errno;
    return Ret(env, (before == after) ? 0 : 1);
}

static napi_value Getpagesize_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int val = g_getpagesize();
    return Ret(env, (val == PAGE_SIZE) ? 0 : 1);
}

static napi_value Getpagesize_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int val = g_getpagesize();
    int (*typedFn)(void) = g_getpagesize;
    (void)typedFn;
    (void)val;
    return Ret(env, 0);
}

static napi_value Getpagesize_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    void *addr = dlsym(RTLD_DEFAULT, "__getpagesize");
    return Ret(env, (addr != nullptr) ? 0 : 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Getpagesize_0100", nullptr, Getpagesize_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getpagesize_0200", nullptr, Getpagesize_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getpagesize_0300", nullptr, Getpagesize_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getpagesize_0500", nullptr, Getpagesize_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getpagesize_0600", nullptr, Getpagesize_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getpagesize_0700", nullptr, Getpagesize_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getpagesize_0800", nullptr, Getpagesize_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Getpagesize_0900", nullptr, Getpagesize_0900,
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
    .nm_modname = "getpagesize_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
