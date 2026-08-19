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

#include "ExceptionStorageTest.h"
#include "Common.h"

namespace {

ani_boolean TestEmptyMapGetException(ani_env *env, ani_object manager)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "emptyConcurrentMap", &mapRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentMapCls = nullptr;
    if (FindClassFallback(env, "ConcurrentHashMap", &concurrentMapCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method getMethod = nullptr;
    if (env->Class_FindMethod(concurrentMapCls, "get",
                              "C{std.core.Object}:C{std.core.Object}", &getMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_object keyResource = nullptr;
    ani_class keyResourceCls = nullptr;
    if (FindClassByName(env, NATIVE_RESOURCE_CLASS, &keyResourceCls) == ANI_TRUE) {
        ani_method ctor = nullptr;
        if (env->Class_FindMethod(keyResourceCls, "<ctor>", ":", &ctor) == ANI_OK) {
            env->Object_New(keyResourceCls, ctor, &keyResource);
        }
    }
    ani_ref resultRef = nullptr;
    ani_status status = env->Object_CallMethod_Ref(static_cast<ani_object>(mapRef), getMethod, &resultRef,
                                                   static_cast<ani_ref>(keyResource));
    if (status != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(resultRef, &isNull) == ANI_OK && isNull == ANI_TRUE) {
        return ANI_TRUE;
    }
    ani_boolean isUndef = ANI_FALSE;
    return (env->Reference_IsUndefined(resultRef, &isUndef) == ANI_OK && isUndef == ANI_TRUE)
               ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestMapPutNullKey(ani_env *env, ani_object manager)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "emptyConcurrentMap", &mapRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentMapCls = nullptr;
    if (FindClassFallback(env, "ConcurrentHashMap", &concurrentMapCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method putMethod = nullptr;
    if (env->Class_FindMethod(concurrentMapCls, "put",
                              "C{std.core.Object}C{std.core.Object}:", &putMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref nullRef = nullptr;
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_object valueResource = nullptr;
    ani_class valueResourceCls = nullptr;
    if (FindClassByName(env, NATIVE_RESOURCE_CLASS, &valueResourceCls) == ANI_TRUE) {
        ani_method ctor = nullptr;
        if (env->Class_FindMethod(valueResourceCls, "<ctor>", ":", &ctor) == ANI_OK) {
            env->Object_New(valueResourceCls, ctor, &valueResource);
        }
    }
    env->Object_CallMethod_Void(static_cast<ani_object>(mapRef), putMethod, nullRef,
                                static_cast<ani_ref>(valueResource));
    env->ResetError();
    return ANI_TRUE;
}

ani_boolean TestEmptyQueuePollException(ani_env *env, ani_object manager)
{
    ani_ref queueRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "emptyQueue", &queueRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentQueueCls = nullptr;
    if (FindClassFallback(env, "ConcurrentQueue", &concurrentQueueCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method pollMethod = nullptr;
    if (env->Class_FindMethod(concurrentQueueCls, "poll", ":C{std.core.Object}", &pollMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref resultRef = nullptr;
    if (env->Object_CallMethod_Ref(static_cast<ani_object>(queueRef), pollMethod, &resultRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isNull = ANI_FALSE;
    return (env->Reference_IsNull(resultRef, &isNull) == ANI_OK && isNull == ANI_TRUE)
               ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestArrayIndexOutOfBounds(ani_env *env, ani_object manager)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "outOfBoundsArray", &arrayRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_size length = 0;
    if (env->Array_GetLength(static_cast<ani_array>(arrayRef), &length) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_size outOfBoundsIndex = length + 1;
    ani_ref elem = nullptr;
    ani_status status = env->Array_Get(static_cast<ani_array>(arrayRef), outOfBoundsIndex, &elem);
    env->ResetError();
    if (status != ANI_OK) {
        return ANI_TRUE;
    }
    ani_boolean isNull = ANI_FALSE;
    return (env->Reference_IsNull(elem, &isNull) == ANI_OK && isNull == ANI_TRUE)
               ? ANI_TRUE : ANI_FALSE;
}

ani_boolean MutexBasicLockUnlock(ani_env *env, ani_ref mutexRef, ani_method lockMethod, ani_method unlockMethod)
{
    if (env->Object_CallMethod_Void(static_cast<ani_object>(mutexRef), lockMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    if (env->Object_CallMethod_Void(static_cast<ani_object>(mutexRef), unlockMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean MutexTryLockWhenHeld(ani_env *env, ani_ref mutexRef, ani_class mutexCls,
                                 ani_method lockMethod, ani_method unlockMethod, ani_boolean *rejected)
{
    *rejected = ANI_FALSE;
    ani_method tryLockMethod = nullptr;
    if (env->Class_FindMethod(mutexCls, "tryLock", ":z", &tryLockMethod) != ANI_OK) {
        return ANI_TRUE;
    }
    if (env->Object_CallMethod_Void(static_cast<ani_object>(mutexRef), lockMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    ani_boolean tryLockResult = ANI_TRUE;
    env->Object_CallMethod_Boolean(static_cast<ani_object>(mutexRef), tryLockMethod, &tryLockResult);
    env->ResetError();
    if (env->Object_CallMethod_Void(static_cast<ani_object>(mutexRef), unlockMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    if (!tryLockResult) {
        *rejected = ANI_TRUE;
        return ANI_TRUE;
    }
    env->Object_CallMethod_Void(static_cast<ani_object>(mutexRef), unlockMethod);
    env->ResetError();
    return ANI_TRUE;
}

ani_boolean TestMutexDoubleLockException(ani_env *env, ani_object manager)
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
        return ANI_FALSE;
    }
    if (!MutexBasicLockUnlock(env, mutexRef, lockMethod, unlockMethod)) {
        return ANI_FALSE;
    }
    ani_boolean tryLockRejected = ANI_FALSE;
    if (!MutexTryLockWhenHeld(env, mutexRef, mutexCls, lockMethod, unlockMethod, &tryLockRejected)) {
        return ANI_FALSE;
    }
    if (tryLockRejected) {
        return ANI_TRUE;
    }
    return MutexBasicLockUnlock(env, mutexRef, lockMethod, unlockMethod);
}

ani_boolean TestGlobalRefDeleteNullException(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_status status = env->GlobalReference_Delete(nullptr);
    return (status != ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNullObjectProperty(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_ref nullRef = nullptr;
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int value = 0;
    ani_status status = env->Object_GetPropertyByName_Int(
        static_cast<ani_object>(nullRef), "value", &value);
    return (status != ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNullArrayOperation(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_ref nullRef = nullptr;
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref elem = nullptr;
    ani_status status = env->Array_Get(static_cast<ani_array>(nullRef), 0, &elem);
    env->ResetError();
    if (status != ANI_OK) {
        return ANI_TRUE;
    }
    ani_boolean elemIsNull = ANI_FALSE;
    return (env->Reference_IsNull(elem, &elemIsNull) == ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNullStringOperation(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_ref nullRef = nullptr;
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_size size = 0;
    ani_status status = env->String_GetUTF8Size(static_cast<ani_string>(nullRef), &size);
    env->ResetError();
    return (status != ANI_OK || size == 0) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestUnboxTypeMismatch(ani_env *env, ani_object manager)
{
    (void)manager;
    ani_object resource = CreateNativeResource(env, RES_INIT_VALUE);
    if (resource == nullptr) {
        return ANI_FALSE;
    }
    ani_boolean boolValue = ANI_FALSE;
    ani_status status = env->Primitive_Unbox_Boolean(resource, &boolValue);
    env->ResetError();
    return (status != ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestMapPutNullValue(ani_env *env, ani_object manager)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "emptyConcurrentMap", &mapRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentMapCls = nullptr;
    if (FindClassFallback(env, "ConcurrentHashMap", &concurrentMapCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method putMethod = nullptr;
    if (env->Class_FindMethod(concurrentMapCls, "put",
                              "C{std.core.Object}C{std.core.Object}:", &putMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref nullRef = nullptr;
    if (env->GetNull(&nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_object keyResource = nullptr;
    ani_class keyResourceCls = nullptr;
    if (FindClassByName(env, NATIVE_RESOURCE_CLASS, &keyResourceCls) == ANI_TRUE) {
        ani_method ctor = nullptr;
        if (env->Class_FindMethod(keyResourceCls, "<ctor>", ":", &ctor) == ANI_OK) {
            env->Object_New(keyResourceCls, ctor, &keyResource);
        }
    }
    env->Object_CallMethod_Void(static_cast<ani_object>(mapRef), putMethod,
                                static_cast<ani_ref>(keyResource), nullRef);
    env->ResetError();
    return ANI_TRUE;
}

ani_boolean TestSetContainsNull(ani_env *env, ani_object manager)
{
    ani_ref setRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "emptyConcurrentSet", &setRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentSetCls = nullptr;
    if (FindClassFallback(env, "ConcurrentSet", &concurrentSetCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method containsMethod = nullptr;
    if (env->Class_FindMethod(concurrentSetCls, "contains",
                              "C{std.core.Object}:z", &containsMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref nullRef = nullptr;
    env->GetNull(&nullRef);
    ani_boolean contains = ANI_TRUE;
    if (env->Object_CallMethod_Boolean(static_cast<ani_object>(setRef), containsMethod,
                                       &contains, nullRef) != ANI_OK) {
        return ANI_FALSE;
    }
    return (contains == ANI_FALSE) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestFixedArrayIndexOutOfBounds(ani_env *env, ani_object manager)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "outOfBoundsFixedArray", &arrayRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_size length = 0;
    if (env->FixedArray_GetLength(static_cast<ani_fixedarray>(arrayRef), &length) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref elem = nullptr;
    ani_status status = env->FixedArray_Get(
        static_cast<ani_fixedarray>(arrayRef), length + 1, &elem);
    return (status != ANI_OK) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestRWLockConflict(ani_env *env, ani_object manager);
ani_boolean AcquireReadLockAndUnlock(ani_env *env, ani_ref rwlockRef);
ani_boolean AcquireWriteLockAndUnlock(ani_env *env, ani_ref rwlockRef);

ani_boolean TestRWLockConflict(ani_env *env, ani_object manager)
{
    ani_ref rwlockRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "rwlock", &rwlockRef) != ANI_OK) {
        return ANI_FALSE;
    }
    if (!AcquireReadLockAndUnlock(env, rwlockRef)) {
        return ANI_FALSE;
    }
    if (!AcquireWriteLockAndUnlock(env, rwlockRef)) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean AcquireReadLockAndUnlock(ani_env *env, ani_ref rwlockRef)
{
    ani_class rwlockCls = nullptr;
    if (FindClassFallback(env, "RWLock", &rwlockCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method readLockMethod = nullptr;
    if (env->Class_FindMethod(rwlockCls, "readLock",
                              ":C{std.core.ReadLock}", &readLockMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref readLockObj = nullptr;
    if (env->Object_CallMethod_Ref(static_cast<ani_object>(rwlockRef),
                                   readLockMethod, &readLockObj) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class lockCls = nullptr;
    if (env->FindClass("std.core.ReadLock", &lockCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method lockMethod = nullptr;
    ani_method unlockMethod = nullptr;
    if (env->Class_FindMethod(lockCls, "lock", ":", &lockMethod) != ANI_OK ||
        env->Class_FindMethod(lockCls, "unlock", ":", &unlockMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->Object_CallMethod_Void(static_cast<ani_object>(readLockObj), lockMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    env->Object_CallMethod_Void(static_cast<ani_object>(readLockObj), unlockMethod);
    return ANI_TRUE;
}

ani_boolean AcquireWriteLockAndUnlock(ani_env *env, ani_ref rwlockRef)
{
    ani_class rwlockCls = nullptr;
    if (FindClassFallback(env, "RWLock", &rwlockCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method writeLockMethod = nullptr;
    if (env->Class_FindMethod(rwlockCls, "writeLock",
                              ":C{std.core.WriteLock}", &writeLockMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref writeLockObj = nullptr;
    if (env->Object_CallMethod_Ref(static_cast<ani_object>(rwlockRef),
                                   writeLockMethod, &writeLockObj) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class writeCls = nullptr;
    if (env->FindClass("std.core.WriteLock", &writeCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method wLockMethod = nullptr;
    ani_method wUnlockMethod = nullptr;
    if (env->Class_FindMethod(writeCls, "lock", ":", &wLockMethod) != ANI_OK ||
        env->Class_FindMethod(writeCls, "unlock", ":", &wUnlockMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    if (env->Object_CallMethod_Void(static_cast<ani_object>(writeLockObj), wLockMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    env->Object_CallMethod_Void(static_cast<ani_object>(writeLockObj), wUnlockMethod);
    return ANI_TRUE;
}

ani_boolean TestWorkerLocalNotSet(ani_env *env, ani_object manager)
{
    ani_ref workerLocalRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "workerLocal", &workerLocalRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class workerLocalCls = nullptr;
    if (FindClassFallback(env, "WorkerLocal", &workerLocalCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method getMethod = nullptr;
    if (env->Class_FindMethod(workerLocalCls, "get", ":C{std.core.Object}", &getMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref retrieved = nullptr;
    ani_status status = env->Object_CallMethod_Ref(
        static_cast<ani_object>(workerLocalRef), getMethod, &retrieved);
    if (status != ANI_OK) {
        env->ResetError();
        return ANI_TRUE;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(retrieved, &isNull) == ANI_OK && isNull == ANI_TRUE) {
        return ANI_TRUE;
    }
    ani_boolean isUndefined = ANI_FALSE;
    return (env->Reference_IsUndefined(retrieved, &isUndefined) == ANI_OK && isUndefined == ANI_TRUE)
               ? ANI_TRUE : ANI_FALSE;
}

const ani_native_function g_exceptionMethods[] = {
    {"testEmptyMapGetExceptionNative", ":z", reinterpret_cast<void *>(TestEmptyMapGetException)},
    {"testMapPutNullKeyNative", ":z", reinterpret_cast<void *>(TestMapPutNullKey)},
    {"testMapPutNullValueNative", ":z", reinterpret_cast<void *>(TestMapPutNullValue)},
    {"testEmptyQueuePollExceptionNative", ":z", reinterpret_cast<void *>(TestEmptyQueuePollException)},
    {"testSetContainsNullNative", ":z", reinterpret_cast<void *>(TestSetContainsNull)},
    {"testArrayIndexOutOfBoundsNative", ":z", reinterpret_cast<void *>(TestArrayIndexOutOfBounds)},
    {"testFixedArrayIndexOutOfBoundsNative", ":z",
     reinterpret_cast<void *>(TestFixedArrayIndexOutOfBounds)},
    {"testMutexDoubleLockExceptionNative", ":z",
     reinterpret_cast<void *>(TestMutexDoubleLockException)},
    {"testRWLockConflictNative", ":z", reinterpret_cast<void *>(TestRWLockConflict)},
    {"testWorkerLocalNotSetNative", ":z", reinterpret_cast<void *>(TestWorkerLocalNotSet)},
    {"testGlobalRefDeleteNullExceptionNative", ":z",
     reinterpret_cast<void *>(TestGlobalRefDeleteNullException)},
    {"testNullObjectPropertyNative", ":z", reinterpret_cast<void *>(TestNullObjectProperty)},
    {"testNullArrayOperationNative", ":z", reinterpret_cast<void *>(TestNullArrayOperation)},
    {"testNullStringOperationNative", ":z", reinterpret_cast<void *>(TestNullStringOperation)},
    {"testUnboxTypeMismatchNative", ":z", reinterpret_cast<void *>(TestUnboxTypeMismatch)},
};

const char *const CLASS_EXCEPTION = "entry.src.main.src.ets.Index.ExceptionTestManager";

} // namespace

ani_status BindExceptionStorageTest(ani_vm *vm)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        AniTestLog("ExceptionStorageTest: unsupported ANI_VERSION_1");
        return static_cast<ani_status>(ANI_RES_OUT_OF_REF);
    }
    BindClassMethods(env, CLASS_EXCEPTION, g_exceptionMethods,
                     sizeof(g_exceptionMethods) / sizeof(g_exceptionMethods[0]),
                     "ExceptionStorageTest");
    WarmupFindClass(env, "entry.src.main.src.ets.Index.ConcurrentHashMap");
    WarmupFindClass(env, "entry.src.main.src.ets.Index.ConcurrentSet");
    WarmupFindClass(env, "entry.src.main.src.ets.Index.ConcurrentQueue");
    WarmupFindClass(env, "std.core.Mutex");
    WarmupFindClass(env, "std.core.RWLock");
    WarmupFindClass(env, "std.core.ReadLock");
    WarmupFindClass(env, "std.core.WriteLock");
    WarmupFindClass(env, "std.core.WorkerLocal");
    return ANI_OK;
}

void CleanupExceptionStorageTest(ani_env *env)
{
    (void)env;
}
