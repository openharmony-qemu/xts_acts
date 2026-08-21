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

#include "ConcurrentStorageTest.h"
#include "CommonDel.h"

#include <thread>
#include <atomic>
#include <vector>
#include <mutex>

namespace {

ani_ref g_concurrentSharedObj = nullptr;
std::mutex g_concurrentMutex;

ani_object CreateNativeResourceWithValue(ani_env *env, ani_int value)
{
    return CreateNativeResource(env, value);
}

ani_boolean TestNativeObjectInConcurrentHashMap(ani_env *env, ani_object manager)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "concurrentMap", &mapRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentMapCls = nullptr;
    if (FindClassFallback(env, "ConcurrentHashMap", &concurrentMapCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method putMethod = nullptr;
    if (env->Class_FindMethod(concurrentMapCls, "put",
        "C{std.core.Object}C{std.core.Object}:", &putMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    for (ani_int i = 0; i < CONCURRENT_MAP_PUT_COUNT; i++) {
        ani_object resource = CreateNativeResourceWithValue(env, i * CONCURRENT_MAP_VALUE_STEP);
        if (resource == nullptr) {
            return ANI_FALSE;
        }
        ani_object boxedKey = nullptr;
        if (env->Primitive_Box_Int(i, &boxedKey) != ANI_OK) {
            env->ResetError();
            return ANI_FALSE;
        }
        if (env->Object_CallMethod_Void(static_cast<ani_object>(mapRef), putMethod,
            static_cast<ani_ref>(boxedKey), static_cast<ani_ref>(resource)) != ANI_OK) {
            env->ResetError();
            return ANI_FALSE;
        }
    }
    return ANI_TRUE;
}

ani_boolean TestNativeObjectInConcurrentSet(ani_env *env, ani_object manager)
{
    ani_ref setRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "concurrentSet", &setRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentSetCls = nullptr;
    if (FindClassFallback(env, "ConcurrentSet", &concurrentSetCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method addMethod = nullptr;
    if (env->Class_FindMethod(concurrentSetCls, "add", "C{std.core.Object}:", &addMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    for (ani_int i = 0; i < CONCURRENT_SET_PUT_COUNT; i++) {
        ani_object resource = CreateNativeResourceWithValue(env, i);
        if (resource == nullptr) {
            return ANI_FALSE;
        }
        if (env->Object_CallMethod_Void(static_cast<ani_object>(setRef), addMethod,
            static_cast<ani_ref>(resource)) != ANI_OK) {
            env->ResetError();
            return ANI_FALSE;
        }
    }
    return ANI_TRUE;
}

ani_boolean TestNativeObjectInConcurrentQueue(ani_env *env, ani_object manager)
{
    ani_ref queueRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "concurrentQueue", &queueRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentQueueCls = nullptr;
    if (FindClassFallback(env, "ConcurrentQueue", &concurrentQueueCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method offerMethod = nullptr;
    if (env->Class_FindMethod(concurrentQueueCls, "offer", "C{std.core.Object}:", &offerMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    for (ani_int i = 0; i < CONCURRENT_QUEUE_PUT_COUNT; i++) {
        ani_object resource = CreateNativeResourceWithValue(env, i);
        if (resource == nullptr) {
            return ANI_FALSE;
        }
        if (env->Object_CallMethod_Void(static_cast<ani_object>(queueRef), offerMethod,
            static_cast<ani_ref>(resource)) != ANI_OK) {
            env->ResetError();
            return ANI_FALSE;
        }
    }
    return ANI_TRUE;
}

ani_boolean TestNativeObjectWithMutex(ani_env *env, ani_object manager)
{
    ani_ref mutexRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "mutex", &mutexRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class mutexCls = nullptr;
    if (FindClassFallback(env, "Mutex", &mutexCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method lockMethod = nullptr;
    ani_method unlockMethod = nullptr;
    if (env->Class_FindMethod(mutexCls, "lock", ":", &lockMethod) != ANI_OK ||
        env->Class_FindMethod(mutexCls, "unlock", ":", &unlockMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    if (env->Object_CallMethod_Void(static_cast<ani_object>(mutexRef), lockMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    ani_object sharedResource = static_cast<ani_object>(g_concurrentSharedObj);
    ani_int value = 0;
    if (sharedResource != nullptr) {
        env->Object_GetPropertyByName_Int(sharedResource, "value", &value);
        value += CONCURRENT_MAP_VALUE_STEP;
        env->Object_SetPropertyByName_Int(sharedResource, "value", value);
    }
    env->Object_CallMethod_Void(static_cast<ani_object>(mutexRef), unlockMethod);
    return ANI_TRUE;
}

ani_boolean TestNativeObjectWithRWLock(ani_env *env, ani_object manager)
{
    ani_ref rwlockRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "rwlock", &rwlockRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class rwlockCls = nullptr;
    if (FindClassFallback(env, "RWLock", &rwlockCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method readLockMethod = nullptr;
    if (env->Class_FindMethod(rwlockCls, "readLock", ":C{std.core.ReadLock}", &readLockMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    ani_ref readLockObj = nullptr;
    if (env->Object_CallMethod_Ref(static_cast<ani_object>(rwlockRef), readLockMethod, &readLockObj) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class readLockCls = nullptr;
    if (env->FindClass("std.core.ReadLock", &readLockCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method lockMethod = nullptr;
    ani_method unlockMethod = nullptr;
    if (env->Class_FindMethod(readLockCls, "lock", ":", &lockMethod) != ANI_OK ||
        env->Class_FindMethod(readLockCls, "unlock", ":", &unlockMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->Object_CallMethod_Void(static_cast<ani_object>(readLockObj), lockMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_object sharedResource = static_cast<ani_object>(g_concurrentSharedObj);
    ani_int value = 0;
    if (sharedResource != nullptr) {
        env->Object_GetPropertyByName_Int(sharedResource, "value", &value);
    }
    env->Object_CallMethod_Void(static_cast<ani_object>(readLockObj), unlockMethod);
    return ANI_TRUE;
}

ani_boolean TestNativeObjectInWorkerLocal(ani_env *env, ani_object manager)
{
    ani_ref workerLocalRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "workerLocal", &workerLocalRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class workerLocalCls = nullptr;
    if (FindClassFallback(env, "WorkerLocal", &workerLocalCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method setMethod = nullptr;
    ani_method getMethod = nullptr;
    if (env->Class_FindMethod(workerLocalCls, "set", "C{std.core.Object}:", &setMethod) != ANI_OK ||
        env->Class_FindMethod(workerLocalCls, "get", ":C{std.core.Object}", &getMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    ani_object resource = CreateNativeResourceWithValue(env, RES_INIT_VALUE);
    if (resource == nullptr) {
        return ANI_FALSE;
    }
    if (env->Object_CallMethod_Void(static_cast<ani_object>(workerLocalRef), setMethod,
        static_cast<ani_ref>(resource)) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref retrieved = nullptr;
    return (env->Object_CallMethod_Ref(static_cast<ani_object>(workerLocalRef), getMethod, &retrieved) == ANI_OK)
               ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNativeObjectCrossEAWorkerMessage(ani_env *env, ani_object manager)
{
    ani_ref msgResource = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "eaMessageResource", &msgResource) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(msgResource, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_int value = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(msgResource), "value", &value) != ANI_OK) {
        return ANI_FALSE;
    }
    if (value != EA_WORKER_MESSAGE_VALUE) {
        return ANI_FALSE;
    }
    ani_int newValue = EA_WORKER_MESSAGE_VALUE + EA_WORKER_MESSAGE_MODIFY;
    return (env->Object_SetPropertyByName_Int(static_cast<ani_object>(msgResource), "value", newValue) == ANI_OK)
               ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestMultiThreadConcurrentAccess(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_vm *vm = nullptr;
    if (env->GetVM(&vm) != ANI_OK) {
        return ANI_FALSE;
    }
    std::vector<std::thread> threads;
    threads.reserve(MULTI_THREAD_COUNT);
    for (ani_int i = 0; i < MULTI_THREAD_COUNT; i++) {
        threads.emplace_back([vm]() {
            ani_env *workerEnv = nullptr;
            ani_options options{};
            if (vm->AttachCurrentThread(&options, ANI_VERSION_1, &workerEnv) != ANI_OK) {
                return;
            }
            workerEnv->CreateLocalScope(LOCAL_SCOPE_CAPACITY);
            {
                std::lock_guard<std::mutex> lock(g_concurrentMutex);
                ani_object sharedObj = static_cast<ani_object>(g_concurrentSharedObj);
                if (sharedObj != nullptr) {
                    ani_int value = 0;
                    workerEnv->Object_GetPropertyByName_Int(sharedObj, "value", &value);
                    value += RES_INCREMENT_STEP;
                    workerEnv->Object_SetPropertyByName_Int(sharedObj, "value", value);
                }
            }
            workerEnv->DestroyLocalScope();
            vm->DetachCurrentThread();
        });
    }
    for (auto &th : threads) {
        th.join();
    }
    return ANI_TRUE;
}

ani_boolean TestNativeObjectAsyncPromiseCreate(ani_env *env, ani_object manager)
{
    ani_object resource = CreateNativeResourceWithValue(env, ASYNC_PROMISE_FINAL_VALUE);
    if (resource == nullptr) {
        return ANI_FALSE;
    }
    return (env->Object_SetFieldByName_Ref(manager, "asyncPromise", resource) == ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNativeObjectAsyncPromiseResolve(ani_env *env, ani_object manager)
{
    ani_ref ref = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "asyncPromise", &ref) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int value = 0;
    return (env->Object_GetPropertyByName_Int(static_cast<ani_object>(ref), "value", &value) == ANI_OK &&
            value == ASYNC_PROMISE_FINAL_VALUE) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNativeETSMultiInteraction(ani_env *env, ani_object manager)
{
    ani_class managerCls = nullptr;
    if (env->FindClass("entry.src.main.src.ets.Index.MultiInteractionManager", &managerCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method etsCreate = nullptr;
    if (env->Class_FindMethod(managerCls, "etsCreateResource",
        ":C{entry.src.main.src.ets.Index.NativeResource}", &etsCreate) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref etsCreated = nullptr;
    if (env->Object_CallMethod_Ref(manager, etsCreate, &etsCreated) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->Object_SetPropertyByName_Int(static_cast<ani_object>(etsCreated), "value", RES_INIT_VALUE) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method etsModify = nullptr;
    if (env->Class_FindMethod(managerCls, "etsModifyResource",
        "C{entry.src.main.src.ets.Index.NativeResource}:C{entry.src.main.src.ets.Index.NativeResource}",
        &etsModify) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref etsModified = nullptr;
    if (env->Object_CallMethod_Ref(manager, etsModify, &etsModified, etsCreated) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method etsValidate = nullptr;
    if (env->Class_FindMethod(managerCls, "etsValidateResource",
        "C{entry.src.main.src.ets.Index.NativeResource}:z", &etsValidate) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean valid = ANI_FALSE;
    return (env->Object_CallMethod_Boolean(manager, etsValidate, &valid, etsModified) == ANI_OK &&
            valid == ANI_TRUE) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNativeETSRecursiveInteraction(ani_env *env, ani_object manager)
{
    ani_class managerCls = nullptr;
    if (env->FindClass("entry.src.main.src.ets.Index.RecursiveInteractionManager", &managerCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method etsStartChain = nullptr;
    if (env->Class_FindMethod(managerCls, "etsStartChain",
        "i:C{entry.src.main.src.ets.Index.NativeResource}", &etsStartChain) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref resultRef = nullptr;
    constexpr ani_int RECURSIVE_INTERACTION_DEPTH = 3;
    constexpr ani_int RECURSIVE_INTERACTION_EXPECTED_VALUE = 600;
    if (env->Object_CallMethod_Ref(manager, etsStartChain, &resultRef,
        static_cast<ani_int>(RECURSIVE_INTERACTION_DEPTH)) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_object resource = static_cast<ani_object>(resultRef);
    ani_int value = 0;
    if (env->Object_GetFieldByName_Int(resource, "value", &value) != ANI_OK) {
        return ANI_FALSE;
    }
    return (value == RECURSIVE_INTERACTION_EXPECTED_VALUE) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNativeObjectAsyncCallbackChain(ani_env *env, ani_object manager)
{
    ani_object resource = CreateNativeResourceWithValue(env, 0);
    if (resource == nullptr) {
        return ANI_FALSE;
    }
    if (env->Object_SetFieldByName_Ref(manager, "chainResource", static_cast<ani_ref>(resource)) != ANI_OK) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean TestNativeObjectWorkerAsyncRoundtrip(ani_env *env, ani_object manager)
{
    ani_object resource = CreateNativeResourceWithValue(env, 99);
    if (resource == nullptr) {
        return ANI_FALSE;
    }
    if (env->Object_SetFieldByName_Ref(manager, "workerResource", static_cast<ani_ref>(resource)) != ANI_OK) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean TestNativeObjectTaskPoolAsyncExecute(ani_env *env, ani_object manager)
{
    ani_object resource = CreateNativeResourceWithValue(env, 50);
    if (resource == nullptr) {
        return ANI_FALSE;
    }
    if (env->Object_SetFieldByName_Ref(manager, "taskResource", static_cast<ani_ref>(resource)) != ANI_OK) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

const ani_native_function g_concurrentMethods[] = {
    {"testNativeObjectInConcurrentHashMapNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectInConcurrentHashMap)},
    {"testNativeObjectInConcurrentSetNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectInConcurrentSet)},
    {"testNativeObjectInConcurrentQueueNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectInConcurrentQueue)},
    {"testNativeObjectWithMutexNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectWithMutex)},
    {"testNativeObjectWithRWLockNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectWithRWLock)},
    {"testNativeObjectInWorkerLocalNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectInWorkerLocal)},
    {"testNativeObjectCrossEAWorkerMessageNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectCrossEAWorkerMessage)},
    {"testMultiThreadConcurrentAccessNative", ":z",
     reinterpret_cast<void *>(TestMultiThreadConcurrentAccess)},
    {"testNativeObjectAsyncPromiseCreateNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectAsyncPromiseCreate)},
    {"testNativeObjectAsyncPromiseResolveNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectAsyncPromiseResolve)},
    {"testNativeETSMultiInteractionNative", ":z",
     reinterpret_cast<void *>(TestNativeETSMultiInteraction)},
    {"testNativeETSRecursiveInteractionNative", ":z",
     reinterpret_cast<void *>(TestNativeETSRecursiveInteraction)},
    {"testNativeObjectAsyncCallbackChainNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectAsyncCallbackChain)},
    {"testNativeObjectWorkerAsyncRoundtripNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectWorkerAsyncRoundtrip)},
    {"testNativeObjectTaskPoolAsyncExecuteNative", ":z",
     reinterpret_cast<void *>(TestNativeObjectTaskPoolAsyncExecute)},
};

const char *const CLASS_CONC_MAP = "entry.src.main.src.ets.Index.ConcurrentMapManager";
const char *const CLASS_CONC_SET = "entry.src.main.src.ets.Index.ConcurrentSetManager";
const char *const CLASS_CONC_QUEUE = "entry.src.main.src.ets.Index.ConcurrentQueueManager";
const char *const CLASS_MUTEX = "entry.src.main.src.ets.Index.MutexManager";
const char *const CLASS_RWLOCK = "entry.src.main.src.ets.Index.RWLockManager";
const char *const CLASS_WORKERLOCAL = "entry.src.main.src.ets.Index.WorkerLocalManager";
const char *const CLASS_EA = "entry.src.main.src.ets.Index.EAWorkerMessageManager";
const char *const CLASS_MULTI = "entry.src.main.src.ets.Index.MultiThreadManager";
const char *const CLASS_ASYNC = "entry.src.main.src.ets.Index.AsyncPromiseManager";
const char *const CLASS_INTERACT = "entry.src.main.src.ets.Index.MultiInteractionManager";
const char *const CLASS_RECURSIVE = "entry.src.main.src.ets.Index.RecursiveInteractionManager";
const char *const CLASS_ASYNC_CHAIN = "entry.src.main.src.ets.Index.AsyncCallbackChainManager";
const char *const CLASS_WORKER_RT = "entry.src.main.src.ets.Index.WorkerAsyncRoundtripManager";
const char *const CLASS_TASKPOOL = "entry.src.main.src.ets.Index.TaskPoolAsyncExecuteManager";

} // namespace

ani_status BindConcurrentStorageTest(ani_vm *vm)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        AniTestLog("ConcurrentStorageTest: unsupported ANI_VERSION_1");
        return static_cast<ani_status>(ANI_RES_OUT_OF_REF);
    }
    if (g_concurrentSharedObj == nullptr) {
        ani_object shared = CreateNativeResourceWithValue(env, RES_INIT_VALUE_ZERO);
        if (shared != nullptr) {
            env->GlobalReference_Create(shared, &g_concurrentSharedObj);
        }
    }
    WarmupFindClass(env, "entry.src.main.src.ets.Index.ConcurrentHashMap");
    WarmupFindClass(env, "entry.src.main.src.ets.Index.ConcurrentSet");
    WarmupFindClass(env, "entry.src.main.src.ets.Index.ConcurrentQueue");
    WarmupFindClass(env, "std.core.Mutex");
    WarmupFindClass(env, "std.core.RWLock");
    WarmupFindClass(env, "std.core.ReadLock");
    WarmupFindClass(env, "std.core.WriteLock");
    WarmupFindClass(env, "std.concurrency.WorkerLocal");
    const char *const classes[] = {
        CLASS_CONC_MAP,    CLASS_CONC_SET,    CLASS_CONC_QUEUE, CLASS_MUTEX,   CLASS_RWLOCK,
        CLASS_WORKERLOCAL, CLASS_EA,          CLASS_MULTI,      CLASS_ASYNC,   CLASS_INTERACT,
        CLASS_RECURSIVE,   CLASS_ASYNC_CHAIN, CLASS_WORKER_RT,  CLASS_TASKPOOL};
    for (const char *clsName : classes) {
        BindClassMethods(env, clsName, g_concurrentMethods,
            sizeof(g_concurrentMethods) / sizeof(g_concurrentMethods[0]),
            "ConcurrentStorageTest");
    }
    return ANI_OK;
}

void CleanupConcurrentStorageTest(ani_env *env)
{
    std::lock_guard<std::mutex> lock(g_concurrentMutex);
    if (g_concurrentSharedObj != nullptr) {
        env->GlobalReference_Delete(g_concurrentSharedObj);
        g_concurrentSharedObj = nullptr;
    }
}
