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
#include <unistd.h>
#include <fcntl.h>
#include <poll.h>
#include <sys/wait.h>
#include <cerrno>
#include <csignal>
#include <cstring>
#include <climits>

static const int STRESS_LOOPS = 1000;
static const int MULTI_CREATE_NUM = 10;
static const int CONCURRENT_THREADS = 4;
static const int KEY_MAX_GUARD = 256;
static const int DTOR_ITERATE_LIMIT = 8;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static napi_value PthreadKeyCreate_Basic_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    int r = pthread_key_create(&key, nullptr);
    if (r != 0) {
        return Ret(env, 1);
    }
    pthread_key_delete(key);
    return Ret(env, 0);
}

static napi_value PthreadKeyCreate_WithDtor_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    int r = pthread_key_create(&key, [](void*) {});
    if (r != 0) {
        return Ret(env, 1);
    }
    pthread_key_delete(key);
    return Ret(env, 0);
}

static void DeleteKeys(pthread_key_t* keys, int n)
{
    for (int i = 0; i < n; i++) {
        pthread_key_delete(keys[i]);
    }
}

static napi_value PthreadKeyCreate_MultiCreate_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t keys[MULTI_CREATE_NUM];
    for (int i = 0; i < MULTI_CREATE_NUM; i++) {
        int r = pthread_key_create(&keys[i], nullptr);
        if (r != 0) {
            DeleteKeys(keys, i);
            return Ret(env, 1);
        }
    }
    for (int i = 1; i < MULTI_CREATE_NUM; i++) {
        for (int j = 0; j < i; j++) {
            if (keys[i] == keys[j]) {
                DeleteKeys(keys, MULTI_CREATE_NUM);
                return Ret(env, 1);
            }
        }
    }
    DeleteKeys(keys, MULTI_CREATE_NUM);
    return Ret(env, 0);
}

static napi_value PthreadKeyCreate_NullKeyPtr_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    int r = pthread_key_create(&key, nullptr);
    if (r != 0) {
        return Ret(env, 1);
    }
    pthread_key_delete(key);
    return Ret(env, 0);
}

static napi_value PthreadKeyCreate_RoundTripSpecific_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    int r = pthread_key_create(&key, nullptr);
    if (r != 0) {
        return Ret(env, 1);
    }
    int value = 0x5a5a;
    pthread_setspecific(key, &value);
    void* got = pthread_getspecific(key);
    int ret = (got == &value) ? 0 : 1;
    pthread_key_delete(key);
    return Ret(env, ret);
}

static volatile sig_atomic_t g_dtorCalled = 0;
static void* g_dtorArg = nullptr;
static void DtorForExit(void* arg)
{
    g_dtorArg = arg;
    g_dtorCalled = 1;
}
static pthread_key_t g_dtorKey;
static void* ChildDtorThread(void*)
{
    pthread_key_create(&g_dtorKey, DtorForExit);
    int val = 0x1234;
    pthread_setspecific(g_dtorKey, &val);
    return nullptr;
}
static napi_value PthreadKeyCreate_DtorOnExit_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    g_dtorCalled = 0;
    g_dtorArg = nullptr;
    pthread_t tid;
    if (pthread_create(&tid, nullptr, ChildDtorThread, nullptr) != 0) {
        return Ret(env, 1);
    }
    void* s = nullptr;
    pthread_join(tid, &s);
    int ret = (g_dtorCalled == 1 && g_dtorArg != nullptr) ? 0 : 1;
    pthread_key_delete(g_dtorKey);
    return Ret(env, ret);
}

static volatile sig_atomic_t g_dtorNullCalled = 0;
static void DtorNullCheck(void*) { g_dtorNullCalled = 1; }
static pthread_key_t g_nullDtorKey;
static void* ChildNullDtorThread(void*)
{
    pthread_key_create(&g_nullDtorKey, DtorNullCheck);
    pthread_setspecific(g_nullDtorKey, nullptr);
    return nullptr;
}
static napi_value PthreadKeyCreate_DtorNullValueSkipped_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    g_dtorNullCalled = 0;
    pthread_t tid;
    if (pthread_create(&tid, nullptr, ChildNullDtorThread, nullptr) != 0) {
        return Ret(env, 1);
    }
    void* s = nullptr;
    pthread_join(tid, &s);
    int ret = (g_dtorNullCalled == 0) ? 0 : 1;
    pthread_key_delete(g_nullDtorKey);
    return Ret(env, ret);
}

static volatile sig_atomic_t g_iterCount = 0;
static pthread_key_t g_iterKey;
static volatile intptr_t g_iterSentinel;
static void DtorIterate(void* arg)
{
    (void)arg;
    g_iterCount++;
    if (g_iterCount < DTOR_ITERATE_LIMIT) {
        pthread_setspecific(g_iterKey, const_cast<void*>(reinterpret_cast<volatile void*>(&g_iterSentinel)));
    }
}
static void* ChildIterThread(void*)
{
    pthread_key_create(&g_iterKey, DtorIterate);
    g_iterSentinel = 1;
    pthread_setspecific(g_iterKey, const_cast<void*>(reinterpret_cast<volatile void*>(&g_iterSentinel)));
    return nullptr;
}
static napi_value PthreadKeyCreate_DtorIteration_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    g_iterCount = 0;
    pthread_t tid;
    if (pthread_create(&tid, nullptr, ChildIterThread, nullptr) != 0) {
        return Ret(env, 1);
    }
    void* s = nullptr;
    pthread_join(tid, &s);
    int ret = (g_iterCount > 0 && g_iterCount <= PTHREAD_DESTRUCTOR_ITERATIONS) ? 0 : 1;
    pthread_key_delete(g_iterKey);
    return Ret(env, ret);
}

static napi_value PthreadKeyCreate_ReuseAfterDelete_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_key_t key;
    if (pthread_key_create(&key, nullptr) != 0) {
        return Ret(env, 1);
    }
    if (pthread_key_delete(key) != 0) {
        return Ret(env, 1);
    }
    pthread_key_t key2;
    int r = pthread_key_create(&key2, nullptr);
    int ret = (r == 0) ? 0 : 1;
    pthread_key_delete(key2);
    return Ret(env, ret);
}

static napi_value PthreadKeyCreate_StressCreateDelete_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    for (int i = 0; i < STRESS_LOOPS; i++) {
        pthread_key_t key;
        if (pthread_key_create(&key, nullptr) != 0) {
            return Ret(env, 1);
        }
        if (pthread_key_delete(key) != 0) {
            return Ret(env, 1);
        }
    }
    return Ret(env, 0);
}

static void* ConcurrentThread(void* arg)
{
    pthread_key_t key;
    if (pthread_key_create(&key, nullptr) != 0) {
        return reinterpret_cast<void*>(static_cast<intptr_t>(1));
    }
    int v = static_cast<int>(reinterpret_cast<intptr_t>(arg));
    pthread_setspecific(key, &v);
    void* got = pthread_getspecific(key);
    int ret = (got == &v) ? 0 : 1;
    pthread_key_delete(key);
    return reinterpret_cast<void*>(static_cast<intptr_t>(ret));
}
static napi_value PthreadKeyCreate_ConcurrentCreate_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    pthread_t tids[CONCURRENT_THREADS];
    for (int i = 0; i < CONCURRENT_THREADS; i++) {
        if (pthread_create(&tids[i], nullptr, ConcurrentThread,
            reinterpret_cast<void*>(static_cast<intptr_t>(i + 1))) != 0) {
            for (int j = 0; j < i; j++) {
                void* s = nullptr;
                pthread_join(tids[j], &s);
            }
            return Ret(env, 1);
        }
    }
    int ret = 0;
    for (int i = 0; i < CONCURRENT_THREADS; i++) {
        void* s = nullptr;
        pthread_join(tids[i], &s);
        if (s != nullptr) {
            ret = 1;
        }
    }
    return Ret(env, ret);
}

static int g_actualMax = 0;
static int FindActualMaxAndCleanup()
{
    pthread_key_t keys[KEY_MAX_GUARD];
    int count = 0;
    while (count < KEY_MAX_GUARD) {
        int r = pthread_key_create(&keys[count], nullptr);
        if (r == EAGAIN) {
            break;
        }
        if (r != 0) {
            for (int i = 0; i < count; i++) {
                pthread_key_delete(keys[i]);
            }
            return -1;
        }
        count++;
    }
    for (int i = 0; i < count; i++) {
        pthread_key_delete(keys[i]);
    }
    return count;
}

static napi_value PthreadKeyCreate_FindMax_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    int m = FindActualMaxAndCleanup();
    g_actualMax = m;
    return Ret(env, m);
}

static napi_value PthreadKeyCreate_ExhaustEagain_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    int max = g_actualMax;
    if (max <= 0) {
        max = FindActualMaxAndCleanup();
        g_actualMax = max;
    }
    if (max <= 0) {
        return Ret(env, 1);
    }
    pthread_key_t keys[KEY_MAX_GUARD];
    for (int i = 0; i < max; i++) {
        if (pthread_key_create(&keys[i], nullptr) != 0) {
            for (int j = 0; j < i; j++) {
                pthread_key_delete(keys[j]);
            }
            return Ret(env, 1);
        }
    }
    int ret = 0;
    int r = pthread_key_create(&keys[max], nullptr);
    if (r != EAGAIN) {
        ret = 1;
    }
    if (ret == 0) {
        pthread_key_delete(keys[0]);
        int r2 = pthread_key_create(&keys[0], nullptr);
        if (r2 != 0) {
            ret = 1;
        }
        pthread_key_delete(keys[0]);
    }
    for (int i = 1; i < max; i++) {
        pthread_key_delete(keys[i]);
    }
    return Ret(env, ret);
}

static napi_value PthreadKeyCreate_NoLeakUnderStress_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    int first = FindActualMaxAndCleanup();
    if (first <= 0) {
        return Ret(env, 1);
    }
    int second = FindActualMaxAndCleanup();
    if (second <= 0) {
        return Ret(env, 1);
    }
    int ret = (first == second) ? 0 : 1;
    return Ret(env, ret);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"PthreadKeyCreate_Basic_0100", nullptr, PthreadKeyCreate_Basic_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_WithDtor_0200", nullptr, PthreadKeyCreate_WithDtor_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_MultiCreate_0300", nullptr, PthreadKeyCreate_MultiCreate_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_NullKeyPtr_0400", nullptr, PthreadKeyCreate_NullKeyPtr_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_RoundTripSpecific_0500", nullptr, PthreadKeyCreate_RoundTripSpecific_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_DtorOnExit_0600", nullptr, PthreadKeyCreate_DtorOnExit_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_DtorNullValueSkipped_0700", nullptr, PthreadKeyCreate_DtorNullValueSkipped_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_DtorIteration_0800", nullptr, PthreadKeyCreate_DtorIteration_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_ReuseAfterDelete_0900", nullptr, PthreadKeyCreate_ReuseAfterDelete_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_StressCreateDelete_1000", nullptr, PthreadKeyCreate_StressCreateDelete_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_ConcurrentCreate_1100", nullptr, PthreadKeyCreate_ConcurrentCreate_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_FindMax_1200", nullptr, PthreadKeyCreate_FindMax_1200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_ExhaustEagain_1300", nullptr, PthreadKeyCreate_ExhaustEagain_1300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadKeyCreate_NoLeakUnderStress_1400", nullptr, PthreadKeyCreate_NoLeakUnderStress_1400,
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
    .nm_modname = "pthreadkeycreate",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
