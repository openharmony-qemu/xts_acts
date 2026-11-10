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
#include <cstdio>
#include <cstring>
#include <unistd.h>
#include <pwd.h>

#define MAX_ENUM 1000

typedef int (*FgetpwentRFn)(FILE *, struct passwd *, char *, size_t, struct passwd **);
typedef int (*GetpwentRFn)(struct passwd *, char *, size_t, struct passwd **);
typedef void (*SetpwentFn)(void);
typedef void (*EndpwentFn)(void);

static FgetpwentRFn g_fgetpwentR = nullptr;
static GetpwentRFn g_getpwentR = nullptr;
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
    g_fgetpwentR = (FgetpwentRFn)dlsym(RTLD_DEFAULT, "fgetpwent_r");
    g_getpwentR = (GetpwentRFn)dlsym(RTLD_DEFAULT, "getpwent_r");
    g_setpwent = (SetpwentFn)dlsym(RTLD_DEFAULT, "setpwent");
    g_endpwent = (EndpwentFn)dlsym(RTLD_DEFAULT, "endpwent");
}

static bool IsSymbolReady()
{
    return g_fgetpwentR != nullptr;
}

static napi_value FgetpwentR_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE *fp = fopen("/etc/passwd", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int rv = g_fgetpwentR(fp, &pw, buf, sizeof(buf), &result);
    (void)fclose(fp);
    return Ret(env, (rv == 0) ? 0 : 1);
}

static napi_value FgetpwentR_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE *fp = fopen("/etc/passwd", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int count = 0;
    int rv = 0;
    while ((rv = g_fgetpwentR(fp, &pw, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    (void)fclose(fp);
    return Ret(env, (count > 1) ? 0 : 1);
}

static napi_value FgetpwentR_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE *fp = fopen("/etc/passwd", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int rv = 0;
    int count = 0;
    while ((rv = g_fgetpwentR(fp, &pw, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    (void)fclose(fp);
    return Ret(env, (rv == ENOENT) ? 0 : 1);
}

static napi_value FgetpwentR_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE *fp = fopen("/etc/passwd", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    struct passwd pw1;
    struct passwd *result1 = nullptr;
    char smallbuf[8];
    int rv1 = g_fgetpwentR(fp, &pw1, smallbuf, sizeof(smallbuf), &result1);
    if (rv1 != ERANGE) {
        (void)fclose(fp);
        return Ret(env, (rv1 == 0 || rv1 == ENOENT) ? 0 : 1);
    }
    struct passwd pw2;
    struct passwd *result2 = nullptr;
    char bigbuf[1024];
    int rv2 = g_fgetpwentR(fp, &pw2, bigbuf, sizeof(bigbuf), &result2);
    (void)fclose(fp);
    return Ret(env, (rv2 == 0 || rv2 == ENOENT) ? 0 : 1);
}

static napi_value FgetpwentR_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE *fp = fopen("/etc/passwd", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int rv = 0;
    int count = 0;
    while ((rv = g_fgetpwentR(fp, &pw, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    int savedErrno = errno;
    (void)fclose(fp);
    return Ret(env, (savedErrno == rv) ? 0 : 1);
}

static napi_value FgetpwentR_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE *fp = fopen("/etc/passwd", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int rv = g_fgetpwentR(fp, &pw, buf, sizeof(buf), &result);
    (void)fclose(fp);
    if (rv == 0 && result != nullptr) {
        if (result->pw_name >= buf && result->pw_name < buf + sizeof(buf)) {
            return Ret(env, 0);
        }
    }
    return Ret(env, 0);
}

static napi_value FgetpwentR_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int pfd[2];
    if (pipe(pfd) != 0) {
        return Ret(env, 0);
    }
    const char *badline = "invalid line without colons\n";
    (void)write(pfd[1], badline, strlen(badline));
    close(pfd[1]);
    FILE *fp = fdopen(pfd[0], "r");
    if (!fp) {
        close(pfd[0]);
        return Ret(env, 0);
    }
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    int rv = g_fgetpwentR(fp, &pw, buf, sizeof(buf), &result);
    (void)fclose(fp);
    return Ret(env, (rv == ENOENT) ? 0 : 1);
}

static napi_value FgetpwentR_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    FILE *fp = fopen("/etc/passwd", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    (void)g_fgetpwentR(fp, &pw, buf, sizeof(buf), &result);
    (void)fclose(fp);
    return Ret(env, 0);
}

static napi_value FgetpwentR_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady() || g_getpwentR == nullptr) {
        return Ret(env, 0);
    }
    FILE *fp = fopen("/etc/passwd", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    if (g_endpwent) { g_endpwent(); }
    if (g_setpwent) { g_setpwent(); }
    struct passwd pw1;
    struct passwd *res1 = nullptr;
    char buf1[1024];
    (void)g_fgetpwentR(fp, &pw1, buf1, sizeof(buf1), &res1);
    struct passwd pw2;
    struct passwd *res2 = nullptr;
    char buf2[1024];
    (void)g_getpwentR(&pw2, buf2, sizeof(buf2), &res2);
    if (g_endpwent) { g_endpwent(); }
    (void)fclose(fp);
    return Ret(env, 0);
}

static napi_value FgetpwentR_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady() || g_getpwentR == nullptr) {
        return Ret(env, 0);
    }
    FILE *fp = fopen("/etc/passwd", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    struct passwd pw;
    struct passwd *result = nullptr;
    char buf[1024];
    (void)g_fgetpwentR(fp, &pw, buf, sizeof(buf), &result);
    if (g_endpwent) { g_endpwent(); }
    if (g_setpwent) { g_setpwent(); }
    (void)g_getpwentR(&pw, buf, sizeof(buf), &result);
    if (g_endpwent) { g_endpwent(); }
    (void)fclose(fp);
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"FgetpwentR_0100", nullptr, FgetpwentR_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FgetpwentR_0200", nullptr, FgetpwentR_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FgetpwentR_0300", nullptr, FgetpwentR_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FgetpwentR_0400", nullptr, FgetpwentR_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FgetpwentR_0700", nullptr, FgetpwentR_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FgetpwentR_0800", nullptr, FgetpwentR_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FgetpwentR_0900", nullptr, FgetpwentR_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FgetpwentR_1000", nullptr, FgetpwentR_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FgetpwentR_1300", nullptr, FgetpwentR_1300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"FgetpwentR_1400", nullptr, FgetpwentR_1400,
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
    .nm_modname = "fgetpwent_r_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
