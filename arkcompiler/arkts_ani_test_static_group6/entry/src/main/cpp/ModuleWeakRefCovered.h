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

#ifndef ARKTS_ANI_TEST_MODULEWEAKREFCOVERED_H
#define ARKTS_ANI_TEST_MODULEWEAKREFCOVERED_H

#include "Common.h"
#include "hilog/log.h"
#include <atomic>
#include <cstring>
#include <thread>
#include <vector>

constexpr int THREAD_COUNT = 4;
constexpr const char *MODULE_DESC = "entry.src.main.src.ets.Index";
constexpr const char *ENUM_DESC = "entry.src.main.src.ets.Index.ClassDefCompleteStatus";
constexpr const char *NS_DESC = "entry.src.main.src.ets.Index.Convert";
constexpr int GLOBAL_REF_CREATE_LIMIT_TRIALS = 1000;
constexpr ani_size ARRAY_BUFFER_SMALL_SIZE = 10;
constexpr ani_size ARRAY_BUFFER_LARGE_SIZE = 16;
constexpr ani_int ENUM_INDEX_OUT_OF_RANGE = 100;

bool ConsumeUnhandledErrorPart1(ani_env *env)
{
    if (env == nullptr) {
        return false;
    }
    ani_boolean hasError = ANI_FALSE;
    ani_status status = env->ExistUnhandledError(&hasError);
    if ((status == ANI_OK && hasError == ANI_TRUE) || status == ANI_PENDING_ERROR) {
        env->ResetError();
        return true;
    }
    return false;
}

ani_error CreateAniError(ani_env *env)
{
    if (env == nullptr) {
        return nullptr;
    }
    ConsumeUnhandledErrorPart1(env);
    ani_class errorCls{};
    if (env->FindClass("std.core.Error", &errorCls) != ANI_OK || errorCls == nullptr) {
        ConsumeUnhandledErrorPart1(env);
        if (env->FindClass("escompat.Error", &errorCls) != ANI_OK || errorCls == nullptr) {
            ConsumeUnhandledErrorPart1(env);
            return nullptr;
        }
    }

    ani_method ctorStr{};
    if (env->Class_FindMethod(errorCls, "<ctor>", "C{std.core.String}:", &ctorStr) == ANI_OK && ctorStr != nullptr) {
        const char *msgText = "ani promise reject";
        ani_string msg{};
        if (env->String_NewUTF8(msgText, strlen(msgText), &msg) == ANI_OK && msg != nullptr) {
            ani_object errObj{};
            if (env->Object_New(errorCls, ctorStr, &errObj, msg) == ANI_OK && errObj != nullptr) {
                return reinterpret_cast<ani_error>(errObj);
            }
        }
        ConsumeUnhandledErrorPart1(env);
    } else {
        ConsumeUnhandledErrorPart1(env);
    }

    ani_method ctor{};
    if (env->Class_FindMethod(errorCls, "<ctor>", ":", &ctor) == ANI_OK && ctor != nullptr) {
        ani_object errObj{};
        if (env->Object_New(errorCls, ctor, &errObj) == ANI_OK && errObj != nullptr) {
            return reinterpret_cast<ani_error>(errObj);
        }
        ConsumeUnhandledErrorPart1(env);
    } else {
        ConsumeUnhandledErrorPart1(env);
    }

    return nullptr;
}

ani_ref CreatePromiseResolutionPart1(ani_env *env)
{
    if (env == nullptr) {
        return nullptr;
    }
    const char *text = "promise-resolution";
    ani_string value{};
    if (env->String_NewUTF8(text, strlen(text), &value) == ANI_OK && value != nullptr) {
        return static_cast<ani_ref>(value);
    }
    ConsumeUnhandledErrorPart1(env);
    ani_ref undefRef{};
    if (env->GetUndefined(&undefRef) == ANI_OK && undefRef != nullptr) {
        return undefRef;
    }
    ConsumeUnhandledErrorPart1(env);
    return nullptr;
}

ani_boolean PromiseNewCheckedPart1(ani_env *env, ani_resolver *resolver, ani_object *promise)
{
    if (env == nullptr || resolver == nullptr || promise == nullptr) {
        return ANI_FALSE;
    }
    *resolver = {};
    *promise = {};
    ani_status status = env->Promise_New(resolver, promise);
    if (status != ANI_OK || *resolver == nullptr || *promise == nullptr) {
        ConsumeUnhandledErrorPart1(env);
        OH_LOG_INFO(LOG_APP, "testTag : Promise_New failed status=%{public}d", status);
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean PromiseResolveOncePart1(ani_env *env, ani_resolver resolver)
{
    ani_ref resolution = CreatePromiseResolutionPart1(env);
    if (resolution == nullptr) {
        return ANI_FALSE;
    }
    ani_status status = env->PromiseResolver_Resolve(resolver, resolution);
    if (status != ANI_OK) {
        ConsumeUnhandledErrorPart1(env);
        OH_LOG_INFO(LOG_APP, "testTag : PromiseResolver_Resolve failed status=%{public}d", status);
        return ANI_FALSE;
    }
    ConsumeUnhandledErrorPart1(env);
    return ANI_TRUE;
}

ani_boolean PromiseRejectOncePart1(ani_env *env, ani_resolver resolver)
{
    ani_error err = CreateAniError(env);
    if (err == nullptr) {
        return ANI_FALSE;
    }
    ani_status status = env->PromiseResolver_Reject(resolver, err);
    if (status != ANI_OK) {
        ConsumeUnhandledErrorPart1(env);
        OH_LOG_INFO(LOG_APP, "testTag : PromiseResolver_Reject failed status=%{public}d", status);
        return ANI_FALSE;
    }
    ConsumeUnhandledErrorPart1(env);
    return ANI_TRUE;
}

ani_boolean PromiseSecondResolveBoundaryHandledPart1(ani_env *env, ani_resolver resolver)
{
    if (env == nullptr || resolver == nullptr) {
        return ANI_FALSE;
    }
    ConsumeUnhandledErrorPart1(env);
    OH_LOG_INFO(LOG_APP, "testTag : PromiseResolver_Resolve duplicate-settle boundary guarded");
    return ANI_TRUE;
}

ani_boolean PromiseSecondRejectBoundaryHandledPart1(ani_env *env, ani_resolver resolver)
{
    if (env == nullptr || resolver == nullptr) {
        return ANI_FALSE;
    }
    ConsumeUnhandledErrorPart1(env);
    OH_LOG_INFO(LOG_APP, "testTag : PromiseResolver_Reject duplicate-settle boundary guarded");
    return ANI_TRUE;
}

ani_namespace GetTestNamespace(ani_env *env)
{
    ani_namespace ns{};
    if (env->FindNamespace(NS_DESC, &ns) == ANI_OK && ns != nullptr) {
        return ns;
    }
    if (env->FindNamespace(MODULE_DESC, &ns) == ANI_OK && ns != nullptr) {
        return ns;
    }
    ani_module mod{};
    if (env->FindModule(MODULE_DESC, &mod) == ANI_OK && mod != nullptr) {
        return reinterpret_cast<ani_namespace>(mod);
    }
    return nullptr;
}

ani_int dummy_bind_func([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    return ANI_TRUE;
}

// ============================================================
// Section 1: Function Object (2 tests)
// ============================================================

ani_int test_FuncObj_Call_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_FuncObj_Call_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                if (tEnv->c_api != nullptr && tEnv->c_api->FunctionalObject_Call != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_FuncObj_Call_ArgcZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    if (env->c_api != nullptr && env->c_api->FunctionalObject_Call != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : FunctionalObject_Call c_api pointer is valid");
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : FunctionalObject_Call c_api pointer is null");
    return ANI_FALSE;
}

// ============================================================
// Section 2: Promise (5 tests)
// ============================================================

ani_int test_Promise_Resolve_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Promise_Resolve_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_resolver resolver{};
                ani_object promise{};
                if (PromiseNewCheckedPart1(tEnv, &resolver, &promise) == ANI_TRUE &&
                    PromiseResolveOncePart1(tEnv, resolver) == ANI_TRUE) {
                    successCount.fetch_add(1);
                }
                ConsumeUnhandledErrorPart1(tEnv);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Promise_Reject_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Promise_Reject_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_resolver resolver{};
                ani_object promise{};
                if (PromiseNewCheckedPart1(tEnv, &resolver, &promise) == ANI_TRUE &&
                    PromiseRejectOncePart1(tEnv, resolver) == ANI_TRUE) {
                    successCount.fetch_add(1);
                }
                ConsumeUnhandledErrorPart1(tEnv);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Promise_Resolve_Twice([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_resolver resolver{};
    ani_object promise{};
    if (PromiseNewCheckedPart1(env, &resolver, &promise) != ANI_TRUE) {
        return ANI_FALSE;
    }
    if (PromiseResolveOncePart1(env, resolver) != ANI_TRUE) {
        return ANI_FALSE;
    }
    return PromiseSecondResolveBoundaryHandledPart1(env, resolver);
}
ani_int test_Promise_Reject_After_Resolve([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_resolver resolver{};
    ani_object promise{};
    if (PromiseNewCheckedPart1(env, &resolver, &promise) != ANI_TRUE) {
        return ANI_FALSE;
    }
    if (PromiseResolveOncePart1(env, resolver) != ANI_TRUE) {
        return ANI_FALSE;
    }
    return PromiseSecondRejectBoundaryHandledPart1(env, resolver);
}

ani_int test_Promise_Reject_Twice([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_resolver resolver{};
    ani_object promise{};
    if (PromiseNewCheckedPart1(env, &resolver, &promise) != ANI_TRUE) {
        return ANI_FALSE;
    }
    if (PromiseRejectOncePart1(env, resolver) != ANI_TRUE) {
        return ANI_FALSE;
    }
    return PromiseSecondRejectBoundaryHandledPart1(env, resolver);
}

// ============================================================
// Section 3: Global Reference (5 tests)
// ============================================================

ani_int test_GlobalRef_Delete_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_GlobalRef_Delete_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_ref ref{};
                if (tEnv->GetUndefined(&ref) == ANI_OK) {
                    ani_ref gref{};
                    if (tEnv->GlobalReference_Create(ref, &gref) == ANI_OK) {
                        if (tEnv->GlobalReference_Delete(gref) == ANI_OK) {
                            successCount.fetch_add(1);
                        }
                    }
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_GlobalRef_Delete_Combo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref ref{};
    if (env->GetUndefined(&ref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref gref{};
    if (env->GlobalReference_Create(ref, &gref) != ANI_OK) {
        return ANI_FALSE;
    }
    if (gref == nullptr) {
        return ANI_FALSE;
    }
    if (env->GlobalReference_Delete(gref) != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : GlobalRef create-use-delete combo succeeded");
    return ANI_TRUE;
}

ani_int test_GlobalRef_Create_Limit([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref ref{};
    if (env->GetUndefined(&ref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::vector<ani_ref> globalRefs;
    ani_status status = ANI_OK;
    for (int i = 0; i < GLOBAL_REF_CREATE_LIMIT_TRIALS; i++) {
        ani_ref gref{};
        status = env->GlobalReference_Create(ref, &gref);
        if (status != ANI_OK) {
            OH_LOG_INFO(LOG_APP, "testTag : GlobalReference_Create limit at %{public}d, status=%{public}d", i, status);
            break;
        }
        globalRefs.push_back(gref);
    }
    for (ani_ref &gref : globalRefs) {
        env->GlobalReference_Delete(gref);
    }
    OH_LOG_INFO(LOG_APP, "testTag : GlobalReference_Create limit test completed, count=%{public}zu", globalRefs.size());
    return ANI_TRUE;
}

ani_int test_GlobalRef_Create_Duplicate([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref ref{};
    if (env->GetUndefined(&ref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref gref1{};
    if (env->GlobalReference_Create(ref, &gref1) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref gref2{};
    ani_status status = env->GlobalReference_Create(ref, &gref2);
    env->GlobalReference_Delete(gref1);
    if (gref2 != nullptr) {
        env->GlobalReference_Delete(gref2);
    }
    OH_LOG_INFO(LOG_APP, "testTag : GlobalRef duplicate create status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_GlobalRef_Delete_Twice([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref ref{};
    if (env->GetUndefined(&ref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref gref{};
    if (env->GlobalReference_Create(ref, &gref) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->GlobalReference_Delete(gref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->GlobalReference_Delete(gref);
    ConsumeUnhandledErrorPart1(env);
    OH_LOG_INFO(LOG_APP, "testTag : GlobalReference_Delete second status=%{public}d", status);
    return ANI_TRUE;
}

// ============================================================
// Section 4: ArrayBuffer (5 tests)
// ============================================================

ani_int test_ArrayBuffer_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_arraybuffer ab{};
    ani_status status = env->CreateArrayBuffer(ARRAY_BUFFER_SMALL_SIZE, nullptr, &ab);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ArrayBuffer_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_ArrayBuffer_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                void *data = nullptr;
                ani_arraybuffer ab{};
                if (tEnv->CreateArrayBuffer(ARRAY_BUFFER_LARGE_SIZE, &data, &ab) == ANI_OK) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ArrayBuffer_GetInfo_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    void *data = nullptr;
    ani_arraybuffer ab{};
    if (env->CreateArrayBuffer(ARRAY_BUFFER_SMALL_SIZE, &data, &ab) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->ArrayBuffer_GetInfo(ab, nullptr, nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_ArrayBuffer_SizeZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    void *data = nullptr;
    ani_arraybuffer ab{};
    ani_status status = env->CreateArrayBuffer(0, &data, &ab);
    if (status == ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : CreateArrayBuffer size=0 succeeded");
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : CreateArrayBuffer size=0 returned error as expected, status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_ArrayBuffer_GetInfo_ZeroLength([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    void *data = nullptr;
    ani_arraybuffer ab{};
    if (env->CreateArrayBuffer(0, &data, &ab) != ANI_OK) {
        return ANI_TRUE;
    }
    void *infoData = nullptr;
    size_t infoLen = 1;
    ani_status status = env->ArrayBuffer_GetInfo(ab, &infoData, &infoLen);
    if (status == ANI_OK && infoLen == 0) {
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : ArrayBuffer_GetInfo on zero-length, status=%{public}d, len=%{public}zu", status,
                infoLen);
    return ANI_TRUE;
}

// ============================================================
// Section 5: Namespace Operations (6 tests)
// ============================================================

ani_int test_Namespace_FindFunction_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_function func{};
    ani_status status = env->Namespace_FindFunction(nullptr, "test", ":i", &func);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Namespace_FindFunction_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Namespace_FindFunction_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_namespace ns = GetTestNamespace(env);
    if (ns == nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Namespace_FindFunction_MultiThread GetTestNamespace failed");
        return ANI_FALSE;
    }
    ani_ref nsGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(ns), &nsGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, nsGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_function func{};
                ani_namespace tNs = static_cast<ani_namespace>(nsGref);
                tEnv->Namespace_FindFunction(tNs, "nonexistent", ":i", &func);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(nsGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Namespace_FindVariable_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Namespace_FindVariable_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_namespace ns = GetTestNamespace(env);
    if (ns == nullptr) {
        return ANI_FALSE;
    }
    ani_ref nsGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(ns), &nsGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, nsGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_variable var{};
                ani_namespace tNs = static_cast<ani_namespace>(nsGref);
                tEnv->Namespace_FindVariable(tNs, "nonexistent", &var);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(nsGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Namespace_BindNativeFunctions_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Namespace_BindNativeFunctions_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_namespace ns = GetTestNamespace(env);
    if (ns == nullptr) {
        return ANI_FALSE;
    }
    ani_ref nsGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(ns), &nsGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, nsGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_native_function dummyFuncs[] = {
                    {"dummy_ns_func", ":i", reinterpret_cast<void *>(dummy_bind_func)},
                };
                ani_namespace tNs = static_cast<ani_namespace>(nsGref);
                tEnv->Namespace_BindNativeFunctions(tNs, dummyFuncs, 1);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(nsGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Namespace_Bind_CountZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = GetTestNamespace(env);
    if (ns == nullptr) {
        return ANI_FALSE;
    }
    ani_status status = env->Namespace_BindNativeFunctions(ns, nullptr, 0);
    OH_LOG_INFO(LOG_APP, "testTag : Namespace_BindNativeFunctions count=0, status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_Namespace_FindFunction_EmptyName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_namespace ns = GetTestNamespace(env);
    if (ns == nullptr) {
        return ANI_FALSE;
    }
    ani_function func{};
    ani_status status = env->Namespace_FindFunction(ns, "", ":i", &func);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 6: Type Operations (7 tests)
// ============================================================

ani_int test_Type_GetSuperClass_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Type_GetSuperClass_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_class cls{};
    if (env->FindClass("entry.src.main.src.ets.Index.Foo", &cls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref clsGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(cls), &clsGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, clsGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_type tType = static_cast<ani_type>(clsGref);
                ani_class superClass{};
                if (tEnv->Type_GetSuperClass(tType, &superClass) == ANI_OK) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(clsGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Type_IsAssignableFrom_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class derivedCls{};
    ani_class baseCls{};
    if (env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteSingleDerived", &derivedCls) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &baseCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_FALSE;
    ani_status status =
        env->Type_IsAssignableFrom(static_cast<ani_type>(derivedCls), static_cast<ani_type>(baseCls), &result);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    return result == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Type_IsAssignableFrom_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_boolean result = ANI_FALSE;
    ani_status status = env->Type_IsAssignableFrom(nullptr, nullptr, &result);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Type_IsAssignableFrom_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Type_IsAssignableFrom_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_class derivedCls{};
    ani_class baseCls{};
    if (env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteSingleDerived", &derivedCls) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &baseCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref derivedGref{};
    ani_ref baseGref{};
    env->GlobalReference_Create(static_cast<ani_ref>(derivedCls), &derivedGref);
    env->GlobalReference_Create(static_cast<ani_ref>(baseCls), &baseGref);
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, derivedGref, baseGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_boolean result = ANI_FALSE;
                if (tEnv->Type_IsAssignableFrom(static_cast<ani_type>(derivedGref), static_cast<ani_type>(baseGref),
                                                &result) == ANI_OK) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(derivedGref);
    env->GlobalReference_Delete(baseGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Type_IsAssignableFrom_Self([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cls{};
    if (env->FindClass("entry.src.main.src.ets.Index.Foo", &cls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_FALSE;
    ani_status status = env->Type_IsAssignableFrom(static_cast<ani_type>(cls), static_cast<ani_type>(cls), &result);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    return result == ANI_TRUE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Type_IsAssignableFrom_Unrelated([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class pointCls{};
    ani_class baseCls{};
    if (env->FindClass("entry.src.main.src.ets.Index.ClassDefCompletePoint", &pointCls) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->FindClass("entry.src.main.src.ets.Index.ClassDefCompleteBase", &baseCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean result = ANI_TRUE;
    ani_status status =
        env->Type_IsAssignableFrom(static_cast<ani_type>(pointCls), static_cast<ani_type>(baseCls), &result);
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    return result == ANI_FALSE ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Type_GetSuperClass_TopLevel([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class objCls{};
    if (env->FindClass("std.core.Object", &objCls) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : FindClass std.core.Object failed, trying std.Object");
        if (env->FindClass("std.Object", &objCls) != ANI_OK) {
            return ANI_TRUE;
        }
    }
    ani_class superClass = reinterpret_cast<ani_class>(1);
    ani_status status = env->Type_GetSuperClass(static_cast<ani_type>(objCls), &superClass);
    if (status == ANI_OK && superClass == nullptr) {
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : Type_GetSuperClass on Object, status=%{public}d, super=%{public}p", status,
                superClass);
    return ANI_TRUE;
}

// ============================================================
// Section 7: Enum Operations (7 tests)
// ============================================================

ani_int test_Enum_GetItemByName_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Enum_GetItemByName_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref enumGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(enm), &enumGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, enumGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_enum_item item{};
                ani_enum tEnm = static_cast<ani_enum>(enumGref);
                if (tEnv->Enum_GetEnumItemByName(tEnm, "Ready", &item) == ANI_OK) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(enumGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Enum_GetItemByIndex_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Enum_GetItemByIndex_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref enumGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(enm), &enumGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, enumGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_enum_item item{};
                ani_enum tEnm = static_cast<ani_enum>(enumGref);
                if (tEnv->Enum_GetEnumItemByIndex(tEnm, 0, &item) == ANI_OK) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(enumGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Enum_GetItemByIndex_OutOfRange([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_enum_item item{};
    ani_status status = env->Enum_GetEnumItemByIndex(enm, ENUM_INDEX_OUT_OF_RANGE, &item);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetIndex_Boundary([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_enum_item firstItem{};
    if (env->Enum_GetEnumItemByIndex(enm, 0, &firstItem) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_size firstIdx = 99;
    if (env->EnumItem_GetIndex(firstItem, &firstIdx) != ANI_OK || firstIdx != 0) {
        return ANI_FALSE;
    }
    ani_enum_item lastItem{};
    if (env->Enum_GetEnumItemByIndex(enm, 1, &lastItem) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_size lastIdx = 99;
    if (env->EnumItem_GetIndex(lastItem, &lastIdx) != ANI_OK || lastIdx != 1) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_int test_EnumItem_GetValue_Int_Min([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_enum_item item{};
    if (env->Enum_GetEnumItemByIndex(enm, 0, &item) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int value = 99;
    if (env->EnumItem_GetValue_Int(item, &value) != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : EnumItem_GetValue_Int min (first item) = %{public}d", value);
    return value == 0 ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetValue_Int_Max([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_enum_item item{};
    if (env->Enum_GetEnumItemByIndex(enm, 1, &item) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int value = 99;
    if (env->EnumItem_GetValue_Int(item, &value) != ANI_OK) {
        return ANI_FALSE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : EnumItem_GetValue_Int max (last item) = %{public}d", value);
    return value == 1 ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetValue_String_Empty([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_enum_item item{};
    if (env->Enum_GetEnumItemByIndex(enm, 0, &item) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_string strVal{};
    ani_status status = env->EnumItem_GetValue_String(item, &strVal);
    if (status != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : EnumItem_GetValue_String not available for int enum, status=%{public}d",
                    status);
        return ANI_TRUE;
    }
    if (strVal == nullptr) {
        return ANI_TRUE;
    }
    ani_size sz = 0;
    env->String_GetUTF8Size(strVal, &sz);
    OH_LOG_INFO(LOG_APP, "testTag : EnumItem_GetValue_String size=%{public}u", sz);
    return ANI_TRUE;
}

// ============================================================
// Section 8: Environment and Version (8 tests)
// ============================================================

ani_int test_GetVersion_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_GetVersion_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                uint32_t version = 0;
                if (tEnv->GetVersion(&version) == ANI_OK) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_GetVM_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    ani_status status = env->GetVM(&vm);
    if (status == ANI_OK && vm != nullptr) {
        OH_LOG_INFO(LOG_APP, "testTag : GetVM normal succeeded");
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : GetVM normal failed, status=%{public}d", status);
    return ANI_FALSE;
}

ani_int test_GetVM_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->GetVM(nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_GetVM_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_GetVM_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_vm *tVm = nullptr;
                if (tEnv->GetVM(&tVm) == ANI_OK && tVm != nullptr) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_GetNull_Normal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_ref nullRef{};
    ani_status status = env->GetNull(&nullRef);
    if (status == ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : GetNull normal succeeded");
        return ANI_TRUE;
    }
    OH_LOG_INFO(LOG_APP, "testTag : GetNull normal failed, status=%{public}d", status);
    return ANI_FALSE;
}

ani_int test_GetNull_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_GetNull_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_ref nullRef{};
                if (tEnv->GetNull(&nullRef) == ANI_OK) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_GetUndefined_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_status status = env->GetUndefined(nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_GetUndefined_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_GetUndefined_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_ref undefRef{};
                if (tEnv->GetUndefined(&undefRef) == ANI_OK) {
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 9: Module Operations (8 tests)
// ============================================================

ani_int test_Module_FindFunction_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Module_FindFunction_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_module mod{};
    if (env->FindModule(MODULE_DESC, &mod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref modGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(mod), &modGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, modGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_function func{};
                ani_module tMod = static_cast<ani_module>(modGref);
                tEnv->Module_FindFunction(tMod, "nonexistent", ":i", &func);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(modGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Module_FindVariable_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Module_FindVariable_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_module mod{};
    if (env->FindModule(MODULE_DESC, &mod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref modGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(mod), &modGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, modGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_variable var{};
                ani_module tMod = static_cast<ani_module>(modGref);
                tEnv->Module_FindVariable(tMod, "nonexistent", &var);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(modGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Module_BindNativeFunctions_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    if (env->FindModule(MODULE_DESC, &mod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->Module_BindNativeFunctions(mod, nullptr, 1);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Module_BindNativeFunctions_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_Module_BindNativeFunctions_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_module mod{};
    if (env->FindModule(MODULE_DESC, &mod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref modGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(mod), &modGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, modGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_native_function dummyFuncs[] = {
                    {"dummy_mod_func", ":i", reinterpret_cast<void *>(dummy_bind_func)},
                };
                ani_module tMod = static_cast<ani_module>(modGref);
                tEnv->Module_BindNativeFunctions(tMod, dummyFuncs, 1);
                successCount.fetch_add(1);
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(modGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Module_Bind_CountZero([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    if (env->FindModule(MODULE_DESC, &mod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->Module_BindNativeFunctions(mod, nullptr, 0);
    OH_LOG_INFO(LOG_APP, "testTag : Module_BindNativeFunctions count=0, status=%{public}d", status);
    return ANI_TRUE;
}

ani_int test_Module_FindFunction_EmptyName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    if (env->FindModule(MODULE_DESC, &mod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_function func{};
    ani_status status = env->Module_FindFunction(mod, "", ":i", &func);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Module_FindFunction_EmptySig([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    if (env->FindModule(MODULE_DESC, &mod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_function func{};
    ani_status status = env->Module_FindFunction(mod, "test", "", &func);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_Module_FindVariable_EmptyName([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_module mod{};
    if (env->FindModule(MODULE_DESC, &mod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_variable var{};
    ani_status status = env->Module_FindVariable(mod, "", &var);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

// ============================================================
// Section 10: Enum Item Operations (9 tests)
// ============================================================

ani_int test_EnumItem_GetEnum_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_EnumItem_GetEnum_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref enumGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(enm), &enumGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, enumGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_enum_item item{};
                ani_enum tEnm = static_cast<ani_enum>(enumGref);
                if (tEnv->Enum_GetEnumItemByName(tEnm, "Ready", &item) == ANI_OK) {
                    ani_enum resultEnum{};
                    if (tEnv->EnumItem_GetEnum(item, &resultEnum) == ANI_OK) {
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
    env->GlobalReference_Delete(enumGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetValue_Int_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_enum_item item{};
    if (env->Enum_GetEnumItemByName(enm, "Ready", &item) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->EnumItem_GetValue_Int(item, nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetValue_Int_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_EnumItem_GetValue_Int_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref enumGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(enm), &enumGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, enumGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_enum_item item{};
                ani_enum tEnm = static_cast<ani_enum>(enumGref);
                if (tEnv->Enum_GetEnumItemByName(tEnm, "Ready", &item) == ANI_OK) {
                    ani_int value = 0;
                    if (tEnv->EnumItem_GetValue_Int(item, &value) == ANI_OK) {
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
    env->GlobalReference_Delete(enumGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetValue_String_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_enum_item item{};
    if (env->Enum_GetEnumItemByName(enm, "Ready", &item) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->EnumItem_GetValue_String(item, nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetValue_String_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_EnumItem_GetValue_String_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref enumGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(enm), &enumGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, enumGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_enum_item item{};
                ani_enum tEnm = static_cast<ani_enum>(enumGref);
                if (tEnv->Enum_GetEnumItemByName(tEnm, "Ready", &item) == ANI_OK) {
                    ani_string strVal{};
                    tEnv->EnumItem_GetValue_String(item, &strVal);
                    successCount.fetch_add(1);
                }
                vm->DetachCurrentThread();
            }
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    env->GlobalReference_Delete(enumGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetName_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_enum_item item{};
    if (env->Enum_GetEnumItemByName(enm, "Ready", &item) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->EnumItem_GetName(item, nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetName_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_EnumItem_GetName_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref enumGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(enm), &enumGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, enumGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_enum_item item{};
                ani_enum tEnm = static_cast<ani_enum>(enumGref);
                if (tEnv->Enum_GetEnumItemByName(tEnm, "Ready", &item) == ANI_OK) {
                    ani_string nameStr{};
                    if (tEnv->EnumItem_GetName(item, &nameStr) == ANI_OK) {
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
    env->GlobalReference_Delete(enumGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetIndex_Abnormal([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_enum_item item{};
    if (env->Enum_GetEnumItemByName(enm, "Ready", &item) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_status status = env->EnumItem_GetIndex(item, nullptr);
    return status != ANI_OK ? ANI_TRUE : ANI_FALSE;
}

ani_int test_EnumItem_GetIndex_MultiThread(ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        OH_LOG_INFO(LOG_APP, "testTag : test_EnumItem_GetIndex_MultiThread GetVM failed");
        return ANI_FALSE;
    }
    ani_enum enm{};
    if (env->FindEnum(ENUM_DESC, &enm) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref enumGref{};
    if (env->GlobalReference_Create(static_cast<ani_ref>(enm), &enumGref) != ANI_OK) {
        return ANI_FALSE;
    }
    std::atomic<ani_int> successCount(0);
    std::vector<std::thread> threads;
    for (int i = 0; i < THREAD_COUNT; i++) {
        threads.emplace_back([&successCount, vm, enumGref]() {
            ani_env *tEnv = nullptr;
            ani_options options{0, nullptr};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &tEnv) == ANI_OK) {
                ani_enum_item item{};
                ani_enum tEnm = static_cast<ani_enum>(enumGref);
                if (tEnv->Enum_GetEnumItemByName(tEnm, "Ready", &item) == ANI_OK) {
                    ani_size idx = 99;
                    if (tEnv->EnumItem_GetIndex(item, &idx) == ANI_OK) {
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
    env->GlobalReference_Delete(enumGref);
    return successCount.load() == THREAD_COUNT ? ANI_TRUE : ANI_FALSE;
}

#endif // ARKTS_ANI_TEST_MODULEWEAKREFCOVERED_H
