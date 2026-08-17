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

#include "ContainerStorageTest.h"
#include "Common.h"

#include <vector>

namespace {

ani_object GetExplicitNullRes(ani_env *env)
{
    ani_ref nullRef = nullptr;
    return (env->GetNull(&nullRef) == ANI_OK) ? static_cast<ani_object>(nullRef) : nullptr;
}

ani_object CreateResourceWithKey(ani_env *env, ani_object manager, ani_string key)
{
    (void)manager;
    (void)key;
    return CreateNativeResource(env, RES_INIT_VALUE);
}

ani_status AddResourceToMap(ani_env *env, ani_object manager, ani_string key, ani_object resource)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceMap", &mapRef) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_class mapCls = nullptr;
    if (env->FindClass("std.core.Map", &mapCls) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_method setMethod = nullptr;
    if (env->Class_FindMethod(mapCls, "set",
                              "C{std.core.Object}C{std.core.Object}:C{std.core.Map}",
                              &setMethod) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_ref result = nullptr;
    return env->Object_CallMethod_Ref(static_cast<ani_object>(mapRef), setMethod, &result, key, resource);
}

ani_object GetResourceFromMap(ani_env *env, ani_object manager, ani_string key)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceMap", &mapRef) != ANI_OK) {
        return nullptr;
    }
    ani_class mapCls = nullptr;
    if (env->FindClass("std.core.Map", &mapCls) != ANI_OK) {
        return nullptr;
    }
    ani_method getMethod = nullptr;
    if (env->Class_FindMethod(mapCls, "get", "C{std.core.Object}:C{std.core.Object}", &getMethod) != ANI_OK) {
        return nullptr;
    }
    ani_ref result = nullptr;
    if (env->Object_CallMethod_Ref(static_cast<ani_object>(mapRef), getMethod, &result, key) != ANI_OK) {
        return nullptr;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(result, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return nullptr;
    }
    return static_cast<ani_object>(result);
}

ani_int GetMapSize(ani_env *env, ani_object manager)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceMap", &mapRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int size = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(mapRef), "size", &size) == ANI_OK) {
        return size;
    }
    return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
}

ani_boolean RemoveResourceFromMap(ani_env *env, ani_object manager, ani_string key)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceMap", &mapRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class mapCls = nullptr;
    if (env->FindClass("std.core.Map", &mapCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method deleteMethod = nullptr;
    if (env->Class_FindMethod(mapCls, "delete", "C{std.core.Object}:z", &deleteMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean removed = ANI_FALSE;
    if (env->Object_CallMethod_Boolean(static_cast<ani_object>(mapRef), deleteMethod, &removed, key) != ANI_OK) {
        return ANI_FALSE;
    }
    return removed;
}

ani_object CreateUniqueResource(ani_env *env, ani_object manager, ani_int id)
{
    (void)manager;
    return CreateNativeResource(env, id);
}

ani_boolean AddResourceToSet(ani_env *env, ani_object manager, ani_object resource)
{
    ani_ref setRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceSet", &setRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class setCls = nullptr;
    if (env->FindClass("std.core.Set", &setCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method addMethod = nullptr;
    if (env->Class_FindMethod(setCls, "add", "C{std.core.Object}:C{std.core.Set}", &addMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref result = nullptr;
    if (env->Object_CallMethod_Ref(static_cast<ani_object>(setRef), addMethod, &result, resource) != ANI_OK) {
        return ANI_FALSE;
    }
    return ANI_TRUE;
}

ani_boolean HasResourceInSet(ani_env *env, ani_object manager, ani_object resource)
{
    ani_ref setRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceSet", &setRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class setCls = nullptr;
    if (env->FindClass("std.core.Set", &setCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method hasMethod = nullptr;
    if (env->Class_FindMethod(setCls, "has", "C{std.core.Object}:z", &hasMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean has = ANI_FALSE;
    if (env->Object_CallMethod_Boolean(static_cast<ani_object>(setRef), hasMethod, &has, resource) != ANI_OK) {
        return ANI_FALSE;
    }
    return has;
}

ani_int GetSetSize(ani_env *env, ani_object manager)
{
    ani_ref setRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceSet", &setRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int size = 0;
    if (env->Object_GetPropertyByName_Int(static_cast<ani_object>(setRef), "size", &size) == ANI_OK) {
        return size;
    }
    return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
}

ani_boolean DeleteResourceFromSet(ani_env *env, ani_object manager, ani_object resource)
{
    ani_ref setRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceSet", &setRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class setCls = nullptr;
    if (env->FindClass("std.core.Set", &setCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method deleteMethod = nullptr;
    if (env->Class_FindMethod(setCls, "delete", "C{std.core.Object}:z", &deleteMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean deleted = ANI_FALSE;
    if (env->Object_CallMethod_Boolean(static_cast<ani_object>(setRef), deleteMethod, &deleted, resource) != ANI_OK) {
        return ANI_FALSE;
    }
    return deleted;
}

ani_object CreateNativeResourceForArray(ani_env *env, ani_object manager)
{
    (void)manager;
    return CreateNativeResource(env, RES_INIT_VALUE);
}

ani_int PushResourceToArray(ani_env *env, ani_object manager, ani_object resource)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceArray", &arrayRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    if (env->Array_Push(static_cast<ani_array>(arrayRef), resource) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_size length = 0;
    if (env->Array_GetLength(static_cast<ani_array>(arrayRef), &length) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return static_cast<ani_int>(length);
}

ani_object PopResourceFromArray(ani_env *env, ani_object manager)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceArray", &arrayRef) != ANI_OK) {
        return nullptr;
    }
    ani_ref popped = nullptr;
    if (env->Array_Pop(static_cast<ani_array>(arrayRef), &popped) != ANI_OK) {
        return GetExplicitNullRes(env);
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(popped, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return GetExplicitNullRes(env);
    }
    return static_cast<ani_object>(popped);
}

ani_object GetResourceFromArray(ani_env *env, ani_object manager, ani_int index)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceArray", &arrayRef) != ANI_OK) {
        return nullptr;
    }
    ani_ref elem = nullptr;
    if (env->Array_Get(static_cast<ani_array>(arrayRef), static_cast<ani_size>(index), &elem) != ANI_OK) {
        return GetExplicitNullRes(env);
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(elem, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return GetExplicitNullRes(env);
    }
    return static_cast<ani_object>(elem);
}

ani_status SetResourceInArray(ani_env *env, ani_object manager, ani_int index, ani_object resource)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceArray", &arrayRef) != ANI_OK) {
        return ANI_ERROR;
    }
    return env->Array_Set(static_cast<ani_array>(arrayRef), static_cast<ani_size>(index), resource);
}

ani_int GetArrayLength(ani_env *env, ani_object manager)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "resourceArray", &arrayRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_size length = 0;
    if (env->Array_GetLength(static_cast<ani_array>(arrayRef), &length) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return static_cast<ani_int>(length);
}

ani_fixedarray CreateFixedArray(ani_env *env, ani_object manager, ani_int size)
{
    ani_class resourceCls = nullptr;
    if (FindClassByName(env, NATIVE_RESOURCE_CLASS, &resourceCls) != ANI_TRUE) {
        return nullptr;
    }
    ani_type elementType = static_cast<ani_type>(resourceCls);
    ani_ref initialElement = nullptr;
    if (env->GetNull(&initialElement) != ANI_OK) {
        return nullptr;
    }
    ani_fixedarray fixedArray = nullptr;
    if (env->FixedArray_New(elementType, static_cast<ani_size>(size), initialElement, &fixedArray) != ANI_OK) {
        return nullptr;
    }
    if (env->Object_SetFieldByName_Ref(manager, "fixedResourceArray",
                                       static_cast<ani_ref>(fixedArray)) != ANI_OK) {
        return nullptr;
    }
    return fixedArray;
}

ani_status SetResourceInFixedArray(ani_env *env, ani_object manager, ani_int index, ani_object resource)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "fixedResourceArray", &arrayRef) != ANI_OK) {
        return ANI_ERROR;
    }
    return env->FixedArray_Set(static_cast<ani_fixedarray>(arrayRef), static_cast<ani_size>(index), resource);
}

ani_object GetResourceFromFixedArray(ani_env *env, ani_object manager, ani_int index)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "fixedResourceArray", &arrayRef) != ANI_OK) {
        return nullptr;
    }
    ani_ref elem = nullptr;
    ani_status status = env->FixedArray_Get(static_cast<ani_fixedarray>(arrayRef),
                                            static_cast<ani_size>(index), &elem);
    if (status != ANI_OK) {
        ani_ref nullRef = nullptr;
        return (env->GetNull(&nullRef) == ANI_OK) ? static_cast<ani_object>(nullRef) : nullptr;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(elem, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        ani_ref nullRef2 = nullptr;
        return (env->GetNull(&nullRef2) == ANI_OK) ? static_cast<ani_object>(nullRef2) : nullptr;
    }
    return static_cast<ani_object>(elem);
}

ani_int GetFixedArrayLength(ani_env *env, ani_object manager)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "fixedResourceArray", &arrayRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_size length = 0;
    if (env->FixedArray_GetLength(static_cast<ani_fixedarray>(arrayRef), &length) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return static_cast<ani_int>(length);
}

ani_valuearray_int CreateIntFixedArray(ani_env *env, ani_object manager, ani_int size)
{
    ani_valuearray_int fixedArray = nullptr;
    if (env->ValueArray_New_Int(static_cast<ani_size>(size), &fixedArray) != ANI_OK) {
        return nullptr;
    }
    if (env->Object_SetFieldByName_Ref(manager, "intFixedArray",
                                       static_cast<ani_ref>(fixedArray)) != ANI_OK) {
        return nullptr;
    }
    return fixedArray;
}

ani_status SetIntValue(ani_env *env, ani_object manager, ani_int index, ani_int value)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "intFixedArray", &arrayRef) != ANI_OK) {
        return ANI_ERROR;
    }
    ani_int values[1] = {value};
    return env->ValueArray_SetRegion_Int(static_cast<ani_valuearray_int>(arrayRef),
                                         static_cast<ani_size>(index),
                                         RES_INCREMENT_STEP, values);
}

ani_int GetIntValue(ani_env *env, ani_object manager, ani_int index)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "intFixedArray", &arrayRef) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    ani_int values[1] = {0};
    if (env->ValueArray_GetRegion_Int(static_cast<ani_valuearray_int>(arrayRef),
                                      static_cast<ani_size>(index),
                                      RES_INCREMENT_STEP, values) != ANI_OK) {
        return RES_INIT_VALUE_ZERO - RES_INCREMENT_STEP;
    }
    return values[0];
}

ani_fixedarray CreateRefFixedArray(ani_env *env, ani_object manager, ani_int size)
{
    ani_class resourceCls = nullptr;
    if (FindClassByName(env, NATIVE_RESOURCE_CLASS, &resourceCls) != ANI_TRUE) {
        return nullptr;
    }
    ani_type elementType = static_cast<ani_type>(resourceCls);
    ani_ref initialElement = nullptr;
    if (env->GetNull(&initialElement) != ANI_OK) {
        return nullptr;
    }
    ani_fixedarray fixedArray = nullptr;
    if (env->FixedArray_New(elementType, static_cast<ani_size>(size), initialElement, &fixedArray) != ANI_OK) {
        return nullptr;
    }
    if (env->Object_SetFieldByName_Ref(manager, "refFixedArray",
                                       static_cast<ani_ref>(fixedArray)) != ANI_OK) {
        return nullptr;
    }
    return fixedArray;
}

ani_status SetNativeResourceInFixedArray(ani_env *env, ani_object manager, ani_int index, ani_object resource)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "refFixedArray", &arrayRef) != ANI_OK) {
        return ANI_ERROR;
    }
    return env->FixedArray_Set(static_cast<ani_fixedarray>(arrayRef), static_cast<ani_size>(index), resource);
}

ani_object GetNativeResourceFromFixedArray(ani_env *env, ani_object manager, ani_int index)
{
    ani_ref arrayRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "refFixedArray", &arrayRef) != ANI_OK) {
        return nullptr;
    }
    ani_ref elem = nullptr;
    if (env->FixedArray_Get(static_cast<ani_fixedarray>(arrayRef),
                            static_cast<ani_size>(index), &elem) != ANI_OK) {
        return GetExplicitNullRes(env);
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(elem, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return GetExplicitNullRes(env);
    }
    return static_cast<ani_object>(elem);
}

const ani_native_function g_containerStorageMethods[] = {
    {"createResourceWithKey",
     "C{std.core.String}:C{entry.src.main.src.ets.Index.NativeResource}",
     reinterpret_cast<void *>(CreateResourceWithKey)},
    {"addResourceToMap",
     "C{std.core.String}C{entry.src.main.src.ets.Index.NativeResource}:",
     reinterpret_cast<void *>(AddResourceToMap)},
    {"getResourceFromMap",
     "C{std.core.String}:X{C{entry.src.main.src.ets.Index.NativeResource}C{std.core.Null}}",
     reinterpret_cast<void *>(GetResourceFromMap)},
    {"getMapSize", ":i", reinterpret_cast<void *>(GetMapSize)},
    {"removeResourceFromMap", "C{std.core.String}:z",
     reinterpret_cast<void *>(RemoveResourceFromMap)},
    {"createUniqueResource", "i:C{entry.src.main.src.ets.Index.NativeResource}",
     reinterpret_cast<void *>(CreateUniqueResource)},
    {"addResourceToSet", "C{entry.src.main.src.ets.Index.NativeResource}:z",
     reinterpret_cast<void *>(AddResourceToSet)},
    {"hasResourceInSet", "C{entry.src.main.src.ets.Index.NativeResource}:z",
     reinterpret_cast<void *>(HasResourceInSet)},
    {"getSetSize", ":i", reinterpret_cast<void *>(GetSetSize)},
    {"deleteResourceFromSet", "C{entry.src.main.src.ets.Index.NativeResource}:z",
     reinterpret_cast<void *>(DeleteResourceFromSet)},
    {"createNativeResource", ":C{entry.src.main.src.ets.Index.NativeResource}",
     reinterpret_cast<void *>(CreateNativeResourceForArray)},
    {"pushResourceToArray", "C{entry.src.main.src.ets.Index.NativeResource}:i",
     reinterpret_cast<void *>(PushResourceToArray)},
    {"popResourceFromArray",
     ":X{C{entry.src.main.src.ets.Index.NativeResource}C{std.core.Null}}",
     reinterpret_cast<void *>(PopResourceFromArray)},
    {"getResourceFromArray",
     "i:X{C{entry.src.main.src.ets.Index.NativeResource}C{std.core.Null}}",
     reinterpret_cast<void *>(GetResourceFromArray)},
    {"setResourceInArray", "iC{entry.src.main.src.ets.Index.NativeResource}:",
     reinterpret_cast<void *>(SetResourceInArray)},
    {"getArrayLength", ":i", reinterpret_cast<void *>(GetArrayLength)},
    {"createFixedArray", "i:A{C{entry.src.main.src.ets.Index.NativeResource}}",
     reinterpret_cast<void *>(CreateFixedArray)},
    {"setResourceInFixedArray", "iC{entry.src.main.src.ets.Index.NativeResource}:",
     reinterpret_cast<void *>(SetResourceInFixedArray)},
    {"getResourceFromFixedArray",
     "i:X{C{entry.src.main.src.ets.Index.NativeResource}C{std.core.Null}}",
     reinterpret_cast<void *>(GetResourceFromFixedArray)},
    {"getFixedArrayLength", ":i", reinterpret_cast<void *>(GetFixedArrayLength)},
    {"createIntFixedArray", "i:A{C{std.core.Int}}",
     reinterpret_cast<void *>(CreateIntFixedArray)},
    {"setIntValue", "ii:", reinterpret_cast<void *>(SetIntValue)},
    {"getIntValue", "i:i", reinterpret_cast<void *>(GetIntValue)},
    {"createRefFixedArray", "i:A{C{entry.src.main.src.ets.Index.NativeResource}}",
     reinterpret_cast<void *>(CreateRefFixedArray)},
    {"setNativeResource", "iC{entry.src.main.src.ets.Index.NativeResource}:",
     reinterpret_cast<void *>(SetNativeResourceInFixedArray)},
    {"getNativeResource",
     "i:X{C{entry.src.main.src.ets.Index.NativeResource}C{std.core.Null}}",
     reinterpret_cast<void *>(GetNativeResourceFromFixedArray)},
};

const char *const CLASS_MAP_MGR = "entry.src.main.src.ets.Index.ResourceMapManager";
const char *const CLASS_SET_MGR = "entry.src.main.src.ets.Index.ResourceSetManager";
const char *const CLASS_ARRAY_MGR = "entry.src.main.src.ets.Index.DynamicArrayManager";
const char *const CLASS_FIXED_MGR = "entry.src.main.src.ets.Index.FixedArrayManager";
const char *const CLASS_MIXED_MGR = "entry.src.main.src.ets.Index.MixedArrayManager";

} // namespace

ani_status BindContainerStorageTest(ani_vm *vm)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        AniTestLog("ContainerStorageTest: unsupported ANI_VERSION_1");
        return static_cast<ani_status>(ANI_RES_OUT_OF_REF);
    }
    const char *const classes[] = {CLASS_MAP_MGR, CLASS_SET_MGR, CLASS_ARRAY_MGR,
                                   CLASS_FIXED_MGR, CLASS_MIXED_MGR};
    for (const char *clsName : classes) {
        BindClassMethods(env, clsName, g_containerStorageMethods,
                         sizeof(g_containerStorageMethods) / sizeof(g_containerStorageMethods[0]),
                         "ContainerStorageTest");
    }
    return ANI_OK;
}

void CleanupContainerStorageTest(ani_env *env)
{
    (void)env;
}
