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
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

using std::atomic_int;

static void **g_stack_end_ptr = nullptr;
static atomic_int g_threadReaderOk;

static napi_value Ret(napi_env env, int32_t val)
{
    napi_value r = nullptr;
    napi_create_int32(env, val, &r);
    return r;
}

static void LoadFunctions()
{
    g_stack_end_ptr = (void **)dlsym(RTLD_DEFAULT, "__libc_stack_end");
}

static bool IsSymbolReady()
{
    return g_stack_end_ptr != nullptr;
}

static void *ConcurrentReader(void *arg)
{
    (void)arg;
    if (g_stack_end_ptr) {
        (void)(*g_stack_end_ptr);
    }
    return nullptr;
}

static void *ThreadedReader(void *arg)
{
    (void)arg;
    if (g_stack_end_ptr) {
        void *val = *g_stack_end_ptr;
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
    void *val = *g_stack_end_ptr;
    return Ret(env, (val != nullptr) ? 0 : 1);
}

static napi_value StackEnd_0200(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *val = *g_stack_end_ptr;
    int local;
    void *localAddr = (void *)&local;
    return Ret(env, ((uintptr_t)val >= (uintptr_t)localAddr) ? 0 : 1);
}

static napi_value StackEnd_0300(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *v1 = *g_stack_end_ptr;
    usleep(0);
    void *v2 = *g_stack_end_ptr;
    return Ret(env, (v1 == v2) ? 0 : 1);
}

static napi_value StackEnd_0400(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *val = *g_stack_end_ptr;
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
    void *val = *g_stack_end_ptr;
    void **typedPtr = g_stack_end_ptr;
    (void)val;
    (void)typedPtr;
    return Ret(env, (sizeof(*typedPtr) == sizeof(void *)) ? 0 : 1);
}

static napi_value StackEnd_0700(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    pthread_t tids[4];
    for (int i = 0; i < 4; i++) {
        int ret = pthread_create(&tids[i], nullptr, ConcurrentReader, nullptr);
        if (ret != 0) {
            return Ret(env, 1);
        }
    }
    for (int i = 0; i < 4; i++) {
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
    void *val = *g_stack_end_ptr;
    FILE *fp = fopen("/proc/self/maps", "r");
    if (!fp) {
        return Ret(env, 0);
    }
    char line[512];
    int found = 0;
    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, "[stack]")) {
            unsigned long start, end;
            if (sscanf(line, "%lx-%lx", &start, &end) == 2) {
                if ((uintptr_t)val >= start && (uintptr_t)val <= end) {
                    found = 1;
                }
            }
            break;
        }
    }
    fclose(fp);
    return Ret(env, found ? 0 : 1);
}

static napi_value StackEnd_0900(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *val = *g_stack_end_ptr;
    long ps = sysconf(_SC_PAGESIZE);
    if (ps <= 0) {
        return Ret(env, 0);
    }
    return Ret(env, (((uintptr_t)val % 16) == 0) ? 0 : 1);
}

static napi_value StackEnd_1000(napi_env env, napi_callback_info info)
{
    (void)info;
    if (!IsSymbolReady()) {
        return Ret(env, 0);
    }
    void *v1 = *g_stack_end_ptr;
    g_threadReaderOk = 0;
    pthread_t tid;
    int ret = pthread_create(&tid, nullptr, ThreadedReader, nullptr);
    if (ret != 0) {
        return Ret(env, 1);
    }
    (void)pthread_join(tid, nullptr);
    void *v2 = *g_stack_end_ptr;
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
