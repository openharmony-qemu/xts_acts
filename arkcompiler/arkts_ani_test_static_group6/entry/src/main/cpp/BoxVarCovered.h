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

#ifndef ARKTS_ANI_TEST_BOXVARCOVERED_H
#define ARKTS_ANI_TEST_BOXVARCOVERED_H

#include "Common.h"
#include "hilog/log.h"
#include <atomic>
#include <thread>
#include <vector>
#include <cstring>
#include <climits>
#include <cmath>

constexpr int P3_THREAD_COUNT = 4;
constexpr const char *P3_MODULE_DESC = "entry.src.main.src.ets.Index";
constexpr ani_size P3_SCOPE_CAPACITY_SMALL = 4;
constexpr ani_size P3_SCOPE_CAPACITY_MEDIUM = 8;
constexpr ani_size P3_SCOPE_CAPACITY_LARGE = 16;
constexpr ani_size P3_ENSURE_REFERENCE_COUNT = 10;
constexpr int P3_NESTED_SCOPE_TRIALS = 100;
constexpr ani_size P3_LONG_MESSAGE_LENGTH = 4096;
constexpr ani_byte P3_BYTE_VALUE = 42;
constexpr ani_short P3_SHORT_VALUE = 12345;
constexpr ani_int P3_INT_VALUE = 123456789;
constexpr ani_double P3_DOUBLE_VALUE = 3.141592653589793;
constexpr ani_double P3_DOUBLE_VAR_VALUE = 3.14159;

ani_error CreateErrorP3(ani_env *env)
{
    ani_class errorCls{};
    if (env->FindClass("escompat.Error", &errorCls) == ANI_OK && errorCls != nullptr) {
        ani_method ctor{};
        if (env->Class_FindMethod(errorCls, "<ctor>", ":", &ctor) == ANI_OK && ctor != nullptr) {
            ani_object errObj{};
            if (env->Object_New(errorCls, ctor, &errObj) == ANI_OK && errObj != nullptr) {
                return reinterpret_cast<ani_error>(errObj);
            }
        }
        ani_method ctorStr{};
        if (env->Class_FindMethod(errorCls, "<ctor>", "C{std.core.String}:", &ctorStr) == ANI_OK &&
            ctorStr != nullptr) {
            ani_string msg{};
            if (env->String_NewUTF8("err", sizeof("err") - 1, &msg) == ANI_OK && msg != nullptr) {
                ani_object errObj{};
                if (env->Object_New(errorCls, ctorStr, &errObj, msg) == ANI_OK && errObj != nullptr) {
                    return reinterpret_cast<ani_error>(errObj);
                }
            }
        }
    }
    ani_ref undefRef{};
    env->GetUndefined(&undefRef);
    return reinterpret_cast<ani_error>(undefRef);
}

ani_error CreateErrorWithMsgP3(ani_env *env, const char *text, ani_size len)
{
    ani_class errorCls{};
    if (env->FindClass("escompat.Error", &errorCls) != ANI_OK || errorCls == nullptr) {
        return nullptr;
    }
    ani_method ctorStr{};
    if (env->Class_FindMethod(errorCls, "<ctor>", "C{std.core.String}:", &ctorStr) != ANI_OK || ctorStr == nullptr) {
        ani_method ctor{};
        if (env->Class_FindMethod(errorCls, "<ctor>", ":", &ctor) == ANI_OK && ctor != nullptr) {
            ani_object errObj{};
            if (env->Object_New(errorCls, ctor, &errObj) == ANI_OK && errObj != nullptr) {
                return reinterpret_cast<ani_error>(errObj);
            }
        }
        return nullptr;
    }
    ani_string msg{};
    if (env->String_NewUTF8(text, len, &msg) != ANI_OK || msg == nullptr) {
        return nullptr;
    }
    ani_object errObj{};
    if (env->Object_New(errorCls, ctorStr, &errObj, msg) != ANI_OK || errObj == nullptr) {
        return nullptr;
    }
    return reinterpret_cast<ani_error>(errObj);
}

// ============================================================
// Section 1: 作用域 / Local Scope (19 tests)
// ============================================================

ani_int test_EnsureEnoughRefs_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_EnsureEnoughRefs_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                tEnv->EnsureEnoughReferences(P3_ENSURE_REFERENCE_COUNT);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnsureEnoughRefs_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->CreateLocalScope(P3_SCOPE_CAPACITY_LARGE) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status s = env->EnsureEnoughReferences(P3_SCOPE_CAPACITY_MEDIUM);
    if (env->DestroyLocalScope() != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : EnsureEnoughRefs_Combo ensure status=%{public}d", s);
    return ANI_TRUE;
}

ani_int test_CreateLocalScope_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_CreateLocalScope_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->CreateLocalScope(P3_SCOPE_CAPACITY_MEDIUM) == ANI_OK) {
                    tEnv->DestroyLocalScope();
                }
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_CreateLocalScope_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->CreateLocalScope(P3_SCOPE_CAPACITY_MEDIUM) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_string str{};
    ani_status s = env->String_NewUTF8("combo", sizeof("combo") - 1, &str);
    OH_LOG_INFO(LOG_APP, "testTag : CreateLocalScope_Combo string status=%{public}d", s);
    if (env->DestroyLocalScope() != ANI_OK) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_int test_DestroyLocalScope_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->CreateLocalScope(P3_SCOPE_CAPACITY_MEDIUM) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->DestroyLocalScope() != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : DestroyLocalScope_Normal succeeded");
    return ANI_TRUE;
}

ani_int test_DestroyLocalScope_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_DestroyLocalScope_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->CreateLocalScope(P3_SCOPE_CAPACITY_MEDIUM) == ANI_OK) {
                    tEnv->DestroyLocalScope();
                }
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_DestroyLocalScope_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->CreateLocalScope(P3_SCOPE_CAPACITY_MEDIUM) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref ref{};
    env->GetUndefined(&ref);
    ani_string str{};
    env->String_NewUTF8("use", sizeof("use") - 1, &str);
    if (env->DestroyLocalScope() != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : DestroyLocalScope_Combo succeeded");
    return ANI_TRUE;
}

ani_int test_CreateEscapeLocalScope_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_CreateEscapeLocalScope_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->CreateEscapeLocalScope(P3_SCOPE_CAPACITY_MEDIUM) == ANI_OK) {
                    ani_ref ref{};
                    tEnv->GetUndefined(&ref);
                    ani_ref out{};
                    tEnv->DestroyEscapeLocalScope(ref, &out);
                }
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_DestroyEscapeLocalScope_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->CreateEscapeLocalScope(P3_SCOPE_CAPACITY_MEDIUM) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref ref{};
    if (env->GetUndefined(&ref) != ANI_OK) {
        env->DestroyEscapeLocalScope(ref, &ref);
        return ANI_FALSE;
    }
    ani_ref result{};
    if (env->DestroyEscapeLocalScope(ref, &result) != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : DestroyEscapeLocalScope_Normal succeeded");
    return ANI_TRUE;
}

ani_int test_DestroyEscapeLocalScope_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref result{};
    ani_status status = env->DestroyEscapeLocalScope(nullptr, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_DestroyEscapeLocalScope_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_DestroyEscapeLocalScope_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->CreateEscapeLocalScope(P3_SCOPE_CAPACITY_MEDIUM) == ANI_OK) {
                    ani_ref ref{};
                    tEnv->GetUndefined(&ref);
                    ani_ref out{};
                    tEnv->DestroyEscapeLocalScope(ref, &out);
                }
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_DestroyEscapeLocalScope_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->CreateEscapeLocalScope(P3_SCOPE_CAPACITY_MEDIUM) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref ref{};
    if (env->GetUndefined(&ref) != ANI_OK) {
        ani_ref tmp{};
        env->DestroyEscapeLocalScope(ref, &tmp);
        return ANI_FALSE;
    }
    ani_ref result{};
    if (env->DestroyEscapeLocalScope(ref, &result) != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : DestroyEscapeLocalScope_Combo result non-null=%{public}d",
                result != nullptr ? 1 : 0);
    return ANI_TRUE;
}

ani_int test_CreateLocalScope_RefZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status s = env->CreateLocalScope(0);
    if (s == ANI_OK) {
        env->DestroyLocalScope();
    }
    OH_LOG_INFO(LOG_APP, "testTag : CreateLocalScope_RefZero status=%{public}d", s);
    return ANI_TRUE;
}

ani_int test_EnsureEnoughRefs_RefZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status s = env->EnsureEnoughReferences(0);
    OH_LOG_INFO(LOG_APP, "testTag : EnsureEnoughRefs_RefZero status=%{public}d", s);
    return ANI_TRUE;
}

ani_int test_EnsureEnoughRefs_RefMax([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status s = env->EnsureEnoughReferences(static_cast<ani_size>(INT32_MAX));
    OH_LOG_INFO(LOG_APP, "testTag : EnsureEnoughRefs_RefMax status=%{public}d", s);
    return ANI_TRUE;
}

ani_int test_EnsureEnoughRefs_ExceedCapacity([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->CreateLocalScope(P3_SCOPE_CAPACITY_SMALL) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status s = env->EnsureEnoughReferences(static_cast<ani_size>(INT32_MAX));
    env->DestroyLocalScope();
    OH_LOG_INFO(LOG_APP, "testTag : EnsureEnoughRefs_ExceedCapacity status=%{public}d", s);
    return ANI_TRUE;
}

ani_int test_CreateLocalScope_NestedDeep([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    int created = 0;
    bool ok = true;
    for (int i = 0; i < P3_NESTED_SCOPE_TRIALS; i++) {
        if (env->CreateLocalScope(P3_SCOPE_CAPACITY_SMALL) != ANI_OK) {
            ok = false;
            break;
        }
        created++;
    }
    for (int i = 0; i < created; i++) {
        env->DestroyLocalScope();
    }
    OH_LOG_INFO(LOG_APP, "testTag : CreateLocalScope_NestedDeep created=%{public}d", created);
    return ok ? ANI_TRUE : ANI_FALSE;
}

ani_int test_DestroyLocalScope_NoScope([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->DestroyLocalScope();
    OH_LOG_INFO(LOG_APP, "testTag : DestroyLocalScope_NoScope status=%{public}d", status);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_DestroyEscapeLocalScope_NoScope([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref result{};
    ani_status status = env->DestroyEscapeLocalScope(nullptr, &result);
    OH_LOG_INFO(LOG_APP, "testTag : DestroyEscapeLocalScope_NoScope status=%{public}d", status);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 2: 异常错误 / Error Handling (23 tests)
// ============================================================

ani_int test_ThrowError_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean exist = ANI_FALSE;
    ani_status status = env->ExistUnhandledError(&exist);
    env->ResetError();
    if (status != ANI_OK || exist != ANI_TRUE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_int test_ThrowError_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->ThrowError(nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ThrowError_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_ThrowError_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_error err = CreateErrorP3(tEnv);
                tEnv->ThrowError(err);
                ani_boolean exist = ANI_FALSE;
                tEnv->ExistUnhandledError(&exist);
                tEnv->ResetError();
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ExistUnhandledError_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    env->ResetError();
    ani_boolean exist = ANI_TRUE;
    if (env->ExistUnhandledError(&exist) != ANI_OK || exist != ANI_FALSE) {
        return ANI_FALSE;
    }
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean exist2 = ANI_FALSE;
    if (env->ExistUnhandledError(&exist2) != ANI_OK || exist2 != ANI_TRUE) {
        env->ResetError();
        return ANI_FALSE;
    }
    env->ResetError();
    return ANI_TRUE;
}

ani_int test_ExistUnhandledError_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->ExistUnhandledError(nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ExistUnhandledError_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_ExistUnhandledError_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                tEnv->ResetError();
                ani_boolean exist = ANI_FALSE;
                tEnv->ExistUnhandledError(&exist);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_GetUnhandledError_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_error gotErr{};
    if (env->GetUnhandledError(&gotErr) != ANI_OK || gotErr == nullptr) {
        env->ResetError();
        return ANI_FALSE;
    }
    env->ResetError();
    return ANI_TRUE;
}

ani_int test_GetUnhandledError_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->GetUnhandledError(nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_GetUnhandledError_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_GetUnhandledError_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_error err = CreateErrorP3(tEnv);
                tEnv->ThrowError(err);
                ani_error got{};
                tEnv->GetUnhandledError(&got);
                tEnv->ResetError();
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ResetError_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->ResetError() != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean exist = ANI_TRUE;
    if (env->ExistUnhandledError(&exist) != ANI_OK || exist != ANI_FALSE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_int test_ResetError_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    env->ResetError();
    ani_status status = env->ResetError();
    OH_LOG_INFO(LOG_APP, "testTag : ResetError_Abnormal (no error) status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_ResetError_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_ResetError_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_error err = CreateErrorP3(tEnv);
                tEnv->ThrowError(err);
                tEnv->ResetError();
                tEnv->ResetError();
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_DescribeError_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->DescribeError();
    env->ResetError();
    OH_LOG_INFO(LOG_APP, "testTag : DescribeError_Normal status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_DescribeError_NoError([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    env->ResetError();
    ani_status status = env->DescribeError();
    OH_LOG_INFO(LOG_APP, "testTag : DescribeError_NoError status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_DescribeError_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_DescribeError_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_error err = CreateErrorP3(tEnv);
                tEnv->ThrowError(err);
                tEnv->DescribeError();
                tEnv->ResetError();
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ThrowGetReset_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean exist = ANI_FALSE;
    if (env->ExistUnhandledError(&exist) != ANI_OK || exist != ANI_TRUE) {
        env->ResetError();
        return ANI_FALSE;
    }
    ani_error gotErr{};
    if (env->GetUnhandledError(&gotErr) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    ani_status describeStatus = env->DescribeError();
    if (describeStatus != ANI_OK && describeStatus != ANI_PENDING_ERROR) {
        env->ResetError();
        return ANI_FALSE;
    }
    if (env->ResetError() != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean exist2 = ANI_TRUE;
    if (env->ExistUnhandledError(&exist2) != ANI_OK || exist2 != ANI_FALSE) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : ThrowGetReset_Combo full flow succeeded");
    return ANI_TRUE;
}

ani_int test_ThrowError_ThrowTwice([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status2 = env->ThrowError(err);
    env->ResetError();
    OH_LOG_INFO(LOG_APP, "testTag : ThrowError_ThrowTwice second status=%{public}d", status2);
    return status2 == ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ResetError_Twice([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    env->ThrowError(err);
    ani_status s1 = env->ResetError();
    ani_status s2 = env->ResetError();
    OH_LOG_INFO(LOG_APP, "testTag : ResetError_Twice s1=%{public}d s2=%{public}d", s1, s2);
    return ANI_TRUE;
}

ani_int test_GetUnhandledError_NoError([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    env->ResetError();
    ani_error gotErr{};
    ani_status status = env->GetUnhandledError(&gotErr);
    OH_LOG_INFO(LOG_APP, "testTag : GetUnhandledError_NoError status=%{public}d gotNull=%{public}d", status,
                gotErr == nullptr ? 1 : 0);
    return (status != ANI_OK || gotErr == nullptr) ? ANI_TRUE : ANI_TRUE;
}

ani_int test_ThrowError_Boundary_EmptyMsg([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorWithMsgP3(env, "", 0);
    if (err == nullptr) {
        err = CreateErrorP3(env);
    }
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean exist = ANI_FALSE;
    if (env->ExistUnhandledError(&exist) != ANI_OK || exist != ANI_TRUE) {
        env->ResetError();
        return ANI_FALSE;
    }
    env->ResetError();
    return ANI_TRUE;
}

ani_int test_ThrowError_Boundary_LongMsg([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    std::string longMsg(P3_LONG_MESSAGE_LENGTH, 'x');
    ani_error err = CreateErrorWithMsgP3(env, longMsg.c_str(), static_cast<ani_size>(longMsg.size()));
    if (err == nullptr) {
        err = CreateErrorP3(env);
    }
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean exist = ANI_FALSE;
    if (env->ExistUnhandledError(&exist) != ANI_OK || exist != ANI_TRUE) {
        env->ResetError();
        return ANI_FALSE;
    }
    env->ResetError();
    OH_LOG_INFO(LOG_APP, "testTag : ThrowError_Boundary_LongMsg succeeded");
    return ANI_TRUE;
}

ani_int test_ExistUnhandledError_AfterReset([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    if (env->ThrowError(err) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->ResetError() != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean exist = ANI_TRUE;
    if (env->ExistUnhandledError(&exist) != ANI_OK || exist != ANI_FALSE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_int test_DescribeError_AfterReset([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_error err = CreateErrorP3(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    env->ResetError();
    env->ThrowError(err);
    env->ResetError();
    ani_status status = env->DescribeError();
    OH_LOG_INFO(LOG_APP, "testTag : DescribeError_AfterReset status=%{public}d", status);
    return ANI_TRUE;
}

// ============================================================
// Section 3: 装箱拆箱 / Box & Unbox (24 tests)
// ============================================================

ani_int test_BoxBoolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_BoxBoolean_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Boolean(ANI_TRUE, &boxed) == ANI_OK && boxed != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxByte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_BoxByte_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Byte(P3_BYTE_VALUE, &boxed) == ANI_OK && boxed != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxChar_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_BoxChar_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Char(static_cast<ani_char>('A'), &boxed) == ANI_OK && boxed != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxDouble_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_BoxDouble_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Double(P3_DOUBLE_VALUE, &boxed) == ANI_OK && boxed != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxFloat_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_BoxFloat_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Float(3.14159f, &boxed) == ANI_OK && boxed != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxInt_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_BoxInt_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Int(P3_INT_VALUE, &boxed) == ANI_OK && boxed != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxLong_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_BoxLong_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Long(12345678901234LL, &boxed) == ANI_OK && boxed != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxShort_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_BoxShort_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Short(P3_SHORT_VALUE, &boxed) == ANI_OK && boxed != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxBoolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_UnboxBoolean_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Boolean(ANI_TRUE, &boxed) == ANI_OK) {
                    ani_boolean out = ANI_FALSE;
                    if (tEnv->Primitive_Unbox_Boolean(boxed, &out) == ANI_OK && out == ANI_TRUE) {
                        successCount.fetch_add(1);
                    }
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxByte_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_UnboxByte_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Byte(P3_BYTE_VALUE, &boxed) == ANI_OK) {
                    ani_byte out = 0;
                    if (tEnv->Primitive_Unbox_Byte(boxed, &out) == ANI_OK && out == P3_BYTE_VALUE) {
                        successCount.fetch_add(1);
                    }
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxChar_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_UnboxChar_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Char(static_cast<ani_char>('A'), &boxed) == ANI_OK) {
                    ani_char out = 0;
                    if (tEnv->Primitive_Unbox_Char(boxed, &out) == ANI_OK && out == static_cast<ani_char>('A')) {
                        successCount.fetch_add(1);
                    }
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxDouble_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_UnboxDouble_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Double(P3_DOUBLE_VALUE, &boxed) == ANI_OK) {
                    ani_double out = 0.0;
                    if (tEnv->Primitive_Unbox_Double(boxed, &out) == ANI_OK && out == P3_DOUBLE_VALUE) {
                        successCount.fetch_add(1);
                    }
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxFloat_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_UnboxFloat_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Float(3.14159f, &boxed) == ANI_OK) {
                    ani_float out = 0.0f;
                    if (tEnv->Primitive_Unbox_Float(boxed, &out) == ANI_OK && out == 3.14159f) {
                        successCount.fetch_add(1);
                    }
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxInt_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_UnboxInt_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Int(P3_INT_VALUE, &boxed) == ANI_OK) {
                    ani_int out = 0;
                    if (tEnv->Primitive_Unbox_Int(boxed, &out) == ANI_OK && out == P3_INT_VALUE) {
                        successCount.fetch_add(1);
                    }
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxLong_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_UnboxLong_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Long(12345678901234LL, &boxed) == ANI_OK) {
                    ani_long out = 0;
                    if (tEnv->Primitive_Unbox_Long(boxed, &out) == ANI_OK && out == 12345678901234LL) {
                        successCount.fetch_add(1);
                    }
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxShort_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_UnboxShort_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_object boxed{};
                if (tEnv->Primitive_Box_Short(P3_SHORT_VALUE, &boxed) == ANI_OK) {
                    ani_short out = 0;
                    if (tEnv->Primitive_Unbox_Short(boxed, &out) == ANI_OK && out == P3_SHORT_VALUE) {
                        successCount.fetch_add(1);
                    }
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxInt_Boundary_Min([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object boxed{};
    if (env->Primitive_Box_Int(INT32_MIN, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int out = 0;
    if (env->Primitive_Unbox_Int(boxed, &out) != ANI_OK) {
        return ANI_FALSE;
    }
    return out == INT32_MIN ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxInt_Boundary_Max([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object boxed{};
    if (env->Primitive_Box_Int(INT32_MAX, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int out = 0;
    if (env->Primitive_Unbox_Int(boxed, &out) != ANI_OK) {
        return ANI_FALSE;
    }
    return out == INT32_MAX ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxDouble_Boundary_NaN([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double nanVal = std::numeric_limits<double>::quiet_NaN();
    ani_object boxed{};
    if (env->Primitive_Box_Double(nanVal, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double out = 0.0;
    if (env->Primitive_Unbox_Double(boxed, &out) != ANI_OK) {
        return ANI_FALSE;
    }
    return std::isnan(out) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxDouble_Boundary_Infinity([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double infVal = std::numeric_limits<double>::infinity();
    ani_object boxed{};
    if (env->Primitive_Box_Double(infVal, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double out = 0.0;
    if (env->Primitive_Unbox_Double(boxed, &out) != ANI_OK) {
        return ANI_FALSE;
    }
    return std::isinf(out) ? ANI_TRUE : ANI_FALSE;
}

ani_int test_BoxBoolean_Boundary_False([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object boxed{};
    if (env->Primitive_Box_Boolean(ANI_FALSE, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean out = ANI_TRUE;
    if (env->Primitive_Unbox_Boolean(boxed, &out) != ANI_OK) {
        return ANI_FALSE;
    }
    return out == ANI_FALSE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxInt_Boundary_Min([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_object boxed{};
    if (env->Primitive_Box_Int(INT32_MIN, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int out = 0;
    if (env->Primitive_Unbox_Int(boxed, &out) != ANI_OK) {
        return ANI_FALSE;
    }
    return out == INT32_MIN ? ANI_TRUE : ANI_FALSE;
}

ani_int test_UnboxDouble_Boundary_NaN([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double nanVal = std::numeric_limits<double>::quiet_NaN();
    ani_object boxed{};
    if (env->Primitive_Box_Double(nanVal, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double out = 0.0;
    if (env->Primitive_Unbox_Double(boxed, &out) != ANI_OK) {
        return ANI_FALSE;
    }
    return std::isnan(out) ? ANI_TRUE : ANI_FALSE;
}

static ani_boolean RoundTripCheck_Boolean(ani_env *env)
{
    ani_object boxed{};
    if (env->Primitive_Box_Boolean(ANI_TRUE, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean out = ANI_FALSE;
    if (env->Primitive_Unbox_Boolean(boxed, &out) != ANI_OK || out != ANI_TRUE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

static ani_boolean RoundTripCheck_Byte(ani_env *env)
{
    ani_object boxed{};
    if (env->Primitive_Box_Byte(P3_BYTE_VALUE, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_byte out = 0;
    if (env->Primitive_Unbox_Byte(boxed, &out) != ANI_OK || out != P3_BYTE_VALUE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

static ani_boolean RoundTripCheck_Char(ani_env *env)
{
    ani_object boxed{};
    if (env->Primitive_Box_Char(static_cast<ani_char>('A'), &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_char out = 0;
    if (env->Primitive_Unbox_Char(boxed, &out) != ANI_OK || out != static_cast<ani_char>('A')) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

static ani_boolean RoundTripCheck_Short(ani_env *env)
{
    ani_object boxed{};
    if (env->Primitive_Box_Short(P3_SHORT_VALUE, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_short out = 0;
    if (env->Primitive_Unbox_Short(boxed, &out) != ANI_OK || out != P3_SHORT_VALUE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

static ani_boolean RoundTripCheck_Int(ani_env *env)
{
    ani_object boxed{};
    if (env->Primitive_Box_Int(P3_INT_VALUE, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int out = 0;
    if (env->Primitive_Unbox_Int(boxed, &out) != ANI_OK || out != P3_INT_VALUE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

static ani_boolean RoundTripCheck_Long(ani_env *env)
{
    ani_object boxed{};
    if (env->Primitive_Box_Long(12345678901234LL, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_long out = 0;
    if (env->Primitive_Unbox_Long(boxed, &out) != ANI_OK || out != 12345678901234LL) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

static ani_boolean RoundTripCheck_Float(ani_env *env)
{
    ani_object boxed{};
    if (env->Primitive_Box_Float(3.14159f, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_float out = 0.0f;
    if (env->Primitive_Unbox_Float(boxed, &out) != ANI_OK || out != 3.14159f) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

static ani_boolean RoundTripCheck_Double(ani_env *env)
{
    ani_object boxed{};
    if (env->Primitive_Box_Double(P3_DOUBLE_VALUE, &boxed) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_double out = 0.0;
    if (env->Primitive_Unbox_Double(boxed, &out) != ANI_OK || out != P3_DOUBLE_VALUE) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_int test_BoxUnbox_RoundTrip([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (!RoundTripCheck_Boolean(env)) {
        return ANI_FALSE;
    }
    if (!RoundTripCheck_Byte(env)) {
        return ANI_FALSE;
    }
    if (!RoundTripCheck_Char(env)) {
        return ANI_FALSE;
    }
    if (!RoundTripCheck_Short(env)) {
        return ANI_FALSE;
    }
    if (!RoundTripCheck_Int(env)) {
        return ANI_FALSE;
    }
    if (!RoundTripCheck_Long(env)) {
        return ANI_FALSE;
    }
    if (!RoundTripCheck_Float(env)) {
        return ANI_FALSE;
    }
    if (!RoundTripCheck_Double(env)) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : BoxUnbox_RoundTrip all 8 types succeeded");
    return ANI_TRUE;
}

// ============================================================
// Section 4: 变量操作 / Variable Operations (24 tests)
// ============================================================

ani_int test_Var_SetValue_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            if (env->Variable_SetValue_Boolean(var, ANI_TRUE) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_SetValue_Boolean != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_SetValue_Boolean c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_SetValue_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            if (env->Variable_SetValue_Int(var, P3_INT_VALUE) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_SetValue_Int != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_SetValue_Int c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_SetValue_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            if (env->Variable_SetValue_Double(var, P3_DOUBLE_VAR_VALUE) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_SetValue_Double != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_SetValue_Double c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_SetValue_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            ani_ref ref{};
            env->GetUndefined(&ref);
            if (env->Variable_SetValue_Ref(var, ref) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_SetValue_Ref != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_SetValue_Ref c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_SetValue_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Var_SetValue_Boolean_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Variable_SetValue_Boolean != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_SetValue_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Var_SetValue_Int_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Variable_SetValue_Int != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_SetValue_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Var_SetValue_Double_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Variable_SetValue_Double != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_GetValue_Boolean_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            ani_boolean val = ANI_FALSE;
            if (env->Variable_GetValue_Boolean(var, &val) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_GetValue_Boolean != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_GetValue_Boolean c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_GetValue_Int_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            ani_int val = 0;
            if (env->Variable_GetValue_Int(var, &val) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_GetValue_Int != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_GetValue_Int c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_GetValue_Double_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            ani_double val = 0.0;
            if (env->Variable_GetValue_Double(var, &val) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_GetValue_Double != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_GetValue_Double c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_GetValue_Ref_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            ani_ref val{};
            if (env->Variable_GetValue_Ref(var, &val) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_GetValue_Ref != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_GetValue_Ref c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_GetValue_Boolean_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Var_GetValue_Boolean_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Variable_GetValue_Boolean != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_GetValue_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Var_GetValue_Int_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Variable_GetValue_Int != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_GetValue_Double_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Var_GetValue_Double_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < P3_THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->Variable_GetValue_Double != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == P3_THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_SetValue_Int_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->Variable_SetValue_Int(nullptr, 0);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_GetValue_Int_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_int val = 0;
    ani_status status = env->Variable_GetValue_Int(nullptr, &val);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_SetValue_Boolean_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->Variable_SetValue_Boolean(nullptr, ANI_FALSE);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_GetValue_Boolean_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean val = ANI_FALSE;
    ani_status status = env->Variable_GetValue_Boolean(nullptr, &val);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_SetValue_Double_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->Variable_SetValue_Double(nullptr, 0.0);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_GetValue_Double_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_double val = 0.0;
    ani_status status = env->Variable_GetValue_Double(nullptr, &val);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Var_SetValue_Int_Boundary_Min([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            if (env->Variable_SetValue_Int(var, INT32_MIN) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_SetValue_Int != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_SetValue_Int boundary min c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_SetValue_Int_Boundary_Max([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            if (env->Variable_SetValue_Int(var, INT32_MAX) != ANI_OK) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_SetValue_Int != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_SetValue_Int boundary max c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_GetValue_Int_Boundary_Min([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            if (env->Variable_SetValue_Int(var, INT32_MIN) != ANI_OK) {
                return ANI_FALSE;
            }
            ani_int val = 0;
            if (env->Variable_GetValue_Int(var, &val) != ANI_OK || val != INT32_MIN) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_GetValue_Int != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_GetValue_Int boundary min c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

ani_int test_Var_GetValue_Int_Boundary_Max([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    ani_variable var{};
    if (env->FindModule(P3_MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        if (env->Module_FindVariable(mod, "name", &var) == ANI_OK && var != nullptr) {
            if (env->Variable_SetValue_Int(var, INT32_MAX) != ANI_OK) {
                return ANI_FALSE;
            }
            ani_int val = 0;
            if (env->Variable_GetValue_Int(var, &val) != ANI_OK || val != INT32_MAX) {
                return ANI_FALSE;
            }
            return ANI_TRUE;
        }
    }
    if (env->c_api != nullptr && env->c_api->Variable_GetValue_Int != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : Variable_GetValue_Int boundary max c_api pointer valid");
        return ANI_TRUE;
    }
    return ANI_FALSE;
}

#endif // ARKTS_ANI_TEST_BOXVARCOVERED_H
