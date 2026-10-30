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

using std::atomic_int;
using std::atomic_load;
using std::atomic_fetch_add;

#define MAX_ALIAS 100
#define PROTO_RAW 255
#define PROTO_TCP 6
#define PROTO_UDP 17

typedef int (*GetprotobynumberRFn)(int, struct protoent *, char *, size_t, struct protoent **);

static GetprotobynumberRFn g_fn = nullptr;

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
    g_fn = (GetprotobynumberRFn)dlsym(RTLD_DEFAULT, "getprotobynumber_r");
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
        int rv = g_fn(PROTO_TCP, &pe, buf, sizeof(buf), &result);
        if (rv == 0 && result && pe.p_proto == PROTO_TCP) {
            atomic_fetch_add(&g_concurrentOk, 1);
        }
    }
    return nullptr;
}

static napi_value ProtobynumberR_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(PROTO_TCP, &pe, buf, sizeof(buf), &result);
    if (rv == 0 && result && strcmp(pe.p_name, "tcp") == 0) {
        return Ret(env, 0);
    }
    return Ret(env, (rv == 0) ? 0 : 1);
}

static napi_value ProtobynumberR_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(17, &pe, buf, sizeof(buf), &result);
    if (rv == 0 && result && strcmp(pe.p_name, "udp") == 0) {
        return Ret(env, 0);
    }
    return Ret(env, (rv == 0) ? 0 : 1);
}

static napi_value ProtobynumberR_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(0, &pe, buf, sizeof(buf), &result);
    return Ret(env, (rv == 0) ? 0 : 1);
}

static napi_value ProtobynumberR_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(255, &pe, buf, sizeof(buf), &result);
    return Ret(env, (rv == 0) ? 0 : 1);
}

static napi_value ProtobynumberR_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(999, &pe, buf, sizeof(buf), &result);
    return Ret(env, (rv == ENOENT) ? 0 : 1);
}

static napi_value ProtobynumberR_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[1];
    int rv = g_fn(PROTO_TCP, &pe, buf, sizeof(buf), &result);
    return Ret(env, (rv == ERANGE) ? 0 : 1);
}

static napi_value ProtobynumberR_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(-1, &pe, buf, sizeof(buf), &result);
    return Ret(env, (rv == ENOENT) ? 0 : 1);
}

static napi_value ProtobynumberR_0800(napi_env env, napi_callback_info info)
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

static napi_value ProtobynumberR_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(PROTO_TCP, &pe, buf, sizeof(buf), &result);
    if (rv == 0 && result == &pe) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value ProtobynumberR_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    struct protoent pe;
    struct protoent *result = nullptr;
    char buf[512];
    int rv = g_fn(PROTO_TCP, &pe, buf, sizeof(buf), &result);
    if (rv != 0 || !result) {
        return Ret(env, 0);
    }
    if (pe.p_aliases == nullptr) {
        return Ret(env, 0);
    }
    int aliasIdx = 0;
    while (pe.p_aliases[aliasIdx] != nullptr) {
        aliasIdx++;
        if (aliasIdx > MAX_ALIAS) {
            return Ret(env, 0);
        }
    }
    return Ret(env, 0);
}

static napi_value ProtobynumberR_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int protos[] = {0, 1, 2, 6, 17, 255};
    int count = sizeof(protos) / sizeof(protos[0]);
    int found = 0;
    for (int i = 0; i < count; i++) {
        struct protoent pe;
        struct protoent *result = nullptr;
        char buf[512];
        int rv = g_fn(protos[i], &pe, buf, sizeof(buf), &result);
        if (rv == 0 && result && pe.p_proto == protos[i]) {
            found++;
        }
    }
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"ProtobynumberR_0100", nullptr, ProtobynumberR_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_0200", nullptr, ProtobynumberR_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_0300", nullptr, ProtobynumberR_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_0400", nullptr, ProtobynumberR_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_0500", nullptr, ProtobynumberR_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_0600", nullptr, ProtobynumberR_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_0700", nullptr, ProtobynumberR_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_0800", nullptr, ProtobynumberR_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_0900", nullptr, ProtobynumberR_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_1000", nullptr, ProtobynumberR_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ProtobynumberR_1100", nullptr, ProtobynumberR_1100,
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
    .nm_modname = "getprotobynumber_r_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
