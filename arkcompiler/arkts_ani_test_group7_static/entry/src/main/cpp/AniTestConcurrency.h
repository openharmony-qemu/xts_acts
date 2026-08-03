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

#ifndef ARKTS_ANI_TEST_NATIVETEST01_CONCURRENCY_H
#define ARKTS_ANI_TEST_NATIVETEST01_CONCURRENCY_H

#include "AniTestBase.h"

inline void SumSquareWorker(ani_vm *vm, int i, AtomicInt &sum)
{
    ani_env *threadEnv = nullptr;
    if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) != ANI_OK) {
        return;
    }
    sum.fetch_add(i * i, std::memory_order_relaxed);
    vm->DetachCurrentThread();
}

inline void RunSumThreads(ani_vm *vm, ani_int taskCount, AtomicInt &sum)
{
    std::vector<std::thread> threads;
    for (int i = 0; i < taskCount; i++) {
        threads.emplace_back([vm, i, &sum]() {
            SumSquareWorker(vm, i, sum);
        });
    }
    for (auto &t : threads) {
        t.join();
    }
}

inline bool RunSumTest(ani_vm *vm, ani_int taskCount, int &outExpectedSum)
{
    AtomicInt sum{0};
    RunSumThreads(vm, taskCount, sum);
    int expected = 0;
    for (int i = 0; i < taskCount; i++) {
        expected += i * i;
    }
    outExpectedSum = expected;
    return (sum.load() == expected);
}

inline void IncrementCounterWorker(ani_vm *vm, AtomicInt &counter)
{
    ani_env *threadEnv = nullptr;
    if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) != ANI_OK) {
        return;
    }
    for (int j = 0; j < INCREMENTS_PER_THREAD; j++) {
        counter.fetch_add(1, std::memory_order_relaxed);
    }
    vm->DetachCurrentThread();
}

inline void RunIncrementThreads(ani_vm *vm, ani_int taskCount, AtomicInt &counter)
{
    std::vector<std::thread> threads;
    for (int i = 0; i < taskCount; i++) {
        threads.emplace_back([vm, &counter]() {
            IncrementCounterWorker(vm, counter);
        });
    }
    for (auto &t : threads) {
        t.join();
    }
}

inline bool RunContentionTest(ani_vm *vm, ani_int taskCount)
{
    AtomicInt counter{0};
    RunIncrementThreads(vm, taskCount, counter);
    int expected = taskCount * INCREMENTS_PER_THREAD;
    return (counter.load() == expected);
}

ani_object testAniParallelSum([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_int taskCount)
{
    if (taskCount < MIN_TASK_COUNT) {
        taskCount = MIN_TASK_COUNT;
    }
    if (taskCount > MAX_TASK_COUNT) {
        taskCount = MAX_TASK_COUNT;
    }
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return nullptr;
    }
    int expectedSum = 0;
    bool sumCorrect = RunSumTest(vm, taskCount, expectedSum);
    bool contentionCorrect = RunContentionTest(vm, taskCount);
    ani_object obj = createEmptyObject(env);
    if (obj == nullptr) {
        return nullptr;
    }
    ani_object sumBoxed = nullptr;
    ani_object contentionBoxed = nullptr;
    if (env->Primitive_Box_Int(sumCorrect ? 1 : 0, &sumBoxed) != ANI_OK ||
        env->Primitive_Box_Int(contentionCorrect ? 1 : 0, &contentionBoxed) != ANI_OK) {
        return nullptr;
    }
    if (env->Object_SetPropertyByName_Ref(obj, "sumCorrect", (ani_ref)sumBoxed) != ANI_OK ||
        env->Object_SetPropertyByName_Ref(obj, "contentionCorrect", (ani_ref)contentionBoxed) != ANI_OK) {
        return nullptr;
    }
    return obj;
}

inline void ReleaseCallbackRef(ani_env *threadEnv, ani_ref ref)
{
    std::lock_guard<std::mutex> lock(g_asyncMutex);
    if (g_asyncCallbackRef == ref) {
        threadEnv->GlobalReference_Delete(g_asyncCallbackRef);
        g_asyncCallbackRef = nullptr;
    }
}

inline void InvokeCallbackOnThread(ani_env *threadEnv, ani_ref ref)
{
    ani_fn_object fnObj = (ani_fn_object)ref;
    ani_ref result = nullptr;
    threadEnv->FunctionalObject_Call(fnObj, 0, nullptr, &result);
    ReleaseCallbackRef(threadEnv, ref);
}

inline void RunAsyncCallback(ani_vm *vm, ani_ref ref)
{
    if (ref == nullptr || vm == nullptr) {
        return;
    }
    ani_env *threadEnv = nullptr;
    if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) != ANI_OK) {
        return;
    }
    InvokeCallbackOnThread(threadEnv, ref);
    vm->DetachCurrentThread();
}

ani_boolean testAniAsyncCompute([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
    ani_fn_object callback)
{
    if (callback == nullptr) {
        return ANI_FALSE;
    }
    {
        std::lock_guard<std::mutex> lock(g_asyncMutex);
        if (g_asyncCallbackRef != nullptr) {
            env->GlobalReference_Delete(g_asyncCallbackRef);
            g_asyncCallbackRef = nullptr;
        }
    }
    ani_ref newRef = nullptr;
    if (env->GlobalReference_Create((ani_ref)callback, &newRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        env->GlobalReference_Delete(newRef);
        return ANI_FALSE;
    }
    {
        std::lock_guard<std::mutex> lock(g_asyncMutex);
        g_asyncCallbackRef = newRef;
        g_vm = vm;
    }
    std::thread([newRef, vm]() {
        std::this_thread::sleep_for(std::chrono::milliseconds(ASYNC_CALLBACK_DELAY_MS));
        ani_ref ref = nullptr;
        {
            std::lock_guard<std::mutex> lock(g_asyncMutex);
            ref = g_asyncCallbackRef;
        }
        RunAsyncCallback(vm, ref);
    }).detach();
    return ANI_TRUE;
}

ani_boolean testAniCachedLookup([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class cachedCls = nullptr;
    {
        std::lock_guard<std::mutex> lock(g_cacheMutex);
        if (g_cachedStringClass == nullptr) {
            ani_class cls = nullptr;
            if (env->FindClass("std.core.String", &cls) != ANI_OK) {
                return ANI_FALSE;
            }
            ani_ref newRef = nullptr;
            if (env->GlobalReference_Create((ani_ref)cls, &newRef) != ANI_OK) {
                return ANI_FALSE;
            }
            g_cachedStringClass = newRef;
        }
        cachedCls = (ani_class)g_cachedStringClass;
    }

    ani_method lengthFn = nullptr;
    ani_status s = env->Class_FindMethod(cachedCls, "getLength", ":i", &lengthFn);

    std::lock_guard<std::mutex> lock(g_cacheMutex);
    if (g_cachedStringClass != nullptr) {
        env->GlobalReference_Delete(g_cachedStringClass);
        g_cachedStringClass = nullptr;
    }
    return (s == ANI_OK && lengthFn != nullptr) ? ANI_TRUE : ANI_FALSE;
}

#endif
