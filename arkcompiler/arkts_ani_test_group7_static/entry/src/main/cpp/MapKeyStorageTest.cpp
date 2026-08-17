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

#include "MapKeyStorageTest.h"
#include "Common.h"
#include <mutex>
#include <string>

namespace {

constexpr ani_int MAP_KEY_VALUE = 100;
constexpr ani_int MAP_KEY_CHECK_VALUE = 100;
constexpr ani_int MAP_KEY_INIT_VALUE = 1;

ani_ref g_storedKeyResource = nullptr;
std::mutex g_storedKeyMutex;

ani_object CreateNativeResourceWithValueLocal(ani_env *env, ani_int value);

ani_boolean TestNativeObjectAsMapKey(ani_env *env, ani_object manager)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "nativeKeyMap", &mapRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentMapCls = nullptr;
    if (FindClassFallback(env, "ConcurrentHashMap", &concurrentMapCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method putMethod = nullptr;
    ani_method containsKeyMethod = nullptr;
    if (env->Class_FindMethod(concurrentMapCls, "put",
                              "C{std.core.Object}C{std.core.Object}:", &putMethod) != ANI_OK ||
        env->Class_FindMethod(concurrentMapCls, "containsKey",
                              "C{std.core.Object}:z", &containsKeyMethod) != ANI_OK) {
        env->ResetError();
        return ANI_FALSE;
    }
    ani_object keyResource = CreateNativeResourceWithValueLocal(env, MAP_KEY_INIT_VALUE);
    ani_object valueResource = CreateNativeResourceWithValueLocal(env, MAP_KEY_VALUE);
    if (keyResource == nullptr || valueResource == nullptr) {
        return ANI_FALSE;
    }
    {
        std::lock_guard<std::mutex> lock(g_storedKeyMutex);
        if (g_storedKeyResource != nullptr) {
            env->GlobalReference_Delete(g_storedKeyResource);
        }
        if (env->GlobalReference_Create(keyResource, &g_storedKeyResource) != ANI_OK) {
            return ANI_FALSE;
        }
    }

    if (env->Object_CallMethod_Void(static_cast<ani_object>(mapRef), putMethod,
                                    static_cast<ani_ref>(keyResource),
                                    static_cast<ani_ref>(valueResource)) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean contains = ANI_FALSE;
    return (env->Object_CallMethod_Boolean(static_cast<ani_object>(mapRef), containsKeyMethod, &contains,
                                           static_cast<ani_ref>(keyResource)) == ANI_OK &&
            contains == ANI_TRUE) ? ANI_TRUE : ANI_FALSE;
}

ani_object CreateNativeResourceWithValueLocal(ani_env *env, ani_int value)
{
    return CreateNativeResource(env, value);
}

ani_boolean TestNativeKeyMapGet(ani_env *env, ani_object manager)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "nativeKeyMap", &mapRef) != ANI_OK) {
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
    {
        std::lock_guard<std::mutex> lock(g_storedKeyMutex);
        keyResource = static_cast<ani_object>(g_storedKeyResource);
    }
    if (keyResource == nullptr) {
        return ANI_FALSE;
    }
    ani_ref valueRef = nullptr;
    if (env->Object_CallMethod_Ref(static_cast<ani_object>(mapRef), getMethod, &valueRef,
                                   static_cast<ani_ref>(keyResource)) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_int value = 0;
    return (env->Object_GetPropertyByName_Int(static_cast<ani_object>(valueRef), "value", &value) == ANI_OK &&
            value == MAP_KEY_CHECK_VALUE) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNativeKeyMapRemove(ani_env *env, ani_object manager)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "nativeKeyMap", &mapRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class concurrentMapCls = nullptr;
    if (FindClassFallback(env, "ConcurrentHashMap", &concurrentMapCls) != ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_method removeMethod = nullptr;
    if (env->Class_FindMethod(concurrentMapCls, "remove",
                              "C{std.core.Object}:z", &removeMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_object keyResource = nullptr;
    {
        std::lock_guard<std::mutex> lock(g_storedKeyMutex);
        keyResource = static_cast<ani_object>(g_storedKeyResource);
    }
    if (keyResource == nullptr) {
        return ANI_FALSE;
    }
    ani_boolean removed = ANI_FALSE;
    return (env->Object_CallMethod_Boolean(static_cast<ani_object>(mapRef), removeMethod, &removed,
                                           static_cast<ani_ref>(keyResource)) == ANI_OK &&
            removed == ANI_TRUE) ? ANI_TRUE : ANI_FALSE;
}

ani_boolean TestNativeKeyBasicMap(ani_env *env, ani_object manager)
{
    ani_ref mapRef = nullptr;
    if (env->Object_GetFieldByName_Ref(manager, "nativeKeyMapBasic", &mapRef) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_class mapCls = nullptr;
    if (env->FindClass("std.core.Map", &mapCls) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_method setMethod = nullptr;
    ani_method getMethod = nullptr;
    if (env->Class_FindMethod(mapCls, "set",
                              "C{std.core.Object}C{std.core.Object}:C{std.core.Map}", &setMethod) != ANI_OK ||
        env->Class_FindMethod(mapCls, "get",
                              "C{std.core.Object}:C{std.core.Object}", &getMethod) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_object keyResource = CreateNativeResourceWithValueLocal(env, MAP_KEY_INIT_VALUE);
    ani_object valueResource = CreateNativeResourceWithValueLocal(env, MAP_KEY_VALUE);
    if (keyResource == nullptr || valueResource == nullptr) {
        return ANI_FALSE;
    }
    ani_ref setResult = nullptr;
    if (env->Object_CallMethod_Ref(static_cast<ani_object>(mapRef), setMethod, &setResult,
                                   static_cast<ani_ref>(keyResource),
                                   static_cast<ani_ref>(valueResource)) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_ref valueRef = nullptr;
    if (env->Object_CallMethod_Ref(static_cast<ani_object>(mapRef), getMethod, &valueRef,
                                   static_cast<ani_ref>(keyResource)) != ANI_OK) {
        return ANI_FALSE;
    }
    ani_boolean isNull = ANI_FALSE;
    if (env->Reference_IsNull(valueRef, &isNull) != ANI_OK || isNull == ANI_TRUE) {
        return ANI_FALSE;
    }
    ani_int value = 0;
    return (env->Object_GetPropertyByName_Int(static_cast<ani_object>(valueRef), "value", &value) == ANI_OK)
               ? ANI_TRUE : ANI_FALSE;
}

const ani_native_function g_mapKeyMethods[] = {
    {"testNativeObjectAsMapKeyNative", ":z", reinterpret_cast<void *>(TestNativeObjectAsMapKey)},
    {"testNativeKeyMapGetNative", ":z", reinterpret_cast<void *>(TestNativeKeyMapGet)},
    {"testNativeKeyMapRemoveNative", ":z", reinterpret_cast<void *>(TestNativeKeyMapRemove)},
    {"testNativeKeyBasicMapNative", ":z", reinterpret_cast<void *>(TestNativeKeyBasicMap)},
};

const char *const CLASS_NATIVE_KEY_MAP = "entry.src.main.src.ets.Index.NativeKeyMapManager";
const char *const CLASS_NATIVE_KEY_BASIC = "entry.src.main.src.ets.Index.NativeKeyBasicMapManager";

} // namespace

ani_status BindMapKeyStorageTest(ani_vm *vm)
{
    ani_env *env = nullptr;
    if (vm->GetEnv(ANI_VERSION_1, &env) != ANI_OK) {
        AniTestLog("MapKeyStorageTest: unsupported ANI_VERSION_1");
        return static_cast<ani_status>(ANI_RES_OUT_OF_REF);
    }
    const char *const classes[] = {CLASS_NATIVE_KEY_MAP, CLASS_NATIVE_KEY_BASIC};
    for (const char *clsName : classes) {
        BindClassMethods(env, clsName, g_mapKeyMethods,
                         sizeof(g_mapKeyMethods) / sizeof(g_mapKeyMethods[0]), "MapKeyStorageTest");
    }
    WarmupFindClass(env, "entry.src.main.src.ets.Index.ConcurrentHashMap");
    return ANI_OK;
}

void CleanupMapKeyStorageTest(ani_env *env)
{
    std::lock_guard<std::mutex> lock(g_storedKeyMutex);
    if (g_storedKeyResource != nullptr) {
        env->GlobalReference_Delete(g_storedKeyResource);
        g_storedKeyResource = nullptr;
    }
}
