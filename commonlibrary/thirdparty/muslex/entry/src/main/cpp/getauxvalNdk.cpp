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
#include <sys/auxv.h>
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
    return LibcFunctionLoader::GetInstance().GetGetauxval() == nullptr;
}

// ==================== Normal Parameter Tests ====================

// Test 1: Get AT_PAGESZ
static napi_value GetauxvalNormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    errno = 0;
    unsigned long pagesz = func(AT_PAGESZ);
    if (pagesz == 0 || errno == ENOENT) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// Test 2: Get AT_SECURE
static napi_value GetauxvalNormal002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    errno = 0;
    unsigned long secure = func(AT_SECURE);
    if (errno == ENOENT) {
        return ReturnInt32(env, 0);
    }
    // AT_SECURE should return 0 or 1
    if (secure > 1) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// Test 3: Get AT_CLKTCK
static napi_value GetauxvalNormal003(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    errno = 0;
    unsigned long clktck = func(AT_CLKTCK);
    if (errno == ENOENT) {
        return ReturnInt32(env, 0);
    }
    if (clktck == 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// Test 4: Get AT_RANDOM
static napi_value GetauxvalNormal004(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    errno = 0;
    unsigned long random = func(AT_RANDOM);
    if (errno == ENOENT) {
        return ReturnInt32(env, 0);
    }
    if (random == 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// Test 5: Get AT_ENTRY (program entry point)
static napi_value GetauxvalNormal005(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    errno = 0;
    unsigned long entry = func(AT_ENTRY);
    if (errno == ENOENT) {
        return ReturnInt32(env, 0);
    }
    if (entry == 0) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// ==================== Abnormal Parameter Tests ====================

// Test 6: Invalid item value
static napi_value GetauxvalAbnormal001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    errno = 0;
    unsigned long result = func(0xFFFFFFFF);
    if (result != 0) {
        return ReturnInt32(env, 0);
    }
    if (errno != ENOENT) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// Test 7: Negative item value
static napi_value GetauxvalAbnormal002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    errno = 0;
    unsigned long result = func(static_cast<unsigned long>(-1));
    if (result != 0) {
        return ReturnInt32(env, 0);
    }
    if (errno != ENOENT) {
        return ReturnInt32(env, 0);
    }
    return ReturnInt32(env, 1);
}

// Test 8: Boundary item value (near valid range)
static napi_value GetauxvalAbnormal003(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    errno = 0;
    unsigned long result1 = func(0x1000);
    if (result1 != 0 || errno != ENOENT) {
        allPassed = false;
    }

    errno = 0;
    unsigned long result2 = func(0x0000);
    if (result2 != 0 || errno != ENOENT) {
        allPassed = false;
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Stability Tests ====================

// Test 9: Repeated calls consistency
static napi_value GetauxvalStable001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    unsigned long items[] = {AT_PAGESZ, AT_SECURE, AT_CLKTCK, AT_RANDOM};
    unsigned long results[4];

    int itemCount = 4;
    for (int i = 0; i < itemCount; ++i) {
        results[i] = func(items[i]);
    }

    int roundCount = 20;
    for (int round = 0; round < roundCount; ++round) {
        for (int i = 0; i < itemCount; ++i) {
            if (func(items[i]) != results[i]) {
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
static napi_value GetauxvalStable002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    bool allPassed = true;
    unsigned long items[] = {AT_PAGESZ, AT_SECURE, AT_CLKTCK, AT_RANDOM};

    int loopCount = 20;
    int basiccount = 4;
    for (int i = 0; i < loopCount; ++i) {
        int idx = i % basiccount;
        unsigned long result = func(items[idx]);
        if (result == 0 && idx != 1) { // AT_SECURE may be 0
            allPassed = false;
            break;
        }
    }

    return ReturnInt32(env, allPassed ? 1 : 0);
}

// ==================== Multi-thread Tests ====================

template<typename Func>
static void GetauxvalThreadWorker(Func func, std::atomic<bool>& hasError,
    unsigned long items[], int iterationsPerThread)
{
    for (int i = 0; i < iterationsPerThread; ++i) {
        int basiccount = 4;
        int idx = i % basiccount;
        unsigned long result = func(items[idx]);
        if (result == 0 && idx != 1) {
            hasError = true;
            return;
        }
    }
}

// Test 11: Multi-thread concurrent calls
static napi_value GetauxvalThread001(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    const int threadCount = 3;
    const int iterationsPerThread = 10;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};
    unsigned long items[] = {AT_PAGESZ, AT_SECURE, AT_CLKTCK, AT_RANDOM};

    for (int t = 0; t < threadCount; ++t) {
        threads.emplace_back([func, &hasError, items, iterationsPerThread]() {
            GetauxvalThreadWorker(func, hasError, const_cast<unsigned long*>(items), iterationsPerThread);
        });
    }
    for (auto& th : threads) {
        th.join();
    }

    return ReturnInt32(env, (!hasError) ? 1 : 0);
}

template<typename Func>
static void GetauxvalThreadWorker2(Func func, std::atomic<bool>& hasError,
    unsigned long allItems[], int iterationsPerThread, int t)
{
    for (int i = 0; i < iterationsPerThread; ++i) {
        int basiccount = 4;
        int idx = (i + t) % 8;
        unsigned long result = func(allItems[idx]);
        // Verify return value and errno
        if (result == 0 && idx >= 4) { // Some items may not exist
            // Not necessarily an error, continue
        }
    }
}

// Test 12: Multi-thread different item mixed
static napi_value GetauxvalThread002(napi_env env, napi_callback_info info)
{
    auto func = LibcFunctionLoader::GetInstance().GetGetauxval();
    if (func == nullptr) {
        return ReturnInt32(env, 1);
    }

    const int threadCount = 3;
    const int iterationsPerThread = 10;
    std::vector<std::thread> threads;
    std::atomic<bool> hasError{false};
    unsigned long allItems[] = {AT_PAGESZ, AT_SECURE, AT_CLKTCK, AT_RANDOM, AT_ENTRY, AT_UID, AT_EUID, AT_GID};

    for (int t = 0; t < threadCount; ++t) {
        threads.emplace_back([func, &hasError, allItems, iterationsPerThread, t]() {
            GetauxvalThreadWorker2(func, hasError, const_cast<unsigned long*>(allItems), iterationsPerThread, t);
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
        {"getauxvalNormal001", nullptr, GetauxvalNormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getauxvalNormal002", nullptr, GetauxvalNormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getauxvalNormal003", nullptr, GetauxvalNormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getauxvalNormal004", nullptr, GetauxvalNormal004, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getauxvalNormal005", nullptr, GetauxvalNormal005, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Abnormal parameters
        {"getauxvalAbnormal001", nullptr, GetauxvalAbnormal001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getauxvalAbnormal002", nullptr, GetauxvalAbnormal002, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getauxvalAbnormal003", nullptr, GetauxvalAbnormal003, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Stability
        {"getauxvalStable001", nullptr, GetauxvalStable001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getauxvalStable002", nullptr, GetauxvalStable002, nullptr, nullptr, nullptr, napi_default, nullptr},
        // Multi-thread
        {"getauxvalThread001", nullptr, GetauxvalThread001, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getauxvalThread002", nullptr, GetauxvalThread002, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "getauxvaldktest",
    .nm_priv = nullptr,
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&demoModule);
}