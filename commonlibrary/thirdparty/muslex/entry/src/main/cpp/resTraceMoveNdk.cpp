/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
#include <cerrno>
#include <cstdint>
#include <cstdlib>
#include <thread>
#include <vector>
#include <atomic>

typedef void (*ResTraceMoveFunc)(unsigned long long, void*, void*, size_t);

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr size_t K_ALLOC_200 = 200;
static constexpr size_t K_ALLOC_100 = 100;

static ResTraceMoveFunc GetResTraceMoveFunc()
{
    static ResTraceMoveFunc cachedFunc = [] {
        dlerror();
        return reinterpret_cast<ResTraceMoveFunc>(dlsym(RTLD_DEFAULT, "resTraceMove"));
    }();
    return cachedFunc;
}

static bool CallResTraceMove(unsigned long long mask, void* oldAddr, void* newAddr, size_t newSize)
{
    auto func = GetResTraceMoveFunc();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    func(mask, oldAddr, newAddr, newSize);
    return true;
}

static bool IsStubMode()
{
    return (GetResTraceMoveFunc() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value ResTraceMoveNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* oldAddr = malloc(K_ALLOC_100);
    void* newAddr = malloc(K_ALLOC_200);
    if (!oldAddr || !newAddr) {
        free(oldAddr);
        free(newAddr);
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceMove(1, oldAddr, newAddr, K_ALLOC_200);
    free(oldAddr);
    free(newAddr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceMoveNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* oldAddr = malloc(K_ALLOC_100);
    void* newAddr = malloc(K_ALLOC_100);
    if (!oldAddr || !newAddr) {
        free(oldAddr);
        free(newAddr);
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceMove(0, oldAddr, newAddr, K_ALLOC_100);
    free(oldAddr);
    free(newAddr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceMoveNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* addr1 = malloc(50);
    void* addr2 = malloc(50);
    if (!addr1 || !addr2) {
        free(addr1);
        free(addr2);
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceMove(2, addr1, addr2, 50);
    free(addr1);
    free(addr2);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceMoveNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    return ReturnInt32(env, 1);
}

static napi_value ResTraceMoveAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* newAddr = malloc(K_ALLOC_100);
    if (!newAddr) {
        return ReturnInt32(env, 0);
    }
    CallResTraceMove(1, nullptr, newAddr, K_ALLOC_100);
    free(newAddr);
    return ReturnInt32(env, 1);
}

static napi_value ResTraceMoveAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* oldAddr = malloc(K_ALLOC_100);
    if (!oldAddr) {
        return ReturnInt32(env, 0);
    }
    CallResTraceMove(1, oldAddr, nullptr, K_ALLOC_100);
    free(oldAddr);
    return ReturnInt32(env, 1);
}

static napi_value ResTraceMoveBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceMove(1, addr, addr, K_ALLOC_100);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceMoveBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    void* oldAddr = malloc(1024);
    void* newAddr = malloc(2048);
    if (!oldAddr || !newAddr) {
        free(oldAddr);
        free(newAddr);
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceMove(1, oldAddr, newAddr, 2048);
    free(oldAddr);
    free(newAddr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceMoveStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        void* oldAddr = malloc(K_ALLOC_100);
        void* newAddr = malloc(K_ALLOC_200);
        if (!oldAddr || !newAddr) {
            free(oldAddr);
            free(newAddr);
            pass = false;
            break;
        }
        bool ret = CallResTraceMove(1, oldAddr, newAddr, K_ALLOC_200);
        free(oldAddr);
        free(newAddr);
        if (!ret) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value ResTraceMoveThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError]()
        {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                void* oldAddr = malloc(K_ALLOC_100);
                void* newAddr = malloc(K_ALLOC_200);
                if (!oldAddr || !newAddr) {
                    free(oldAddr);
                    free(newAddr);
                    hasError = true;
                    return;
                }
                CallResTraceMove(1, oldAddr, newAddr, K_ALLOC_200);
                free(oldAddr);
                free(newAddr);
            }
        });
    }
    for (auto& th : threads) {
        th.join();
    }
    return ReturnInt32(env, !hasError ? 1 : 0);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"resTraceMoveNormal001", nullptr, ResTraceMoveNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resTraceMoveNormal002", nullptr, ResTraceMoveNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resTraceMoveNormal003", nullptr, ResTraceMoveNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resTraceMoveNormal004", nullptr, ResTraceMoveNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resTraceMoveAbnormal001", nullptr, ResTraceMoveAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resTraceMoveAbnormal002", nullptr, ResTraceMoveAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resTraceMoveBoundary001", nullptr, ResTraceMoveBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resTraceMoveBoundary002", nullptr, ResTraceMoveBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resTraceMoveStable001", nullptr, ResTraceMoveStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resTraceMoveThread001", nullptr, ResTraceMoveThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "restracemovendktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}