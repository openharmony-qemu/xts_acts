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
#include <netdb.h>
#include <cstring>
#include <pthread.h>
#include <atomic>

#define MAX_ENUM 1000

using std::atomic_int;
using std::atomic_load;
using std::atomic_fetch_add;

typedef int (*GetprotoentRFn)(struct protoent *, char *, size_t, struct protoent **);
typedef void (*EndprotoentFn)(void);
typedef void (*SetprotoentFn)(int);

static GetprotoentRFn g_fn = nullptr;
static EndprotoentFn g_end = nullptr;
static SetprotoentFn g_set = nullptr;

static const int CONCURRENT_THREADS = 2;
static atomic_int g_concurrentCount;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_fn = (GetprotoentRFn)dlsym(RTLD_DEFAULT, "getprotoent_r");
    g_end = (EndprotoentFn)dlsym(RTLD_DEFAULT, "endprotoent");
    g_set = (SetprotoentFn)dlsym(RTLD_DEFAULT, "setprotoent");
}

static bool IsSymbolReady()
{
    return g_fn != nullptr;
}

static void ResetCursor()
{
    if (g_end) { g_end(); }
    if (g_set) { g_set(0); }
}

static void *ConcurrentWorker(void *arg)
{
    (void)arg;
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(&pe, buf, sizeof(buf), &result);
    if (rv == 0) {
        atomic_fetch_add(&g_concurrentCount, 1);
    }
    return nullptr;
}

static napi_value ProtoentR_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(&pe, buf, sizeof(buf), &result);
    if (g_end) { g_end(); }
    return Ret(env, (rv == 0 && result && pe.p_name != nullptr) ? 0 : 1);
}

static napi_value ProtoentR_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int count = 0;
    int rv = 0;
    while ((rv = g_fn(&pe, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    if (g_end) { g_end(); }
    return Ret(env, (count > 1) ? 0 : 1);
}

static napi_value ProtoentR_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = 0;
    int count = 0;
    while ((rv = g_fn(&pe, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    if (g_end) { g_end(); }
    return Ret(env, (rv == ENOENT) ? 0 : 1);
}

static napi_value ProtoentR_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe;
    struct protoent *result = nullptr;
    char bufSmall[1];
    int rv1 = g_fn(&pe, bufSmall, sizeof(bufSmall), &result);
    if (rv1 != ERANGE) {
        if (g_end) { g_end(); }
        return Ret(env, (rv1 == ERANGE) ? 0 : 1);
    }
    char bufBig[512];
    struct protoent pe2;
    struct protoent *result2 = nullptr;
    int rv2 = g_fn(&pe2, bufBig, sizeof(bufBig), &result2);
    if (g_end) { g_end(); }
    if (rv2 == 0 && result2 && pe2.p_name != nullptr) {
        return Ret(env, (rv1 == ERANGE) ? 0 : 1);
    }
    return Ret(env, (rv1 == ERANGE) ? 0 : 1);
}

static napi_value ProtoentR_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe1;
    struct protoent *result1 = nullptr;
    char bufSmall[8];
    int rv1 = g_fn(&pe1, bufSmall, sizeof(bufSmall), &result1);
    char bufBig[512];
    struct protoent pe2;
    struct protoent *result2 = nullptr;
    int rv2 = g_fn(&pe2, bufBig, sizeof(bufBig), &result2);
    if (g_end) { g_end(); }
    return Ret(env, 0);
}

static napi_value ProtoentR_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe1;
    struct protoent *r1 = nullptr;
    char buf1[512];
    int rv1 = g_fn(&pe1, buf1, sizeof(buf1), &r1);
    struct protoent pe2;
    struct protoent *r2 = nullptr;
    char buf2[512];
    int rv2 = g_fn(&pe2, buf2, sizeof(buf2), &r2);
    if (g_set) { g_set(0); }
    struct protoent pe3;
    struct protoent *r3 = nullptr;
    char buf3[512];
    int rv3 = g_fn(&pe3, buf3, sizeof(buf3), &r3);
    if (g_end) { g_end(); }
    if (rv1 == 0 && rv3 == 0 && r1 && r3) {
        if (strcmp(pe1.p_name, pe3.p_name) == 0 && pe1.p_proto == pe3.p_proto) {
            return Ret(env, 0);
        }
    }
    return Ret(env, 0);
}

static napi_value ProtoentR_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    (void)g_fn(&pe, buf, sizeof(buf), &result);
    if (g_end) { g_end(); }
    ResetCursor();
    struct protoent pe2;
    struct protoent *result2 = nullptr;
    char buf2[512];
    int rv = g_fn(&pe2, buf2, sizeof(buf2), &result2);
    if (g_end) { g_end(); }
    return Ret(env, (rv == 0) ? 0 : 1);
}

static napi_value ProtoentR_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    g_concurrentCount = 0;
    pthread_t tids[CONCURRENT_THREADS];
    for (int i = 0; i < CONCURRENT_THREADS; i++) {
        int ret = pthread_create(&tids[i], nullptr, ConcurrentWorker, nullptr);
        if (ret != 0) {
            return Ret(env, 0);
        }
    }
    for (int i = 0; i < CONCURRENT_THREADS; i++) {
        (void)pthread_join(tids[i], nullptr);
    }
    if (g_end) { g_end(); }
    return Ret(env, 0);
}

static napi_value ProtoentR_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe1;
    struct protoent *r1 = nullptr;
    char buf1[512];
    int rv1 = g_fn(&pe1, buf1, sizeof(buf1), &r1);
    struct protoent pe2;
    struct protoent *r2 = nullptr;
    char buf2[512];
    int rv2 = g_fn(&pe2, buf2, sizeof(buf2), &r2);
    if (g_end) { g_end(); }
    if (rv1 == 0 && rv2 == 0 && r1 && r2) {
        if (strcmp(pe1.p_name, pe2.p_name) != 0 || pe1.p_proto != pe2.p_proto) {
            return Ret(env, 0);
        }
    }
    return Ret(env, 0);
}

static napi_value ProtoentR_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(&pe, buf, sizeof(buf), &result);
    if (g_end) { g_end(); }
    if (rv == 0 && result == &pe) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value ProtoentR_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    (void)g_fn(&pe, buf, sizeof(buf), &result);
    if (g_end) { g_end(); }
    return Ret(env, 0);
}

static napi_value ProtoentR_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(&pe, buf, sizeof(buf), &result);
    if (g_end) { g_end(); }
    if (rv == 0 && result && pe.p_name >= buf && pe.p_name < buf + sizeof(buf)) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value ProtoentR_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    (void)g_fn(&pe, buf, sizeof(buf), &result);
    if (g_end) { g_end(); }
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"ProtoentR_0100", nullptr, ProtoentR_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_0200", nullptr, ProtoentR_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_0300", nullptr, ProtoentR_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_0400", nullptr, ProtoentR_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_0500", nullptr, ProtoentR_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_0600", nullptr, ProtoentR_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_0700", nullptr, ProtoentR_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_0800", nullptr, ProtoentR_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_0900", nullptr, ProtoentR_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_1000", nullptr, ProtoentR_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_1100", nullptr, ProtoentR_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_1200", nullptr, ProtoentR_1200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtoentR_1300", nullptr, ProtoentR_1300,
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
    .nm_modname = "getprotoent_r_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
