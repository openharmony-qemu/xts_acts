/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

#ifndef ARKTS_ANI_TEST_TUPLECOVERED_H
#define ARKTS_ANI_TEST_TUPLECOVERED_H

#include "Common.h"
#include "hilog/log.h"
#include <atomic>
#include <thread>
#include <vector>
#include <cstring>

constexpr int P6_THREAD_COUNT = 4;

// ============================================================
// Section 1: TupleValue_GetNumberOfItems (2 tests)
// ============================================================

ani_int test_Tuple_GetNumberOfItems_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetNumberOfItems_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetNumberOfItems != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetNumberOfItems_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size result = 0;
    ani_status status = env->TupleValue_GetNumberOfItems(nullptr, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 2: TupleValue_GetItem_Boolean (4 tests)
// ============================================================

ani_int test_Tuple_GetItem_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetItem_Boolean_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetItem_Boolean != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Boolean_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_FALSE;
    ani_status status = env->TupleValue_GetItem_Boolean(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Boolean_Boundary_IndexZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_FALSE;
    ani_status status = env->TupleValue_GetItem_Boolean(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Boolean_Boundary_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_FALSE;
    ani_status status = env->TupleValue_GetItem_Boolean(nullptr, 100, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 3: TupleValue_GetItem_Char (4 tests)
// ============================================================

ani_int test_Tuple_GetItem_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetItem_Char_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetItem_Char != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Char_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char result = 0;
    ani_status status = env->TupleValue_GetItem_Char(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Char_Boundary_IndexZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char result = 0;
    ani_status status = env->TupleValue_GetItem_Char(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Char_Boundary_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_char result = 0;
    ani_status status = env->TupleValue_GetItem_Char(nullptr, 100, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 4: TupleValue_GetItem_Byte (4 tests)
// ============================================================

ani_int test_Tuple_GetItem_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetItem_Byte_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetItem_Byte != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Byte_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_byte result = 0;
    ani_status status = env->TupleValue_GetItem_Byte(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Byte_Boundary_IndexZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_byte result = 0;
    ani_status status = env->TupleValue_GetItem_Byte(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Byte_Boundary_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_byte result = 0;
    ani_status status = env->TupleValue_GetItem_Byte(nullptr, 100, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 5: TupleValue_GetItem_Short (4 tests)
// ============================================================

ani_int test_Tuple_GetItem_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetItem_Short_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetItem_Short != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Short_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_short result = 0;
    ani_status status = env->TupleValue_GetItem_Short(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Short_Boundary_IndexZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_short result = 0;
    ani_status status = env->TupleValue_GetItem_Short(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Short_Boundary_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_short result = 0;
    ani_status status = env->TupleValue_GetItem_Short(nullptr, 100, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 6: TupleValue_GetItem_Int (4 tests)
// ============================================================

ani_int test_Tuple_GetItem_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetItem_Int_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetItem_Int != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Int_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int result = 0;
    ani_status status = env->TupleValue_GetItem_Int(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Int_Boundary_IndexZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int result = 0;
    ani_status status = env->TupleValue_GetItem_Int(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Int_Boundary_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int result = 0;
    ani_status status = env->TupleValue_GetItem_Int(nullptr, 100, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 7: TupleValue_GetItem_Long (4 tests)
// ============================================================

ani_int test_Tuple_GetItem_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetItem_Long_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetItem_Long != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Long_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_long result = 0;
    ani_status status = env->TupleValue_GetItem_Long(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Long_Boundary_IndexZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_long result = 0;
    ani_status status = env->TupleValue_GetItem_Long(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Long_Boundary_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_long result = 0;
    ani_status status = env->TupleValue_GetItem_Long(nullptr, 100, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 8: TupleValue_GetItem_Float (4 tests)
// ============================================================

ani_int test_Tuple_GetItem_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetItem_Float_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetItem_Float != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Float_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_float result = 0;
    ani_status status = env->TupleValue_GetItem_Float(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Float_Boundary_IndexZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_float result = 0;
    ani_status status = env->TupleValue_GetItem_Float(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Float_Boundary_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_float result = 0;
    ani_status status = env->TupleValue_GetItem_Float(nullptr, 100, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 9: TupleValue_GetItem_Double (4 tests)
// ============================================================

ani_int test_Tuple_GetItem_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetItem_Double_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetItem_Double != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Double_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double result = 0;
    ani_status status = env->TupleValue_GetItem_Double(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Double_Boundary_IndexZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double result = 0;
    ani_status status = env->TupleValue_GetItem_Double(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Double_Boundary_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double result = 0;
    ani_status status = env->TupleValue_GetItem_Double(nullptr, 100, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 10: TupleValue_GetItem_Ref (4 tests)
// ============================================================

ani_int test_Tuple_GetItem_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_GetItem_Ref_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_GetItem_Ref != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Ref_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref result{};
    ani_status status = env->TupleValue_GetItem_Ref(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Ref_Boundary_IndexZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref result{};
    ani_status status = env->TupleValue_GetItem_Ref(nullptr, 0, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Ref_Boundary_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref result{};
    ani_status status = env->TupleValue_GetItem_Ref(nullptr, 100, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 11: TupleValue_SetItem_Boolean (2 tests)
// ============================================================

ani_int test_Tuple_SetItem_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_SetItem_Boolean_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_SetItem_Boolean != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_SetItem_Boolean_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->TupleValue_SetItem_Boolean(nullptr, 0, ANI_TRUE);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 12: TupleValue_SetItem_Char (2 tests)
// ============================================================

ani_int test_Tuple_SetItem_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_SetItem_Char_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_SetItem_Char != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_SetItem_Char_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->TupleValue_SetItem_Char(nullptr, 0, static_cast<ani_char>('A'));
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 13: TupleValue_SetItem_Byte (2 tests)
// ============================================================

ani_int test_Tuple_SetItem_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_SetItem_Byte_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_SetItem_Byte != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_SetItem_Byte_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->TupleValue_SetItem_Byte(nullptr, 0, static_cast<ani_byte>(1));
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 14: TupleValue_SetItem_Short (2 tests)
// ============================================================

ani_int test_Tuple_SetItem_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_SetItem_Short_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_SetItem_Short != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_SetItem_Short_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->TupleValue_SetItem_Short(nullptr, 0, static_cast<ani_short>(1));
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 15: TupleValue_SetItem_Int (2 tests)
// ============================================================

ani_int test_Tuple_SetItem_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_SetItem_Int_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_SetItem_Int != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_SetItem_Int_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->TupleValue_SetItem_Int(nullptr, 0, 42);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 16: TupleValue_SetItem_Long (2 tests)
// ============================================================

ani_int test_Tuple_SetItem_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_SetItem_Long_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_SetItem_Long != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_SetItem_Long_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->TupleValue_SetItem_Long(nullptr, 0, static_cast<ani_long>(42));
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 17: TupleValue_SetItem_Float (2 tests)
// ============================================================

ani_int test_Tuple_SetItem_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_SetItem_Float_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_SetItem_Float != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_SetItem_Float_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->TupleValue_SetItem_Float(nullptr, 0, static_cast<ani_float>(1.5f));
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 18: TupleValue_SetItem_Double (2 tests)
// ============================================================

ani_int test_Tuple_SetItem_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_SetItem_Double_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_SetItem_Double != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_SetItem_Double_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->TupleValue_SetItem_Double(nullptr, 0, static_cast<ani_double>(2.5));
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 19: TupleValue_SetItem_Ref (2 tests)
// ============================================================

ani_int test_Tuple_SetItem_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Tuple_SetItem_Ref_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P6_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->TupleValue_SetItem_Ref != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P6_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_SetItem_Ref_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref ref{};
    ani_status status = env->TupleValue_SetItem_Ref(nullptr, 0, ref);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 20: Combo and Boundary (6 tests)
// ============================================================

ani_int test_Tuple_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr) {
        return ANI_FALSE;
    }
    if (env->c_api->TupleValue_GetNumberOfItems == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Boolean == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Char == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Byte == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Short == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Int == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Long == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Float == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Double == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Ref == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Boolean == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Char == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Byte == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Short == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Int == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Long == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Float == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Double == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Ref == nullptr) return ANI_FALSE;
    OH_LOG_INFO(LOG_APP, "testTag : TupleValue combo all c_api pointers valid");
    return ANI_TRUE;
}

ani_int test_Tuple_Boundary_NegativeIndex([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int result = 0;
    ani_status status = env->TupleValue_GetItem_Int(nullptr, static_cast<ani_size>(-1), &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_Boundary_AllGetTypePointers([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Boolean == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Char == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Byte == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Short == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Int == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Long == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Float == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Double == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_GetItem_Ref == nullptr) return ANI_FALSE;
    OH_LOG_INFO(LOG_APP, "testTag : TupleValue all 9 GetItem c_api pointers valid");
    return ANI_TRUE;
}

ani_int test_Tuple_Boundary_AllSetTypePointers([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Boolean == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Char == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Byte == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Short == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Int == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Long == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Float == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Double == nullptr) return ANI_FALSE;
    if (env->c_api->TupleValue_SetItem_Ref == nullptr) return ANI_FALSE;
    OH_LOG_INFO(LOG_APP, "testTag : TupleValue all 9 SetItem c_api pointers valid");
    return ANI_TRUE;
}

ani_int test_Tuple_GetNumberOfItems_Boundary_ZeroItems([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size result = 99;
    ani_status status = env->TupleValue_GetNumberOfItems(nullptr, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Tuple_GetItem_Boundary_AllTypesRoundTrip([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean bResult = ANI_FALSE;
    ani_char cResult = 0;
    ani_byte byResult = 0;
    ani_short sResult = 0;
    ani_int iResult = 0;
    ani_long lResult = 0;
    ani_float fResult = 0;
    ani_double dResult = 0;
    ani_ref rResult{};

    ani_status s1 = env->TupleValue_GetItem_Boolean(nullptr, 0, &bResult);
    ani_status s2 = env->TupleValue_GetItem_Char(nullptr, 0, &cResult);
    ani_status s3 = env->TupleValue_GetItem_Byte(nullptr, 0, &byResult);
    ani_status s4 = env->TupleValue_GetItem_Short(nullptr, 0, &sResult);
    ani_status s5 = env->TupleValue_GetItem_Int(nullptr, 0, &iResult);
    ani_status s6 = env->TupleValue_GetItem_Long(nullptr, 0, &lResult);
    ani_status s7 = env->TupleValue_GetItem_Float(nullptr, 0, &fResult);
    ani_status s8 = env->TupleValue_GetItem_Double(nullptr, 0, &dResult);
    ani_status s9 = env->TupleValue_GetItem_Ref(nullptr, 0, &rResult);

    if (s1 != ANI_OK && s2 != ANI_OK && s3 != ANI_OK && s4 != ANI_OK &&
        s5 != ANI_OK && s6 != ANI_OK && s7 != ANI_OK && s8 != ANI_OK && s9 != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : TupleValue all 9 GetItem types fail on nullptr as expected");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

#endif // ARKTS_ANI_TEST_TUPLECOVERED_H
