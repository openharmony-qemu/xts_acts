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
    return LibcFunctionLoader::GetInstance().GetFinitef() == nullptr;
}

// ==================== Normal Parameter Tests ====================

// Test 1: Basic finite value identification
static napi_value FinitefNormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinitef();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    // Zero
    if (func(0.0f) == 0) {
        allPassed = false;
    }
    // Positive
    if (func(3.14f) == 0) {
        allPassed = false;
    }
    if (func(100.0f) == 0) {
        allPassed = false;
    }
    // Negative
    if (func(-3.14f) == 0) {
        allPassed = false;
    }
    if (func(-100.0f) == 0) {
        allPassed = false;
    }
    // Decimal
    if (func(0.0001f) == 0) {
        allPassed = false;
    }
    if (func(-0.0001f) == 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 2: Non-finite value identification
static napi_value FinitefNormal002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinitef();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    if (func(HUGE_VALF) != 0) {
        allPassed = false;
    }
    if (func(-HUGE_VALF) != 0) {
        allPassed = false;
    }
    if (func(NAN) != 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Boundary Value Tests ====================

// Test 3: Max/min value boundaries
static napi_value FinitefBoundary001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinitef();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    if (func(FLT_MAX) == 0) {
        allPassed = false;
    }
    if (func(FLT_MIN) == 0) {
        allPassed = false;
    }
    if (func(-FLT_MAX) == 0) {
        allPassed = false;
    }
    if (func(-FLT_MIN) == 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// Test 4: Near boundary values
static napi_value FinitefBoundary002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinitef();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    float nearInf = 3.402823e38f;
    if (func(nearInf) == 0) {
        allPassed = false;
    }
    if (func(-nearInf) == 0) {
        allPassed = false;
    }

    float nearZero = 1.4e-45f;
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
static napi_value FinitefAbnormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinitef();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    if (func(NAN) != 0) {
        allPassed = false;
    }
    
    union { float f; uint32_t i; } nan1 = { .i = 0x7FC00001 };
    union { float f; uint32_t i; } nan2 = { .i = 0x7FC00002 };
    if (func(nan1.f) != 0) {
        allPassed = false;
    }
    if (func(nan2.f) != 0) {
        allPassed = false;
    }

    union { float f; uint32_t i; } snan = { .i = 0x7FA00000 };
    if (func(snan.f) != 0) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Stability Tests ====================

// Test 6: Repeated calls consistency
static napi_value FinitefStable001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinitef();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    bool allPassed = true;
    float testVals[] = {0.0f, 3.14f, -3.14f, HUGE_VALF, -HUGE_VALF, NAN};
    int results[6];

    for (int i = 0; i < 6; ++i) {
        results[i] = func(testVals[i]);
    }

    for (int round = 0; round < 20; ++round) {
        for (int i = 0; i < 6; ++i) {
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
static napi_value FinitefThread001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetFinitef();
    if (func == nullptr) {
        return ReturnInt32(env, 0);
    }

    const int threadCount = 3;
    const int iterationsPerThread = 10;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};
    float testVals[] = {0.0f, 3.14f, HUGE_VALF, -HUGE_VALF, NAN};

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
        {"finitefNormal001", nullptr, FinitefNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finitefNormal002", nullptr, FinitefNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finitefBoundary001", nullptr, FinitefBoundary001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finitefBoundary002", nullptr, FinitefBoundary002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finitefAbnormal001", nullptr, FinitefAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finitefStable001", nullptr, FinitefStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"finitefThread001", nullptr, FinitefThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "finitefdktest",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}
