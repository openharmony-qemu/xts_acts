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

#ifndef ARKTS_ANI_TEST_NATIVETEST01_H
#define ARKTS_ANI_TEST_NATIVETEST01_H

#include "Common.h"
#include <thread>
#include <atomic>
#include <vector>
#include <unistd.h>
#include <sys/sendfile.h>
#include <fcntl.h>
#include <cmath>
#include <cstring>
#include <unordered_set>
#include <mutex>

constexpr int PHYSICS_STATE_SIZE = 10;
constexpr int PHYSICS_STATE_BYTES = PHYSICS_STATE_SIZE * sizeof(float);
constexpr int MAX_ALLOC_SIZE = 1024 * 1024;
constexpr int MAX_TASK_COUNT = 8;
constexpr int FEATURE_SAMPLE_INTERVAL = 4;
constexpr int MIN_TASK_COUNT = 2;
constexpr int INCREMENTS_PER_THREAD = 10000;
constexpr int ASYNC_CALLBACK_DELAY_MS = 100;
constexpr size_t PATH_PROBE_SIZE = 64;
constexpr const char *NATIVE_BINDINGS_MODULE = "entry.src.main.src.test.NativeBindings";
constexpr int PHYSICS_POS_X = 0;
constexpr int PHYSICS_POS_Y = 1;
constexpr int PHYSICS_POS_Z = 2;
constexpr int PHYSICS_VEL_X = 3;
constexpr int PHYSICS_VEL_Y = 4;
constexpr int PHYSICS_VEL_Z = 5;
constexpr int PHYSICS_ACC_X = 6;
constexpr int PHYSICS_ACC_Y = 7;
constexpr int PHYSICS_ACC_Z = 8;
constexpr int PHYSICS_GRAVITY_INDEX = 9;
constexpr int FILE_CREATE_PERMISSION = 0644;
constexpr double ARRAY_DOUBLE_FACTOR = 2.0;

inline std::unordered_set<uintptr_t> g_validHandles;
inline std::mutex g_handleMutex;
inline std::mutex g_asyncMutex;
inline std::mutex g_cacheMutex;
inline ani_ref g_asyncCallbackRef = nullptr;
inline ani_vm *g_vm = nullptr;
inline ani_ref g_cachedStringClass = nullptr;

inline ani_object createEmptyObject([[maybe_unused]] ani_env *env)
{
    ani_class objClass = nullptr; ani_method ctor = nullptr; ani_object obj = nullptr;
    if (env->FindClass("std.core.Object", &objClass) != ANI_OK) {
        return nullptr;
    }
    env->Class_FindMethod(objClass, "<ctor>", "", &ctor);
    if (env->Object_New(objClass, ctor, &obj) != ANI_OK) {
        return nullptr;
    }
    return obj;
}

ani_array testAniArrayDouble([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_array arr)
{
    if (arr == nullptr) {
        return nullptr;
    }
    ani_size len = 0;
    if (env->Array_GetLength(arr, &len) != ANI_OK) {
        return nullptr;
    }
    ani_ref undefined_ref = nullptr;
    if (env->GetUndefined(&undefined_ref) != ANI_OK) {
        return nullptr;
    }
    ani_array result = nullptr;
    if (env->Array_New(len, undefined_ref, &result) != ANI_OK) {
        return nullptr;
    }
    for (ani_size i = 0; i < len; i++) {
        ani_ref elem_ref = nullptr;
        if (env->Array_Get(arr, i, &elem_ref) != ANI_OK) {
            return nullptr;
        }
        ani_double val = 0;
        if (env->Primitive_Unbox_Double((ani_object)elem_ref, &val) != ANI_OK) {
            return nullptr;
        }
        ani_object boxed = nullptr;
        if (env->Primitive_Box_Double(val * ARRAY_DOUBLE_FACTOR, &boxed) != ANI_OK) {
            return nullptr;
        }
        if (env->Array_Set(result, i, (ani_ref)boxed) != ANI_OK) {
            return nullptr;
        }
    }
    return result;
}

ani_arraybuffer testAniMatrixTranspose([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
    ani_arraybuffer srcBuf, ani_int rows, ani_int cols)
{
    if (srcBuf == nullptr || rows <= 0 || cols <= 0) {
        return nullptr;
    }
    const size_t maxSize = SIZE_MAX / sizeof(float);
    if (static_cast<size_t>(rows) > maxSize / static_cast<size_t>(cols)) {
        return nullptr;
    }
    void *srcData = nullptr;
    size_t srcSize = 0;
    if (env->ArrayBuffer_GetInfo(srcBuf, &srcData, &srcSize) != ANI_OK) {
        return nullptr;
    }
    size_t expectedSize = static_cast<size_t>(rows) * static_cast<size_t>(cols) * sizeof(float);
    if (srcSize < expectedSize || srcData == nullptr) {
        return nullptr;
    }
    void *dstData = nullptr;
    ani_arraybuffer result = nullptr;
    if (env->CreateArrayBuffer(expectedSize, &dstData, &result) != ANI_OK) {
        return nullptr;
    }
    const float *src = static_cast<const float *>(srcData);
    float *dst = static_cast<float *>(dstData);
    for (int32_t r = 0; r < rows; r++) {
        for (int32_t c = 0; c < cols; c++) {
            dst[c * rows + r] = src[r * cols + c];
        }
    }
    return result;
}

ani_boolean testAniXorEncrypt([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_arraybuffer srcBuf)
{
    void *data = nullptr;
    size_t size = 0;
    if (env->ArrayBuffer_GetInfo(srcBuf, &data, &size) != ANI_OK) {
        return ANI_FALSE;
    }
    if (data == nullptr || size == 0) {
        return ANI_FALSE;
    }
    auto *bytes = static_cast<uint8_t *>(data);
    for (size_t i = 0; i < size; i++) {
        bytes[i] = ~bytes[i];
    }
    return ANI_TRUE;
}

inline char *ResolvePath(ani_env *env, ani_string path)
{
    char probe[PATH_PROBE_SIZE];
    ani_size needed = 0;
    env->String_GetUTF8(path, probe, sizeof(probe), &needed);
    if (needed == 0 || needed > PATH_PROBE_SIZE) {
        return nullptr;
    }
    char *buf = static_cast<char *>(malloc(needed + 1));
    if (buf == nullptr) {
        return nullptr;
    }
    ani_size actualLen = 0;
    if (env->String_GetUTF8(path, buf, needed + 1, &actualLen) != ANI_OK) {
        free(buf);
        return nullptr;
    }
    return buf;
}

ani_boolean testAniFileCopy([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
    ani_string srcPath, ani_string dstPath, ani_long size)
{
    if (srcPath == nullptr || dstPath == nullptr || size <= 0) {
        return ANI_FALSE;
    }
    char *srcBuf = ResolvePath(env, srcPath);
    char *dstBuf = ResolvePath(env, dstPath);
    if (srcBuf == nullptr || dstBuf == nullptr) {
        free(srcBuf);
        free(dstBuf);
        return ANI_FALSE;
    }
    int srcFd = open(srcBuf, O_RDONLY);
    if (srcFd < 0) {
        free(srcBuf);
        free(dstBuf);
        return ANI_FALSE;
    }
    int dstFd = open(dstBuf, O_WRONLY | O_CREAT | O_TRUNC, FILE_CREATE_PERMISSION);
    if (dstFd < 0) {
        close(srcFd);
        free(srcBuf);
        free(dstBuf);
        return ANI_FALSE;
    }
    off_t offset = 0;
    ssize_t ret = sendfile(dstFd, srcFd, &offset, static_cast<size_t>(size));
    close(srcFd);
    close(dstFd);
    free(srcBuf);
    free(dstBuf);
    return (ret == size) ? ANI_TRUE : ANI_FALSE;
}

ani_object testAniSysInfo([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    long cores = sysconf(_SC_NPROCESSORS_ONLN);
    long pageSize = sysconf(_SC_PAGESIZE);
    ani_object obj = createEmptyObject(env);
    if (obj == nullptr) {
        return nullptr;
    }
    ani_int coresVal = static_cast<int32_t>(cores > 0 ? cores : 0);
    ani_int pageVal = static_cast<int32_t>(pageSize > 0 ? pageSize : 0);
    ani_object coresBoxed = nullptr;
    ani_object pageBoxed = nullptr;
    if (env->Primitive_Box_Int(coresVal, &coresBoxed) != ANI_OK ||
        env->Primitive_Box_Int(pageVal, &pageBoxed) != ANI_OK) {
        return nullptr;
    }
    if (env->Object_SetPropertyByName_Ref(obj, "cpuCores", (ani_ref)coresBoxed) != ANI_OK ||
        env->Object_SetPropertyByName_Ref(obj, "pageSize", (ani_ref)pageBoxed) != ANI_OK) {
        return nullptr;
    }
    return obj;
}

ani_long testAniCreatePhysics([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_double gravity)
{
    if (PHYSICS_STATE_BYTES == 0 || PHYSICS_STATE_BYTES > MAX_ALLOC_SIZE) {
        return 0;
    }
    auto *state = static_cast<float *>(malloc(PHYSICS_STATE_BYTES));
    if (state == nullptr) {
        return 0;
    }
    for (size_t i = 0; i < PHYSICS_STATE_SIZE; ++i) {
        state[i] = 0.0f;
    }
    state[PHYSICS_GRAVITY_INDEX] = static_cast<float>(gravity);
    {
        std::lock_guard<std::mutex> lock(g_handleMutex);
        g_validHandles.insert(reinterpret_cast<uintptr_t>(state));
    }
    return reinterpret_cast<int64_t>(state);
}

ani_double testAniStepPhysics([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object,
    ani_long handle, ani_double dt)
{
    if (handle == 0 || dt <= 0.0) {
        return 0.0;
    }
    auto handleAddr = static_cast<uintptr_t>(handle);
    {
        std::lock_guard<std::mutex> lock(g_handleMutex);
        if (g_validHandles.find(handleAddr) == g_validHandles.end()) {
            return 0.0;
        }
    }
    auto *state = reinterpret_cast<float *>(handleAddr);
    if (fabsf(state[PHYSICS_GRAVITY_INDEX]) < 1e-3f) {
        return 0.0;
    }
    float invMass = 1.0f / state[PHYSICS_GRAVITY_INDEX];
    state[PHYSICS_VEL_X] += state[PHYSICS_ACC_X] * invMass * static_cast<float>(dt);
    state[PHYSICS_VEL_Y] += state[PHYSICS_ACC_Y] * invMass * static_cast<float>(dt);
    state[PHYSICS_VEL_Z] += state[PHYSICS_ACC_Z] * invMass * static_cast<float>(dt);
    state[PHYSICS_POS_X] += state[PHYSICS_VEL_X] * static_cast<float>(dt);
    state[PHYSICS_POS_Y] += state[PHYSICS_VEL_Y] * static_cast<float>(dt);
    state[PHYSICS_POS_Z] += state[PHYSICS_VEL_Z] * static_cast<float>(dt);
    return static_cast<double>(dt * state[PHYSICS_GRAVITY_INDEX]);
}

void testAniDestroyPhysics([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_long handle)
{
    if (handle != 0) {
        auto handleAddr = static_cast<uintptr_t>(handle);
        {
            std::lock_guard<std::mutex> lock(g_handleMutex);
            g_validHandles.erase(handleAddr);
        }
        auto *state = reinterpret_cast<float *>(handleAddr);
        for (size_t i = 0; i < PHYSICS_STATE_SIZE; ++i) {
            state[i] = 0.0f;
        }
        free(state);
    }
}

inline ani_size SampleFeatureArray(ani_env *env, ani_array input, ani_size len, ani_array output)
{
    ani_size outIdx = 0;
    for (ani_size i = 0; i < len; i += FEATURE_SAMPLE_INTERVAL) {
        ani_ref elem_ref = nullptr;
        if (env->Array_Get(input, i, &elem_ref) != ANI_OK) {
            return static_cast<ani_size>(-1);
        }
        ani_double val = 0;
        if (env->Primitive_Unbox_Double((ani_object)elem_ref, &val) != ANI_OK) {
            return static_cast<ani_size>(-1);
        }
        ani_object boxed = nullptr;
        if (env->Primitive_Box_Double(val, &boxed) != ANI_OK) {
            return static_cast<ani_size>(-1);
        }
        if (env->Array_Set(output, outIdx, (ani_ref)boxed) != ANI_OK) {
            return static_cast<ani_size>(-1);
        }
        outIdx++;
    }
    return outIdx;
}

ani_object testAniFeatureExtract([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object, ani_array input)
{
    if (input == nullptr) {
        return nullptr;
    }
    ani_size len = 0;
    if (env->Array_GetLength(input, &len) != ANI_OK) {
        return nullptr;
    }
    ani_ref undefined_ref = nullptr;
    if (env->GetUndefined(&undefined_ref) != ANI_OK) {
        return nullptr;
    }
    ani_size outLen = (len + FEATURE_SAMPLE_INTERVAL - 1) / FEATURE_SAMPLE_INTERVAL;
    if (outLen == 0) {
        outLen = 1;
    }
    ani_array output = nullptr;
    if (env->Array_New(outLen, undefined_ref, &output) != ANI_OK) {
        return nullptr;
    }
    ani_size outIdx = SampleFeatureArray(env, input, len, output);
    if (outIdx == static_cast<ani_size>(-1)) {
        return nullptr;
    }
    ani_object obj = createEmptyObject(env);
    if (obj == nullptr) {
        return nullptr;
    }
    ani_object lenBoxed = nullptr;
    if (env->Primitive_Box_Int(static_cast<int32_t>(outIdx), &lenBoxed) != ANI_OK) {
        return nullptr;
    }
    if (env->Object_SetPropertyByName_Ref(obj, "dst", (ani_ref)output) != ANI_OK ||
        env->Object_SetPropertyByName_Ref(obj, "len", (ani_ref)lenBoxed) != ANI_OK) {
        return nullptr;
    }
    return obj;
}

ani_boolean testAniErrorTrigger([[maybe_unused]] ani_env *env, [[maybe_unused]] ani_object object)
{
    ani_class dummy = nullptr;
    ani_status status = env->FindClass("non.existent.Class", &dummy);
    if (status == ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean hasError = ANI_FALSE;
    env->ExistUnhandledError(&hasError);
    if (hasError == ANI_TRUE) {
        env->ResetError();
    }
    ani_string str = nullptr;
    status = env->String_NewUTF8("after reset", static_cast<ani_size>(strlen("after reset")), &str);
    return (status == ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

inline bool RunSumTest(ani_vm *vm, ani_int taskCount, int &outExpectedSum)
{
    std::atomic<int> sum{0};
    std::vector<std::thread> threads;
    for (int i = 0; i < taskCount; i++) {
        threads.emplace_back([vm, i, &sum]() {
            ani_env *threadEnv = nullptr;
            if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) != ANI_OK) {
                return;
            }
            sum.fetch_add(i * i, std::memory_order_relaxed);
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
    int expected = 0;
    for (int i = 0; i < taskCount; i++) {
        expected += i * i;
    }
    outExpectedSum = expected;
    return (sum.load() == expected);
}

inline bool RunContentionTest(ani_vm *vm, ani_int taskCount)
{
    std::atomic<int> counter{0};
    std::vector<std::thread> threads;
    for (int i = 0; i < taskCount; i++) {
        threads.emplace_back([vm, &counter]() {
            ani_env *threadEnv = nullptr;
            if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) != ANI_OK) {
                return;
            }
            for (int j = 0; j < INCREMENTS_PER_THREAD; j++) {
                counter.fetch_add(1, std::memory_order_relaxed);
            }
            vm->DetachCurrentThread();
        });
    }
    for (auto &t : threads) {
        t.join();
    }
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

inline void RunAsyncCallback(ani_vm *vm, ani_ref ref)
{
    if (ref == nullptr || vm == nullptr) {
        return;
    }
    ani_env *threadEnv = nullptr;
    if (vm->AttachCurrentThread(nullptr, ANI_VERSION_1, &threadEnv) != ANI_OK) {
        return;
    }
    ani_fn_object fnObj = (ani_fn_object)ref;
    ani_ref result = nullptr;
    threadEnv->FunctionalObject_Call(fnObj, 0, nullptr, &result);
    ReleaseCallbackRef(threadEnv, ref);
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

inline ani_int DynAdd([[maybe_unused]] ani_env *env, ani_int a, ani_int b)
{
    return a + b;
}

inline ani_int DynSub([[maybe_unused]] ani_env *env, ani_int a, ani_int b)
{
    return a - b;
}

ani_boolean testAniDynamicRegistration([[maybe_unused]] ani_env *env)
{
    ani_module module = nullptr;
    if (env->FindModule(NATIVE_BINDINGS_MODULE, &module) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_function addFn = nullptr;
    ani_function subFn = nullptr;
    if (env->Module_FindFunction(module, "dynAdd", "ii:i", &addFn) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->Module_FindFunction(module, "dynSub", "ii:i", &subFn) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int addResult = 0;
    ani_int addA = 3;
    ani_int addB = 5;
    if (env->Function_Call_Int(addFn, &addResult, addA, addB) != ANI_OK || addResult != 8) {
        return ANI_FALSE;
    }
    ani_int subResult = 0;
    ani_int subA = 10;
    ani_int subB = 4;
    if (env->Function_Call_Int(subFn, &subResult, subA, subB) != ANI_OK || subResult != 6) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

#endif
