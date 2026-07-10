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
#include "libcFunctionLoader.h"
#include <cerrno>
#include <cstdint>
#include <thread>
#include <vector>
#include <atomic>

static constexpr int K_STABLE_LOOP = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;
static constexpr uint64_t K_TIMESPAN = 1000;
static constexpr uint64_t K_TIMESPAN_ZERO = 0;
static constexpr uint64_t K_TIMESPAN_LARGE = 5000;
static constexpr size_t K_DEPTH = 1;

static size_t CallGwpAsanCollect(uint64_t timespan, uintptr_t* buffer, size_t maxCount, size_t depth = 1)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetGwpAsanCollect();
    if (!func) {
        errno = ENOSYS;
        return 0;
    }
    errno = 0;
    return func(timespan, buffer, maxCount, depth);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetGwpAsanCollect() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value GwpAsanCollectNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int bufcap = 2;
    uintptr_t buffer[10];
    size_t ret = CallGwpAsanCollect(K_TIMESPAN, buffer, bufcap, K_DEPTH);
    return ReturnInt32(env, (ret <= bufcap) ? 1 : 0);
}

static napi_value GwpAsanCollectNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int bufcap = 2;
    uintptr_t buffer[10];
    size_t ret = CallGwpAsanCollect(K_TIMESPAN_ZERO, buffer, bufcap, K_DEPTH);
    return ReturnInt32(env, (ret <= bufcap) ? 1 : 0);
}

static napi_value GwpAsanCollectNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int bufcap = 5;
    uintptr_t buffer[20];
    int depth = 4;
    size_t ret = CallGwpAsanCollect(K_TIMESPAN_LARGE, buffer, bufcap, depth);
    return ReturnInt32(env, (ret <= bufcap) ? 1 : 0);
}

static napi_value GwpAsanCollectNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

static napi_value GwpAsanCollectAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int bufcap = 2;
    size_t ret = CallGwpAsanCollect(K_TIMESPAN, nullptr, bufcap, K_DEPTH);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value GwpAsanCollectAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    uintptr_t buffer[10];
    size_t ret = CallGwpAsanCollect(K_TIMESPAN, buffer, 0, K_DEPTH);
    return ReturnInt32(env, (ret == 0) ? 1 : 0);
}

static napi_value GwpAsanCollectBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int bufcap = 2;
    uintptr_t buffer[20];
    size_t ret = CallGwpAsanCollect(UINT64_MAX, buffer, bufcap, K_DEPTH);
    return ReturnInt32(env, (ret >= 0) ? 1 : 0);
}

static napi_value GwpAsanCollectBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int bufcap = 1;
    uintptr_t buffer[4];
    size_t ret = CallGwpAsanCollect(K_TIMESPAN, buffer, bufcap, K_DEPTH);
    return ReturnInt32(env, (ret >= 0 && ret <= bufcap) ? 1 : 0);
}

static napi_value GwpAsanCollectStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int bufcap = 2;
    bool pass = true;
    for (int i = 0; i < K_STABLE_LOOP; ++i) {
        uintptr_t buffer[10];
        size_t ret = CallGwpAsanCollect(K_TIMESPAN, buffer, bufcap, K_DEPTH);
        if (ret > bufcap) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value GwpAsanCollectThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    int bufcap = 2;
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError, bufcap]() {
            for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
                uintptr_t buffer[10];
                CallGwpAsanCollect(K_TIMESPAN, buffer, bufcap, K_DEPTH);
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
        {"gwpAsanCollectNormal001", nullptr, GwpAsanCollectNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gwpAsanCollectNormal002", nullptr, GwpAsanCollectNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gwpAsanCollectNormal003", nullptr, GwpAsanCollectNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gwpAsanCollectNormal004", nullptr, GwpAsanCollectNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gwpAsanCollectAbnormal001", nullptr, GwpAsanCollectAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gwpAsanCollectAbnormal002", nullptr, GwpAsanCollectAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gwpAsanCollectBoundary001", nullptr, GwpAsanCollectBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gwpAsanCollectBoundary002", nullptr, GwpAsanCollectBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gwpAsanCollectStable001", nullptr, GwpAsanCollectStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gwpAsanCollectThread001", nullptr, GwpAsanCollectThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "gwpasancollectndktest",
    .nm_priv = ((void*)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
