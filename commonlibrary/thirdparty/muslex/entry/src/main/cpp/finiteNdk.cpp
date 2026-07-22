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
#include <cfloat>
#include <thread>
#include <vector>
#include <atomic>

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

static bool IsStubMode()
{
    return LibcFunctionLoader::GetInstance().GetFinite() == nullptr;
}

static constexpr double SMALL_FINITE = 0.0001;
static constexpr double LARGE_FINITE = 100.0;

// ==================== Normal Parameter Tests ====================

// Test 1: Basic finite value identification
static napi_value FiniteNormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    double testFinite = 3.14;
    // Zero
    if (func(0.0) == 0) {
        allPassed = false;
    }
    // Positive
    if (func(testFinite) == 0) {
        allPassed = false;
    }
    if (func(LARGE_FINITE) == 0) {
        allPassed = false;
    }
    // Negative
    if (func(-testFinite) == 0) {
        allPassed = false;
    }
    if (func(-LARGE_FINITE) == 0) {
        allPassed = false;
    }
    // Decimal
    if (func(SMALL_FINITE) == 0) {
        allPassed = false;
    }
    if (func(-SMALL_FINITE) == 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 2: Non-finite value identification (Inf, -Inf, NaN)
static napi_value FiniteNormal002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // Positive infinity
    if (func(INFINITY) != 0) {
        allPassed = false;
    }
    // Negative infinity
    if (func(-INFINITY) != 0) {
        allPassed = false;
    }
    // NaN
    if (func(NAN) != 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Boundary Value Tests ====================

// Test 3: Max/min value boundaries
static napi_value FiniteBoundary001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // DBL_MAX should be finite
    if (func(DBL_MAX) == 0) {
        allPassed = false;
    }
    // DBL_MIN should be finite
    if (func(DBL_MIN) == 0) {
        allPassed = false;
    }
    // -DBL_MAX should be finite
    if (func(-DBL_MAX) == 0) {
        allPassed = false;
    }
    // -DBL_MIN should be finite
    if (func(-DBL_MIN) == 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 4: Near boundary values
static napi_value FiniteBoundary002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // Finite value near infinity
    double nearInf = 1.7976931348623157e+308; // Near DBL_MAX
    if (func(nearInf) == 0) {
        allPassed = false;
    }
    if (func(-nearInf) == 0) {
        allPassed = false;
    }

    // Minimum value near zero
    double nearZero = 4.9e-324; // DBL_TRUE_MIN
    if (func(nearZero) == 0) {
        allPassed = false;
    }
    if (func(-nearZero) == 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Abnormal Parameter Tests ====================

// Test 5: Various NaN representations
static napi_value FiniteAbnormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    // Standard NaN
    if (func(NAN) != 0) {
        allPassed = false;
    }
    
    // Different byte representations of NaN (generated via bit operations)
    union { double f; uint64_t i; } nan1 = { .i = 0x7FF8000000000001ULL };
    union { double f; uint64_t i; } nan2 = { .i = 0x7FF8000000000002ULL };
    
    if (func(nan1.f) != 0) {
        allPassed = false;
    }
    if (func(nan2.f) != 0) {
        allPassed = false;
    }

    // Signaling NaN
    union { double f; uint64_t i; } snan = { .i = 0x7FF4000000000000ULL };
    if (func(snan.f) != 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Stability Tests ====================

// Test 6: Repeated calls consistency
static napi_value FiniteStable001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    double testVals[] = {0.0, 3.14, -3.14, INFINITY, -INFINITY, NAN};
    int resultCount = 6;
    int results[resultCount];

    for (int i = 0; i < resultCount; ++i) {
        results[i] = func(testVals[i]);
    }

    int roundCount = 20;
    for (int round = 0; round < roundCount; ++round) {
        for (int i = 0; i < resultCount; ++i) {
            if (func(testVals[i]) != results[i]) {
                allPassed = false;
                break;
            }
        }
        if (!allPassed) {
            break;
        }
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Multi-thread Tests ====================

// Test 7: Multi-thread concurrent
static napi_value FiniteThread001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    const int threadCount = 3;
    const int iterationsPerThread = 10;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};
    double testVals[] = {0.0, 3.14, INFINITY, -INFINITY, NAN};

    for (int t = 0; t < threadCount; ++t) {
        threads.emplace_back([func, &hasError, testVals, iterationsPerThread]() {
            for (int i = 0; i < iterationsPerThread; ++i) {
                int idx = i % 5;
                int expected = (idx == 0 || idx == 1) ? 1 : 0;
                int actual = func(testVals[idx]);
                if ((actual != 0 && expected == 0) || (actual == 0 && expected != 0)) {
                    hasError = true;
                    return;
                }
            }
        });
    }

    for (auto& th : threads) {
        th.join();
    }

    return ReturnInt32(env, (!hasError) ? 1 : 0);
}

// ==================== NAPI Registration ====================

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"finiteNormal001", nullptr, FiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finiteNormal002", nullptr, FiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finiteBoundary001", nullptr, FiniteBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finiteBoundary002", nullptr, FiniteBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finiteAbnormal001", nullptr, FiniteAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finiteStable001", nullptr, FiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finiteThread001", nullptr, FiniteThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "finitedktest",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}