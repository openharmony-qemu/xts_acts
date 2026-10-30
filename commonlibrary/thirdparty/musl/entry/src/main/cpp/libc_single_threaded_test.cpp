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
#include <unistd.h>
#include <cerrno>
#include <sys/wait.h>
#include <atomic>

#define USLEEP_50MS 50000
#define USLEEP_100MS 100000
#define USLEEP_10MS 10000

using std::atomic_int;

#define FORK_NOT_SUPPORTED (-2)
#define LOOP_COUNT_100 100
#define LOOP_COUNT_5 5
#define THREAD_COUNT_4 4

static char *g_singleThreadedPtr = nullptr;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_singleThreadedPtr = (char *)dlsym(RTLD_DEFAULT, "__libc_single_threaded");
}

static bool IsSymbolReady()
{
    return g_singleThreadedPtr != nullptr;
}

static pid_t ForkChild()
{
    pid_t parentPid = getpid();
    pid_t pid = fork();
    if (pid == 0 && getpid() == parentPid) {
        return FORK_NOT_SUPPORTED;
    }
    return pid;
}

static void *NoopThread(void *arg)
{
    (void)arg;
    usleep(USLEEP_100MS);
    return nullptr;
}

static void *ConcurrentReader(void *arg)
{
    (void)arg;
    if (g_singleThreadedPtr) {
        (void)(*g_singleThreadedPtr);
    }
    return nullptr;
}

static atomic_int g_readerDone;

static void *ReaderWorker(void *arg)
{
    (void)arg;
    for (int i = 0; i < LOOP_COUNT_100; i++) {
        if (g_singleThreadedPtr) {
            (void)(*g_singleThreadedPtr);
        }
    }
    g_readerDone = 1;
    return nullptr;
}

static napi_value SingleThreaded_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    int val = static_cast<int>(*g_singleThreadedPtr);
    return Ret(env, (val == 0 || val == 1) ? 0 : 1);
}

static napi_value SingleThreaded_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, NoopThread, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    usleep(USLEEP_50MS);
    int val = static_cast<int>(*g_singleThreadedPtr);
    (void)pthread_join(tid, nullptr);
    return Ret(env, (val == 0) ? 0 : 1);
}

static napi_value SingleThreaded_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, NoopThread, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    (void)pthread_join(tid, nullptr);
    int val = static_cast<int>(*g_singleThreadedPtr);
    return Ret(env, (val == 0) ? 0 : 1);
}

static napi_value SingleThreaded_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    char sample = *g_singleThreadedPtr;
    (void)sample;
    int sz = static_cast<int>(sizeof(char));
    return Ret(env, (sz == 1) ? 0 : 1);
}

static napi_value SingleThreaded_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    for (int i = 0; i < LOOP_COUNT_5; i++) {
        pthread_t tid;
        int ret = pthread_create(&tid, nullptr, NoopThread, nullptr);
        if (ret != 0) {
            return Ret(env, 1);
        }
        (void)pthread_join(tid, nullptr);
    }
    int val = static_cast<int>(*g_singleThreadedPtr);
    return Ret(env, (val == 0) ? 0 : 1);
}

static napi_value SingleThreaded_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t tids[4];
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        int ret = pthread_create(&tids[i], nullptr, ConcurrentReader, nullptr);
        if (ret != 0) {
            return Ret(env, 1);
        }
    }
    for (int i = 0; i < THREAD_COUNT_4; i++) {
        (void)pthread_join(tids[i], nullptr);
    }
    return Ret(env, 0);
}

static napi_value SingleThreaded_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    errno = 0;
    int before = errno;
    (void)(*g_singleThreadedPtr);
    int after = errno;
    return Ret(env, (before == after) ? 0 : 1);
}

static napi_value SingleThreaded_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pid_t pid = ForkChild();
    if (pid == 0) {
        int val = static_cast<int>(*g_singleThreadedPtr);
        _exit(val == 1 ? 0 : 1);
    }
    if (pid > 0) {
        int status = 0;
        (void)waitpid(pid, &status, 0);
        if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
            return Ret(env, 0);
        }
    }
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, 0);
}

static napi_value SingleThreaded_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, NoopThread, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    usleep(USLEEP_50MS);
    pid_t pid = ForkChild();
    if (pid == 0) {
        int val = static_cast<int>(*g_singleThreadedPtr);
        _exit(val == 0 ? 0 : 1);
    }
    if (pid > 0) {
        int status = 0;
        (void)waitpid(pid, &status, 0);
        (void)pthread_join(tid, nullptr);
        if (WIFEXITED(status) && WEXITSTATUS(status) == 0) {
            return Ret(env, 0);
        }
        if (WIFSIGNALED(status)) {
            return Ret(env, 0);
        }
    }
    (void)pthread_join(tid, nullptr);
    if (pid < 0) {
        return Ret(env, 0);
    }
    return Ret(env, 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"SingleThreaded_0100", nullptr, SingleThreaded_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SingleThreaded_0200", nullptr, SingleThreaded_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SingleThreaded_0300", nullptr, SingleThreaded_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SingleThreaded_0400", nullptr, SingleThreaded_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SingleThreaded_0500", nullptr, SingleThreaded_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SingleThreaded_0600", nullptr, SingleThreaded_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SingleThreaded_0700", nullptr, SingleThreaded_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SingleThreaded_0800", nullptr, SingleThreaded_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SingleThreaded_0900", nullptr, SingleThreaded_0900,
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
    .nm_modname = "libc_single_threaded_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
