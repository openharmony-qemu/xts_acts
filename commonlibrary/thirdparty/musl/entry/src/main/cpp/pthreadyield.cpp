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
#include <pthread.h>
#include <sched.h>
#include <cerrno>
#include <unistd.h>
#include <dlfcn.h>
#include <atomic>

using std::atomic_int;
using std::atomic_load;
using std::atomic_fetch_add;

typedef int (*PthreadYieldFn)(void);

static PthreadYieldFn g_yield = nullptr;

static const int CONCURRENT_THREADS_SMALL = 4;
static const int CONCURRENT_THREADS_LARGE = 100;
static const int LOOPS_PER_THREAD = 100;
static const int LOOPS_PER_THREAD_LARGE = 10;
static const int LOOP_COUNT_SMALL = 1000;
static const int LOOP_COUNT_LARGE = 10000;
static const int STRESS_ROUNDS = 10000;
static const int JOIN_LOOP_ROUNDS = 100;
static const int ALTERNATING_ROUNDS = 10;
static const int EXPECTED_YIELD_COUNT_400 = 400;
static const int EXPECTED_YIELD_COUNT_1000 = 1000;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_yield = (PthreadYieldFn)dlsym(RTLD_DEFAULT, "pthread_yield");
}

static bool IsSymbolAvailable()
{
    if (g_yield == nullptr) {
        return false;
    }
    int ret = g_yield();
    if (ret == ENOSYS) {
        return false;
    }
    return true;
}

static bool IsSymbolReady()
{
    if (g_yield == nullptr) {
        return false;
    }
    return IsSymbolAvailable();
}

static atomic_int g_workerDone;
static atomic_int g_yieldCount;
static atomic_int g_concurrentTimes;
static int g_joinLoopCount = 0;
static atomic_int g_threadAFlag;
static atomic_int g_threadBFlag;
static atomic_int g_canExit;
static atomic_int g_threadBReady;
static int g_threadLeakCount = 0;
static atomic_int g_countA;
static atomic_int g_countB;
static atomic_int g_turn;
static atomic_int g_startFlag;
static atomic_int g_readyA;
static atomic_int g_readyB;
static atomic_int g_abortFlag;

static void *Worker017(void *arg)
{
    (void)arg;
    int ret = g_yield();
    if (ret == 0) {
        g_workerDone = 1;
    }
    return nullptr;
}

static void *ConcurrentWorker(void *arg)
{
    (void)arg;
    int times = atomic_load(&g_concurrentTimes);
    for (int i = 0; i < times; i++) {
        int ret = g_yield();
        if (ret == 0) {
            atomic_fetch_add(&g_yieldCount, 1);
        }
    }
    return nullptr;
}

static void *JoinLoopWorker(void *arg)
{
    (void)arg;
    (void)g_yield();
    return nullptr;
}

static void *ScheduleWorkerB(void *arg)
{
    (void)arg;
    g_threadBReady = 1;
    while (atomic_load(&g_canExit) == 0) {
        (void)sched_yield();
    }
    g_threadBFlag = 1;
    return nullptr;
}

static void *MemSafetyWorker(void *arg)
{
    (void)arg;
    (void)g_yield();
    return nullptr;
}

static void *AlternatingWorkerA(void *arg)
{
    (void)arg;
    g_readyA = 1;
    while (atomic_load(&g_startFlag) == 0 && atomic_load(&g_abortFlag) == 0) {
        (void)sched_yield();
    }
    if (atomic_load(&g_abortFlag) != 0) {
        return nullptr;
    }
    for (int i = 0; i < ALTERNATING_ROUNDS; i++) {
        while (atomic_load(&g_turn) != 0 && atomic_load(&g_abortFlag) == 0) {
            (void)sched_yield();
        }
        if (atomic_load(&g_abortFlag) != 0) {
            return nullptr;
        }
        atomic_fetch_add(&g_countA, 1);
        g_turn = 1;
        (void)g_yield();
    }
    return nullptr;
}

static void *AlternatingWorkerB(void *arg)
{
    (void)arg;
    g_readyB = 1;
    while (atomic_load(&g_startFlag) == 0 && atomic_load(&g_abortFlag) == 0) {
        (void)sched_yield();
    }
    if (atomic_load(&g_abortFlag) != 0) {
        return nullptr;
    }
    for (int i = 0; i < ALTERNATING_ROUNDS; i++) {
        while (atomic_load(&g_turn) != 1 && atomic_load(&g_abortFlag) == 0) {
            (void)sched_yield();
        }
        if (atomic_load(&g_abortFlag) != 0) {
            return nullptr;
        }
        atomic_fetch_add(&g_countB, 1);
        g_turn = 0;
        (void)g_yield();
    }
    return nullptr;
}

static napi_value PthreadYield_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int ret = g_yield();
    if (ret == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadYield_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_workerDone = 0;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, Worker017, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    (void)pthread_join(tid, nullptr);
    if (atomic_load(&g_workerDone) == 1) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadYield_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (g_yield == nullptr) {
        return Ret(env, 0);
    }
    int ret = g_yield();
    if (ret == 0 || ret == ENOSYS) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadYield_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_yieldCount = 0;
    g_concurrentTimes = LOOPS_PER_THREAD;
    pthread_t tids[CONCURRENT_THREADS_SMALL];
    for (int i = 0; i < CONCURRENT_THREADS_SMALL; i++) {
        int ret = pthread_create(&tids[i], nullptr, ConcurrentWorker, nullptr);
        if (ret != 0) {
            return Ret(env, 1);
        }
    }
    for (int i = 0; i < CONCURRENT_THREADS_SMALL; i++) {
        (void)pthread_join(tids[i], nullptr);
    }
    if (atomic_load(&g_yieldCount) == EXPECTED_YIELD_COUNT_400) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadYield_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_yieldCount = 0;
    g_concurrentTimes = LOOPS_PER_THREAD_LARGE;
    pthread_t tids[CONCURRENT_THREADS_LARGE];
    for (int i = 0; i < CONCURRENT_THREADS_LARGE; i++) {
        int ret = pthread_create(&tids[i], nullptr, ConcurrentWorker, nullptr);
        if (ret != 0) {
            return Ret(env, 1);
        }
    }
    for (int i = 0; i < CONCURRENT_THREADS_LARGE; i++) {
        (void)pthread_join(tids[i], nullptr);
    }
    if (atomic_load(&g_yieldCount) == EXPECTED_YIELD_COUNT_1000) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadYield_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    for (int i = 0; i < LOOP_COUNT_SMALL; i++) {
        int ret = g_yield();
        if (ret != 0) {
            return Ret(env, 1);
        }
    }
    return Ret(env, 0);
}

static napi_value PthreadYield_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    for (int i = 0; i < LOOP_COUNT_LARGE; i++) {
        int ret = g_yield();
        if (ret != 0) {
            return Ret(env, 1);
        }
    }
    return Ret(env, 0);
}

static napi_value PthreadYield_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_joinLoopCount = 0;
    for (int i = 0; i < JOIN_LOOP_ROUNDS; i++) {
        pthread_t tid;
        int ret = pthread_create(&tid, nullptr, JoinLoopWorker, nullptr);
        if (ret != 0) {
            return Ret(env, 1);
        }
        (void)pthread_join(tid, nullptr);
        g_joinLoopCount++;
    }
    if (g_joinLoopCount == JOIN_LOOP_ROUNDS) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadYield_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_threadAFlag = 0;
    g_threadBFlag = 0;
    g_canExit = 0;
    g_threadBReady = 0;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, ScheduleWorkerB, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    while (atomic_load(&g_threadBReady) == 0) {
        (void)sched_yield();
    }
    (void)g_yield();
    g_threadAFlag = 1;
    g_canExit = 1;
    while (atomic_load(&g_threadBFlag) == 0) {
        (void)sched_yield();
    }
    (void)pthread_join(tid, nullptr);
    if (atomic_load(&g_threadAFlag) == 1 && atomic_load(&g_threadBFlag) == 1) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadYield_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_threadLeakCount = 0;
    for (int i = 0; i < STRESS_ROUNDS; i++) {
        pthread_t tid;
        int ret = pthread_create(&tid, nullptr, MemSafetyWorker, nullptr);
        if (ret != 0) {
            g_threadLeakCount++;
            continue;
        }
        int jret = pthread_join(tid, nullptr);
        if (jret != 0) {
            g_threadLeakCount++;
        }
    }
    if (g_threadLeakCount == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadYield_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_countA = 0;
    g_countB = 0;
    g_turn = 0;
    g_startFlag = 0;
    g_readyA = 0;
    g_readyB = 0;
    g_abortFlag = 0;
    pthread_t tidA;
    int retA = pthread_create(&tidA, nullptr, AlternatingWorkerA, nullptr);
    if (retA != 0) {
        return Ret(env, 1);
    }
    pthread_t tidB;
    int retB = pthread_create(&tidB, nullptr, AlternatingWorkerB, nullptr);
    if (retB != 0) {
        g_abortFlag = 1;
        g_startFlag = 1;
        (void)pthread_join(tidA, nullptr);
        return Ret(env, 1);
    }
    while (atomic_load(&g_readyA) == 0 || atomic_load(&g_readyB) == 0) {
        (void)sched_yield();
    }
    g_startFlag = 1;
    (void)pthread_join(tidA, nullptr);
    (void)pthread_join(tidB, nullptr);
    if (atomic_load(&g_countA) == ALTERNATING_ROUNDS && atomic_load(&g_countB) == ALTERNATING_ROUNDS) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"PthreadYield_0100", nullptr, PthreadYield_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_0200", nullptr, PthreadYield_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_0300", nullptr, PthreadYield_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_0400", nullptr, PthreadYield_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_0500", nullptr, PthreadYield_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_0600", nullptr, PthreadYield_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_0700", nullptr, PthreadYield_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_0800", nullptr, PthreadYield_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_0900", nullptr, PthreadYield_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_1000", nullptr, PthreadYield_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadYield_1100", nullptr, PthreadYield_1100,
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
    .nm_modname = "pthreadyield",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
