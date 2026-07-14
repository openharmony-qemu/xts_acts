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

static constexpr int kStableLoop10000 = 20;
static constexpr int kThreadCount = 3;
static constexpr int kIterPerThread = 10;

static double CallLog2Finite(double x)
{
    auto& loader = LibcFunctionLoader::GetInstance();
    auto func = loader.GetLog2Finite();
    if (!func) {
        errno = ENOSYS;
        return 0.0;
    }
    errno = 0;
    return func(x);
}

static bool IsStubMode()
{
    auto& loader = LibcFunctionLoader::GetInstance();
    return (loader.GetLog2Finite() == nullptr);
}

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static napi_value Log2FiniteNormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog2Finite(1.0);
    return ReturnInt32(env, (result == 0.0) ? 1 : 0);
}

static napi_value Log2FiniteNormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog2Finite(2.0);
    double expected = std::log2(2.0);
    return ReturnInt32(env, (fabs(result - expected) < 1e-12) ? 1 : 0);
}

static napi_value Log2FiniteNormal003(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog2Finite(4.0);
    double expected = std::log2(4.0);
    return ReturnInt32(env, (fabs(result - expected) < 1e-12) ? 1 : 0);
}

static napi_value Log2FiniteNormal004(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog2Finite(8.0);
    double expected = std::log2(8.0);
    return ReturnInt32(env, (fabs(result - expected) < 1e-12) ? 1 : 0);
}

static napi_value Log2FiniteAbnormal001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog2Finite(NAN);
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value Log2FiniteAbnormal002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    double result = CallLog2Finite(-1.0);
    return ReturnInt32(env, std::isnan(result) ? 1 : 0);
}

static napi_value Log2FiniteBoundary001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallLog2Finite(DBL_MIN);
    bool pass = std::isfinite(result) && result < 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value Log2FiniteBoundary002(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    errno = 0;
    double result = CallLog2Finite(DBL_MAX);
    bool pass = std::isfinite(result) && result > 0 && errno == 0;
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value Log2FiniteStable001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    bool pass = true;
    double expected = std::log2(2.0);
    for (int i = 0; i < kStableLoop10000; ++i) {
        double result = CallLog2Finite(2.0);
        if (fabs(result - expected) > 1e-12) {
            pass = false;
            break;
        }
    }
    return ReturnInt32(env, pass ? 1 : 0);
}

static napi_value Log2FiniteThread001(napi_env env, napi_callback_info info)
{
    if (IsStubMode()) {
        return ReturnInt32(env, 0);
    }
    std::atomic<bool> hasError{false};
    std::vector<std::thread> threads;
    double testVals[] = {1.0, 2.0, 4.0, 8.0, 0.5};

    for (int t = 0; t < kThreadCount; ++t) {
        threads.emplace_back([&hasError, testVals]() {
            for (int i = 0; i < kIterPerThread; ++i) {
                int idx = i % 5;
                double expected = std::log2(testVals[idx]);
                double result = CallLog2Finite(testVals[idx]);
                if (fabs(result - expected) > 1e-12) {
                    hasError = true;
                    return;
                }
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
        {"log2FiniteNormal001", nullptr, Log2FiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2FiniteNormal002", nullptr, Log2FiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2FiniteNormal003", nullptr, Log2FiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2FiniteNormal004", nullptr, Log2FiniteNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2FiniteAbnormal001", nullptr, Log2FiniteAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2FiniteAbnormal002", nullptr, Log2FiniteAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2FiniteBoundary001", nullptr, Log2FiniteBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2FiniteBoundary002", nullptr, Log2FiniteBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2FiniteStable001", nullptr, Log2FiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"log2FiniteThread001", nullptr, Log2FiniteThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "log2finitendktest",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
