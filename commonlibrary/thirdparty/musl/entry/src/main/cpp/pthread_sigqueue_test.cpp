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
#include <pthread.h>
#include <csignal>
#include <unistd.h>
#include <cerrno>
#include <cstring>
#include <sys/wait.h>
#include <sys/types.h>
#include <cstdlib>

#define USLEEP_50MS 50000
#define USLEEP_100MS 100000
#define USLEEP_10MS 10000

#ifndef SIGCANCEL
#define SIGCANCEL 33
#endif
#ifndef SIGTIMER
#define SIGTIMER 32
#endif
#ifndef SIGSYNCCALL
#define SIGSYNCCALL 34
#endif
#ifndef SI_QUEUE
#define SI_QUEUE (-1)
#endif

#define MAX_ENUM 100

#define MAX_WAIT_LOOPS 200
#define SIG_VAL_17 17
#define SIG_VAL_42 42
#define SIG_VAL_7 7
#define SIG_VAL_8 8
#define SIG_VAL_9 9

typedef int (*PthreadSigqueueFn)(pthread_t, int, union sigval);

static PthreadSigqueueFn g_pthreadSigqueue = nullptr;

static volatile sig_atomic_t g_sigReceived = 0;
static volatile sig_atomic_t g_sigVal = 0;
static volatile sig_atomic_t g_siCode = 0;
static volatile sig_atomic_t g_siPid = 0;
static volatile sig_atomic_t g_siUid = 0;
static volatile void *g_sigPtr = nullptr;
static int g_sentinel = 0x12345678;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_pthreadSigqueue = (PthreadSigqueueFn)dlsym(RTLD_DEFAULT, "pthread_sigqueue");
}

static bool IsSymbolReady()
{
    return g_pthreadSigqueue != nullptr;
}

static void Sigusr1Handler(int sig, siginfo_t *si, void *ctx)
{
    (void)sig;
    (void)ctx;
    g_sigReceived = 1;
    g_sigVal = si->si_value.sival_int;
    g_sigPtr = si->si_value.sival_ptr;
    g_siCode = si->si_code;
    g_siPid = si->si_pid;
    g_siUid = si->si_uid;
}

static void SetupSigusr1Handler()
{
    struct sigaction sa = {};
    sa.sa_sigaction = Sigusr1Handler;
    sa.sa_flags = SA_SIGINFO;
    sigemptyset(&sa.sa_mask);
    sigaction(SIGUSR1, &sa, nullptr);
}

static void *TargetThread(void *arg)
{
    (void)arg;
    int waited = 0;
    while (!g_sigReceived && waited < MAX_WAIT_LOOPS) {
        usleep(USLEEP_10MS);
        waited++;
    }
    return nullptr;
}

static void *ExitImmediately(void *arg)
{
    (void)arg;
    return nullptr;
}

static napi_value Sigqueue_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    SetupSigusr1Handler();
    g_sigReceived = 0;
    g_sigVal = 0;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, TargetThread, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    usleep(USLEEP_50MS);
    union sigval value = {};
    value.sival_int = SIG_VAL_42;
    (void)g_pthreadSigqueue(tid, SIGUSR1, value);
    usleep(USLEEP_100MS);
    (void)pthread_join(tid, nullptr);
    return Ret(env, (g_sigVal == SIG_VAL_42) ? 0 : 1);
}

static napi_value Sigqueue_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    SetupSigusr1Handler();
    g_sigReceived = 0;
    g_sigPtr = nullptr;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, TargetThread, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    usleep(USLEEP_50MS);
    union sigval value = {};
    value.sival_ptr = reinterpret_cast<void *>(&g_sentinel);
    (void)g_pthreadSigqueue(tid, SIGUSR1, value);
    usleep(USLEEP_100MS);
    (void)pthread_join(tid, nullptr);
    return Ret(env, (g_sigPtr == reinterpret_cast<void *>(&g_sentinel)) ? 0 : 1);
}

static napi_value Sigqueue_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *fake = calloc(1, 4096);
    if (!fake) {
        return Ret(env, 1);
    }
    union sigval value = {};
    value.sival_int = 0;
    int rv = g_pthreadSigqueue(reinterpret_cast<pthread_t>(fake), SIGUSR1, value);
    free(fake);
    return Ret(env, (rv == ESRCH) ? 0 : 1);
}

static napi_value Sigqueue_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t self = pthread_self();
    union sigval value = {};
    value.sival_int = 0;
    int rv = g_pthreadSigqueue(self, SIGCANCEL, value);
    return Ret(env, (rv == EINVAL) ? 0 : 1);
}

static napi_value Sigqueue_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t self = pthread_self();
    union sigval value = {};
    value.sival_int = 0;
    int rv = g_pthreadSigqueue(self, SIGTIMER, value);
    return Ret(env, (rv == EINVAL) ? 0 : 1);
}

static napi_value Sigqueue_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t self = pthread_self();
    union sigval value = {};
    value.sival_int = 0;
    int rv = g_pthreadSigqueue(self, SIGSYNCCALL, value);
    return Ret(env, (rv == EINVAL) ? 0 : 1);
}

static napi_value Sigqueue_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    SetupSigusr1Handler();
    g_sigReceived = 0;
    g_sigVal = 0;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, TargetThread, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    usleep(USLEEP_50MS);
    errno = 0;
    int before = errno;
    union sigval value = {};
    value.sival_int = SIG_VAL_7;
    int rv = g_pthreadSigqueue(tid, SIGUSR1, value);
    int after = errno;
    usleep(USLEEP_100MS);
    (void)pthread_join(tid, nullptr);
    if (rv != 0) {
        return Ret(env, 1);
    }
    return Ret(env, (before == after) ? 0 : 1);
}

static napi_value Sigqueue_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    SetupSigusr1Handler();
    g_sigReceived = 0;
    g_siCode = 0;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, TargetThread, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    usleep(USLEEP_50MS);
    union sigval value = {};
    value.sival_int = SIG_VAL_8;
    (void)g_pthreadSigqueue(tid, SIGUSR1, value);
    usleep(USLEEP_100MS);
    (void)pthread_join(tid, nullptr);
    return Ret(env, (g_sigReceived == 1 && g_siCode == SI_QUEUE) ? 0 : 1);
}

static napi_value Sigqueue_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    SetupSigusr1Handler();
    g_sigReceived = 0;
    g_siPid = 0;
    g_siUid = 0;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, TargetThread, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    usleep(USLEEP_50MS);
    union sigval value = {};
    value.sival_int = SIG_VAL_9;
    (void)g_pthreadSigqueue(tid, SIGUSR1, value);
    usleep(USLEEP_100MS);
    (void)pthread_join(tid, nullptr);
    if (g_sigReceived != 1) {
        return Ret(env, 1);
    }
    if (g_siPid == 0 && g_siUid == 0) {
        return Ret(env, 0);
    }
    return Ret(env, (g_siPid == getpid() && g_siUid == getuid()) ? 0 : 1);
}

static napi_value Sigqueue_1400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t self = pthread_self();
    union sigval value = {};
    value.sival_int = 0;
    int rv = g_pthreadSigqueue(self, 9999, value);
    return Ret(env, (rv == EINVAL) ? 0 : 1);
}

static napi_value Sigqueue_1500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, ExitImmediately, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    (void)pthread_join(tid, nullptr);
    usleep(USLEEP_10MS);
    void *fake = calloc(1, 4096);
    if (!fake) {
        return Ret(env, 1);
    }
    union sigval value = {};
    value.sival_int = 0;
    int rv = g_pthreadSigqueue(reinterpret_cast<pthread_t>(fake), SIGUSR1, value);
    free(fake);
    return Ret(env, (rv == ESRCH) ? 0 : 1);
}

static napi_value Sigqueue_1600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    char *st = (char *)dlsym(RTLD_DEFAULT, "__libc_single_threaded");
    if (st) {
        (void)(*st);
    }
    return Ret(env, 0);
}

static napi_value Sigqueue_1700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    SetupSigusr1Handler();
    g_sigReceived = 0;
    g_sigVal = 0;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, TargetThread, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    usleep(USLEEP_50MS);
    union sigval value = {};
    value.sival_int = SIG_VAL_17;
    int rv = g_pthreadSigqueue(tid, SIGUSR1, value);
    usleep(USLEEP_100MS);
    (void)pthread_join(tid, nullptr);
    return Ret(env, (rv == 0) ? 0 : 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"Sigqueue_0100", nullptr, Sigqueue_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_0200", nullptr, Sigqueue_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_0300", nullptr, Sigqueue_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_0400", nullptr, Sigqueue_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_0500", nullptr, Sigqueue_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_0600", nullptr, Sigqueue_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_0700", nullptr, Sigqueue_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_0800", nullptr, Sigqueue_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_0900", nullptr, Sigqueue_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_1400", nullptr, Sigqueue_1400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_1500", nullptr, Sigqueue_1500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_1600", nullptr, Sigqueue_1600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"Sigqueue_1700", nullptr, Sigqueue_1700,
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
    .nm_modname = "pthread_sigqueue_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
