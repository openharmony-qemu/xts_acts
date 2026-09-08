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

#ifndef ARKTS_ANI_TEST_CLASSCOVERED_H
#define ARKTS_ANI_TEST_CLASSCOVERED_H

#include "Common.h"
#include "hilog/log.h"
#include <atomic>
#include <thread>
#include <vector>
#include <cstring>
#include <climits>
#include <cmath>

constexpr int P7_THREAD_COUNT = 4;
constexpr const char *P7_CLASS_DESC = "entry.src.main.src.ets.Index.Foo";
constexpr const char *P7_BASE_DESC = "entry.src.main.src.ets.Index.ClassDefCompleteBase";
constexpr const char *P7_POINT_DESC = "entry.src.main.src.ets.Index.ClassDefCompletePoint";
constexpr const char *P7_IMPLICIT_OVERLOAD_DESC = "entry.src.main.src.ets.Index.ClassDefCompleteImplicitMethodOverload";
constexpr const char *P7_STATIC_OVERLOAD_DESC = "entry.src.main.src.ets.Index.ClassDefCompleteStaticOverload";

ani_int p7_dummy_native([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    return ANI_TRUE;
}

// ============================================================
// Section 1: FindField / FindStaticField (12 tests)
// ============================================================

ani_int test_Class_FindField_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_POINT_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_field field{};
    if (env->Class_FindField(cls, "x", &field) != ANI_OK || field == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_FindField_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_field field{};
    ani_status status = env->Class_FindField(nullptr, "x", &field);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindField_EmptyName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_POINT_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_field field{};
    ani_status status = env->Class_FindField(cls, "", &field);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindField_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_FindField != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticField_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_field field{};
    if (env->Class_FindStaticField(cls, "staticField", &field) != ANI_OK || field == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_FindStaticField_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_static_field field{};
    ani_status status = env->Class_FindStaticField(nullptr, "staticField", &field);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticField_EmptyName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_field field{};
    ani_status status = env->Class_FindStaticField(cls, "", &field);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticField_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_FindStaticField != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindField_NotExist([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_POINT_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_field field{};
    ani_status status = env->Class_FindField(cls, "nonexistent_field", &field);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindField_LongName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_POINT_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    std::string longName(4096, 'A');
    ani_field field{};
    ani_status status = env->Class_FindField(cls, longName.c_str(), &field);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticField_NotExist([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_field field{};
    ani_status status = env->Class_FindStaticField(cls, "nonexistent_static", &field);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticField_LongName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    std::string longName(4096, 'B');
    ani_static_field field{};
    ani_status status = env->Class_FindStaticField(cls, longName.c_str(), &field);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 2: FindMethod / FindStaticMethod (12 tests)
// ============================================================

ani_int test_Class_FindMethod_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_POINT_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_method method{};
    if (env->Class_FindMethod(cls, "move", "ii:", &method) != ANI_OK || method == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_FindMethod_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_method method{};
    ani_status status = env->Class_FindMethod(nullptr, "move", "ii:", &method);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindMethod_EmptyName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_POINT_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_method method{};
    ani_status status = env->Class_FindMethod(cls, "", "ii:", &method);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindMethod_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_FindMethod != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticMethod_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_method method{};
    if (env->Class_FindStaticMethod(cls, "sum", "ii:i", &method) != ANI_OK || method == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_FindStaticMethod_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_static_method method{};
    ani_status status = env->Class_FindStaticMethod(nullptr, "sum", "ii:i", &method);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticMethod_EmptyName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_method method{};
    ani_status status = env->Class_FindStaticMethod(cls, "", "ii:i", &method);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticMethod_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_FindStaticMethod != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindMethod_NotExist([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_POINT_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_method method{};
    ani_status status = env->Class_FindMethod(cls, "nonexistent_method", "ii:", &method);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindMethod_NullSig([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_IMPLICIT_OVERLOAD_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_method method{};
    ani_status status = env->Class_FindMethod(cls, "choose", nullptr, &method);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticMethod_NotExist([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_method method{};
    ani_status status = env->Class_FindStaticMethod(cls, "nonexistent_static_method", "ii:i", &method);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_FindStaticMethod_NullSig([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_STATIC_OVERLOAD_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_method method{};
    ani_status status = env->Class_FindStaticMethod(cls, "choose", nullptr, &method);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 3: GetStaticField (18 tests = 9 types x 2)
// ============================================================

ani_int test_Class_GetStaticField_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Boolean == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_GetStaticField_Boolean != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Char_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Char == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_GetStaticField_Char != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Byte_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Byte == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_GetStaticField_Byte != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Short_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Short == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_GetStaticField_Short != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_field field{};
    if (env->Class_FindStaticField(cls, "staticField", &field) != ANI_OK || field == nullptr) return ANI_FALSE;
    ani_int result = 0;
    if (env->Class_GetStaticField_Int(cls, field, &result) != ANI_OK) return ANI_FALSE;
    return result == 3 ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_GetStaticField_Int != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Long_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Long == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_GetStaticField_Long != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Float_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Float == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_GetStaticField_Float != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Double == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_GetStaticField_Double != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Ref == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_GetStaticField_Ref != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 4: SetStaticField (18 tests = 9 types x 2)
// ============================================================

ani_int test_Class_SetStaticField_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_SetStaticField_Boolean == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_SetStaticField_Boolean != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_SetStaticField_Char_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_SetStaticField_Char == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_SetStaticField_Char != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_SetStaticField_Byte_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_SetStaticField_Byte == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_SetStaticField_Byte != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_SetStaticField_Short_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_SetStaticField_Short == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_SetStaticField_Short != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_SetStaticField_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_field field{};
    if (env->Class_FindStaticField(cls, "staticField", &field) != ANI_OK || field == nullptr) return ANI_FALSE;
    if (env->Class_SetStaticField_Int(cls, field, 42) != ANI_OK) return ANI_FALSE;
    ani_int result = 0;
    if (env->Class_GetStaticField_Int(cls, field, &result) != ANI_OK) return ANI_FALSE;
    if (result != 42) return ANI_FALSE;
    env->Class_SetStaticField_Int(cls, field, 3);
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_SetStaticField_Int != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_SetStaticField_Long_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_SetStaticField_Long == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_SetStaticField_Long != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_SetStaticField_Float_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_SetStaticField_Float == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_SetStaticField_Float != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_SetStaticField_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_SetStaticField_Double == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_SetStaticField_Double != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_SetStaticField_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_SetStaticField_Ref == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_SetStaticField_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_SetStaticField_Ref != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 5: BindNativeMethods / BindStaticNativeMethods (8 tests)
// ============================================================

ani_int test_Class_BindNativeMethods_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_native_function methods[] = {
        {"p7_bind_native", ":i", reinterpret_cast<void *>(p7_dummy_native)},
    };
    ani_status status = env->Class_BindNativeMethods(cls, methods, 1);
    OH_LOG_INFO(LOG_APP, "testTag : Class_BindNativeMethods normal, status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_Class_BindNativeMethods_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_native_function methods[] = {
        {"p7_bind_abnormal", ":i", reinterpret_cast<void *>(p7_dummy_native)},
    };
    ani_status status = env->Class_BindNativeMethods(nullptr, methods, 1);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_BindNativeMethods_EmptyName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_native_function methods[] = {
        {"", ":i", reinterpret_cast<void *>(p7_dummy_native)},
    };
    ani_status status = env->Class_BindNativeMethods(cls, methods, 1);
    OH_LOG_INFO(LOG_APP, "testTag : Class_BindNativeMethods empty name, status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_Class_BindNativeMethods_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_BindNativeMethods != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_BindStaticNativeMethods_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_native_function methods[] = {
        {"p7_bind_static", ":i", reinterpret_cast<void *>(p7_dummy_native)},
    };
    ani_status status = env->Class_BindStaticNativeMethods(cls, methods, 1);
    OH_LOG_INFO(LOG_APP, "testTag : Class_BindStaticNativeMethods normal, status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_Class_BindStaticNativeMethods_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_native_function methods[] = {
        {"p7_bind_static_abnormal", ":i", reinterpret_cast<void *>(p7_dummy_native)},
    };
    ani_status status = env->Class_BindStaticNativeMethods(nullptr, methods, 1);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_BindStaticNativeMethods_EmptyName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_native_function methods[] = {
        {"", ":i", reinterpret_cast<void *>(p7_dummy_native)},
    };
    ani_status status = env->Class_BindStaticNativeMethods(cls, methods, 1);
    OH_LOG_INFO(LOG_APP, "testTag : Class_BindStaticNativeMethods empty name, status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_Class_BindStaticNativeMethods_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_BindStaticNativeMethods != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 6: CallStaticMethodByName (60 tests = 10 types x 3 variants x 2)
// ============================================================

// --- Boolean base ---
ani_int test_Class_CallStaticMethodByName_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_boolean result = ANI_FALSE;
    ani_status status = env->Class_CallStaticMethodByName_Boolean(cls, "or", "zz:z", &result, ANI_TRUE, ANI_FALSE);
    if (status != ANI_OK) return ANI_FALSE;
    return result == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_CallStaticMethodByName_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Boolean != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Boolean _A ---
ani_int test_Class_CallStaticMethodByName_Boolean_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_value args[2];
    args[0].z = ANI_TRUE;
    args[1].z = ANI_FALSE;
    ani_boolean result = ANI_FALSE;
    ani_status status = env->Class_CallStaticMethodByName_Boolean_A(cls, "or", "zz:z", &result, args);
    if (status != ANI_OK) return ANI_FALSE;
    return result == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_CallStaticMethodByName_Boolean_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Boolean_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Boolean _V ---
ani_int test_Class_CallStaticMethodByName_Boolean_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Boolean_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Boolean_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Boolean_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Char base ---
ani_int test_Class_CallStaticMethodByName_Char_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Char == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Char_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Char != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Char _A ---
ani_int test_Class_CallStaticMethodByName_Char_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Char_A == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Char_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Char_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Char _V ---
ani_int test_Class_CallStaticMethodByName_Char_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Char_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Char_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Char_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Byte base ---
ani_int test_Class_CallStaticMethodByName_Byte_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Byte == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Byte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Byte != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Byte _A ---
ani_int test_Class_CallStaticMethodByName_Byte_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Byte_A == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Byte_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Byte_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Byte _V ---
ani_int test_Class_CallStaticMethodByName_Byte_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Byte_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Byte_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Byte_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Short base ---
ani_int test_Class_CallStaticMethodByName_Short_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Short == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Short_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Short != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Short _A ---
ani_int test_Class_CallStaticMethodByName_Short_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Short_A == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Short_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Short_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Short _V ---
ani_int test_Class_CallStaticMethodByName_Short_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Short_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Short_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Short_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Int base ---
ani_int test_Class_CallStaticMethodByName_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_int result = 0;
    ani_status status = env->Class_CallStaticMethodByName_Int(cls, "sum", "ii:i", &result, 3, 4);
    if (status != ANI_OK) return ANI_FALSE;
    return result == 7 ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_CallStaticMethodByName_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Int != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Int _A ---
ani_int test_Class_CallStaticMethodByName_Int_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_value args[2];
    args[0].i = 3;
    args[1].i = 4;
    ani_int result = 0;
    ani_status status = env->Class_CallStaticMethodByName_Int_A(cls, "sum", "ii:i", &result, args);
    if (status != ANI_OK) return ANI_FALSE;
    return result == 7 ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_CallStaticMethodByName_Int_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Int_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Int _V ---
ani_int test_Class_CallStaticMethodByName_Int_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Int_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Int_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Int_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Long base ---
ani_int test_Class_CallStaticMethodByName_Long_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Long == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Long_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Long != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Long _A ---
ani_int test_Class_CallStaticMethodByName_Long_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Long_A == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Long_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Long_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Long _V ---
ani_int test_Class_CallStaticMethodByName_Long_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Long_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Long_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Long_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Float base ---
ani_int test_Class_CallStaticMethodByName_Float_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Float == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Float_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Float != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Float _A ---
ani_int test_Class_CallStaticMethodByName_Float_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Float_A == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Float_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Float_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Float _V ---
ani_int test_Class_CallStaticMethodByName_Float_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Float_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Float_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Float_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Double base ---
ani_int test_Class_CallStaticMethodByName_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Double == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Double != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Double _A ---
ani_int test_Class_CallStaticMethodByName_Double_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Double_A == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Double_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Double_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Double _V ---
ani_int test_Class_CallStaticMethodByName_Double_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Double_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Double_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Double_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Ref base ---
ani_int test_Class_CallStaticMethodByName_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_ref result{};
    ani_status status = env->Class_CallStaticMethodByName_Ref(cls, "new_Foo",
        ":C{entry.src.main.src.ets.Index.Foo}", &result);
    if (status != ANI_OK) return ANI_FALSE;
    return result != nullptr ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_CallStaticMethodByName_Ref_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Ref != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Ref _A ---
ani_int test_Class_CallStaticMethodByName_Ref_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_ref result{};
    ani_value args[1] = {};
    ani_status status = env->Class_CallStaticMethodByName_Ref_A(cls, "new_Foo",
        ":C{entry.src.main.src.ets.Index.Foo}", &result, args);
    if (status != ANI_OK) return ANI_FALSE;
    return result != nullptr ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_CallStaticMethodByName_Ref_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Ref_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Ref _V ---
ani_int test_Class_CallStaticMethodByName_Ref_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Ref_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Ref_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Ref_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Void base ---
ani_int test_Class_CallStaticMethodByName_Void_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Void == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Void_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Void != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Void _A ---
ani_int test_Class_CallStaticMethodByName_Void_A_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Void_A == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Void_A_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Void_A != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// --- Void _V ---
ani_int test_Class_CallStaticMethodByName_Void_V_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_CallStaticMethodByName_Void_V == nullptr) return ANI_FALSE;
    ani_class cls{};
    if (env->FindClass(P7_CLASS_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_CallStaticMethodByName_Void_V_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) return ANI_FALSE;
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P7_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Class_CallStaticMethodByName_Void_V != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) { t.join(); }
    return successCount.load() == P7_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 7: Boundary (30 tests)
// ============================================================

ani_int test_Class_GetStaticField_Boolean_Boundary_DefaultValue([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Boolean == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Int_Boundary_Min([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_field field{};
    if (env->Class_FindStaticField(cls, "staticField", &field) != ANI_OK || field == nullptr) return ANI_FALSE;
    ani_int result = 0;
    if (env->Class_GetStaticField_Int(cls, field, &result) != ANI_OK) return ANI_FALSE;
    return result >= INT32_MIN ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Int_Boundary_Max([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass(P7_BASE_DESC, &cls) != ANI_OK || cls == nullptr) return ANI_FALSE;
    ani_static_field field{};
    if (env->Class_FindStaticField(cls, "staticField", &field) != ANI_OK || field == nullptr) return ANI_FALSE;
    ani_int result = 0;
    if (env->Class_GetStaticField_Int(cls, field, &result) != ANI_OK) return ANI_FALSE;
    return result <= INT32_MAX ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Class_GetStaticField_Long_Boundary_Min([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Long == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Long_Boundary_Max([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Long == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}

ani_int test_Class_GetStaticField_Float_Boundary_NaN([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api == nullptr || env->c_api->Class_GetStaticField_Float == nullptr) return ANI_FALSE;
    return ANI_TRUE;
}


