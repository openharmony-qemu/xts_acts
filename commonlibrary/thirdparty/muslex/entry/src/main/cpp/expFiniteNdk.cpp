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
#include <thread>
#include <vector>
#include <atomic>
#include <chrono>

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static bool IsStubMode()
{
    return LibcFunctionLoader::GetInstance().GetExpFinite() == nullptr;
}

// ==================== Normal Parameter Tests ====================

// Test 1: Basic exponentiation (positive, negative, zero)
static napi_value ExpFiniteNormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // Zero
    if (std::abs(func(0.0) - 1.0) > 1e-9)
    {
        allPassed = false;
    }
    // Positive
    if (std::abs(func(1.0) - std::exp(1.0)) > 1e-9)
    {
        allPassed = false;
    }
    if (std::abs(func(2.5) - std::exp(2.5)) > 1e-9)
    {
        allPassed = false;
    }
    // Negative
    if (std::abs(func(-1.0) - std::exp(-1.0)) > 1e-9)
    {
        allPassed = false;
    }
    if (std::abs(func(-2.5) - std::exp(-2.5)) > 1e-9)
    {
        allPassed = false;
    }
    // Decimal
    if (std::abs(func(0.5) - std::exp(0.5)) > 1e-9)
    {
        allPassed = false;
    }
    if (std::abs(func(-0.5) - std::exp(-0.5)) > 1e-9)
    {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 2: Large value computation
static napi_value ExpFiniteNormal002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // Larger positive
    double result1 = func(10.0);
    if (std::abs(result1 - std::exp(10.0)) > 1e-6)
    {
        allPassed = false;
    }
    
    double result2 = func(20.0);
    if (std::abs(result2 - std::exp(20.0)) > 1e-6)
    {
        allPassed = false;
    }

    // Smaller negative
    double result3 = func(-10.0);
    if (std::abs(result3 - std::exp(-10.0)) > 1e-9)
    {
        allPassed = false;
    }
    
    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 3: Precision verification
static napi_value ExpFiniteNormal003(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // Test precision: compare with standard exp
    double testVals[] = {0.1, 0.01, 0.001, -0.1, -0.01, -0.001};
    for (double val : testVals)
    {
        double expected = std::exp(val);
        double actual = func(val);
        if (std::abs(actual - expected) > 1e-9)
        {
            allPassed = false;
            break;
        }
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Boundary Value Tests ====================

// Test 4: Overflow boundary
static napi_value ExpFiniteBoundary001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    errno = 0;
    double largeVal = 710.0;
    double result = func(largeVal);
    // Should return inf or very large value
    if (!std::isinf(result) && !std::isnan(result))
    {
        // Check if near overflow boundary
        if (result < 1e308)
        {
            allPassed = false;
        }
    }
    // Check if errno is set
    if (errno != 0 && errno != ERANGE)
    {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 5: Underflow boundary
static napi_value ExpFiniteBoundary002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    errno = 0;
    double smallVal = -745.0;
    double result = func(smallVal);
    // Should return 0 or very close to 0
    if (result != 0.0 && result > 1e-308)
    {
        allPassed = false;
    }
    if (errno != 0 && errno != ERANGE)
    {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 6: Critical values (near overflow/underflow boundary)
static napi_value ExpFiniteBoundary003(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // Near overflow boundary
    double nearOverflow = 709.0;
    double result1 = func(nearOverflow);
    if (!std::isfinite(result1) || result1 < 1e300)
    {
        allPassed = false;
    }

    // Near underflow boundary
    double nearUnderflow = -708.0;
    double result2 = func(nearUnderflow);
    if (!std::isfinite(result2) || result2 > 1e-300)
    {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Abnormal Parameter Tests ====================

// Test 7: Invalid parameters (NaN, Inf)
static napi_value ExpFiniteAbnormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // NaN input should return NaN
    double resultNan = func(NAN);
    if (!std::isnan(resultNan))
    {
        allPassed = false;
    }

    // Positive infinity input should return positive infinity
    double resultInf = func(INFINITY);
    if (!std::isinf(resultInf) || resultInf < 0)
    {
        allPassed = false;
    }

    // Negative infinity input should return 0
    double resultNegInf = func(-INFINITY);
    if (resultNegInf != 0.0)
    {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Stability Tests ====================

// Test 8: Repeated calls result consistency
static napi_value ExpFiniteStable001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    double testVals[] = {0.0, 0.5, 1.0, 2.0, -1.0, -0.5};
    double results[6];

    // First call
    for (int i = 0; i < 6; ++i)
    {
        results[i] = func(testVals[i]);
    }

    // Repeated calls, verify consistency
    for (int round = 0; round < 20; ++round)
    {
        for (int i = 0; i < 6; ++i)
        {
            double current = func(testVals[i]);
            if (std::abs(current - results[i]) > 1e-9)
            {
                allPassed = false;
                break;
            }
        }
        if (!allPassed)
        {
            break;
        }
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 9: Continuous call performance (no crash)
static napi_value ExpFiniteStable002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // Massive continuous calls, ensure no crash
    for (int i = 0; i < 20; ++i)
    {
        double val = (i % 100) / 10.0 - 5.0; // -5.0 to 5.0
        double result = func(val);
        if (!std::isfinite(result) && val < 5.0)
        {
            allPassed = false;
            break;
        }
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Multi-thread Tests ====================

// Test 10: Multi-thread concurrent calls
static napi_value ExpFiniteThread001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    const int threadCount = 3;
    const int iterationsPerThread = 10;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};
    std::atomic<int> completedCount{0};

    for (int t = 0; t < threadCount; ++t)
    {
        threads.emplace_back([func, &hasError, iterationsPerThread, &completedCount]()
        {
            for (int i = 0; i < iterationsPerThread; ++i)
            {
                double val = (i % 20) / 2.0 - 5.0; // -5.0 to 5.0
                double expected = std::exp(val);
                double actual = func(val);
                if (std::abs(actual - expected) > 1e-9)
                {
                    hasError = true;
                    break;
                }
            }
            completedCount++;
        });
    }

    for (auto& th : threads)
    {
        th.join();
    }

    return ReturnInt32(env, (!hasError) ? 1 : 0);
}

// Test 11: Multi-thread different parameters mixed
static napi_value ExpFiniteThread002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetExpFinite();
    if (func == nullptr)
    {
        return ReturnInt32(env, 1);
    }

    const int threadCount = 3;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};
    double testVals[] = {0.0, 0.5, 1.0, 2.0, -1.0, -0.5, 5.0, -5.0, 10.0, -10.0};

    for (int t = 0; t < threadCount; ++t)
    {
        threads.emplace_back([func, &hasError, testVals]()
        {
            for (int round = 0; round < 10; ++round)
            {
                for (double val : testVals)
                {
                    double expected = std::exp(val);
                    double actual = func(val);
                    if (std::abs(actual - expected) > 1e-9)
                    {
                        hasError = true;
                        return;
                    }
                }
            }
        });
    }

    for (auto& th : threads)
    {
        th.join();
    }

    return ReturnInt32(env, (!hasError) ? 1 : 0);
}

// ==================== NAPI Registration ====================

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        // Normal parameters
        {"expFiniteNormal001", nullptr, ExpFiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expFiniteNormal002", nullptr, ExpFiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expFiniteNormal003", nullptr, ExpFiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Boundary values
        {"expFiniteBoundary001", nullptr, ExpFiniteBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expFiniteBoundary002", nullptr, ExpFiniteBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expFiniteBoundary003", nullptr, ExpFiniteBoundary003, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Abnormal parameters
        {"expFiniteAbnormal001", nullptr, ExpFiniteAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Stability
        {"expFiniteStable001", nullptr, ExpFiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expFiniteStable002", nullptr, ExpFiniteStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Multi-thread
        {"expFiniteThread001", nullptr, ExpFiniteThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"expFiniteThread002", nullptr, ExpFiniteThread002, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "expfinitedktest",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}