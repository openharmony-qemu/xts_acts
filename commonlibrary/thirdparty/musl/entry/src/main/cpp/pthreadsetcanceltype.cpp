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
#include <climits>
#include <unistd.h>
#include <dlfcn.h>
#include <atomic>

using std::atomic_int;
using std::atomic_load;

typedef int (*PthreadSetcanceltypeFn)(int, int *);
typedef int (*PthreadCancelFn)(pthread_t);
typedef int (*PthreadSetcancelstateFn)(int, int *);
typedef void (*PthreadTestcancelFn)(void);

static PthreadSetcanceltypeFn g_setcanceltype = nullptr;
static PthreadCancelFn g_cancel = nullptr;
static PthreadSetcancelstateFn g_setcancelstate = nullptr;
static PthreadTestcancelFn g_testcancel = nullptr;

static const int INVALID_CANCEL_TYPE = 2;
static const int INVALID_TYPE_COUNT = 3;
static const int TEST_TYPE_COUNT = 3;
static const int RETRY_COUNT = 10;
static const int CONCURRENT_THREADS_SMALL = 4;
static const int CONCURRENT_THREADS_LARGE = 100;
static const int LOOPS_PER_THREAD = 100;
static const int SWITCH_COUNT_SMALL = 1000;
static const int SWITCH_COUNT_LARGE = 10000;
static const int STRESS_ROUNDS = 10000;
static const int ALTERNATING_ROUNDS = 10;
static const int THREAD_FUNC_LOOPS = 10;
static const int THREAD_FUNC_LOOPS_5 = 5;
static const int USLEEP_WAIT_ITERATIONS = 200;
static const int USLEEP_INTERVAL_US = 1000;
static const int CANCEL_RESULT_NOT_AVAILABLE = 0;
static const int CANCEL_RESULT_FAILED = 1;
static const int CANCEL_RESULT_SUCCESS = 2;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_setcanceltype = (PthreadSetcanceltypeFn)dlsym(RTLD_DEFAULT, "pthread_setcanceltype");
    g_cancel = (PthreadCancelFn)dlsym(RTLD_DEFAULT, "pthread_cancel");
    g_setcancelstate = (PthreadSetcancelstateFn)dlsym(RTLD_DEFAULT, "pthread_setcancelstate");
    g_testcancel = (PthreadTestcancelFn)dlsym(RTLD_DEFAULT, "pthread_testcancel");
}

static bool IsSymbolAvailable()
{
    if (g_setcanceltype == nullptr) {
        return false;
    }
    int oldType = -1;
    int ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &oldType);
    if (ret == ENOSYS) {
        return false;
    }
    return true;
}

static bool IsSymbolReady()
{
    if (g_setcanceltype == nullptr) {
        return false;
    }
    return IsSymbolAvailable();
}

static atomic_int g_threadError;
static atomic_int g_ready009;
static atomic_int g_canExit009;
static atomic_int g_ready010;
static atomic_int g_canExit010;
static atomic_int g_reachedTestcancel010;
static atomic_int g_readyA011;
static atomic_int g_readyB011;
static atomic_int g_canExitA011;
static atomic_int g_canExitB011;
static atomic_int g_resultA011;
static atomic_int g_resultB011;
static atomic_int g_ready015;
static atomic_int g_canEnable015;
static atomic_int g_canExit015;
static atomic_int g_survivedCancel015;

static void *ThreadFunc009(void *arg)
{
    (void)arg;
    int old = -1;
    (void)g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
    g_ready009 = 1;
    while (atomic_load(&g_canExit009) == 0) {
        (void)sched_yield();
    }
    return nullptr;
}

static void *ThreadFunc010(void *arg)
{
    (void)arg;
    int old = -1;
    (void)g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
    g_ready010 = 1;
    while (atomic_load(&g_canExit010) == 0) {
        (void)sched_yield();
    }
    g_reachedTestcancel010 = 1;
    if (g_testcancel) {
        g_testcancel();
    }
    return nullptr;
}

static void *ThreadFuncA011(void *arg)
{
    (void)arg;
    int old = -1;
    int ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
    if (ret == 0 && old == PTHREAD_CANCEL_DEFERRED) {
        g_resultA011 = 1;
    } else {
        g_resultA011 = 0;
    }
    g_readyA011 = 1;
    while (atomic_load(&g_canExitA011) == 0) {
        (void)sched_yield();
    }
    return nullptr;
}

static void *ThreadFuncB011(void *arg)
{
    (void)arg;
    int old = -1;
    int ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
    if (ret == 0 && old == PTHREAD_CANCEL_DEFERRED) {
        g_resultB011 = 1;
    } else {
        g_resultB011 = 0;
    }
    g_readyB011 = 1;
    while (atomic_load(&g_canExitB011) == 0) {
        (void)sched_yield();
    }
    (void)g_setcanceltype(PTHREAD_CANCEL_DEFERRED, nullptr);
    return nullptr;
}

static void *ThreadFunc012(void *arg)
{
    (void)arg;
    for (int i = 0; i < LOOPS_PER_THREAD; i++) {
        int old = -1;
        int ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
        if (ret != 0) {
            g_threadError = 1;
            return nullptr;
        }
        ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
        if (ret != 0) {
            g_threadError = 1;
            return nullptr;
        }
        (void)g_setcanceltype(PTHREAD_CANCEL_DEFERRED, nullptr);
    }
    return nullptr;
}

static void *ThreadFunc015(void *arg)
{
    (void)arg;
    if (g_setcancelstate) {
        (void)g_setcancelstate(PTHREAD_CANCEL_DISABLE, nullptr);
    }
    (void)g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, nullptr);
    g_ready015 = 1;
    while (atomic_load(&g_canEnable015) == 0) {
        (void)sched_yield();
    }
    g_survivedCancel015 = 1;
    if (g_setcancelstate) {
        (void)g_setcancelstate(PTHREAD_CANCEL_ENABLE, nullptr);
    }
    while (atomic_load(&g_canExit015) == 0) {
        (void)sched_yield();
    }
    return nullptr;
}

static void *ThreadFunc027(void *arg)
{
    (void)arg;
    for (int i = 0; i < THREAD_FUNC_LOOPS; i++) {
        int old = -1;
        int ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
        if (ret != 0) {
            g_threadError = 1;
            return nullptr;
        }
        ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
        if (ret != 0) {
            g_threadError = 1;
            return nullptr;
        }
        (void)g_setcanceltype(PTHREAD_CANCEL_DEFERRED, nullptr);
    }
    return nullptr;
}

static void *ThreadFunc030(void *arg)
{
    (void)arg;
    for (int i = 0; i < THREAD_FUNC_LOOPS_5; i++) {
        int old = -1;
        int ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
        if (ret != 0) {
            g_threadError = 1;
            return nullptr;
        }
        ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
        if (ret != 0) {
            g_threadError = 1;
            return nullptr;
        }
    }
    return nullptr;
}

static void WaitUsleep()
{
    for (int i = 0; i < USLEEP_WAIT_ITERATIONS; i++) {
        usleep(USLEEP_INTERVAL_US);
    }
}

static int DoCancelAndWait(pthread_t tid, atomic_int *exitFlag)
{
    int cancelRet = g_cancel(tid);
    if (cancelRet == ENOSYS) {
        *exitFlag = 1;
        return CANCEL_RESULT_NOT_AVAILABLE;
    }
    if (cancelRet != 0) {
        *exitFlag = 1;
        return CANCEL_RESULT_FAILED;
    }
    WaitUsleep();
    *exitFlag = 1;
    return CANCEL_RESULT_SUCCESS;
}

static napi_value PthreadSetcanceltype_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int old = -1;
    int ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
    if (ret == 0 && old == PTHREAD_CANCEL_DEFERRED) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int old = -1;
    int ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
    if (ret == 0 && old == PTHREAD_CANCEL_DEFERRED) {
        (void)g_setcanceltype(PTHREAD_CANCEL_DEFERRED, nullptr);
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int old1 = -1;
    int ret1 = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old1);
    if (ret1 != 0 || old1 != PTHREAD_CANCEL_DEFERRED) {
        return Ret(env, 1);
    }
    int old2 = -1;
    int ret2 = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old2);
    if (ret2 != 0 || old2 != PTHREAD_CANCEL_ASYNCHRONOUS) {
        return Ret(env, 1);
    }
    return Ret(env, 0);
}

static napi_value PthreadSetcanceltype_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int invalidTypes[] = {INVALID_CANCEL_TYPE, -1, INT_MAX};
    for (int i = 0; i < INVALID_TYPE_COUNT; i++) {
        int old = -1;
        int ret = g_setcanceltype(invalidTypes[i], &old);
        if (ret != EINVAL || old != -1) {
            return Ret(env, 1);
        }
    }
    return Ret(env, 0);
}

static napi_value PthreadSetcanceltype_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, nullptr);
    if (ret == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (g_setcanceltype == nullptr) {
        return Ret(env, 0);
    }
    int old = -1;
    int ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
    if (ret == 0 || ret == ENOSYS) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int testTypes[] = {PTHREAD_CANCEL_DEFERRED, PTHREAD_CANCEL_ASYNCHRONOUS, INVALID_CANCEL_TYPE};
    for (int i = 0; i < TEST_TYPE_COUNT; i++) {
        for (int j = 0; j < RETRY_COUNT; j++) {
            int old = -1;
            int ret = g_setcanceltype(testTypes[i], &old);
            if (ret == EINTR) {
                return Ret(env, 1);
            }
            bool expectError = (testTypes[i] == INVALID_CANCEL_TYPE);
            int expectedRet = expectError ? EINVAL : 0;
            if (ret != expectedRet) {
                return Ret(env, 1);
            }
        }
    }
    (void)g_setcanceltype(PTHREAD_CANCEL_DEFERRED, nullptr);
    return Ret(env, 0);
}

static napi_value PthreadSetcanceltype_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (g_setcanceltype == nullptr || g_cancel == nullptr) {
        return Ret(env, 0);
    }
    if (!IsSymbolAvailable()) {
        return Ret(env, 0);
    }
    g_ready009 = 0;
    g_canExit009 = 0;
    pthread_t tid = 0;
    int ret = pthread_create(&tid, nullptr, ThreadFunc009, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    while (atomic_load(&g_ready009) == 0) {
        (void)sched_yield();
    }
    int cancelRet = g_cancel(tid);
    if (cancelRet == ENOSYS) {
        g_canExit009 = 1;
        void *s = nullptr;
        (void)pthread_join(tid, &s);
        return Ret(env, 0);
    }
    if (cancelRet != 0) {
        g_canExit009 = 1;
        void *s = nullptr;
        (void)pthread_join(tid, &s);
        return Ret(env, 1);
    }
    WaitUsleep();
    g_canExit009 = 1;
    void *status = nullptr;
    int joinRet = pthread_join(tid, &status);
    if (joinRet != 0) {
        return Ret(env, 1);
    }
    if (status == PTHREAD_CANCELED) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (g_setcanceltype == nullptr || g_cancel == nullptr || g_testcancel == nullptr) {
        return Ret(env, 0);
    }
    if (!IsSymbolAvailable()) {
        return Ret(env, 0);
    }
    g_ready010 = 0;
    g_canExit010 = 0;
    g_reachedTestcancel010 = 0;
    pthread_t tid = 0;
    int ret = pthread_create(&tid, nullptr, ThreadFunc010, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    while (atomic_load(&g_ready010) == 0) {
        (void)sched_yield();
    }
    int cancelRet = g_cancel(tid);
    if (cancelRet == ENOSYS) {
        g_canExit010 = 1;
        void *s = nullptr;
        (void)pthread_join(tid, &s);
        return Ret(env, 0);
    }
    if (cancelRet != 0) {
        g_canExit010 = 1;
        void *s = nullptr;
        (void)pthread_join(tid, &s);
        return Ret(env, 1);
    }
    WaitUsleep();
    g_canExit010 = 1;
    void *status = nullptr;
    int joinRet = pthread_join(tid, &status);
    if (joinRet != 0) {
        return Ret(env, 1);
    }
    if (status == PTHREAD_CANCELED && atomic_load(&g_reachedTestcancel010) == 1) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_readyA011 = 0;
    g_readyB011 = 0;
    g_canExitA011 = 0;
    g_canExitB011 = 0;
    g_resultA011 = -1;
    g_resultB011 = -1;
    pthread_t tidA = 0;
    pthread_t tidB = 0;
    int retA = pthread_create(&tidA, nullptr, ThreadFuncA011, nullptr);
    int retB = pthread_create(&tidB, nullptr, ThreadFuncB011, nullptr);
    if (retA != 0 || retB != 0) {
        if (retA == 0) {
            g_canExitA011 = 1;
            void *s = nullptr;
            (void)pthread_join(tidA, &s);
        }
        if (retB == 0) {
            g_canExitB011 = 1;
            void *s = nullptr;
            (void)pthread_join(tidB, &s);
        }
        return Ret(env, 1);
    }
    while (atomic_load(&g_readyA011) == 0 || atomic_load(&g_readyB011) == 0) {
        (void)sched_yield();
    }
    g_canExitA011 = 1;
    g_canExitB011 = 1;
    void *statusA = nullptr;
    void *statusB = nullptr;
    int joinA = pthread_join(tidA, &statusA);
    int joinB = pthread_join(tidB, &statusB);
    if (joinA != 0 || joinB != 0) {
        return Ret(env, 1);
    }
    if (atomic_load(&g_resultA011) == 1 && atomic_load(&g_resultB011) == 1) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_1100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_threadError = 0;
    pthread_t tids[CONCURRENT_THREADS_SMALL] = {0};
    int created = 0;
    for (int i = 0; i < CONCURRENT_THREADS_SMALL; i++) {
        int ret = pthread_create(&tids[i], nullptr, ThreadFunc012, nullptr);
        if (ret != 0) {
            for (int j = 0; j < created; j++) {
                void *s = nullptr;
                (void)pthread_join(tids[j], &s);
            }
            return Ret(env, 1);
        }
        created++;
    }
    int allOk = 1;
    for (int i = 0; i < CONCURRENT_THREADS_SMALL; i++) {
        void *status = nullptr;
        int joinRet = pthread_join(tids[i], &status);
        if (joinRet != 0 || atomic_load(&g_threadError) != 0) {
            allOk = 0;
        }
    }
    if (allOk) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_1200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    for (int i = 0; i < SWITCH_COUNT_SMALL; i++) {
        int old = -1;
        int targetType = (i % 2 == 0) ? PTHREAD_CANCEL_ASYNCHRONOUS : PTHREAD_CANCEL_DEFERRED;
        int expectedOld = (i % 2 == 0) ? PTHREAD_CANCEL_DEFERRED : PTHREAD_CANCEL_ASYNCHRONOUS;
        int ret = g_setcanceltype(targetType, &old);
        if (ret != 0 || old != expectedOld) {
            return Ret(env, 1);
        }
    }
    (void)g_setcanceltype(PTHREAD_CANCEL_DEFERRED, nullptr);
    return Ret(env, 0);
}

static napi_value PthreadSetcanceltype_1300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int old = -1;
    int ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
    if (ret != 0) {
        return Ret(env, 1);
    }
    old = -1;
    ret = g_setcanceltype(INVALID_CANCEL_TYPE, &old);
    if (ret != EINVAL) {
        return Ret(env, 1);
    }
    old = -1;
    ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
    if (ret != 0 || old != PTHREAD_CANCEL_ASYNCHRONOUS) {
        return Ret(env, 1);
    }
    return Ret(env, 0);
}

static napi_value PthreadSetcanceltype_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (g_setcanceltype == nullptr || g_cancel == nullptr || g_setcancelstate == nullptr) {
        return Ret(env, 0);
    }
    if (!IsSymbolAvailable()) {
        return Ret(env, 0);
    }
    g_ready015 = 0;
    g_canEnable015 = 0;
    g_canExit015 = 0;
    g_survivedCancel015 = 0;
    pthread_t tid = 0;
    int ret = pthread_create(&tid, nullptr, ThreadFunc015, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    while (atomic_load(&g_ready015) == 0) {
        (void)sched_yield();
    }
    int phase = DoCancelAndWait(tid, &g_canEnable015);
    if (phase == CANCEL_RESULT_NOT_AVAILABLE) {
        g_canExit015 = 1;
        void *s = nullptr;
        (void)pthread_join(tid, &s);
        return Ret(env, 0);
    }
    if (phase == CANCEL_RESULT_FAILED) {
        g_canExit015 = 1;
        void *s = nullptr;
        (void)pthread_join(tid, &s);
        return Ret(env, 1);
    }
    WaitUsleep();
    g_canExit015 = 1;
    void *status = nullptr;
    int joinRet = pthread_join(tid, &status);
    if (joinRet != 0) {
        return Ret(env, 1);
    }
    if (status == PTHREAD_CANCELED && atomic_load(&g_survivedCancel015) == 1) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_1500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int old = -1;
    int ret = g_setcanceltype(INT_MIN, &old);
    if (ret != EINVAL || old != -1) {
        return Ret(env, 1);
    }
    old = -1;
    ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
    if (ret == 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_1600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    int old = -1;
    ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
    if (ret == 0 && old == PTHREAD_CANCEL_ASYNCHRONOUS) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_1700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_threadError = 0;
    pthread_t tids[CONCURRENT_THREADS_LARGE] = {0};
    int created = 0;
    for (int i = 0; i < CONCURRENT_THREADS_LARGE; i++) {
        int ret = pthread_create(&tids[i], nullptr, ThreadFunc027, nullptr);
        if (ret != 0) {
            for (int j = 0; j < created; j++) {
                void *s = nullptr;
                (void)pthread_join(tids[j], &s);
            }
            return Ret(env, 1);
        }
        created++;
    }
    int allOk = 1;
    for (int i = 0; i < CONCURRENT_THREADS_LARGE; i++) {
        void *status = nullptr;
        int joinRet = pthread_join(tids[i], &status);
        if (joinRet != 0 || atomic_load(&g_threadError) != 0) {
            allOk = 0;
        }
    }
    if (allOk) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

static napi_value PthreadSetcanceltype_1800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    for (int i = 0; i < SWITCH_COUNT_LARGE; i++) {
        int old = -1;
        int targetType = (i % 2 == 0) ? PTHREAD_CANCEL_ASYNCHRONOUS : PTHREAD_CANCEL_DEFERRED;
        int expectedOld = (i % 2 == 0) ? PTHREAD_CANCEL_DEFERRED : PTHREAD_CANCEL_ASYNCHRONOUS;
        int ret = g_setcanceltype(targetType, &old);
        if (ret != 0 || old != expectedOld) {
            return Ret(env, 1);
        }
    }
    (void)g_setcanceltype(PTHREAD_CANCEL_DEFERRED, nullptr);
    return Ret(env, 0);
}

static napi_value PthreadSetcanceltype_1900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int old = -1;
    int ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
    if (ret != 0 || old != PTHREAD_CANCEL_DEFERRED) {
        return Ret(env, 1);
    }
    old = -1;
    ret = g_setcanceltype(INVALID_CANCEL_TYPE, &old);
    if (ret != EINVAL) {
        return Ret(env, 1);
    }
    old = -1;
    ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
    if (ret != 0 || old != PTHREAD_CANCEL_ASYNCHRONOUS) {
        return Ret(env, 1);
    }
    old = -1;
    ret = g_setcanceltype(-1, &old);
    if (ret != EINVAL) {
        return Ret(env, 1);
    }
    old = -1;
    ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
    if (ret != 0 || old != PTHREAD_CANCEL_DEFERRED) {
        return Ret(env, 1);
    }
    (void)g_setcanceltype(PTHREAD_CANCEL_DEFERRED, nullptr);
    return Ret(env, 0);
}

static napi_value PthreadSetcanceltype_2000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_threadError = 0;
    for (int round = 0; round < STRESS_ROUNDS; round++) {
        pthread_t tid = 0;
        int ret = pthread_create(&tid, nullptr, ThreadFunc030, nullptr);
        if (ret != 0) {
            return Ret(env, 1);
        }
        void *status = nullptr;
        int joinRet = pthread_join(tid, &status);
        if (joinRet != 0 || atomic_load(&g_threadError) != 0) {
            return Ret(env, 1);
        }
    }
    int old = -1;
    int ret = g_setcanceltype(PTHREAD_CANCEL_ASYNCHRONOUS, &old);
    if (ret != 0 || old != PTHREAD_CANCEL_DEFERRED) {
        return Ret(env, 1);
    }
    old = -1;
    ret = g_setcanceltype(PTHREAD_CANCEL_DEFERRED, &old);
    if (ret != 0 || old != PTHREAD_CANCEL_ASYNCHRONOUS) {
        return Ret(env, 1);
    }
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"PthreadSetcanceltype_0100", nullptr, PthreadSetcanceltype_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_0200", nullptr, PthreadSetcanceltype_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_0300", nullptr, PthreadSetcanceltype_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_0400", nullptr, PthreadSetcanceltype_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_0500", nullptr, PthreadSetcanceltype_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_0600", nullptr, PthreadSetcanceltype_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_0700", nullptr, PthreadSetcanceltype_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_0800", nullptr, PthreadSetcanceltype_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_0900", nullptr, PthreadSetcanceltype_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1000", nullptr, PthreadSetcanceltype_1000,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1100", nullptr, PthreadSetcanceltype_1100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1200", nullptr, PthreadSetcanceltype_1200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1300", nullptr, PthreadSetcanceltype_1300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1400", nullptr, PthreadSetcanceltype_1400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1500", nullptr, PthreadSetcanceltype_1500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1600", nullptr, PthreadSetcanceltype_1600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1700", nullptr, PthreadSetcanceltype_1700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1800", nullptr, PthreadSetcanceltype_1800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_1900", nullptr, PthreadSetcanceltype_1900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadSetcanceltype_2000", nullptr, PthreadSetcanceltype_2000,
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
    .nm_modname = "pthreadsetcanceltype",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
