/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#include "ThreadSafeStorageTest.h"
#include "Common.h"

#include <thread>
#include <atomic>
#include <vector>
#include <cstring>
#include <mutex>

namespace {

ani_ref g_globalResourceRef = nullptr;
std::mutex g_globalRefMutex;
ani_ref g_sharedResourceGlobalRef = nullptr;
ani_ref g_taskPoolResourceGlobalRef = nullptr;
std::mutex g_resourceValueMutex;
ani_ref g_cachedGlobalRef = nullptr;
std::atomic<bool> g_scopeRunning(false);
std::atomic<bool> g_scopeStarted(false);
std::thread g_scopeThread;
std::atomic<int> g_scopeProcessedCount(0);
ani_ref g_scopeClassGlobalRef = nullptr;
std::mutex g_scopeClassMutex;

ani_object CreateNativeResourceInMainThread(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_object resource = CreateNativeResource(env, RES_INIT_VALUE);
    if (resource == nullptr) {
        return nullptr;
    }
    std::lock_guard<std::mutex> lock(g_globalRefMutex);
    if (g_globalResourceRef != nullptr) {
        env->GlobalReference_Delete(g_globalResourceRef);
        g_globalResourceRef = nullptr;
    }
    if (env->GlobalReference_Create(resource, &g_globalResourceRef) != ANI_OK) {
        return nullptr;
    }
    return resource;
}

ani_int UseNativeResourceInWorkerThread(ani_env *env, ani_object manager, ani_object resource)
{
    (void)manager;
    (void)resource;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    std::atomic<ani_int> result(RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP);
    std::thread worker([vm, &result]() {
        ani_env *workerEnv = nullptr;
        ani_options options{};
        if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv) != ANI_OK) {
            return;
        }
        workerEnv->CreateLocalScope(LOCAL_SCOPE_CAPACITY);
        ani_object resourceObj = nullptr;
        {
            std::lock_guard<std::mutex> lock(g_globalRefMutex);
            resourceObj = static_cast<ani_object>(g_globalResourceRef);
        }
        if (resourceObj != nullptr) {
            ani_int value = 0;
            if (workerEnv->Object_GetPropertyByName_Int(resourceObj, "value", &value) == ANI_OK) {
                result.store(value);
            }
        }
        workerEnv->DestroyLocalScope();
        vm->DetachCurrentThread();
    });
    worker.join();
    return result.load();
}

ani_status CleanupGlobalReference(ani_env *env, ani_object manager)
{
    (void)manager;
    std::lock_guard<std::mutex> lock(g_globalRefMutex);
    if (g_globalResourceRef != nullptr) {
        env->GlobalReference_Delete(g_globalResourceRef);
        g_globalResourceRef = nullptr;
    }
    return ANI_OK;
}

ani_status InitSharedNativeResource(ani_env *env, ani_class cls)
{
    ani_object resource = CreateNativeResource(env, RES_INIT_VALUE_ZERO);
    if (resource == nullptr) {
        return ANI_ERROR;
    }
    if (env->Class_SetStaticFieldByName_Ref(cls, "sharedNativeResource", resource) != ANI_OK) {
        return ANI_ERROR;
    }
    if (g_sharedResourceGlobalRef != nullptr) {
        env->GlobalReference_Delete(g_sharedResourceGlobalRef);
    }
    return env->GlobalReference_Create(resource, &g_sharedResourceGlobalRef);
}

ani_int IncrementResourceValueInWorker(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    std::atomic<ani_int> result(RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP);
    std::thread worker([vm, &result]() {
        ani_env *workerEnv = nullptr;
        ani_options options{};
        if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv) != ANI_OK) {
            return;
        }
        workerEnv->CreateLocalScope(LOCAL_SCOPE_CAPACITY);
        ani_object sharedResource = nullptr;
        {
            std::lock_guard<std::mutex> lock(g_resourceValueMutex);
            sharedResource = static_cast<ani_object>(g_sharedResourceGlobalRef);
            if (sharedResource != nullptr) {
                ani_int currentValue = 0;
                if (workerEnv->Object_GetPropertyByName_Int(sharedResource, "value", &currentValue) == ANI_OK) {
                    currentValue += RES_INCREMENT_STEP;
                    workerEnv->Object_SetPropertyByName_Int(sharedResource, "value", currentValue);
                    result.store(currentValue);
                }
            }
        }
        workerEnv->DestroyLocalScope();
        vm->DetachCurrentThread();
    });
    worker.join();
    return result.load();
}

ani_int GetConcurrentResourceValue(ani_env *env, ani_object manager)
{
    (void)manager;
    std::lock_guard<std::mutex> lock(g_resourceValueMutex);
    if (g_sharedResourceGlobalRef == nullptr) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int value = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(g_sharedResourceGlobalRef), "value", &value) !=
        ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return value;
}

ani_int ProcessResourceInTaskPool(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    std::atomic<ani_int> result(RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP);
    std::thread worker([vm, &result]() {
        ani_env *workerEnv = nullptr;
        ani_options options{};
        if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv) != ANI_OK) {
            return;
        }
        workerEnv->CreateLocalScope(LOCAL_SCOPE_CAPACITY);
        ani_object taskResource = nullptr;
        {
            std::lock_guard<std::mutex> lock(g_resourceValueMutex);
            taskResource = static_cast<ani_object>(g_taskPoolResourceGlobalRef);
            if (taskResource != nullptr) {
                ani_int currentValue = 0;
                if (workerEnv->Object_GetPropertyByName_Int(taskResource, "value", &currentValue) == ANI_OK) {
                    currentValue += RES_INCREMENT_STEP;
                    workerEnv->Object_SetPropertyByName_Int(taskResource, "value", currentValue);
                    result.store(currentValue);
                }
            }
        }
        workerEnv->DestroyLocalScope();
        vm->DetachCurrentThread();
    });
    worker.join();
    return result.load();
}

ani_status InitTaskPoolResource(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_object resource = CreateNativeResource(env, RES_INIT_VALUE_ZERO);
    if (resource == nullptr) {
        return ANI_ERROR;
    }
    std::lock_guard<std::mutex> lock(g_resourceValueMutex);
    if (g_taskPoolResourceGlobalRef != nullptr) {
        env->GlobalReference_Delete(g_taskPoolResourceGlobalRef);
    }
    return env->GlobalReference_Create(resource, &g_taskPoolResourceGlobalRef);
}

ani_int GetTaskPoolResult(ani_env *env, ani_object manager)
{
    (void)manager;
    std::lock_guard<std::mutex> lock(g_resourceValueMutex);
    if (g_taskPoolResourceGlobalRef == nullptr) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int value = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(g_taskPoolResourceGlobalRef), "value", &value) !=
        ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return value;
}

ani_status CreateManyLocalRefs(ani_env *env, ani_object manager, ani_int count)
{
    (void)manager;
    ani_class resourceCls = nullptr;
    if (FindClassByName(env, NATIVE_RESOURCE_CLASS, &resourceCls) != ANI_TRUE) {
        return ANI_ERROR;
    }
    ani_method ctor = nullptr;
    if (env->Class_FindMethod(resourceCls, "<ctor>", ":", &ctor) != ANI_OK) {
        return ANI_ERROR;
    }
    for (ani_int i = 0; i < count; i++) {
        ani_object temp = nullptr;
        if (env->Object_New(resourceCls, ctor, &temp) != ANI_OK) {
            return ANI_ERROR;
        }
    }
    return ANI_OK;
}

ani_boolean VerifyNoRefLeak(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_class resourceCls = nullptr;
    if (FindClassByName(env, NATIVE_RESOURCE_CLASS, &resourceCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method ctor = nullptr;
    if (env->Class_FindMethod(resourceCls, "<ctor>", ":", &ctor) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_object testResource = nullptr;
    ani_status status = env->Object_New(resourceCls, ctor, &testResource);
    return (status == ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

ani_object CreateAndCacheGlobalRef(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_object resource = CreateNativeResource(env, RES_INIT_VALUE);
    if (resource == nullptr) {
        return nullptr;
    }
    if (g_cachedGlobalRef != nullptr) {
        env->GlobalReference_Delete(g_cachedGlobalRef);
    }
    if (env->GlobalReference_Create(resource, &g_cachedGlobalRef) != ANI_OK) {
        return nullptr;
    }
    return resource;
}

ani_int UseCachedGlobalRef(ani_env *env, ani_object manager)
{
    (void)manager;
    if (g_cachedGlobalRef == nullptr) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int value = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(g_cachedGlobalRef), "value", &value) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return value;
}

ani_status DeleteCachedGlobalRef(ani_env *env, ani_object manager)
{
    (void)manager;
    if (g_cachedGlobalRef != nullptr) {
        env->GlobalReference_Delete(g_cachedGlobalRef);
        g_cachedGlobalRef = nullptr;
    }
    return ANI_OK;
}

ani_boolean VerifyGlobalRefDeleted(ani_env *env, ani_object manager)
{
    (void)env;
    (void)manager;
    return (g_cachedGlobalRef == nullptr) ? ANI_TRUE : ANI_FALSE;
}

void ScopeThreadFunc(ani_vm *vm)
{
    ani_env *workerEnv = nullptr;
    ani_options options{};
    if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv) != ANI_OK) {
        g_scopeStarted.store(true);
        return;
    }
    g_scopeStarted.store(true);
    ani_class resourceCls = nullptr;
    {
        std::lock_guard<std::mutex> lock(g_scopeClassMutex);
        if (g_scopeClassGlobalRef != nullptr) {
            resourceCls = static_cast<ani_class>(g_scopeClassGlobalRef);
        }
    }
    ani_method ctor = nullptr;
    if (resourceCls != nullptr) {
        workerEnv->Class_FindMethod(resourceCls, "<ctor>", ":", &ctor);
    }
    while (g_scopeRunning.load()) {
        workerEnv->CreateLocalScope(LOCAL_SCOPE_CAPACITY);
        if (resourceCls != nullptr && ctor != nullptr) {
            for (ani_size i = 0; i < LOCAL_SCOPE_CAPACITY && g_scopeRunning.load(); ++i) {
                ani_object temp = nullptr;
                if (workerEnv->Object_New(resourceCls, ctor, &temp) == ANI_OK) {
                    workerEnv->Object_SetPropertyByName_Int(temp, "value",
                        static_cast<ani_int>(g_scopeProcessedCount.load()));
                    g_scopeProcessedCount.fetch_add(RES_INCREMENT_STEP);
                }
            }
        }
        workerEnv->DestroyLocalScope();
    }
    vm->DetachCurrentThread();
}

ani_status StartBackgroundThread(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_ERROR;
    }
    {
        std::lock_guard<std::mutex> lock(g_scopeClassMutex);
        if (g_scopeClassGlobalRef == nullptr) {
            ani_class localCls = nullptr;
            if (env->FindClass(NATIVE_RESOURCE_CLASS, &localCls) == ANI_OK && localCls != nullptr) {
                env->GlobalReference_Create(localCls, &g_scopeClassGlobalRef);
            }
        }
    }
    g_scopeRunning.store(true);
    g_scopeStarted.store(false);
    g_scopeProcessedCount.store(0);
    if (g_scopeThread.joinable()) {
        g_scopeThread.join();
    }
    g_scopeThread = std::thread(ScopeThreadFunc, vm);
    while (!g_scopeStarted.load()) {
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
    }
    return ANI_OK;
}

ani_status StopBackgroundThread(ani_env *env, ani_object manager)
{
    (void)env;
    (void)manager;
    g_scopeRunning.store(false);
    if (g_scopeThread.joinable()) {
        g_scopeThread.join();
    }
    return ANI_OK;
}

ani_int GetProcessedCount(ani_env *env, ani_object manager)
{
    (void)env;
    (void)manager;
    return static_cast<ani_int>(g_scopeProcessedCount.load());
}

void CleanupAllThreadSafeRefs(ani_env *env)
{
    std::lock_guard<std::mutex> lock1(g_globalRefMutex);
    std::lock_guard<std::mutex> lock2(g_resourceValueMutex);
    std::lock_guard<std::mutex> lock3(g_scopeClassMutex);
    if (g_globalResourceRef != nullptr) {
        env->GlobalReference_Delete(g_globalResourceRef);
        g_globalResourceRef = nullptr;
    }
    if (g_sharedResourceGlobalRef != nullptr) {
        env->GlobalReference_Delete(g_sharedResourceGlobalRef);
        g_sharedResourceGlobalRef = nullptr;
    }
    if (g_taskPoolResourceGlobalRef != nullptr) {
        env->GlobalReference_Delete(g_taskPoolResourceGlobalRef);
        g_taskPoolResourceGlobalRef = nullptr;
    }
    if (g_cachedGlobalRef != nullptr) {
        env->GlobalReference_Delete(g_cachedGlobalRef);
        g_cachedGlobalRef = nullptr;
    }
    if (g_scopeClassGlobalRef != nullptr) {
        env->GlobalReference_Delete(g_scopeClassGlobalRef);
        g_scopeClassGlobalRef = nullptr;
    }
    if (g_scopeThread.joinable()) {
        g_scopeRunning.store(false);
        g_scopeThread.join();
    }
}

const ani_native_function g_threadSafeMethods[] = {
    {"createNativeResourceInMainThread", ":C{entry.src.main.src.ets.Index.NativeResource}",
     reinterpret_cast<void *>(CreateNativeResourceInMainThread)},
    {"useNativeResourceInWorkerThread", "C{entry.src.main.src.ets.Index.NativeResource}:i",
     reinterpret_cast<void *>(UseNativeResourceInWorkerThread)},
    {"cleanupGlobalReference", ":", reinterpret_cast<void *>(CleanupGlobalReference)},
    {"initSharedNativeResource", ":", reinterpret_cast<void *>(InitSharedNativeResource)},
    {"incrementResourceValueInWorker", ":i",
     reinterpret_cast<void *>(IncrementResourceValueInWorker)},
    {"getResourceValue", ":i", reinterpret_cast<void *>(GetConcurrentResourceValue)},
    {"initTaskPoolResource", ":", reinterpret_cast<void *>(InitTaskPoolResource)},
    {"processResourceInTaskPool", ":i", reinterpret_cast<void *>(ProcessResourceInTaskPool)},
    {"getTaskPoolResult", ":i", reinterpret_cast<void *>(GetTaskPoolResult)},
    {"createManyLocalRefs", "i:", reinterpret_cast<void *>(CreateManyLocalRefs)},
    {"verifyNoRefLeak", ":z", reinterpret_cast<void *>(VerifyNoRefLeak)},
    {"createAndCacheGlobalRef", ":C{entry.src.main.src.ets.Index.NativeResource}",
     reinterpret_cast<void *>(CreateAndCacheGlobalRef)},
    {"useCachedGlobalRef", ":i", reinterpret_cast<void *>(UseCachedGlobalRef)},
    {"deleteCachedGlobalRef", ":", reinterpret_cast<void *>(DeleteCachedGlobalRef)},
    {"verifyGlobalRefDeleted", ":z", reinterpret_cast<void *>(VerifyGlobalRefDeleted)},
    {"startBackgroundThread", ":", reinterpret_cast<void *>(StartBackgroundThread)},
    {"stopBackgroundThread", ":", reinterpret_cast<void *>(StopBackgroundThread)},
    {"getProcessedCount", ":i", reinterpret_cast<void *>(GetProcessedCount)},
};

const char *const CLASS_THREAD_MGR = "entry.src.main.src.ets.Index.ThreadSafeResourceManager";
const char *const CLASS_EA_MGR = "entry.src.main.src.ets.Index.ConcurrentResourceManager";
const char *const CLASS_TASK_MGR = "entry.src.main.src.ets.Index.TaskPoolResourceManager";
const char *const CLASS_LOCALREF_MGR = "entry.src.main.src.ets.Index.LocalRefManager";
const char *const CLASS_GLOBALREF_MGR = "entry.src.main.src.ets.Index.GlobalRefLifecycleManager";
const char *const CLASS_SCOPE_MGR = "entry.src.main.src.ets.Index.LocalScopeManager";

} // namespace

ani_status BindThreadSafeStorageTest(ani_vm *vm)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        AniTestLog("ThreadSafeStorageTest: unsupported ANI_VERSION_1");
        return static_cast<ani_status>(ANI_RES_OUT_OF_REF);
    }
    const char *const classes[] = {CLASS_THREAD_MGR,   CLASS_EA_MGR,        CLASS_TASK_MGR,
                                   CLASS_LOCALREF_MGR, CLASS_GLOBALREF_MGR, CLASS_SCOPE_MGR};
    for (const char *clsName : classes) {
        if (strcmp(clsName, CLASS_EA_MGR) == 0) {
            ani_class cls = nullptr;
            if (env->FindClass(clsName, &cls) == ANI_OK) {
                InitSharedNativeResource(env, cls);
                InitTaskPoolResource(env, nullptr);
            }
        }
        BindClassMethods(env, clsName, g_threadSafeMethods,
            sizeof(g_threadSafeMethods) / sizeof(g_threadSafeMethods[0]),
            "ThreadSafeStorageTest");
    }
    return ANI_OK;
}

void CleanupThreadSafeStorageTest(ani_env *env)
{
    CleanupAllThreadSafeRefs(env);
}
