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

static double CallPowFinite(double x, double y)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetPowFinite();
    if (!func) {
        errno = ENOSYS;
        return 0.0;
    }
    errno = 0;
    return func(x, y);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetPowFinite() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value PowFiniteNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallPowFinite(2.0, 3.0);
    double expected = 8.0;
    return ReturnInt32(env, (fabs(result - expected) < 1e-12) ? 1 : 0);
}

static napi_value PowFiniteNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallPowFinite(10.0, 2.0);
    return ReturnInt32(env, (fabs(result - 100.0) < 1e-12) ? 1 : 0);
}

static napi_value PowFiniteNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallPowFinite(4.0, 0.5);
    double expected = std::pow(4.0, 0.5);
    return ReturnInt32(env, (fabs(result - expected) < 1e-12) ? 1 : 0);
}

static napi_value PowFiniteNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallPowFinite(1.0, 100.0);
    return ReturnInt32(env, (fabs(result - 1.0) < 1e-12) ? 1 : 0);
}

static napi_value PowFiniteAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallPowFinite(NAN, 2.0);
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value PowFiniteAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallPowFinite(-1.0, 0.5);
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value PowFiniteBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallPowFinite(DBL_MAX, 1.0);
    bool pass = std::isfinite(result) && result > 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PowFiniteBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallPowFinite(1.0, DBL_MAX);
    bool pass = (result == 1.0) && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value PowFiniteStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    double expected = std::pow(2.0, 3.0);
    for (int i = 0; i < K_STABLE_LOOP10000; ++i) {
        double result = CallPowFinite(2.0, 3.0);
        if (fabs(result - expected) > 1e-12) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static void PowThreadWorker(std::atomic<bool>& hasError, const double* testX, const double* testY)
{
    for (int i = 0; i < K_ITER_PER_THREAD; ++i) {
        int idx = i % 5;
        double expected = std::pow(testX[idx], testY[idx]);
        double result = CallPowFinite(testX[idx], testY[idx]);
        if (fabs(result - expected) > 1e-12) {
            hasError = true;
            return;
        }
    }
}

static napi_value PowFiniteThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    double testX[] = {2.0, 10.0, 4.0, 1.0, 3.0};
    double testY[] = {3.0, 2.0, 0.5, 100.0, 2.0};

    for (int t = 0; t < K_THREAD_COUNT; ++t) {
        threads.emplace_back(PowThreadWorker, std::ref(hasError), testX, testY);
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
        {"powFiniteNormal001", nullptr, PowFiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powFiniteNormal002", nullptr, PowFiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powFiniteNormal003", nullptr, PowFiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powFiniteNormal004", nullptr, PowFiniteNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powFiniteAbnormal001", nullptr, PowFiniteAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powFiniteAbnormal002", nullptr, PowFiniteAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powFiniteBoundary001", nullptr, PowFiniteBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powFiniteBoundary002", nullptr, PowFiniteBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powFiniteStable001", nullptr, PowFiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"powFiniteThread001", nullptr, PowFiniteThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "powfinitendktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
