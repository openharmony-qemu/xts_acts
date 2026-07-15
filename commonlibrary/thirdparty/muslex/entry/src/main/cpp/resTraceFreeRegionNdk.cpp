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

typedef void (*ResTraceFreeRegionFunc)(unsigned long long, void*, size_t);

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr size_t K_ALLOC_100 = 100;
static constexpr size_t K_ALLOC_200 = 200;
static constexpr size_t K_CHUNK_1M = 1024 * 1024;

static ResTraceFreeRegionFunc GetResTraceFreeRegionFunc()
{
    static ResTraceFreeRegionFunc cachedFunc = [] {
        dlerror();
        return reinterpret_cast<ResTraceFreeRegionFunc>(dlsym(RTLD_DEFAULT, "resTraceFreeRegion"));
    }();
    return cachedFunc;
}

static bool CallResTraceFreeRegion(unsigned long long mask, void* addr, size_t size)
{
    auto func = GetResTraceFreeRegionFunc();
    if (!func) {
        errno = ENOSYS;
        return false;
    }
    errno = 0;
    func(mask, addr, size);
    return true;
}

static bool IsStubMode()
{
    return (GetResTraceFreeRegionFunc() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value ResTraceFreeRegionNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceFreeRegion(1, addr, K_ALLOC_100);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceFreeRegionNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceFreeRegion(0, addr, K_ALLOC_100);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceFreeRegionNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_200);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceFreeRegion(3, addr, K_ALLOC_200);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceFreeRegionNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value ResTraceFreeRegionAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    CallResTraceFreeRegion(1, nullptr, K_ALLOC_100);
    return ReturnInt32(env, 1);
}

static napi_value ResTraceFreeRegionAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    CallResTraceFreeRegion(1, addr, 0);
    free(addr);
    return ReturnInt32(env, 1);
}

static napi_value ResTraceFreeRegionBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_CHUNK_1M);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceFreeRegion(1, addr, K_CHUNK_1M);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceFreeRegionBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    void* addr = malloc(K_ALLOC_100);
    if (!addr) {
        return ReturnInt32(env, 0);
    }
    bool ret = CallResTraceFreeRegion(UINT64_MAX, addr, K_ALLOC_100);
    free(addr);
    return ReturnInt32(env, ret ? 1 : 0);
}

static napi_value ResTraceFreeRegionStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        void* addr = malloc(K_ALLOC_100);
        if (!addr) {
            pass = false;
            break;
        }
        bool ret = CallResTraceFreeRegion(1, addr, K_ALLOC_100);
        free(addr);
        if (!ret) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void ResTraceFreeRegionWorker(std::atomic<bool>& hasError)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        void* addr = malloc(K_ALLOC_100);
        if (!addr) {
            hasError = true;
            return;
        }
        CallResTraceFreeRegion(1, addr, K_ALLOC_100);
        free(addr);
    }
}

static napi_value ResTraceFreeRegionThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(ResTraceFreeRegionWorker, std::ref(hasError));
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
        {"resTraceFreeRegionNormal001", nullptr, ResTraceFreeRegionNormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"resTraceFreeRegionNormal002", nullptr, ResTraceFreeRegionNormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"resTraceFreeRegionNormal003", nullptr, ResTraceFreeRegionNormal003, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"resTraceFreeRegionNormal004", nullptr, ResTraceFreeRegionNormal004, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"resTraceFreeRegionAbnormal001", nullptr, ResTraceFreeRegionAbnormal001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"resTraceFreeRegionAbnormal002", nullptr, ResTraceFreeRegionAbnormal002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"resTraceFreeRegionBoundary001", nullptr, ResTraceFreeRegionBoundary001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"resTraceFreeRegionBoundary002", nullptr, ResTraceFreeRegionBoundary002, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"resTraceFreeRegionStable001", nullptr, ResTraceFreeRegionStable001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
        {"resTraceFreeRegionThread001", nullptr, ResTraceFreeRegionThread001, nullptr, nullptr, nullptr,
            napi_default, nullptr},
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
    .nm_modname = "restracefreeregionndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}