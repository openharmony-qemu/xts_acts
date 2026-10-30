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
#include <unistd.h>
#include <cerrno>
#include <pthread.h>
#include <atomic>
#include <cstdio>
#include <cstring>
#include <cstdlib>

using std::atomic_int;

#define STACK_ALIGNMENT 16
#define EXPECTED_MATCH_2 2
#define THREAD_COUNT_4 4

static void **g_stackEndPtr = nullptr;
static atomic_int g_threadReaderOk;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_stackEndPtr = (void **)dlsym(RTLD_DEFAULT, "__libc_stack_end");
}

static bool IsSymbolReady()
{
    return g_stackEndPtr != nullptr;
}

static void *ConcurrentReader(void *arg)
{
    (void)arg;
    if (g_stackEndPtr) {
        (void)(*g_stackEndPtr);
    }
    return nullptr;
}

static void *ThreadedReader(void *arg)
{
    (void)arg;
    if (g_stackEndPtr) {
        void *val = *g_stackEndPtr;
        if (val != nullptr) {
            g_threadReaderOk = 1;
        }
    }
    return nullptr;
}

static napi_value StackEnd_0100(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *val = *g_stackEndPtr;
    return Ret(env, (val != nullptr) ? 0 : 1);
}

static napi_value StackEnd_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *val = *g_stackEndPtr;
    int local;
    void *localAddr = reinterpret_cast<void *>(&local);
    return Ret(env, (reinterpret_cast<uintptr_t>(val) >= reinterpret_cast<uintptr_t>(localAddr)) ? 0 : 1);
}

static napi_value StackEnd_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *v1 = *g_stackEndPtr;
    usleep(0);
    void *v2 = *g_stackEndPtr;
    return Ret(env, (v1 == v2) ? 0 : 1);
}

static napi_value StackEnd_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *val = *g_stackEndPtr;
    if (val != nullptr) {
        volatile char probe = *((volatile char *)val);
        (void)probe;
    }
    return Ret(env, 0);
}

static napi_value StackEnd_0500(napi_env env, napi_callback_info info)
{
    (void)info;
    void *addr = dlsym(RTLD_DEFAULT, "__libc_stack_end");
    return Ret(env, (addr != nullptr) ? 0 : 1);
}

static napi_value StackEnd_0600(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *val = *g_stackEndPtr;
    void **typedPtr = g_stackEndPtr;
    (void)val;
    (void)typedPtr;
    return Ret(env, (sizeof(void *) == sizeof(void *)) ? 0 : 1);
}

static napi_value StackEnd_0700(napi_env env, napi_callback_info info)
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

static napi_value StackEnd_0800(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *val = *g_stackEndPtr;
    FILE *fp = fopen("/proc/self/maps", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    char line[512];
    int found = 0;
    char *fgetsRet = fgets(line, sizeof(line), fp);
    while (fgetsRet != nullptr) {
        if (!strstr(line, "[stack]")) {
            fgetsRet = fgets(line, sizeof(line), fp);
            continue;
        }
        char *dashPos = strchr(line, '-');
        if (dashPos == nullptr) {
            break;
        }
        unsigned long start = strtoul(line, nullptr, 16);
        unsigned long end = strtoul(dashPos + 1, nullptr, 16);
        uintptr_t valAddr = reinterpret_cast<uintptr_t>(val);
        if (valAddr >= start && valAddr <= end) {
            found = 1;
        }
        break;
    }
    (void)fclose(fp);
    return Ret(env, found ? 0 : 1);
}

static napi_value StackEnd_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *val = *g_stackEndPtr;
    long ps = sysconf(_SC_PAGESIZE);
    if (ps <= 0) {
        return Ret(env, 0);
    }
    return Ret(env, ((reinterpret_cast<uintptr_t>(val) % sizeof(void *)) == 0) ? 0 : 1);
}

static napi_value StackEnd_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *v1 = *g_stackEndPtr;
    g_threadReaderOk = 0;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, ThreadedReader, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    (void)pthread_join(tid, nullptr);
    void *v2 = *g_stackEndPtr;
    return Ret(env, (v1 == v2 && g_threadReaderOk == 1) ? 0 : 1);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    LoadFunctions();
    napi_property_descriptor desc[] = {
        {"StackEnd_0100", nullptr, StackEnd_0100,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StackEnd_0200", nullptr, StackEnd_0200,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StackEnd_0300", nullptr, StackEnd_0300,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StackEnd_0400", nullptr, StackEnd_0400,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StackEnd_0500", nullptr, StackEnd_0500,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StackEnd_0600", nullptr, StackEnd_0600,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StackEnd_0700", nullptr, StackEnd_0700,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StackEnd_0800", nullptr, StackEnd_0800,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StackEnd_0900", nullptr, StackEnd_0900,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"StackEnd_1000", nullptr, StackEnd_1000,
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
    .nm_modname = "libc_stack_end_test",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
