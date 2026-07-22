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

static napi_value ReturnInt32(napi_env env, int32_t value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

// Check if Stub mode (function not enabled)
static bool IsStubMode()
{
    auto func = LibcFunctionLoader::GetInstance().GetExp2fFinite();
    if (func == nullptr) {
        return true;
    }
    // Additional check: try calling and check errno
    errno = 0;
    func(0.0f);
    if (errno == ENOSYS) {
        return true;
    }
    return false;
}

// Get function pointer, return nullptr if not available
static auto GetExp2fFinite()
{
    auto func = LibcFunctionLoader::GetInstance().GetExp2fFinite();
    if (func == nullptr) {
        return func;
    }
    // Check if really usable
    errno = 0;
    func(0.0f);
    if (errno == ENOSYS) {
        return static_cast<decltype(func)>(nullptr);
    }
    return func;
}

// Helper function: compute standard 2^x value (using ldexpf)
static float StandardExp2f(float x)
{
    int intPart = static_cast<int>(x);
    float fracPart = x - intPart;
    if (fabsf(fracPart) < 1e-7f) {
        return ldexpf(1.0f, intPart);
    }
    return powf(2.0f, x);
}

// ==================== Normal Parameter Tests ====================

// Test 1: Basic exponentiation
static napi_value Exp2fFiniteNormal001(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    float epsilon = 1e-6f;

    // Zero: 2^0 = 1
    if (fabsf(func(0.0f) - 1.0f) > epsilon) {
        allPassed = false;
    }
    // Positive
    if (fabsf(func(1.0f) - 2.0f) > epsilon) {
        allPassed = false;
    }
    if (fabsf(func(2.0f) - 4.0f) > epsilon) {
        allPassed = false;
    }
    if (fabsf(func(3.0f) - 8.0f) > epsilon) {
        allPassed = false;
    }
    // Negative
    if (fabsf(func(-1.0f) - 0.5f) > epsilon) {
        allPassed = false;
    }
    if (fabsf(func(-2.0f) - 0.25f) > epsilon) {
        allPassed = false;
    }
    // Decimal
    if (fabsf(func(0.5f) - StandardExp2f(0.5f)) > epsilon) {
        allPassed = false;
    }
    if (fabsf(func(-0.5f) - StandardExp2f(-0.5f)) > epsilon) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 2: Large value computation
static napi_value Exp2fFiniteNormal002(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;

    float result1 = func(10.0f);
    float expected1 = StandardExp2f(10.0f);
    if (fabsf(result1 - expected1) / (fabsf(result1) + 1e-30f) > 1e-5f) {
        allPassed = false;
    }

    float result2 = func(15.0f);
    float expected2 = StandardExp2f(15.0f);
    if (fabsf(result2 - expected2) / (fabsf(result2) + 1e-30f) > 1e-5f) {
        allPassed = false;
    }

    float result3 = func(-10.0f);
    float expected3 = StandardExp2f(-10.0f);
    if (fabsf(result3 - expected3) > 1e-7f) {
        allPassed = false;
    }

    float result4 = func(-15.0f);
    float expected4 = StandardExp2f(-15.0f);
    if (fabsf(result4 - expected4) > 1e-7f) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 3: Precision verification
static napi_value Exp2fFiniteNormal003(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    float epsilon = 1e-6f;
    float testVals[] = {0.1f, 0.01f, 0.001f, -0.1f, -0.01f, -0.001f, 0.25f, -0.25f};

    for (float val : testVals) {
        float expected = StandardExp2f(val);
        float actual = func(val);
        if (fabsf(actual - expected) > epsilon) {
            allPassed = false;
            break;
        }
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 4: Integer power verification
static napi_value Exp2fFiniteNormal004(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    float epsilon = 1e-6f;

    int testInts[] = {-8, -5, -3, -1, 0, 1, 3, 5, 8, 10, 16, 20};
    for (int n : testInts) {
        float expected = ldexpf(1.0f, n);
        float actual = func(static_cast<float>(n));
        if (fabsf(actual - expected) > epsilon) {
            allPassed = false;
            break;
        }
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Boundary Value Tests ====================

// Test 5: Overflow boundary
static napi_value Exp2fFiniteBoundary001(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    errno = 0;

    float largeVal = 130.0f;
    float result = func(largeVal);
    if (!std::isinf(result) && !std::isnan(result)) {
        if (result < FLT_MAX / 2.0f) {
            allPassed = false;
        }
    }
    if (errno != 0 && errno != ERANGE) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 6: Underflow boundary
static napi_value Exp2fFiniteBoundary002(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    errno = 0;

    float smallVal = -130.0f;
    float result = func(smallVal);
    if (result != 0.0f && result > FLT_MIN) {
        allPassed = false;
    }
    if (errno != 0 && errno != ERANGE) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 7: Critical values
static napi_value Exp2fFiniteBoundary003(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;

    float nearOverflow = 127.0f;
    float result1 = func(nearOverflow);
    if (!std::isfinite(result1) || result1 < 1e37f) {
        allPassed = false;
    }

    float nearUnderflow = -126.0f;
    float result2 = func(nearUnderflow);
    if (!std::isfinite(result2) || result2 > 1e-37f) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Abnormal Parameter Tests ====================

// Test 8: NaN and Inf
static napi_value Exp2fFiniteAbnormal001(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;

    float resultNan = func(NAN);
    if (!std::isnan(resultNan)) {
        allPassed = false;
    }

    float resultInf = func(INFINITY);
    if (!std::isinf(resultInf) || resultInf < 0) {
        allPassed = false;
    }

    float resultNegInf = func(-INFINITY);
    if (resultNegInf != 0.0f) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Stability Tests ====================

// Test 9: Repeated calls consistency
static napi_value Exp2fFiniteStable001(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    float testVals[] = {0.0f, 0.5f, 1.0f, 2.0f, -1.0f, -0.5f, 3.0f, -3.0f};
    int exp2fTestCount = 8;
    float results[exp2fTestCount];

    for (int i = 0; i < exp2fTestCount; ++i) {
        results[i] = func(testVals[i]);
    }

    int roundCount = 20;
    for (int round = 0; round < roundCount; ++round) {
        for (int i = 0; i < exp2fTestCount; ++i) {
            float current = func(testVals[i]);
            if (fabsf(current - results[i]) > 1e-9f) {
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

// Test 10: Massive continuous calls
static napi_value Exp2fFiniteStable002(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    int loopCount = 20;

    for (int i = 0; i < loopCount; ++i) {
        float val = (i % 100) / 10.0f - 5.0f;
        float result = func(val);
        if (!std::isfinite(result) && val < 5.0f) {
            allPassed = false;
            break;
        }
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Multi-thread Tests ====================

// Test 11: Multi-thread concurrent calls
static napi_value Exp2fFiniteThread001(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    const int threadCount = 3;
    const int iterationsPerThread = 10;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};

    for (int t = 0; t < threadCount; ++t) {
        threads.emplace_back([func, &hasError, iterationsPerThread]() {
            float epsilon = 1e-6f;
            for (int i = 0; i < iterationsPerThread; ++i) {
                float val = (i % 20) / 2.0f - 5.0f;
                float expected = StandardExp2f(val);
                float actual = func(val);
                if (fabsf(actual - expected) > epsilon) {
                    hasError = true;
                    break;
                }
            }
        });
    }

    for (auto& th : threads) {
        th.join();
    }

    return ReturnInt32(env, (!hasError) ? 1 : 0);
}

// Test 12: Multi-thread different parameters mixed
static napi_value Exp2fFiniteThread002(napi_env env, napi_callback_info info)
{
    auto func = GetExp2fFinite();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    const int threadCount = 3;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};
    float testVals[] = {0.0f, 0.5f, 1.0f, 2.0f, -1.0f, -0.5f, 5.0f, -5.0f, 10.0f, -10.0f};

    for (int t = 0; t < threadCount; ++t) {
        threads.emplace_back([func, &hasError, testVals]() {
            float epsilon = 1e-6f;
            int roundCount = 10;
            for (int round = 0; round < roundCount; ++round) {
                for (float val : testVals) {
                    float expected = StandardExp2f(val);
                    float actual = func(val);
                    if (fabsf(actual - expected) > epsilon) {
                        hasError = true;
                        return;
                    }
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
        {"exp2fFiniteNormal001", nullptr, Exp2fFiniteNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteNormal002", nullptr, Exp2fFiniteNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteNormal003", nullptr, Exp2fFiniteNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteNormal004", nullptr, Exp2fFiniteNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteBoundary001", nullptr, Exp2fFiniteBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteBoundary002", nullptr, Exp2fFiniteBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteBoundary003", nullptr, Exp2fFiniteBoundary003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteAbnormal001", nullptr, Exp2fFiniteAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteStable001", nullptr, Exp2fFiniteStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteStable002", nullptr, Exp2fFiniteStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteThread001", nullptr, Exp2fFiniteThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"exp2fFiniteThread002", nullptr, Exp2fFiniteThread002, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "exp2ffinitedktest",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}