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

#include "ClassStorageTest.h"
#include "CommonDel.h"
#include <mutex>

namespace {

ani_object CreateAndStoreNativeObject(ani_env *env, ani_object holder)
{
    ani_object resource = CreateNativeResource(env, RES_INIT_VALUE);
    if (resource == nullptr) {
        return nullptr;
    }
    if (env->Object_SetFieldByName_Ref(holder, "nativeObj", resource) != ANI_OK) {
        return nullptr;
    }
    return resource;
}

ani_int GetNativeObjectValue(ani_env *env, ani_object holder)
{
    ani_ref objRef = nullptr;
    if (env->Object_GetFieldByName_Ref(holder, "nativeObj", &objRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(objRef, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int value = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(objRef), "value", &value) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return value;
}

ani_status SetNativeObjectValue(ani_env *env, ani_object holder, ani_int value)
{
    ani_ref objRef = nullptr;
    if (env->Object_GetFieldByName_Ref(holder, "nativeObj", &objRef) != ANI_OK) {
        return ANI_ERROR;
    }
    return env->Object_SetPropertyByName_Int(static_cast<ani_object>(objRef), "value", value);
}

ani_object CreateResource(ani_env *env, [[maybe_unused]] ani_object container)
{
    return CreateNativeResource(env, RES_INIT_VALUE);
}

ani_int GetResourceData(ani_env *env, ani_object container)
{
    ani_ref resourceRef = nullptr;
    if (env->Object_GetPropertyByName_Ref(container, "resource", &resourceRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int data = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(resourceRef), "value", &data) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return data;
}

ani_object CreateNativeData(ani_env *env, [[maybe_unused]] ani_object holder)
{
    ani_class dataCls = nullptr;
    if (FindClassByName(env, NATIVE_DATA_CLASS, &dataCls) != ANI_TRUE) {
        return nullptr;
    }
    ani_method ctor = nullptr;
    if (env->Class_FindMethod(dataCls, "<ctor>", ":", &ctor) != ANI_OK) {
        return nullptr;
    }
    ani_object data = nullptr;
    if (env->Object_New(dataCls, ctor, &data) != ANI_OK) {
        return nullptr;
    }
    if (env->Object_SetPropertyByName_Int(data, "value", RES_INIT_VALUE) != ANI_OK) {
        return nullptr;
    }
    return data;
}

ani_int GetDataValue(ani_env *env, ani_object holder)
{
    ani_ref dataRef = nullptr;
    if (env->Object_GetFieldByName_Ref(holder, "data", &dataRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(dataRef, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int value = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(dataRef), "value", &value) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return value;
}

ani_ref g_sharedResourceGlobal = nullptr;
std::mutex g_sharedResourceMutex;

ani_status InitSharedResource(ani_env *env, ani_class cls)
{
    ani_object resource = CreateNativeResource(env, RES_INIT_VALUE_ALT);
    if (resource == nullptr) {
        return ANI_ERROR;
    }
    if (env->Class_SetStaticFieldByName_Ref(cls, "sharedResource", resource) != ANI_OK) {
        return ANI_ERROR;
    }
    std::lock_guard<std::mutex> lock(g_sharedResourceMutex);
    if (g_sharedResourceGlobal != nullptr) {
        env->GlobalReference_Delete(g_sharedResourceGlobal);
    }
    if (env->GlobalReference_Create(resource, &g_sharedResourceGlobal) != ANI_OK) {
        return ANI_ERROR;
    }
    return ANI_OK;
}

ani_int GetSharedResourceValue(ani_env *env, [[maybe_unused]] ani_object manager)
{
    std::lock_guard<std::mutex> lock(g_sharedResourceMutex);
    if (g_sharedResourceGlobal == nullptr) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int value = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(g_sharedResourceGlobal), "value", &value) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return value;
}

ani_status UpdateSharedResourceValue(ani_env *env, [[maybe_unused]] ani_object manager, ani_int value)
{
    std::lock_guard<std::mutex> lock(g_sharedResourceMutex);
    if (g_sharedResourceGlobal == nullptr) {
        return ANI_ERROR;
    }
    return env->Object_SetPropertyByName_Int(static_cast<ani_object>(g_sharedResourceGlobal), "value", value);
}

ani_status AddResourceToCollection(ani_env *env, ani_object collection, ani_object resource)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetPropertyByName_Ref(collection, "resources", &arrayRef) != ANI_OK) {
        return ANI_ERROR;
    }
    return env->Array_Push(static_cast<ani_array>(arrayRef), resource);
}

ani_int GetResourceCount(ani_env *env, ani_object collection)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetPropertyByName_Ref(collection, "resources", &arrayRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_size length = 0;
    if (env->Array_GetLength(static_cast<ani_array>(arrayRef), &length) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return static_cast<ani_int>(length);
}

ani_object GetResourceAtIndex(ani_env *env, ani_object collection, ani_int index)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetPropertyByName_Ref(collection, "resources", &arrayRef) != ANI_OK) {
        return nullptr;
    }
    ani_ref elemRef = nullptr;
    if (env->Array_Get(static_cast<ani_array>(arrayRef), static_cast<ani_size>(index), &elemRef) != ANI_OK) {
        return nullptr;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(elemRef, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return nullptr;
    }
    return static_cast<ani_object>(elemRef);
}

const ani_native_function g_classStorageMethods[] = {
    {"createAndStoreNativeObject", ":C{entry.src.main.src.ets.Index.NativeResource}",
     reinterpret_cast<void *>(CreateAndStoreNativeObject)},
    {"getNativeObjectValue", ":i", reinterpret_cast<void *>(GetNativeObjectValue)},
    {"setNativeObjectValue", "i:", reinterpret_cast<void *>(SetNativeObjectValue)},
    {"createResource", ":C{entry.src.main.src.ets.Index.NativeResource}",
     reinterpret_cast<void *>(CreateResource)},
    {"getResourceData", ":i", reinterpret_cast<void *>(GetResourceData)},
    {"createNativeData", ":C{entry.src.main.src.ets.Index.NativeData}",
     reinterpret_cast<void *>(CreateNativeData)},
    {"getDataValue", ":i", reinterpret_cast<void *>(GetDataValue)},
    {"initSharedResource", ":", reinterpret_cast<void *>(InitSharedResource)},
    {"getSharedResourceValue", ":i", reinterpret_cast<void *>(GetSharedResourceValue)},
    {"updateSharedResourceValue", "i:", reinterpret_cast<void *>(UpdateSharedResourceValue)},
    {"addResource", "C{entry.src.main.src.ets.Index.NativeResource}:",
     reinterpret_cast<void *>(AddResourceToCollection)},
    {"getResourceCount", ":i", reinterpret_cast<void *>(GetResourceCount)},
    {"getResourceAtIndex", "i:X{C{entry.src.main.src.ets.Index.NativeResource}C{std.core.Null}}",
     reinterpret_cast<void *>(GetResourceAtIndex)},
};

const char *const CLASS_HOLDER = "entry.src.main.src.ets.Index.NativeObjectHolder";
const char *const CLASS_CONTAINER = "entry.src.main.src.ets.Index.ResourceContainer";
const char *const CLASS_GLOBAL_MGR = "entry.src.main.src.ets.Index.GlobalResourceManager";
const char *const CLASS_DATA_HOLDER = "entry.src.main.src.ets.Index.DataHolderImpl";
const char *const CLASS_COLLECTION = "entry.src.main.src.ets.Index.ResourceCollectionImpl";

} // namespace

ani_status BindClassStorageTest(ani_vm *vm)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        AniTestLog("ClassStorageTest: unsupported ANI_VERSION_1");
        return static_cast<ani_status>(ANI_RES_OUT_OF_REF);
    }

    const char *const classes[] = {CLASS_HOLDER, CLASS_CONTAINER, CLASS_GLOBAL_MGR, CLASS_DATA_HOLDER,
                                   CLASS_COLLECTION};
    for (const char *clsName : classes) {
        BindClassMethods(env, clsName, g_classStorageMethods,
                         sizeof(g_classStorageMethods) / sizeof(g_classStorageMethods[0]), "ClassStorageTest");
    }
    ani_class globalCls = nullptr;
    if (env->FindClass(CLASS_GLOBAL_MGR, &globalCls) == ANI_OK) {
        InitSharedResource(env, globalCls);
    }
    return ANI_OK;
}

void CleanupClassStorageTest(ani_env *env)
{
    std::lock_guard<std::mutex> lock(g_sharedResourceMutex);
    if (g_sharedResourceGlobal != nullptr) {
        env->GlobalReference_Delete(g_sharedResourceGlobal);
        g_sharedResourceGlobal = nullptr;
    }
}
