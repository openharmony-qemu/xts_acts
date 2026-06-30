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

#include <AbilityKit/ability_runtime/extension_ability.h>
#include <AbilityKit/ability_runtime/modular_object_extension_ability.h>
#include <AbilityKit/ability_runtime/modular_object_extension_context.h>
#include <AbilityKit/ability_base/want.h>
#include <cstdlib>
#include <cstring>
#include <string>
#include <hilog/log.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0x3200
#define LOG_TAG "MOD_OBJ_EXT_TAG"

static int g_onCreateCallbackCount = 0;
static int g_onDestroyCallbackCount = 0;
static int g_onConnectCallbackCount = 0;
static int g_onDisconnectCallbackCount = 0;

EXTERN_C_START

static void OnCreateCallback(OH_AbilityRuntime_ModObjExtensionInstanceHandle instance, AbilityBase_Want *want)
{
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnCreateCallback Enter ===================");
    g_onCreateCallbackCount++;
    
    if (instance == nullptr) {
        OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnCreateCallback instance is null");
        return;
    }
    
    OH_AbilityRuntime_ModObjExtensionContextHandle context = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_GetContextFromInstance(instance, &context);
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnCreateCallback GetContextFromInstance errCode=%{public}d", errCode);
    
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR && context != nullptr) {
        AbilityRuntime_ContextHandle baseContext = nullptr;
        errCode = OH_AbilityRuntime_ModObjExtensionContext_GetBaseContext(context, &baseContext);
        OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnCreateCallback GetBaseContext errCode=%{public}d", errCode);
    }
    
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnCreateCallback End ===================");
}

static void OnDestroyCallback(OH_AbilityRuntime_ModObjExtensionInstanceHandle instance)
{
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnDestroyCallback Enter ===================");
    g_onDestroyCallbackCount++;
    
    if (instance == nullptr) {
        OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnDestroyCallback instance is null");
        return;
    }
    
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnDestroyCallback End ===================");
}

static OHIPCRemoteStub* OnConnectCallback(OH_AbilityRuntime_ModObjExtensionInstanceHandle instance, AbilityBase_Want *want)
{
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnConnectCallback Enter ===================");
    g_onConnectCallbackCount++;
    
    if (instance == nullptr) {
        OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnConnectCallback instance is null");
        return nullptr;
    }
    
    OH_AbilityRuntime_ModObjExtensionContextHandle context = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_GetContextFromInstance(instance, &context);
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnConnectCallback GetContextFromInstance errCode=%{public}d", errCode);
    
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnConnectCallback End ===================");
    return nullptr;
}

static void OnDisconnectCallback(OH_AbilityRuntime_ModObjExtensionInstanceHandle instance)
{
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnDisconnectCallback Enter ===================");
    g_onDisconnectCallbackCount++;
    
    if (instance == nullptr) {
        OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnDisconnectCallback instance is null");
        return;
    }
    
    OH_LOG_INFO(LOG_APP, "ModularObjectExtension OnDisconnectCallback End ===================");
}

void OH_AbilityRuntime_OnNativeExtensionCreate(AbilityRuntime_ExtensionInstanceHandle handle, const char *abilityName)
{
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate Enter ===================");
    OH_LOG_INFO(LOG_APP, "abilityName=%{public}s", abilityName);
    
    if (handle == nullptr) {
        OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate handle is null");
        return;
    }
    
    OH_AbilityRuntime_ModObjExtensionInstanceHandle instance = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_GetInstanceFromBase(handle, &instance);
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate GetInstanceFromBase errCode=%{public}d", errCode);
    
    if (errCode != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR || instance == nullptr) {
        OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate GetInstanceFromBase failed");
        return;
    }
    
    OH_AbilityRuntime_ModObjExtensionContextHandle context = nullptr;
    errCode = OH_AbilityRuntime_ModObjExtensionAbility_GetContextFromInstance(instance, &context);
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate GetContextFromInstance errCode=%{public}d", errCode);
    
    errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnCreateFunc(instance, OnCreateCallback);
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate RegisterOnCreateFunc errCode=%{public}d", errCode);
    
    errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDestroyFunc(instance, OnDestroyCallback);
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate RegisterOnDestroyFunc errCode=%{public}d", errCode);
    
    errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnConnectFunc(instance, OnConnectCallback);
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate RegisterOnConnectFunc errCode=%{public}d", errCode);
    
    errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDisconnectFunc(instance, OnDisconnectCallback);
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate RegisterOnDisconnectFunc errCode=%{public}d", errCode);
    
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_OnNativeExtensionCreate End ===================");
}

EXTERN_C_END

int GetOnCreateCallbackCount()
{
    return g_onCreateCallbackCount;
}

int GetOnDestroyCallbackCount()
{
    return g_onDestroyCallbackCount;
}

int GetOnConnectCallbackCount()
{
    return g_onConnectCallbackCount;
}

int GetOnDisconnectCallbackCount()
{
    return g_onDisconnectCallbackCount;
}

void ResetCallbackCounts()
{
    g_onCreateCallbackCount = 0;
    g_onDestroyCallbackCount = 0;
    g_onConnectCallbackCount = 0;
    g_onDisconnectCallbackCount = 0;
}