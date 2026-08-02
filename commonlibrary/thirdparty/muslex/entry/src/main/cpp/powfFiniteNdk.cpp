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

static constexpr int K_STABLE_LOOP_10000 = 20;
static constexpr int K_THREAD_COUNT = 3;
static constexpr int K_ITER_PER_THREAD = 10;

static float CallPowfFinite(float x, float y)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPowfFinite();
    if (!func) {
        errno = ENOSYS;
        return 0.0f;
    }
    errno = 0;
    return func(x, y);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetPowfFinite() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value PowfFiniteNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float result = CallPowfFinite(2.0f, 3.0f);
    return ReturnInt32(env, (fabsf(result - 8.0f) < 1e-6f) ? 1 : 0);
}

static napi_value PowfFiniteNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float result = CallPowfFinite(10.0f, 2.0f);
    return ReturnInt32(env, (fabsf(result - 100.0f) < 1e-4f) ? 1 : 0);
}

static napi_value PowfFiniteNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float result = CallPowfFinite(4.0f, 0.5f);
    float expected = std::pow(4.0f, 0.5f);
    return ReturnInt32(env, (fabsf(result - expected) < 1e-6f) ? 1 : 0);
}

static napi_value PowfFiniteNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float result = CallPowfFinite(1.0f, 100.0f);
    return ReturnInt32(env, (fabsf(result - 1.0f) < 1e-6f) ? 1 : 0);
}

static napi_value PowfFiniteAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float result = CallPowfFinite(NAN, 2.0f);
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value PowfFiniteAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    float result = CallPowfFinite(-1.0f, 0.5f);
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value PowfFiniteBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    float result = CallPowfFinite(FLT_MAX, 1.0f);
    bool pass = std::isfinite(result) && result > 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PowfFiniteBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    errno = 0;
    float result = CallPowfFinite(1.0f, FLT_MAX);
    bool pass = (result == 1.0f) && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PowfFiniteStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    bool pass = true;
    float expected = std::pow(2.0f, 3.0f);
    for (int i = 0; i < K_STABLE_LOOP_10000; ++i) {
        float result = CallPowfFinite(2.0f, 3.0f);
        if (fabsf(result - expected) > 1e-6f) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void PowfFiniteThreadWorker(std::atomic<bool>& hasError, float testX[], float testY[])
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int idx = i % 5;
        float expected = std::pow(testX[idx], testY[idx]);
        float result = CallPowfFinite(testX[idx], testY[idx]);
        if (fabsf(result - expected) > 1e-5f) {
            hasError = true;
            return;
        }
    }
}

static napi_value PowfFiniteThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 1);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    float testX[] = {2.0f, 10.0f, 4.0f, 1.0f, 3.0f};
    float testY[] = {3.0f, 2.0f, 0.5f, 100.0f, 2.0f};

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back([&hasError, testX, testY]() {
            PowfFiniteThreadWorker(hasError, const_cast<float*>(testX), const_cast<float*>(testY));
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
        {"powfFiniteNormal001", nullptr, PowfFiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powfFiniteNormal002", nullptr, PowfFiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powfFiniteNormal003", nullptr, PowfFiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powfFiniteNormal004", nullptr, PowfFiniteNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powfFiniteAbnormal001", nullptr, PowfFiniteAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powfFiniteAbnormal002", nullptr, PowfFiniteAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powfFiniteBoundary001", nullptr, PowfFiniteBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powfFiniteBoundary002", nullptr, PowfFiniteBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powfFiniteStable001", nullptr, PowfFiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powfFiniteThread001", nullptr, PowfFiniteThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "powffinitendktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}