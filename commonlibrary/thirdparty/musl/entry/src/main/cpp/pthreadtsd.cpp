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
#include <threads.h>
#include <unistd.h>
#include <fcntl.h>
#include <poll.h>
#include <sys/wait.h>
#include <csignal>
#include <cstdint>
#include <dlfcn.h>

typedef void** (*PthreadGettsdFn)(void);
typedef void (*PthreadSettsdFn)(void**);

static PthreadGettsdFn g_gettsd = nullptr;
static PthreadSettsdFn g_settsd = nullptr;

static const int TSD_SLOT_NUM = 128;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_gettsd = (PthreadGettsdFn)dlsym(RTLD_DEFAULT, "pthread_gettsd");
    g_settsd = (PthreadSettsdFn)dlsym(RTLD_DEFAULT, "pthread_settsd");
}

static bool IsSymbolReady()
{
    return (g_gettsd != nullptr && g_settsd != nullptr);
}

static void ClearBuf(void** buf, int n)
{
    for (int i = 0; i < n; i++) {
        buf[i] = nullptr;
    }
}

static napi_value PthreadTsd_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void** p1 = g_gettsd();
    void** p2 = g_gettsd();
    if (p1 == nullptr || p1 != p2) {
        return Ret(env, 1);
    }
    return Ret(env, 0);
}

static void* g_roundTripBuf[TSD_SLOT_NUM];
static napi_value PthreadTsd_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void** origin = g_gettsd();
    ClearBuf(g_roundTripBuf, TSD_SLOT_NUM);
    g_settsd(g_roundTripBuf);
    void** got = g_gettsd();
    g_settsd(origin);
    if (got != g_roundTripBuf) {
        return Ret(env, 1);
    }
    return Ret(env, 0);
}

static void* g_specBuf[TSD_SLOT_NUM];
static napi_value PthreadTsd_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void** origin = g_gettsd();
    ClearBuf(g_specBuf, TSD_SLOT_NUM);
    g_settsd(g_specBuf);
    pthread_key_t key;
    int err = pthread_key_create(&key, nullptr);
    int ret = 0;
    if (err != 0) {
        ret = 1;
    } else {
        int value = 0x1234;
        pthread_setspecific(key, &value);
        void* gotv = pthread_getspecific(key);
        void** tsd = g_gettsd();
        if (gotv != &value || tsd[key] != &value) {
            ret = 1;
        }
        pthread_key_delete(key);
    }
    g_settsd(origin);
    return Ret(env, ret);
}

static void* g_mainBuf[TSD_SLOT_NUM];
static volatile intptr_t g_childSamePtr = 0;
static volatile intptr_t g_childTsdNonNull = 0;
static void* ChildIsolationThread(void* arg)
{
    (void)arg;
    void** childTsd = g_gettsd();
    if (childTsd == nullptr) {
        g_childTsdNonNull = 0;
        return nullptr;
    }
    g_childTsdNonNull = 1;
    if (childTsd == g_mainBuf) {
        g_childSamePtr = 1;
    }
    return nullptr;
}
static napi_value PthreadTsd_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void** origin = g_gettsd();
    ClearBuf(g_mainBuf, TSD_SLOT_NUM);
    g_settsd(g_mainBuf);
    g_childSamePtr = 0;
    g_childTsdNonNull = 0;
    pthread_t tid = 0;
    int err = pthread_create(&tid, nullptr, ChildIsolationThread, nullptr);
    int ret = 0;
    if (err != 0) {
        ret = 1;
    } else {
        void* s = nullptr;
        (void)pthread_join(tid, &s);
        if (g_childTsdNonNull == 0 || g_childSamePtr == 1) {
            ret = 1;
        }
    }
    g_settsd(origin);
    return Ret(env, ret);
}

static void* g_restoreBuf[TSD_SLOT_NUM];
static napi_value PthreadTsd_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void** origin = g_gettsd();
    ClearBuf(g_restoreBuf, TSD_SLOT_NUM);
    g_settsd(g_restoreBuf);
    g_settsd(origin);
    void** now = g_gettsd();
    int ret = 0;
    if (now != origin) {
        ret = 1;
    } else {
        pthread_key_t key;
        int err = pthread_key_create(&key, nullptr);
        if (err != 0) {
            ret = 1;
        } else {
            int v = 0x5678;
            pthread_setspecific(key, &v);
            void* gv = pthread_getspecific(key);
            if (gv != &v) {
                ret = 1;
            }
            pthread_key_delete(key);
        }
    }
    return Ret(env, ret);
}

static int ProbeSettsdNullAbort()
{
    int pipefd[2];
    if (pipe(pipefd) != 0) {
        return 1;
    }
    pid_t pid = fork();
    if (pid < 0) {
        close(pipefd[0]);
        close(pipefd[1]);
        return 1;
    }
    if (pid == 0) {
        close(pipefd[0]);
        char marker = 0x42;
        ssize_t wr = write(pipefd[1], &marker, 1);
        (void)wr;
        close(pipefd[1]);
        g_settsd(nullptr);
        _exit(0);
    }
    close(pipefd[1]);
    fcntl(pipefd[0], F_SETFL, fcntl(pipefd[0], F_GETFL) | O_NONBLOCK);
    struct pollfd pfd = {pipefd[0], POLLIN, 0};
    bool reached = false;
    int pret = poll(&pfd, 1, 2000);
    if (pret > 0 && (pfd.revents & POLLIN)) {
        char got = 0;
        if (read(pipefd[0], &got, 1) == 1 && got == 0x42) {
            reached = true;
        }
    }
    close(pipefd[0]);
    int status = 0;
    if (waitpid(pid, &status, 0) < 0) {
        return 1;
    }
    if (!reached) {
        return 0;
    }
    if (WIFSIGNALED(status) || (WIFEXITED(status) && WEXITSTATUS(status) != 0)) {
        return 0;
    }
    return 1;
}

static napi_value PthreadTsd_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    return Ret(env, ProbeSettsdNullAbort());
}

static void* g_tssBuf[TSD_SLOT_NUM];
static napi_value PthreadTsd_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void** origin = g_gettsd();
    ClearBuf(g_tssBuf, TSD_SLOT_NUM);
    g_settsd(g_tssBuf);
    tss_t key;
    int err = tss_create(&key, nullptr);
    int ret = 0;
    if (err != thrd_success) {
        ret = 1;
    } else {
        int value = 0xABCD;
        tss_set(key, &value);
        void* gotv = tss_get(key);
        void** tsd = g_gettsd();
        if (gotv != &value || tsd[key] != &value) {
            ret = 1;
        }
        tss_delete(key);
    }
    g_settsd(origin);
    return Ret(env, ret);
}

static void* g_klBuf[TSD_SLOT_NUM];
static napi_value PthreadTsd_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void** origin = g_gettsd();
    ClearBuf(g_klBuf, TSD_SLOT_NUM);
    g_settsd(g_klBuf);
    pthread_key_t key;
    int err = pthread_key_create(&key, nullptr);
    int ret = 0;
    if (err != 0) {
        ret = 1;
    } else {
        int value = 0x7777;
        pthread_setspecific(key, &value);
        if (g_klBuf[key] != &value) {
            ret = 1;
        }
        pthread_key_delete(key);
        if (g_klBuf[key] != nullptr) {
            ret = 1;
        }
    }
    g_settsd(origin);
    return Ret(env, ret);
}

static volatile intptr_t g_childGettsdNonNull = 0;
static volatile intptr_t g_childSpecificOk = 0;
static void* ChildGettsdThread(void* arg)
{
    (void)arg;
    void** childTsd = g_gettsd();
    if (childTsd == nullptr) {
        g_childGettsdNonNull = 0;
        return nullptr;
    }
    g_childGettsdNonNull = 1;
    pthread_key_t key;
    if (pthread_key_create(&key, nullptr) == 0) {
        int v = 0x8888;
        pthread_setspecific(key, &v);
        void* gv = pthread_getspecific(key);
        void** tsd = g_gettsd();
        if (gv == &v && tsd[key] == &v) {
            g_childSpecificOk = 1;
        }
        pthread_key_delete(key);
    }
    return nullptr;
}
static napi_value PthreadTsd_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_childGettsdNonNull = 0;
    g_childSpecificOk = 0;
    pthread_t tid = 0;
    int err = pthread_create(&tid, nullptr, ChildGettsdThread, nullptr);
    if (err != 0) {
        return Ret(env, 1);
    }
    void* s = nullptr;
    (void)pthread_join(tid, &s);
    if (g_childGettsdNonNull == 0 || g_childSpecificOk == 0) {
        return Ret(env, 1);
    }
    return Ret(env, 0);
}

static volatile sig_atomic_t g_dtorCalled = 0;
static void DtorFunc(void* val)
{
    (void)val;
    g_dtorCalled = 1;
}
static void* g_dtorBuf[TSD_SLOT_NUM];
static void* ChildDtorThread(void* arg)
{
    (void)arg;
    ClearBuf(g_dtorBuf, TSD_SLOT_NUM);
    g_settsd(g_dtorBuf);
    pthread_key_t key;
    if (pthread_key_create(&key, DtorFunc) != 0) {
        return nullptr;
    }
    int val = 0x9999;
    pthread_setspecific(key, &val);
    return nullptr;
}
static napi_value PthreadTsd_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    g_dtorCalled = 0;
    pthread_t tid = 0;
    int err = pthread_create(&tid, nullptr, ChildDtorThread, nullptr);
    if (err != 0) {
        return Ret(env, 1);
    }
    void* s = nullptr;
    (void)pthread_join(tid, &s);
    if (g_dtorCalled == 0) {
        return Ret(env, 1);
    }
    return Ret(env, 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"PthreadTsd_0100", nullptr, PthreadTsd_0100, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadTsd_0200", nullptr, PthreadTsd_0200, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadTsd_0300", nullptr, PthreadTsd_0300, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadTsd_0400", nullptr, PthreadTsd_0400, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadTsd_0500", nullptr, PthreadTsd_0500, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadTsd_0600", nullptr, PthreadTsd_0600, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadTsd_0700", nullptr, PthreadTsd_0700, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadTsd_0800", nullptr, PthreadTsd_0800, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadTsd_0900", nullptr, PthreadTsd_0900, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PthreadTsd_1000", nullptr, PthreadTsd_1000, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "pthreadtsd",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
