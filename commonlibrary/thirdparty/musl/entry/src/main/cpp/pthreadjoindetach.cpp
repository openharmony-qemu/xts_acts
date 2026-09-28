/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <atomic>
#include <cerrno>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <pthread.h>
#include <semaphore.h>
#include <sys/wait.h>
#include <unistd.h>

using std::atomic_int;
using std::atomic_fetch_add;
using std::atomic_init;
using std::atomic_load;

#define SENTINEL (reinterpret_cast<void *>(0xDEADBEEF))
#define JOINER_NUM 4
#define BARRIER_COUNT (JOINER_NUM + 1)
#define REPEAT_COUNT 3
#define THREAD_COUNT 3

#define MIXED_RETVAL_COUNT 2

static sem_t g_blockSem;
static sem_t g_doneSem;
static pthread_barrier_t g_barrier;
static pthread_t g_target;
static int g_rets[JOINER_NUM];
static void *g_res[JOINER_NUM];
static void *g_mixedRes[2];
static atomic_int g_aliveCount;

static void *ThreadFuncDetachBlock(void *arg)
{
    (void)arg;
    sem_wait(&g_blockSem);
    sem_post(&g_doneSem);
    return nullptr;
}

static void *ThreadFuncExiting(void *arg)
{
    (void)arg;
    sem_post(&g_doneSem);
    return nullptr;
}

static void *RetValueFunc(void *arg)
{
    return arg;
}

static void *JoinerFunc(void *arg)
{
    int idx = *reinterpret_cast<int *>(arg);
    pthread_barrier_wait(&g_barrier);
    g_rets[idx] = pthread_join(g_target, nullptr);
    return nullptr;
}

static void *JoinerRetvalFunc(void *arg)
{
    int idx = *reinterpret_cast<int *>(arg);
    pthread_barrier_wait(&g_barrier);
    g_rets[idx] = pthread_join(g_target, &g_res[idx]);
    return nullptr;
}

static void *JoinerMixedFunc(void *arg)
{
    int idx = *reinterpret_cast<int *>(arg);
    pthread_barrier_wait(&g_barrier);
    if (idx < MIXED_RETVAL_COUNT) {
        g_rets[idx] = pthread_join(g_target, nullptr);
    } else {
        g_rets[idx] = pthread_join(g_target, &g_mixedRes[idx - MIXED_RETVAL_COUNT]);
    }
    return nullptr;
}

static void *JoinerAliveFunc(void *arg)
{
    int idx = *reinterpret_cast<int *>(arg);
    pthread_barrier_wait(&g_barrier);
    (void)pthread_join(g_target, nullptr);
    atomic_fetch_add(&g_aliveCount, 1);
    return nullptr;
}

static void SemInitPair(void)
{
    sem_init(&g_blockSem, 0, 0);
    sem_init(&g_doneSem, 0, 0);
}

static void SemDestroyPair(void)
{
    sem_destroy(&g_blockSem);
    sem_destroy(&g_doneSem);
}

static int CreateDetachedRunningThread(pthread_t *t)
{
    SemInitPair();
    int ret = pthread_create(t, nullptr, ThreadFuncDetachBlock, nullptr);
    if (ret != 0) {
        SemDestroyPair();
        return ret;
    }
    ret = pthread_detach(*t);
    if (ret != 0) {
        sem_post(&g_blockSem);
        sem_wait(&g_doneSem);
        SemDestroyPair();
        return ret;
    }
    return 0;
}

static void ReleaseDetachedThread(void)
{
    sem_post(&g_blockSem);
    sem_wait(&g_doneSem);
    SemDestroyPair();
}

/* 0100: detached running thread join returns EINVAL */
static napi_value PthreadJoinDetach_0100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        pthread_t t;
        if (CreateDetachedRunningThread(&t) != 0) { _exit(1); }
        if (pthread_join(t, nullptr) != EINVAL) { _exit(1); }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 0200: retval not modified */
static napi_value PthreadJoinDetach_0200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        pthread_t t;
        if (CreateDetachedRunningThread(&t) != 0) { _exit(1); }
        void *res = SENTINEL;
        if (pthread_join(t, &res) != EINVAL || res != SENTINEL) { _exit(1); }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 0300: multiple join same detached thread, all EINVAL */
static napi_value PthreadJoinDetach_0300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        pthread_t t;
        if (CreateDetachedRunningThread(&t) != 0) { _exit(1); }
        for (int i = 0; i < REPEAT_COUNT; i++) {
            if (pthread_join(t, nullptr) != EINVAL) { _exit(1); }
        }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 0400: multiple independent detached threads, all EINVAL */
static napi_value PthreadJoinDetach_0400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        pthread_t t[THREAD_COUNT];
        SemInitPair();
        for (int i = 0; i < THREAD_COUNT; i++) {
            if (pthread_create(&t[i], nullptr, ThreadFuncDetachBlock, nullptr) != 0) { _exit(1); }
            if (pthread_detach(t[i]) != 0) { _exit(1); }
        }
        for (int i = 0; i < THREAD_COUNT; i++) {
            if (pthread_join(t[i], nullptr) != EINVAL) { _exit(1); }
        }
        sem_post(&g_blockSem);
        sem_wait(&g_doneSem);
        SemDestroyPair();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 0500: join immediately after detach returns EINVAL */
static napi_value PthreadJoinDetach_0500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        pthread_t t;
        if (CreateDetachedRunningThread(&t) != 0) { _exit(1); }
        if (pthread_join(t, nullptr) != EINVAL) { _exit(1); }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 0600: concurrent join same detached thread, all EINVAL */
static napi_value PthreadJoinDetach_0600(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        SemInitPair();
        if (pthread_create(&g_target, nullptr, ThreadFuncDetachBlock, nullptr) != 0) { _exit(1); }
        if (pthread_detach(g_target) != 0) { _exit(1); }
        pthread_barrier_init(&g_barrier, nullptr, BARRIER_COUNT);
        pthread_t joiner[JOINER_NUM];
        int idx[JOINER_NUM];
        for (int i = 0; i < JOINER_NUM; i++) {
            idx[i] = i;
            if (pthread_create(&joiner[i], nullptr, JoinerFunc, &idx[i]) != 0) { _exit(1); }
        }
        pthread_barrier_wait(&g_barrier);
        for (int i = 0; i < JOINER_NUM; i++) { pthread_join(joiner[i], nullptr); }
        pthread_barrier_destroy(&g_barrier);
        for (int i = 0; i < JOINER_NUM; i++) {
            if (g_rets[i] != EINVAL) { _exit(1); }
        }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 0700: concurrent join with retval, retval not modified */
static napi_value PthreadJoinDetach_0700(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        SemInitPair();
        if (pthread_create(&g_target, nullptr, ThreadFuncDetachBlock, nullptr) != 0) { _exit(1); }
        if (pthread_detach(g_target) != 0) { _exit(1); }
        for (int i = 0; i < JOINER_NUM; i++) { g_res[i] = SENTINEL; }
        pthread_barrier_init(&g_barrier, nullptr, BARRIER_COUNT);
        pthread_t joiner[JOINER_NUM];
        int idx[JOINER_NUM];
        for (int i = 0; i < JOINER_NUM; i++) {
            idx[i] = i;
            if (pthread_create(&joiner[i], nullptr, JoinerRetvalFunc, &idx[i]) != 0) { _exit(1); }
        }
        pthread_barrier_wait(&g_barrier);
        for (int i = 0; i < JOINER_NUM; i++) { pthread_join(joiner[i], nullptr); }
        pthread_barrier_destroy(&g_barrier);
        for (int i = 0; i < JOINER_NUM; i++) {
            if (g_rets[i] != EINVAL || g_res[i] != SENTINEL) { _exit(1); }
        }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 0800: mixed retval concurrent join, all EINVAL */
static napi_value PthreadJoinDetach_0800(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        SemInitPair();
        if (pthread_create(&g_target, nullptr, ThreadFuncDetachBlock, nullptr) != 0) { _exit(1); }
        if (pthread_detach(g_target) != 0) { _exit(1); }
        g_mixedRes[0] = SENTINEL;
        g_mixedRes[1] = SENTINEL;
        pthread_barrier_init(&g_barrier, nullptr, BARRIER_COUNT);
        pthread_t joiner[JOINER_NUM];
        int idx[JOINER_NUM];
        for (int i = 0; i < JOINER_NUM; i++) {
            idx[i] = i;
            if (pthread_create(&joiner[i], nullptr, JoinerMixedFunc, &idx[i]) != 0) { _exit(1); }
        }
        pthread_barrier_wait(&g_barrier);
        for (int i = 0; i < JOINER_NUM; i++) { pthread_join(joiner[i], nullptr); }
        pthread_barrier_destroy(&g_barrier);
        for (int i = 0; i < JOINER_NUM; i++) {
            if (g_rets[i] != EINVAL) { _exit(1); }
        }
        for (int i = 0; i < MIXED_RETVAL_COUNT; i++) {
            if (g_mixedRes[i] != SENTINEL) { _exit(1); }
        }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 0900: all calling threads survive after concurrent join */
static napi_value PthreadJoinDetach_0900(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        SemInitPair();
        if (pthread_create(&g_target, nullptr, ThreadFuncDetachBlock, nullptr) != 0) { _exit(1); }
        if (pthread_detach(g_target) != 0) { _exit(1); }
        atomic_init(&g_aliveCount, 0);
        pthread_barrier_init(&g_barrier, nullptr, BARRIER_COUNT);
        pthread_t joiner[JOINER_NUM];
        int idx[JOINER_NUM];
        for (int i = 0; i < JOINER_NUM; i++) {
            idx[i] = i;
            if (pthread_create(&joiner[i], nullptr, JoinerAliveFunc, &idx[i]) != 0) { _exit(1); }
        }
        pthread_barrier_wait(&g_barrier);
        for (int i = 0; i < JOINER_NUM; i++) { pthread_join(joiner[i], nullptr); }
        pthread_barrier_destroy(&g_barrier);
        if (atomic_load(&g_aliveCount) != JOINER_NUM) { _exit(1); }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 1000: joinable normal join returns 0 and retval correct */
static napi_value PthreadJoinDetach_1000(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pthread_t t;
    if (pthread_create(&t, nullptr, RetValueFunc, reinterpret_cast<void *>(0x1234)) != 0) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    void *res = SENTINEL;
    int ret = pthread_join(t, &res);
    if (ret != 0 || res != reinterpret_cast<void *>(0x1234)) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 1100: NULL argument returns ESRCH */
static napi_value PthreadJoinDetach_1100(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int ret = pthread_join(static_cast<pthread_t>(0), nullptr);
    if (ret != ESRCH) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 1200: repeated detach on detached thread returns 0 */
static napi_value PthreadJoinDetach_1200(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        pthread_t t;
        if (CreateDetachedRunningThread(&t) != 0) { _exit(1); }
        if (pthread_detach(t) != 0) { _exit(1); }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 1300: multiple repeated detach, all return 0 */
static napi_value PthreadJoinDetach_1300(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        pthread_t t;
        if (CreateDetachedRunningThread(&t) != 0) { _exit(1); }
        for (int i = 0; i < REPEAT_COUNT; i++) {
            if (pthread_detach(t) != 0) { _exit(1); }
        }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 1400: cross-platform consistency - detached join returns EINVAL */
static napi_value PthreadJoinDetach_1400(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        pthread_t t;
        if (CreateDetachedRunningThread(&t) != 0) { _exit(1); }
        int ret = pthread_join(t, nullptr);
        if (ret != EINVAL) { _exit(1); }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

/* 1500: errno not modified (detached scenario) */
static napi_value PthreadJoinDetach_1500(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    pid_t sPid = fork();
    if (sPid == 0) {
        pthread_t t;
        if (CreateDetachedRunningThread(&t) != 0) { _exit(1); }
        errno = 0;
        int savedErrno = errno;
        if (pthread_join(t, nullptr) != EINVAL || errno != savedErrno) { _exit(1); }
        ReleaseDetachedThread();
        _exit(0);
    } else if (sPid > 0) {
        int st;
        (void)waitpid(sPid, &st, 0);
        if (WIFSIGNALED(st) || (WIFEXITED(st) && WEXITSTATUS(st) != 0)) {
            napi_create_int32(env, 1, &result);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"PthreadJoinDetach_0100", nullptr, PthreadJoinDetach_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_0200", nullptr, PthreadJoinDetach_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_0300", nullptr, PthreadJoinDetach_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_0400", nullptr, PthreadJoinDetach_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_0500", nullptr, PthreadJoinDetach_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_0600", nullptr, PthreadJoinDetach_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_0700", nullptr, PthreadJoinDetach_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_0800", nullptr, PthreadJoinDetach_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_0900", nullptr, PthreadJoinDetach_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_1000", nullptr, PthreadJoinDetach_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_1100", nullptr, PthreadJoinDetach_1100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_1200", nullptr, PthreadJoinDetach_1200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_1300", nullptr, PthreadJoinDetach_1300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_1400", nullptr, PthreadJoinDetach_1400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadJoinDetach_1500", nullptr, PthreadJoinDetach_1500, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "pthreadjoin",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
