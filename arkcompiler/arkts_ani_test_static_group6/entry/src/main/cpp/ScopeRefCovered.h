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

#ifndef ARKTS_ANI_TEST_SCOPEREFCOVERED_H
#define ARKTS_ANI_TEST_SCOPEREFCOVERED_H

#include "Common.h"
#include "hilog/log.h"
#include <atomic>
#include <thread>
#include <vector>
#include <cstring>

constexpr const char *PART2_MODULE_DESC = "entry.src.main.src.ets.Index";
constexpr const char *PART2_NS_DESC = "entry.src.main.src.ets.Index.Convert";
constexpr const char *PART2_CLASS_DESC = "entry.src.main.src.ets.Index.Foo";
constexpr const char *PART2_ENUM_DESC = "entry.src.main.src.ets.Index.COLOR";
constexpr int PART2_THREAD_COUNT = 4;
constexpr ani_size PART2_TWO_ITEM_ARRAY = 2;
constexpr ani_size PART2_THREE_ITEM_ARRAY = 3;
constexpr ani_size PART2_LOCAL_SCOPE_CAPACITY = 16;
constexpr ani_size PART2_LONG_DESC_LENGTH = 4096;

bool ConsumeUnhandledErrorPart2(ani_env *env)
{
    if (env == nullptr) {
        return false;
    }
    ani_boolean hasError = ANI_FALSE;
    if (env->ExistUnhandledError(&hasError) == ANI_OK && hasError == ANI_TRUE) {
        env->ResetError();
        return true;
    }
    return false;
}

// ============================================================
// Category 1: Weak Reference (11 tests)
// ============================================================

ani_int test_WeakRef_Create_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_WeakRef_Create_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            ani_wref wref{};
            if (tEnv->String_NewUTF8("weak", sizeof("weak") - 1, &str) != ANI_OK ||
                tEnv->WeakReference_Create(static_cast<ani_ref>(str), &wref) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            tEnv->WeakReference_Delete(wref);
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_WeakRef_Create_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("combo", sizeof("combo") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_wref wref{};
    if (env->WeakReference_Create(static_cast<ani_ref>(str), &wref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean wasReleased = ANI_TRUE;
    ani_ref ref{};
    if (env->WeakReference_GetReference(wref, &wasReleased, &ref) != ANI_OK) {
        env->WeakReference_Delete(wref);
        return ANI_FALSE;
    }
    if (wasReleased != ANI_FALSE) {
        env->WeakReference_Delete(wref);
        return ANI_FALSE;
    }
    if (env->WeakReference_Delete(wref) != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : WeakRef create-get-delete combo succeeded");
    return ANI_TRUE;
}

ani_int test_WeakRef_Delete_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("normal", sizeof("normal") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_wref wref{};
    if (env->WeakReference_Create(static_cast<ani_ref>(str), &wref) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->WeakReference_Delete(wref) != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : WeakRef delete normal succeeded");
    return ANI_TRUE;
}

ani_int test_WeakRef_Delete_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->WeakReference_Delete(nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_WeakRef_Delete_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_WeakRef_Delete_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            ani_wref wref{};
            if (tEnv->String_NewUTF8("del", sizeof("del") - 1, &str) != ANI_OK ||
                tEnv->WeakReference_Create(static_cast<ani_ref>(str), &wref) != ANI_OK ||
                tEnv->WeakReference_Delete(wref) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_WeakRef_Delete_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("delcombo", sizeof("delcombo") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_wref wref{};
    if (env->WeakReference_Create(static_cast<ani_ref>(str), &wref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean wasReleased = ANI_TRUE;
    ani_ref ref{};
    if (env->WeakReference_GetReference(wref, &wasReleased, &ref) != ANI_OK) {
        env->WeakReference_Delete(wref);
        return ANI_FALSE;
    }
    if (env->WeakReference_Delete(wref) != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : WeakRef delete combo succeeded");
    return ANI_TRUE;
}

ani_int test_WeakRef_GetReference_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_WeakRef_GetReference_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            ani_wref wref{};
            ani_boolean wasReleased = ANI_TRUE;
            ani_ref ref{};
            if (tEnv->String_NewUTF8("getref", sizeof("getref") - 1, &str) != ANI_OK ||
                tEnv->WeakReference_Create(static_cast<ani_ref>(str), &wref) != ANI_OK ||
                tEnv->WeakReference_GetReference(wref, &wasReleased, &ref) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            tEnv->WeakReference_Delete(wref);
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_WeakRef_GetReference_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("getcombo", sizeof("getcombo") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_wref wref{};
    if (env->WeakReference_Create(static_cast<ani_ref>(str), &wref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean wasReleased = ANI_TRUE;
    ani_ref ref{};
    if (env->WeakReference_GetReference(wref, &wasReleased, &ref) != ANI_OK) {
        env->WeakReference_Delete(wref);
        return ANI_FALSE;
    }
    if (wasReleased != ANI_FALSE) {
        env->WeakReference_Delete(wref);
        return ANI_FALSE;
    }
    env->WeakReference_Delete(wref);
    OH_LOG_INFO(LOG_APP, "testTag : WeakRef GetReference combo succeeded, wasReleased=%{public}d", wasReleased);
    return ANI_TRUE;
}

ani_int test_WeakRef_Create_NullRef([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef{};
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_wref wref{};
    ani_status status = env->WeakReference_Create(nullRef, &wref);
    OH_LOG_INFO(LOG_APP, "testTag : WeakRef create from null ref, status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_WeakRef_Delete_Twice([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("twice", sizeof("twice") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_wref wref{};
    if (env->WeakReference_Create(static_cast<ani_ref>(str), &wref) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->WeakReference_Delete(wref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->WeakReference_Delete(wref);
    bool hadError = ConsumeUnhandledErrorPart2(env);
    OH_LOG_INFO(LOG_APP, "testTag : WeakRef delete twice status=%{public}d, hadError=%{public}d", status, hadError);
    if (status != ANI_OK || hadError) {
        return ANI_TRUE;
    }
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_WeakRef_GetReference_AfterGC([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("gc", sizeof("gc") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_wref wref{};
    if (env->WeakReference_Create(static_cast<ani_ref>(str), &wref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean wasReleased = ANI_FALSE;
    ani_ref ref{};
    ani_status status = env->WeakReference_GetReference(wref, &wasReleased, &ref);
    OH_LOG_INFO(LOG_APP, "testTag : WeakRef GetReference after GC, status=%{public}d, wasReleased=%{public}d", status,
                wasReleased);
    env->WeakReference_Delete(wref);
    return ANI_TRUE;
}

// ============================================================
// Category 2: Find Operations (13 tests)
// ============================================================

ani_int test_FindModule_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_status status = env->FindModule(PART2_MODULE_DESC, &mod);
    if (status == ANI_OK && mod != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : FindModule normal succeeded");
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : FindModule normal failed, status=%{public}d", status);
    return ANI_FALSE;
}

ani_int test_FindModule_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_status status = env->FindModule(nullptr, &mod);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindModule_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FindModule_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> finishedCount(0);
    std::atomic<ani_int> attachFailCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&finishedCount, &attachFailCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_module mod{};
            ani_status status = tEnv->FindModule(PART2_MODULE_DESC, &mod);
            ConsumeUnhandledErrorPart2(tEnv);
            OH_LOG_INFO(LOG_APP, "testTag : FindModule multi-thread status=%{public}d", status);
            finishedCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return (finishedCount.load() == PART2_THREAD_COUNT && attachFailCount.load() == 0) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindNamespace_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns{};
    ani_status status = env->FindNamespace(nullptr, &ns);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindNamespace_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FindNamespace_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> finishedCount(0);
    std::atomic<ani_int> attachFailCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&finishedCount, &attachFailCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_namespace ns{};
            ani_status status = tEnv->FindNamespace(PART2_NS_DESC, &ns);
            ConsumeUnhandledErrorPart2(tEnv);
            OH_LOG_INFO(LOG_APP, "testTag : FindNamespace multi-thread status=%{public}d", status);
            finishedCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return (finishedCount.load() == PART2_THREAD_COUNT && attachFailCount.load() == 0) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindClass_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FindClass_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> finishedCount(0);
    std::atomic<ani_int> attachFailCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&finishedCount, &attachFailCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_class cls{};
            ani_status status = tEnv->FindClass(PART2_CLASS_DESC, &cls);
            ConsumeUnhandledErrorPart2(tEnv);
            OH_LOG_INFO(LOG_APP, "testTag : FindClass multi-thread status=%{public}d", status);
            finishedCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return (finishedCount.load() == PART2_THREAD_COUNT && attachFailCount.load() == 0) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindEnum_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FindEnum_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> finishedCount(0);
    std::atomic<ani_int> attachFailCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&finishedCount, &attachFailCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_enum enm{};
            ani_status status = tEnv->FindEnum(PART2_ENUM_DESC, &enm);
            ConsumeUnhandledErrorPart2(tEnv);
            OH_LOG_INFO(LOG_APP, "testTag : FindEnum multi-thread status=%{public}d", status);
            finishedCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return (finishedCount.load() == PART2_THREAD_COUNT && attachFailCount.load() == 0) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindClass_EmptyDesc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    ani_status status = env->FindClass("", &cls);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindModule_EmptyDesc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_status status = env->FindModule("", &mod);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindNamespace_EmptyDesc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns{};
    ani_status status = env->FindNamespace("", &ns);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindEnum_EmptyDesc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    ani_status status = env->FindEnum("", &enm);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindClass_LongDesc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string longDesc(PART2_LONG_DESC_LENGTH, 'A');
    ani_class cls{};
    ani_status status = env->FindClass(longDesc.c_str(), &cls);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FindModule_LongDesc([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string longDesc(PART2_LONG_DESC_LENGTH, 'A');
    ani_module mod{};
    ani_status status = env->FindModule(longDesc.c_str(), &mod);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Category 3: Array Operations (16 tests)
// ============================================================

ani_int test_Array_GetLength_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_size len = 0;
    ani_status status = env->Array_GetLength(nullptr, &len);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_GetLength_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Array_GetLength_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_ref undef{};
            ani_array arr{};
            ani_size len = 0;
            if (tEnv->GetUndefined(&undef) != ANI_OK ||
                tEnv->Array_New(PART2_THREE_ITEM_ARRAY, undef, &arr) != ANI_OK ||
                tEnv->Array_GetLength(arr, &len) != ANI_OK ||
                len != PART2_THREE_ITEM_ARRAY) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_New_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Array_New_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_ref undef{};
            ani_array arr{};
            if (tEnv->GetUndefined(&undef) != ANI_OK ||
                tEnv->Array_New(PART2_TWO_ITEM_ARRAY, undef, &arr) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Set_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undef{};
    if (env->GetUndefined(&undef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_array arr{};
    if (env->Array_New(1, undef, &arr) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_string str{};
    if (env->String_NewUTF8("elem", sizeof("elem") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->Array_Set(arr, 0, static_cast<ani_ref>(str));
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Set_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undef{};
    if (env->GetUndefined(&undef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->Array_Set(nullptr, 0, undef);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Set_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Array_Set_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_ref undef{};
            ani_array arr{};
            ani_string str{};
            if (tEnv->GetUndefined(&undef) != ANI_OK ||
                tEnv->Array_New(PART2_TWO_ITEM_ARRAY, undef, &arr) != ANI_OK ||
                tEnv->String_NewUTF8("set", sizeof("set") - 1, &str) != ANI_OK ||
                tEnv->Array_Set(arr, 0, static_cast<ani_ref>(str)) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Get_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Array_Get_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_ref undef{};
            ani_array arr{};
            ani_ref ref{};
            if (tEnv->GetUndefined(&undef) != ANI_OK ||
                tEnv->Array_New(PART2_TWO_ITEM_ARRAY, undef, &arr) != ANI_OK ||
                tEnv->Array_Get(arr, 0, &ref) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Push_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undef{};
    if (env->GetUndefined(&undef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->Array_Push(nullptr, undef);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Push_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Array_Push_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_ref undef{};
            ani_array arr{};
            ani_string str{};
            if (tEnv->GetUndefined(&undef) != ANI_OK ||
                tEnv->Array_New(0, undef, &arr) != ANI_OK ||
                tEnv->String_NewUTF8("push", sizeof("push") - 1, &str) != ANI_OK ||
                tEnv->Array_Push(arr, static_cast<ani_ref>(str)) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Pop_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref ref{};
    ani_status status = env->Array_Pop(nullptr, &ref);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Pop_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Array_Pop_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_ref undef{};
            ani_array arr{};
            ani_ref ref{};
            if (tEnv->GetUndefined(&undef) != ANI_OK ||
                tEnv->Array_New(1, undef, &arr) != ANI_OK ||
                tEnv->Array_Pop(arr, &ref) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_New_LengthZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undef{};
    if (env->GetUndefined(&undef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_array arr{};
    ani_status status = env->Array_New(0, undef, &arr);
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Get_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undef{};
    if (env->GetUndefined(&undef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_array arr{};
    if (env->Array_New(PART2_TWO_ITEM_ARRAY, undef, &arr) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref ref{};
    ani_status status = env->Array_Get(arr, PART2_TWO_ITEM_ARRAY, &ref);
    bool hadError = ConsumeUnhandledErrorPart2(env);
    return (status != ANI_OK || hadError) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Get_FirstElement([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undef{};
    if (env->GetUndefined(&undef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_array arr{};
    if (env->Array_New(1, undef, &arr) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_string str{};
    if (env->String_NewUTF8("first", sizeof("first") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->Array_Set(arr, 0, static_cast<ani_ref>(str)) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref ref{};
    ani_status status = env->Array_Get(arr, 0, &ref);
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Set_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undef{};
    if (env->GetUndefined(&undef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_array arr{};
    if (env->Array_New(PART2_TWO_ITEM_ARRAY, undef, &arr) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_string str{};
    if (env->String_NewUTF8("oor", sizeof("oor") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->Array_Set(arr, PART2_TWO_ITEM_ARRAY, static_cast<ani_ref>(str));
    bool hadError = ConsumeUnhandledErrorPart2(env);
    return (status != ANI_OK || hadError) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Array_Pop_Empty([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref undef{};
    if (env->GetUndefined(&undef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_array arr{};
    if (env->Array_New(0, undef, &arr) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref ref{};
    ani_status status = env->Array_Pop(arr, &ref);
    bool hadError = ConsumeUnhandledErrorPart2(env);
    if (status != ANI_OK || hadError || ref == nullptr) {
        return ANI_TRUE;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(ref, &isNull) == ANI_OK && isNull == ANI_TRUE) {
        return ANI_TRUE;
    }
    ani_boolean isUndefined = ANI_FALSE;
    if (env->Reference_IsUndefined(ref, &isUndefined) == ANI_OK && isUndefined == ANI_TRUE) {
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

// ============================================================
// Category 4: References and Special Values (17 tests)
// ============================================================

ani_int test_Reference_Delete_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Reference_Delete_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str{};
            if (tEnv->String_NewUTF8("del", sizeof("del") - 1, &str) != ANI_OK ||
                tEnv->Reference_Delete(static_cast<ani_ref>(str)) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_Delete_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("combo", sizeof("combo") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_size sz = 0;
    if (env->String_GetUTF8Size(str, &sz) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->Reference_Delete(static_cast<ani_ref>(str)) != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : Reference_Delete combo succeeded, string size=%{public}u", sz);
    return ANI_TRUE;
}

ani_int test_Reference_IsNull_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef{};
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(nullRef, &isNull) != ANI_OK) {
        return ANI_FALSE;
    }
    if (isNull != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_string str{};
    if (env->String_NewUTF8("valid", sizeof("valid") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isNotNull = ANI_TRUE;
    if (env->Reference_IsNull(static_cast<ani_ref>(str), &isNotNull) != ANI_OK) {
        return ANI_FALSE;
    }
    return isNotNull == ANI_FALSE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_IsNull_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Reference_IsNull_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_ref nullRef{};
            ani_boolean isNull = ANI_FALSE;
            if (tEnv->GetNull(&nullRef) != ANI_OK ||
                tEnv->Reference_IsNull(nullRef, &isNull) != ANI_OK ||
                isNull != ANI_TRUE) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_IsUndefined_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_FALSE;
    ani_status status = env->Reference_IsUndefined(nullptr, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_IsUndefined_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Reference_IsUndefined_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_ref undefRef{};
            ani_boolean isUndef = ANI_FALSE;
            if (tEnv->GetUndefined(&undefRef) != ANI_OK ||
                tEnv->Reference_IsUndefined(undefRef, &isUndef) != ANI_OK ||
                isUndef != ANI_TRUE) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_IsNullishValue_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef{};
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isNullish = ANI_FALSE;
    if (env->Reference_IsNullishValue(nullRef, &isNullish) != ANI_OK) {
        return ANI_FALSE;
    }
    if (isNullish != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_ref undefRef{};
    if (env->GetUndefined(&undefRef) != ANI_OK) {
        return ANI_FALSE;
    }
    isNullish = ANI_FALSE;
    if (env->Reference_IsNullishValue(undefRef, &isNullish) != ANI_OK) {
        return ANI_FALSE;
    }
    if (isNullish != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_string str{};
    if (env->String_NewUTF8("valid", sizeof("valid") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    isNullish = ANI_TRUE;
    if (env->Reference_IsNullishValue(static_cast<ani_ref>(str), &isNullish) != ANI_OK) {
        return ANI_FALSE;
    }
    return isNullish == ANI_FALSE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_IsNullishValue_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Reference_IsNullishValue_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_ref nullRef{};
            ani_boolean isNullish = ANI_FALSE;
            if (tEnv->GetNull(&nullRef) != ANI_OK ||
                tEnv->Reference_IsNullishValue(nullRef, &isNullish) != ANI_OK ||
                isNullish != ANI_TRUE) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_Equals_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_FALSE;
    ani_status status = env->Reference_Equals(nullptr, nullptr, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_Equals_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Reference_Equals_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str1{};
            ani_string str2{};
            ani_boolean isEqual = ANI_FALSE;
            if (tEnv->String_NewUTF8("hello", sizeof("hello") - 1, &str1) != ANI_OK ||
                tEnv->String_NewUTF8("hello", sizeof("hello") - 1, &str2) != ANI_OK ||
                tEnv->Reference_Equals(static_cast<ani_ref>(str1), static_cast<ani_ref>(str2), &isEqual) != ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_StrictEquals_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Reference_StrictEquals_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < PART2_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) != ANI_OK) {
                return;
            }
            ani_string str1{};
            ani_string str2{};
            ani_boolean isEqual = ANI_FALSE;
            if (tEnv->String_NewUTF8("world", sizeof("world") - 1, &str1) != ANI_OK ||
                tEnv->String_NewUTF8("world", sizeof("world") - 1, &str2) != ANI_OK ||
                tEnv->Reference_StrictEquals(static_cast<ani_ref>(str1), static_cast<ani_ref>(str2), &isEqual) !=
                    ANI_OK) {
                vm->DetachCurrentThread();
                return;
            }
            successCount.fetch_add(1);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == PART2_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_Delete_Twice([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_string str{};
    if (env->String_NewUTF8("twice", sizeof("twice") - 1, &str) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->Reference_Delete(static_cast<ani_ref>(str)) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->Reference_Delete(static_cast<ani_ref>(str));
    bool hadError = ConsumeUnhandledErrorPart2(env);
    OH_LOG_INFO(LOG_APP, "testTag : Reference_Delete twice status=%{public}d, hadError=%{public}d", status, hadError);
    if (status != ANI_OK || hadError) {
        return ANI_TRUE;
    }
    return status == ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_Delete_AfterScopeDestroy([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->CreateLocalScope(PART2_LOCAL_SCOPE_CAPACITY) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_string str{};
    if (env->String_NewUTF8("scope", sizeof("scope") - 1, &str) != ANI_OK) {
        env->DestroyLocalScope();
        return ANI_FALSE;
    }
    if (env->DestroyLocalScope() != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->Reference_Delete(static_cast<ani_ref>(str));
    OH_LOG_INFO(LOG_APP, "testTag : Reference_Delete after scope destroy, status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_Reference_Equals_BothNull([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef{};
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_FALSE;
    if (env->Reference_Equals(nullRef, nullRef, &result) != ANI_OK) {
        return ANI_FALSE;
    }
    return result == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_Equals_NullVsUndefined([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef{};
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref undefRef{};
    if (env->GetUndefined(&undefRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_TRUE;
    ani_status status = env->Reference_Equals(nullRef, undefRef, &result);
    bool hadError = ConsumeUnhandledErrorPart2(env);
    if (status != ANI_OK || hadError) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : Reference_Equals null vs undefined result=%{public}d, status=%{public}d", result,
                status);
    return (result == ANI_FALSE || result == ANI_TRUE) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_StrictEquals_BothNull([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef{};
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_FALSE;
    if (env->Reference_StrictEquals(nullRef, nullRef, &result) != ANI_OK) {
        return ANI_FALSE;
    }
    return result == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Reference_StrictEquals_NullVsUndefined([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef{};
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref undefRef{};
    if (env->GetUndefined(&undefRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_TRUE;
    if (env->Reference_StrictEquals(nullRef, undefRef, &result) != ANI_OK) {
        return ANI_FALSE;
    }
    return result == ANI_FALSE ? ANI_TRUE : ANI_FALSE;
}

#endif // ARKTS_ANI_TEST_SCOPEREFCOVERED_H
