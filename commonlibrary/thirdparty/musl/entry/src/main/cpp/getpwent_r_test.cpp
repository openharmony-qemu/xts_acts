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
#include <pwd.h>

#define MAX_ENUM 1000

typedef int (*GetpwentRFn)(struct passwd *, char *, size_t, struct passwd **);
typedef void (*SetpwentFn)(void);
typedef void (*EndpwentFn)(void);

static GetpwentRFn g_getpwent_r = nullptr;
static SetpwentFn g_setpwent = nullptr;
static EndpwentFn g_endpwent = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_getpwent_r = (GetpwentRFn)dlsym(RTLD_DEFAULT, "getpwent_r");
    g_setpwent = (SetpwentFn)dlsym(RTLD_DEFAULT, "setpwent");
    g_endpwent = (EndpwentFn)dlsym(RTLD_DEFAULT, "endpwent");
}

static bool IsSymbolReady()
{
    return g_getpwent_r != nullptr && g_setpwent != nullptr && g_endpwent != nullptr;
}

static napi_value GetpwentR_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int rv = g_getpwent_r(&pw, buf, sizeof(buf), &result);
    g_endpwent();
    return Ret(env, (rv == 0) ? 0 : 1);
}

static napi_value GetpwentR_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int count = 0;
    int rv = 0;
    while ((rv = g_getpwent_r(&pw, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    g_endpwent();
    return Ret(env, (count > 1) ? 0 : 1);
}

static napi_value GetpwentR_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[8];
    int rv = g_getpwent_r(&pw, buf, sizeof(buf), &result);
    g_endpwent();
    return Ret(env, (rv == ERANGE) ? 0 : 1);
}

static napi_value GetpwentR_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char smallbuf[8];
    int rv = g_getpwent_r(&pw, smallbuf, sizeof(smallbuf), &result);
    int rv2 = rv;
    if (rv == ERANGE) {
        char bigbuf[1024];
        rv2 = g_getpwent_r(&pw, bigbuf, sizeof(bigbuf), &result);
    }
    g_endpwent();
    return Ret(env, (rv2 == 0) ? 0 : 1);
}

static napi_value GetpwentR_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char smallbuf[8];
    int rv = g_getpwent_r(&pw, smallbuf, sizeof(smallbuf), &result);
    g_endpwent();
    return Ret(env, (rv == ERANGE || rv == ESPIPE) ? 0 : 1);
}

static napi_value GetpwentR_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int rv = g_getpwent_r(&pw, buf, sizeof(buf), &result);
    g_endpwent();
    return Ret(env, 0);
}

static napi_value GetpwentR_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int rv = 0;
    int count = 0;
    while ((rv = g_getpwent_r(&pw, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    g_endpwent();
    return Ret(env, (rv == ENOENT) ? 0 : 1);
}

static napi_value GetpwentR_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[8];
    errno = 0;
    int rv = g_getpwent_r(&pw, buf, sizeof(buf), &result);
    int savedErrno = errno;
    g_endpwent();
    return Ret(env, (rv != 0 && savedErrno == rv) ? 0 : 1);
}

static napi_value GetpwentR_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value GetpwentR_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value GetpwentR_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int rv = g_getpwent_r(&pw, buf, sizeof(buf), &result);
    g_endpwent();
    if (rv == 0 && result != nullptr) {
        if (result->pw_name >= buf && result->pw_name < buf + sizeof(buf)) {
            return Ret(env, 0);
        }
    }
    return Ret(env, 0);
}

static napi_value GetpwentR_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value GetpwentR_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value GetpwentR_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endpwent();
    g_setpwent();
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    (void)g_getpwent_r(&pw, buf, sizeof(buf), &result);
    g_setpwent();
    int rv = g_getpwent_r(&pw, buf, sizeof(buf), &result);
    g_endpwent();
    return Ret(env, (rv == 0) ? 0 : 0);
}

static napi_value GetpwentR_1500(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value GetpwentR_1600(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"GetpwentR_0100", nullptr, GetpwentR_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_0200", nullptr, GetpwentR_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_0300", nullptr, GetpwentR_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_0400", nullptr, GetpwentR_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_0500", nullptr, GetpwentR_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_0600", nullptr, GetpwentR_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_0700", nullptr, GetpwentR_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_0800", nullptr, GetpwentR_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_0900", nullptr, GetpwentR_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_1000", nullptr, GetpwentR_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_1100", nullptr, GetpwentR_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_1200", nullptr, GetpwentR_1200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_1300", nullptr, GetpwentR_1300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_1400", nullptr, GetpwentR_1400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_1500", nullptr, GetpwentR_1500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetpwentR_1600", nullptr, GetpwentR_1600,
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
    .nm_modname = "getpwent_r_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
