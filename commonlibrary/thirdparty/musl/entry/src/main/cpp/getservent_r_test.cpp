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

using std::atomic_int;
using std::atomic_load;
using std::atomic_fetch_add;

typedef int (*GetserventRFn)(struct servent *, char *, size_t, struct servent **);
typedef void (*EndserventFn)(void);
typedef void (*SetserventFn)(int);

static GetserventRFn g_fn = nullptr;
static EndserventFn g_end = nullptr;
static SetserventFn g_set = nullptr;

static const int CONCURRENT_THREADS = 2;
static const int LOOPS_PER_THREAD = 50;
static const int MAX_ENUM = 1000;
static atomic_int g_concurrentOk;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_fn = (GetserventRFn)dlsym(RTLD_DEFAULT, "getservent_r");
    g_end = (EndserventFn)dlsym(RTLD_DEFAULT, "endservent");
    g_set = (SetserventFn)dlsym(RTLD_DEFAULT, "setservent");
}

static bool IsSymbolReady()
{
    return g_fn != nullptr;
}

static void ResetCursor()
{
    if (g_end) g_end();
}

static void *ConcurrentWorker(void *arg)
{
    (void)arg;
    for (int i = 0; i < LOOPS_PER_THREAD; i++) {
        struct servent se;
        struct servent *result = nullptr;
        char buf[1024];
        int rv = g_fn(&se, buf, sizeof(buf), &result);
        if (rv == 0 || rv == ENOENT) {
            atomic_fetch_add(&g_concurrentOk, 1);
        }
    }
    return nullptr;
}

static napi_value ServentR_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    int rv = g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, (rv == 0) ? 0 : 1);
}

static napi_value ServentR_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = (struct servent *)1;
    char buf[1024];
    int rv = g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, (rv == 0 && result == nullptr) ? 0 : (rv == 0 ? 0 : 1));
}

static napi_value ServentR_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    int rv = g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, (rv == ENOENT || rv == 0) ? 0 : 1);
}

static napi_value ServentR_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[8];
    int rv = g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, (rv == ERANGE || rv == 0) ? 0 : 1);
}

static napi_value ServentR_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[8];
    int rv = g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, (rv == ESPIPE || rv == ERANGE || rv == 0) ? 0 : 1);
}

static napi_value ServentR_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    (void)g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    (void)g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    (void)g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    (void)g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    (void)g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    int rv = g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    if (rv == 0 && result) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value ServentR_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
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
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    int rv = 0;
    int count = 0;
    while ((rv = g_fn(&se, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    if (g_end) g_end();
    return Ret(env, (rv == ENOENT || rv == 0) ? 0 : 1);
}

static napi_value ServentR_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    errno = 0;
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    int rv = g_fn(&se, buf, sizeof(buf), &result);
    int savedErrno = errno;
    if (g_end) g_end();
    return Ret(env, (savedErrno == rv) ? 0 : 1);
}

static napi_value ServentR_1500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    (void)g_fn(&se, buf, sizeof(buf), &result);
    return Ret(env, 0);
}

static napi_value ServentR_1600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    int rv = 0;
    int count = 0;
    while ((rv = g_fn(&se, buf, sizeof(buf), &result)) == 0 && count < MAX_ENUM) {
        count++;
    }
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_1700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    (void)g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_1800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    struct servent se;
    struct servent *result = nullptr;
    char buf[1024];
    (void)g_fn(&se, buf, sizeof(buf), &result);
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_1900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
    for (int i = 0; i < 50; i++) {
        struct servent se;
        struct servent *result = nullptr;
        char buf[1024];
        (void)g_fn(&se, buf, sizeof(buf), &result);
    }
    if (g_end) g_end();
    return Ret(env, 0);
}

static napi_value ServentR_2000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    ResetCursor();
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
    if (g_end) g_end();
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"ServentR_0100", nullptr, ServentR_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_0200", nullptr, ServentR_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_0300", nullptr, ServentR_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_0400", nullptr, ServentR_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_0500", nullptr, ServentR_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_0600", nullptr, ServentR_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_0700", nullptr, ServentR_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_0800", nullptr, ServentR_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_0900", nullptr, ServentR_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1000", nullptr, ServentR_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1100", nullptr, ServentR_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1200", nullptr, ServentR_1200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1300", nullptr, ServentR_1300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1400", nullptr, ServentR_1400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1500", nullptr, ServentR_1500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1600", nullptr, ServentR_1600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1700", nullptr, ServentR_1700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1800", nullptr, ServentR_1800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_1900", nullptr, ServentR_1900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"ServentR_2000", nullptr, ServentR_2000,
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
    .nm_modname = "getservent_r_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
