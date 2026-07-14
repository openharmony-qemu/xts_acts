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
#include <cmath>
#include <cerrno>
#include <cfloat>
#include <cfenv>
#include <thread>
#include <vector>
#include <atomic>
#include <functional>

static constexpr int K_STABLE_LOOP10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static float CallLog2fFinite(float x)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetLog2fFinite();
    if (!func) {
        errno = ENOSYS;
        return 0.0f;
    }
    errno = 0;
    return func(x);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetLog2fFinite() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Log2fFiniteNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    float result = CallLog2fFinite(1.0f);
    return ReturnInt32(env, (result == 0.0f) ? 1 : 0);
}

static napi_value Log2fFiniteNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    float result = CallLog2fFinite(2.0f);
    float expected = std::log2(2.0f);
    return ReturnInt32(env, (fabsf(result - expected) < 1e-6f) ? 1 : 0);
}

static napi_value Log2fFiniteNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    float result = CallLog2fFinite(4.0f);
    float expected = std::log2(4.0f);
    return ReturnInt32(env, (fabsf(result - expected) < 1e-6f) ? 1 : 0);
}

static napi_value Log2fFiniteNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    float result = CallLog2fFinite(8.0f);
    float expected = std::log2(8.0f);
    return ReturnInt32(env, (fabsf(result - expected) < 1e-6f) ? 1 : 0);
}

static napi_value Log2fFiniteAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    float result = CallLog2fFinite(NAN);
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value Log2fFiniteAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    float result = CallLog2fFinite(-1.0f);
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value Log2fFiniteBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    float result = CallLog2fFinite(FLT_MIN);
    bool pass = std::isfinite(result) && result < 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value Log2fFiniteBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    float result = CallLog2fFinite(FLT_MAX);
    bool pass = std::isfinite(result) && result > 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value Log2fFiniteStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    float expected = std::log2(2.0f);
    for (int i = 0; i < K_STABLE_LOOP10000; ++i) {
        float result = CallLog2fFinite(2.0f);
        if (fabsf(result - expected) > 1e-6f) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void Log2fThreadWorker(std::atomic<bool>& hasError, const float* testVals)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int idx = i % 5;
        float expected = std::log2(testVals[idx]);
        float result = CallLog2fFinite(testVals[idx]);
        if (fabsf(result - expected) > 1e-6f) {
            hasError = true;
            return;
        }
    }
}

static napi_value Log2fFiniteThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    float testVals[] = {1.0f, 2.0f, 4.0f, 8.0f, 0.5f};

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(Log2fThreadWorker, std::ref(hasError), testVals);
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
        {"log2fFiniteNormal001", nullptr, Log2fFiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2fFiniteNormal002", nullptr, Log2fFiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2fFiniteNormal003", nullptr, Log2fFiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2fFiniteNormal004", nullptr, Log2fFiniteNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2fFiniteAbnormal001", nullptr, Log2fFiniteAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2fFiniteAbnormal002", nullptr, Log2fFiniteAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2fFiniteBoundary001", nullptr, Log2fFiniteBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2fFiniteBoundary002", nullptr, Log2fFiniteBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2fFiniteStable001", nullptr, Log2fFiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2fFiniteThread001", nullptr, Log2fFiniteThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "ohos_log2ffinitendktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
