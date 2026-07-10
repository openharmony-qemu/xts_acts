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
    return LibcFunctionLoader::GetInstance().GetIsinf() == nullptr;
}

// ==================== Normal Parameter Tests ====================

// Test 1: Positive infinity identification
static napi_value IsinfNormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    if (func(INFINITY) != 1) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// Test 2: Negative infinity identification
static napi_value IsinfNormal002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    if (func(-INFINITY) != -1) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// Test 3: NaN identification (should return 0)
static napi_value IsinfNormal003(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    if (func(NAN) != 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// Test 4: Finite value identification (should return 0)
static napi_value IsinfNormal004(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    double finitetest = 3.14;
    double largefinite = 100.0;
    if (func(0.0) != 0) {
        allPassed = false;
    }
    if (func(finitetest) != 0) {
        allPassed = false;
    }
    if (func(-finitetest) != 0) {
        allPassed = false;
    }
    if (func(largefinite) != 0) {
        allPassed = false;
    }
    if (func(-largefinite) != 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Boundary Value Tests ====================

// Test 5: Max/min finite values
static napi_value IsinfBoundary001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    if (func(DBL_MAX) != 0) {
        allPassed = false;
    }
    if (func(DBL_MIN) != 0) {
        allPassed = false;
    }
    if (func(-DBL_MAX) != 0) {
        allPassed = false;
    }
    if (func(-DBL_MIN) != 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 6: Value near infinity
static napi_value IsinfBoundary002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    double nearInf = 1.7976931348623157e+308;
    if (func(nearInf) != 0) {
        allPassed = false;
    }
    if (func(-nearInf) != 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Abnormal Parameter Tests ====================

// Test 7: Various NaN representations
static napi_value IsinfAbnormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    if (func(NAN) != 0) {
        allPassed = false;
    }

    union { double f; uint64_t i; } nan1 = { .i = 0x7FF8000000000001ULL };
    union { double f; uint64_t i; } nan2 = { .i = 0x7FF8000000000002ULL };
    if (func(nan1.f) != 0) {
        allPassed = false;
    }
    if (func(nan2.f) != 0) {
        allPassed = false;
    }

    union { double f; uint64_t i; } snan = { .i = 0x7FF4000000000000ULL };
    if (func(snan.f) != 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 8: Sign bit does not affect identification
static napi_value IsinfAbnormal002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    // Positive and negative infinity should return different signs
    if (func(INFINITY) != 1) {
        allPassed = false;
    }
    if (func(-INFINITY) != -1) {
        allPassed = false;
    }

    // But sign does not affect finite values
    if (func(0.0) != 0) {
        allPassed = false;
    }
    if (func(-0.0) != 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Stability Tests ====================

// Test 9: Repeated calls consistency
static napi_value IsinfStable001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    double testVals[] = {0.0, 3.14, INFINITY, -INFINITY, NAN};
    int resultscount = 5;
    int results[resultscount];

    for (int i = 0; i < resultscount; ++i) {
        results[i] = func(testVals[i]);
    }

    int roundcount = 20;
    for (int round = 0; round < roundcount; ++round) {
        for (int i = 0; i < resultscount; ++i) {
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

// Test 10: Massive calls
static napi_value IsinfStable002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    int loopcount = 20;
    bool allPassed = true;
    for (int i = 0; i < loopcount; ++i) {
        double val = (i % 100) / 10.0 - 5.0;
        int expected = 0;
        int actual = func(val);
        if (actual != expected) {
            allPassed = false;
            break;
        }
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Multi-thread Tests ====================

// Test 11: Multi-thread concurrent calls
static napi_value IsinfThread001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    const int threadCount = 3;
    const int iterationsPerThread = 10;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};
    double testVals[] = {0.0, 3.14, INFINITY, -INFINITY, NAN};
    int expected[] = {0, 0, 1, -1, 0};

    for (int t = 0; t < threadCount; ++t) {
        threads.emplace_back([func, &hasError, testVals, expected, iterationsPerThread]() {
            for (int i = 0; i < iterationsPerThread; ++i) {
                int idx = i % 5;
                if (func(testVals[idx]) != expected[idx]) {
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

template<typename Func>
static void IsinfThreadWorker(Func func, std::atomic<bool>& hasError, int rounds)
{
    for (int round = 0; round < rounds; ++round) {
        if (func(INFINITY) != 1) {
            hasError = true;
            return;
        }
        if (func(-INFINITY) != -1) {
            hasError = true;
            return;
        }
        if (func(NAN) != 0) {
            hasError = true;
            return;
        }
        if (func(0.0) != 0) {
            hasError = true;
            return;
        }
    }
}

// Test 12: Multi-thread different parameters mixed
static napi_value IsinfThread002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetIsinf();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    const int threadCount = 3;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};

    int roundcount2 = 10;
    for (int t = 0; t < threadCount; ++t) {
        threads.emplace_back([func, &hasError, roundcount2]() {
            IsinfThreadWorker(func, hasError, roundcount2);
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
        // Normal parameters
        {"isinfNormal001", nullptr, IsinfNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isinfNormal002", nullptr, IsinfNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isinfNormal003", nullptr, IsinfNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isinfNormal004", nullptr, IsinfNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Boundary values
        {"isinfBoundary001", nullptr, IsinfBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isinfBoundary002", nullptr, IsinfBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Abnormal parameters
        {"isinfAbnormal001", nullptr, IsinfAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isinfAbnormal002", nullptr, IsinfAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Stability
        {"isinfStable001", nullptr, IsinfStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isinfStable002", nullptr, IsinfStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Multi-thread
        {"isinfThread001", nullptr, IsinfThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isinfThread002", nullptr, IsinfThread002, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "isinftest",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
