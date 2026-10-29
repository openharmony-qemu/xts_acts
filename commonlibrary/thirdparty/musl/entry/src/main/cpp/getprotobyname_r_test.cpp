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
#include <errno.h>
#include <netdb.h>
#include <string.h>
#include <pthread.h>
#include <atomic>

#define MAX_ENUM 1000

using std::atomic_int;
using std::atomic_load;
using std::atomic_fetch_add;

typedef int (*GetprotobynameRFn)(const char *, struct protoent *, char *, size_t, struct protoent **);
typedef int (*GetprotobynumberRFn)(int, struct protoent *, char *, size_t, struct protoent **);
typedef int (*GetprotoentRFn)(struct protoent *, char *, size_t, struct protoent **);
typedef void (*EndprotoentFn)(void);
typedef void (*SetprotoentFn)(int);

static GetprotobynameRFn g_fn = nullptr;
static GetprotobynumberRFn g_bynum = nullptr;
static GetprotoentRFn g_ent = nullptr;
static EndprotoentFn g_end = nullptr;
static SetprotoentFn g_set = nullptr;

static const int CONCURRENT_THREADS = 2;
static const int LOOPS_PER_THREAD = 50;
static atomic_int g_concurrentOk;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_fn = (GetprotobynameRFn)dlsym(RTLD_DEFAULT, "getprotobyname_r");
    g_bynum = (GetprotobynumberRFn)dlsym(RTLD_DEFAULT, "getprotobynumber_r");
    g_ent = (GetprotoentRFn)dlsym(RTLD_DEFAULT, "getprotoent_r");
    g_end = (EndprotoentFn)dlsym(RTLD_DEFAULT, "endprotoent");
    g_set = (SetprotoentFn)dlsym(RTLD_DEFAULT, "setprotoent");
}

static bool IsSymbolReady()
{
    return g_fn != nullptr;
}

static void *ConcurrentWorker(void *arg)
{
    (void)arg;
    for (int i = 0; i < LOOPS_PER_THREAD; i++) {
        struct protoent pe;
        struct protoent *result = nullptr;
        char buf[512];
        int rv = g_fn("tcp", &pe, buf, sizeof(buf), &result);
        if (rv == 0 && result && pe.p_proto == 6) {
            atomic_fetch_add(&g_concurrentOk, 1);
        }
    }
    return nullptr;
}

static napi_value ProtobynameR_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn("tcp", &pe, buf, sizeof(buf), &result);
    int proto = (rv == 0 && result) ? pe.p_proto : -1;
    return Ret(env, (rv == 0 && proto == 6) ? 0 : 1);
}

static napi_value ProtobynameR_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn("udp", &pe, buf, sizeof(buf), &result);
    int proto = (rv == 0 && result) ? pe.p_proto : -1;
    return Ret(env, (rv == 0 && proto == 17) ? 0 : 1);
}

static napi_value ProtobynameR_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn("ip", &pe, buf, sizeof(buf), &result);
    int proto = (rv == 0 && result) ? pe.p_proto : -1;
    return Ret(env, (rv == 0 && proto == 0) ? 0 : 1);
}

static napi_value ProtobynameR_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn("raw", &pe, buf, sizeof(buf), &result);
    int proto = (rv == 0 && result) ? pe.p_proto : -1;
    return Ret(env, (rv == 0 && proto == 255) ? 0 : 1);
}

static napi_value ProtobynameR_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(nullptr, &pe, buf, sizeof(buf), &result);
    return Ret(env, (rv == EINVAL) ? 0 : 1);
}

static napi_value ProtobynameR_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn("nonexistent_proto_xyz", &pe, buf, sizeof(buf), &result);
    return Ret(env, (rv == ENOENT) ? 0 : 1);
}

static napi_value ProtobynameR_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[8];
    int rv = g_fn("tcp", &pe, buf, sizeof(buf), &result);
    return Ret(env, (rv == ERANGE) ? 0 : 1);
}

static napi_value ProtobynameR_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn("TCP", &pe, buf, sizeof(buf), &result);
    return Ret(env, (rv == ENOENT) ? 0 : 1);
}

static napi_value ProtobynameR_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn("tcp", &pe, buf, sizeof(buf), &result);
    if (rv == 0 && result) {
        if (pe.p_aliases != nullptr) {
            int i = 0;
            while (pe.p_aliases[i] != nullptr) {
                i++;
                if (i > 100) {
                    return Ret(env, 0);
                }
            }
        }
    }
    return Ret(env, 0);
}

static napi_value ProtobynameR_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_concurrentOk = 0;
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
    return Ret(env, 0);
}

static napi_value ProtobynameR_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn("tcp", &pe, buf, sizeof(buf), &result);
    if (rv == 0 && result) {
        if (pe.p_name >= buf && pe.p_name < buf + sizeof(buf)) {
            return Ret(env, 0);
        }
    }
    return Ret(env, 0);
}

static napi_value ProtobynameR_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn("tcp", &pe, buf, sizeof(buf), &result);
    if (rv == 0 && result && pe.p_proto == 6) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value ProtobynameR_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe1, pe2;
    struct protoent *r1 = nullptr, *r2 = nullptr;
    char buf1[512], buf2[512];
    int rv1 = g_fn("tcp", &pe1, buf1, sizeof(buf1), &r1);
    int rv2 = 0;
    if (g_bynum) {
        rv2 = g_bynum(6, &pe2, buf2, sizeof(buf2), &r2);
    }
    if (rv1 == 0 && rv2 == 0 && r1 && r2) {
        if (pe1.p_proto == pe2.p_proto && strcmp(pe1.p_name, pe2.p_name) == 0) {
            return Ret(env, 0);
        }
    }
    return Ret(env, 0);
}

static napi_value ProtobynameR_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady() || !g_ent) {
        return Ret(env, 0);
    }
    if (g_end) g_end();
    if (g_set) g_set(0);
    struct protoent pe1;
    struct protoent *r1 = nullptr;
    char buf1[512];
    int rv1 = g_ent(&pe1, buf1, sizeof(buf1), &r1);
    if (rv1 != 0) {
        if (g_end) g_end();
        return Ret(env, 0);
    }
    struct protoent pe2;
    struct protoent *r2 = nullptr;
    char buf2[512];
    (void)g_fn("udp", &pe2, buf2, sizeof(buf2), &r2);
    struct protoent pe3;
    struct protoent *r3 = nullptr;
    char buf3[512];
    int rv3 = g_ent(&pe3, buf3, sizeof(buf3), &r3);
    if (rv3 == 0 && r3) {
        if (strcmp(pe1.p_name, pe3.p_name) != 0) {
            if (g_end) g_end();
            return Ret(env, 0);
        }
    }
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ProtobynameR_1500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent peN;
    struct protoent *rN = nullptr;
    char bufN[512];
    int rvN = g_fn("tcp", &peN, bufN, sizeof(bufN), &rN);
    struct protoent peB;
    struct protoent *rB = nullptr;
    char bufB[512];
    int rvB = 0;
    if (g_bynum) {
        rvB = g_bynum(6, &peB, bufB, sizeof(bufB), &rB);
    }
    int found = 0;
    if (g_ent) {
        if (g_end) g_end();
        if (g_set) g_set(0);
        struct protoent peE;
        struct protoent *rE = nullptr;
        char bufE[512];
        int rvE = 0;
        int count = 0;
        while ((rvE = g_ent(&peE, bufE, sizeof(bufE), &rE)) == 0 && count < MAX_ENUM) {
            count++;
            if (rE && peE.p_proto == 6) {
                found = 1;
                break;
            }
        }
        if (g_end) g_end();
    }
    if (rvN == 0 && rvB == 0 && found) {
        if (peN.p_proto == peB.p_proto && peN.p_proto == 6) {
            return Ret(env, 0);
        }
    }
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"ProtobynameR_0100", nullptr, ProtobynameR_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_0200", nullptr, ProtobynameR_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_0300", nullptr, ProtobynameR_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_0400", nullptr, ProtobynameR_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_0500", nullptr, ProtobynameR_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_0600", nullptr, ProtobynameR_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_0700", nullptr, ProtobynameR_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_0800", nullptr, ProtobynameR_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_0900", nullptr, ProtobynameR_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_1000", nullptr, ProtobynameR_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_1100", nullptr, ProtobynameR_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_1200", nullptr, ProtobynameR_1200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_1300", nullptr, ProtobynameR_1300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_1400", nullptr, ProtobynameR_1400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynameR_1500", nullptr, ProtobynameR_1500,
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
    .nm_modname = "getprotobyname_r_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
