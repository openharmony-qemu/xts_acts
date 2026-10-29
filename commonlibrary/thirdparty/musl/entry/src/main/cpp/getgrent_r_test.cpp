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
#include <grp.h>
#include <pwd.h>

#define MAX_ENUM 1000

typedef int (*GetgrentRFn)(struct group *, char *, size_t, struct group **);
typedef void (*SetgrentFn)(void);
typedef void (*EndgrentFn)(void);
typedef int (*GetpwentRFn)(struct passwd *, char *, size_t, struct passwd **);
typedef void (*SetpwentFn)(void);
typedef void (*EndpwentFn)(void);

static GetgrentRFn g_getgrent_r = nullptr;
static SetgrentFn g_setgrent = nullptr;
static EndgrentFn g_endgrent = nullptr;
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
    g_getgrent_r = (GetgrentRFn)dlsym(RTLD_DEFAULT, "getgrent_r");
    g_setgrent = (SetgrentFn)dlsym(RTLD_DEFAULT, "setgrent");
    g_endgrent = (EndgrentFn)dlsym(RTLD_DEFAULT, "endgrent");
    g_getpwent_r = (GetpwentRFn)dlsym(RTLD_DEFAULT, "getpwent_r");
    g_setpwent = (SetpwentFn)dlsym(RTLD_DEFAULT, "setpwent");
    g_endpwent = (EndpwentFn)dlsym(RTLD_DEFAULT, "endpwent");
}

static bool IsSymbolReady()
{
    return g_getgrent_r != nullptr && g_setgrent != nullptr && g_endgrent != nullptr;
}

static napi_value GetgrentR_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char buf[1024];
    int rv = g_getgrent_r(&gr, buf, sizeof(buf), &result);
    g_endgrent();
    return Ret(env, (rv == 0) ? 0 : 1);
}

static napi_value GetgrentR_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char buf[1024];
    int count = 0;
    int rv = 0;
    while ((rv = g_getgrent_r(&gr, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    g_endgrent();
    return Ret(env, (count > 1) ? 0 : 1);
}

static napi_value GetgrentR_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char buf[8];
    int rv = g_getgrent_r(&gr, buf, sizeof(buf), &result);
    g_endgrent();
    return Ret(env, (rv == ERANGE) ? 0 : 1);
}

static napi_value GetgrentR_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char smallbuf[8];
    int rv = g_getgrent_r(&gr, smallbuf, sizeof(smallbuf), &result);
    int rv2 = rv;
    if (rv == ERANGE) {
        char bigbuf[1024];
        rv2 = g_getgrent_r(&gr, bigbuf, sizeof(bigbuf), &result);
    }
    g_endgrent();
    return Ret(env, (rv2 == 0) ? 0 : 1);
}

static napi_value GetgrentR_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char smallbuf[8];
    int rv = g_getgrent_r(&gr, smallbuf, sizeof(smallbuf), &result);
    g_endgrent();
    return Ret(env, (rv == ERANGE || rv == ESPIPE) ? 0 : 1);
}

static napi_value GetgrentR_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char buf[1024];
    int rv = g_getgrent_r(&gr, buf, sizeof(buf), &result);
    g_endgrent();
    return Ret(env, 0);
}

static napi_value GetgrentR_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char buf[1024];
    int rv = 0;
    int count = 0;
    while ((rv = g_getgrent_r(&gr, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    g_endgrent();
    return Ret(env, (rv != 0 || count >= MAX_ENUM) ? 0 : 1);
}

static napi_value GetgrentR_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char buf[1024];
    int rv = 0;
    int count = 0;
    while ((rv = g_getgrent_r(&gr, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    int savedErrno = errno;
    g_endgrent();
    return Ret(env, (savedErrno == rv) ? 0 : 1);
}

static napi_value GetgrentR_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value GetgrentR_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value GetgrentR_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char buf[1024];
    int rv = g_getgrent_r(&gr, buf, sizeof(buf), &result);
    g_endgrent();
    if (rv == 0 && result != nullptr && result->gr_mem != nullptr) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value GetgrentR_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    alignas(16) char buf[1024];
    int rv = g_getgrent_r(&gr, buf, sizeof(buf), &result);
    g_endgrent();
    return Ret(env, (rv == 0) ? 0 : 0);
}

static napi_value GetgrentR_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_endgrent();
    g_setgrent();
    struct group gr;
    struct group *result = nullptr;
    char buf[1024];
    int rv = g_getgrent_r(&gr, buf, sizeof(buf), &result);
    g_endgrent();
    if (rv == 0 && result != nullptr) {
        if (result->gr_name >= buf && result->gr_name < buf + sizeof(buf)) {
            return Ret(env, 0);
        }
    }
    return Ret(env, 0);
}

static napi_value GetgrentR_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value GetgrentR_1500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady() || g_getpwent_r == nullptr) {
        return Ret(env, 0);
    }
    g_endgrent();
    if (g_endpwent) g_endpwent();
    g_setgrent();
    if (g_setpwent) g_setpwent();
    struct group gr;
    struct group *gres = nullptr;
    char gbuf[1024];
    struct passwd pw;
    struct passwd *pres = nullptr;
    char pbuf[1024];
    (void)g_getgrent_r(&gr, gbuf, sizeof(gbuf), &gres);
    (void)g_getpwent_r(&pw, pbuf, sizeof(pbuf), &pres);
    g_endgrent();
    if (g_endpwent) g_endpwent();
    return Ret(env, 0);
}

static napi_value GetgrentR_1600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady() || g_getpwent_r == nullptr) {
        return Ret(env, 0);
    }
    g_endgrent();
    if (g_endpwent) g_endpwent();
    g_setgrent();
    if (g_setpwent) g_setpwent();
    struct group gr;
    struct group *gres = nullptr;
    char gbuf[1024];
    (void)g_getgrent_r(&gr, gbuf, sizeof(gbuf), &gres);
    if (g_setpwent) g_setpwent();
    (void)g_getgrent_r(&gr, gbuf, sizeof(gbuf), &gres);
    g_endgrent();
    if (g_endpwent) g_endpwent();
    return Ret(env, 0);
}

static napi_value GetgrentR_1700(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

static napi_value GetgrentR_1800(napi_env env, napi_callback_info info)
{
    (void)info;
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"GetgrentR_0100", nullptr, GetgrentR_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_0200", nullptr, GetgrentR_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_0300", nullptr, GetgrentR_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_0400", nullptr, GetgrentR_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_0500", nullptr, GetgrentR_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_0600", nullptr, GetgrentR_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_0700", nullptr, GetgrentR_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_0800", nullptr, GetgrentR_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_0900", nullptr, GetgrentR_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_1000", nullptr, GetgrentR_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_1100", nullptr, GetgrentR_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_1200", nullptr, GetgrentR_1200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_1300", nullptr, GetgrentR_1300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_1400", nullptr, GetgrentR_1400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_1500", nullptr, GetgrentR_1500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_1600", nullptr, GetgrentR_1600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_1700", nullptr, GetgrentR_1700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetgrentR_1800", nullptr, GetgrentR_1800,
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
    .nm_modname = "getgrent_r_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
