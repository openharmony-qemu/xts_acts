/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include <AbilityKit/ability_base/ability_base_common.h>
#include <cstdio>
#include <cstring>
#include <string>
#include <AbilityKit/ability_runtime/start_options.h>
#include <AbilityKit/native_child_process.h>
#include "napi/native_api.h"
#include "AbilityKit/ability_runtime/ability_runtime_common.h"
#include "AbilityKit/ability_runtime/application_context.h"
#include "AbilityKit/ability_runtime/context_constant.h"
#include "AbilityKit/ability_base/want.h"
#include "hilog/log.h"
#include "fcntl.h"
#include "unistd.h"
#include <AbilityKit/ability_runtime/modular_object_extension_manager.h>
#include <AbilityKit/ability_runtime/modular_object_extension_context.h>
#include <AbilityKit/ability_runtime/modular_object_extension_ability.h>
#include <AbilityKit/ability_runtime/connect_options.h>

extern int GetOnCreateCallbackCount();
extern int GetOnDestroyCallbackCount();
extern int GetOnConnectCallbackCount();
extern int GetOnDisconnectCallbackCount();
extern void ResetCallbackCounts();

namespace {
constexpr int32_t BUF_SIZE = 1024;

static void Throw(napi_env env, int32_t errCode, const char *errMsg)
{
    napi_value code;
    napi_create_int32(env, errCode, &code);

    napi_value msg = nullptr;
    if (errMsg != nullptr) {
        napi_create_string_utf8(env, errMsg, strlen(errMsg), &msg);
    } else {
        napi_create_string_utf8(env, "", 0, &msg);
    }

    napi_value error;
    napi_create_error(env, code, msg, &error);
    napi_throw(env, error);
}

typedef AbilityRuntime_ErrorCode (*AbilityRuntime_GetDirFunc)(char *, int32_t, int32_t *);


static napi_value NdkGetModObjExtInfoLaunchMode_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0100 begins");
    OH_AbilityRuntime_LaunchMode launchMode;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoLaunchMode(nullptr, &launchMode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoLaunchMode_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoLaunchMode(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoLaunchMode_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoProcessMode_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0100 begins");
    OH_AbilityRuntime_ProcessMode processMode;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoProcessMode(nullptr, &processMode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoProcessMode_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoProcessMode(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoProcessMode_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoThreadMode_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0100 begins");
    OH_AbilityRuntime_ThreadMode threadMode;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoThreadMode(nullptr, &threadMode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoThreadMode_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoThreadMode(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoThreadMode_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoElementName_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0100 begins");
    AbilityBase_Element element;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoElementName(nullptr, &element);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoElementName_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoElementName(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoElementName_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoDisableState_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0100 begins");
    bool isDisabled = false;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoDisableState(nullptr, &isDisabled);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoDisableState_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModularObjectExtensionInfoDisableState(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoDisableState_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkAcquireSelfModObjExtInfos_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_AcquireSelfModObjExtInfos_0100 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_AcquireSelfModObjExtInfos_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkReleaseAllExtensionInfos_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ReleaseAllExtensionInfos_0100 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ReleaseAllExtensionInfos(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ReleaseAllExtensionInfos_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetCountFromAllModObjExtInfos_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0100 begins");
    size_t count = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos(nullptr, &count);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetCountFromAllModObjExtInfos_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0200 begins");
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos(allExtensionInfos, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetCountFromAllModObjExtInfos_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoByIndex_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0100 begins");
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(nullptr, 0, &extensionInfo);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoByIndex_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0200 begins");
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtInfoByIndex_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0300 begins");
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = nullptr;
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 100, &extensionInfo);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtInfoByIndex_0300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtCtxGetBaseContext_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0100 begins");
    AbilityRuntime_ContextHandle baseContext = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionContext_GetBaseContext(nullptr, &baseContext);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtCtxGetBaseContext_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0200 begins");
    OH_AbilityRuntime_ModObjExtensionContextHandle modObjExtensionContext = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionContext_GetBaseContext(modObjExtensionContext, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtCtxStartSelfUIAbility_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbility(nullptr, want);
    OH_AbilityBase_DestroyWant(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtCtxStartSelfUIAbility_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0200 begins");
    OH_AbilityRuntime_ModObjExtensionContextHandle context = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbility(context, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtCtxStartSelfUIAbilityWithOptions_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbilityWithStartOptions(nullptr, want, options);
    OH_AbilityBase_DestroyWant(want);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtCtxStartSelfUIAbilityWithOptions_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0200 begins");
    OH_AbilityRuntime_ModObjExtensionContextHandle context = nullptr;
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbilityWithStartOptions(context, nullptr, options);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtCtxStartSelfUIAbilityWithOptions_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityRuntime_ModObjExtensionContextHandle context = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbilityWithStartOptions(context, want, nullptr);
    OH_AbilityBase_DestroyWant(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtCtxTerminateSelf_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxTerminateSelf_0100 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionContext_TerminateSelf(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtCtxTerminateSelf_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityRegisterOnCreate_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0100 begins");
    OH_AbilityRuntime_ModObjExtensionAbility_OnCreateFunc onCreateFunc = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnCreateFunc(nullptr, onCreateFunc);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityRegisterOnCreate_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInstanceHandle instance = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnCreateFunc(instance, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnCreate_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityRegisterOnDestroy_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0100 begins");
    OH_AbilityRuntime_ModObjExtensionAbility_OnDestroyFunc onDestroyFunc = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDestroyFunc(nullptr, onDestroyFunc);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityRegisterOnDestroy_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInstanceHandle instance = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDestroyFunc(instance, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDestroy_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityRegisterOnConnect_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0100 begins");
    OH_AbilityRuntime_ModObjExtensionAbility_OnConnectFunc onConnectFunc = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnConnectFunc(nullptr, onConnectFunc);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityRegisterOnConnect_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInstanceHandle instance = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnConnectFunc(instance, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnConnect_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityRegisterOnDisconnect_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0100 begins");
    OH_AbilityRuntime_ModObjExtensionAbility_OnDisconnectFunc onDisconnectFunc = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDisconnectFunc(nullptr, onDisconnectFunc);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityRegisterOnDisconnect_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInstanceHandle instance = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDisconnectFunc(instance, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityRegisterOnDisconnect_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityGetContext_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0100 begins");
    OH_AbilityRuntime_ModObjExtensionContextHandle context = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_GetContextFromInstance(nullptr, &context);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityGetContext_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0200 begins");
    OH_AbilityRuntime_ModObjExtensionInstanceHandle instance = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_GetContextFromInstance(instance, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityGetContext_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityGetInstanceFromBase_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0100 begins");
    OH_AbilityRuntime_ModObjExtensionInstanceHandle modObjExtensionInstance = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_GetInstanceFromBase(nullptr, &modObjExtensionInstance);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkModObjExtAbilityGetInstanceFromBase_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0200 begins");
    AbilityRuntime_ExtensionInstanceHandle baseExtensionInstance = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ModObjExtensionAbility_GetInstanceFromBase(baseExtensionInstance, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ModObjExtAbilityGetInstanceFromBase_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkConnectModObjExtAbility_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0100 begins");
    OH_AbilityRuntime_ConnectOptions *connectOptions = OH_AbilityRuntime_CreateConnectOptions();
    int64_t connectionId = -1;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectModularObjectExtensionAbility(nullptr, connectOptions, &connectionId);
    OH_AbilityRuntime_DestroyConnectOptions(connectOptions);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkConnectModObjExtAbility_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    int64_t connectionId = -1;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectModularObjectExtensionAbility(want, nullptr, &connectionId);
    OH_AbilityBase_DestroyWant(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkConnectModObjExtAbility_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityRuntime_ConnectOptions *connectOptions = OH_AbilityRuntime_CreateConnectOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectModularObjectExtensionAbility(want, connectOptions, nullptr);
    OH_AbilityBase_DestroyWant(want);
    OH_AbilityRuntime_DestroyConnectOptions(connectOptions);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectModObjExtAbility_0300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkDisconnectModObjExtAbility_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0100 begins");
    int64_t connectionId = -1;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_DisconnectModularObjectExtensionAbility(connectionId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkDisconnectModObjExtAbility_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0200 begins");
    int64_t connectionId = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_DisconnectModularObjectExtensionAbility(connectionId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_DisconnectModObjExtAbility_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkDestroyConnectOptions_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_DestroyConnectOptions_0100 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_DestroyConnectOptions(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_DestroyConnectOptions_0100 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkConnectOptionsSetOnConnect_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0100 begins");
    OH_AbilityRuntime_ConnectOptions_OnConnectCallback onConnectCallback = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectOptions_SetOnConnectCallback(nullptr, onConnectCallback);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkConnectOptionsSetOnConnect_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 begins");
    OH_AbilityRuntime_ConnectOptions *connectOptions = OH_AbilityRuntime_CreateConnectOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectOptions_SetOnConnectCallback(connectOptions, nullptr);
    OH_AbilityRuntime_DestroyConnectOptions(connectOptions);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkConnectOptionsSetOnDisconnect_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0100 begins");
    OH_AbilityRuntime_ConnectOptions_OnDisconnectCallback onDisconnectCallback = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectOptions_SetOnDisconnectCallback(nullptr, onDisconnectCallback);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0100 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkConnectOptionsSetOnDisconnect_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0200 begins");
    OH_AbilityRuntime_ConnectOptions *connectOptions = OH_AbilityRuntime_CreateConnectOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectOptions_SetOnDisconnectCallback(connectOptions, nullptr);
    OH_AbilityRuntime_DestroyConnectOptions(connectOptions);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnDisconnect_0200 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkConnectOptionsSetOnFailed_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0100 begins");
    OH_AbilityRuntime_ConnectOptions_OnFailedCallback onFailedCallback = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectOptions_SetOnFailedCallback(nullptr, onFailedCallback);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0100 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkConnectOptionsSetOnFailed_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0200 begins");
    OH_AbilityRuntime_ConnectOptions *connectOptions = OH_AbilityRuntime_CreateConnectOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectOptions_SetOnFailedCallback(connectOptions, nullptr);
    OH_AbilityRuntime_DestroyConnectOptions(connectOptions);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnFailed_0200 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
      OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectOptionsSetOnConnect_0200 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetModObjExtCallbackCounts_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0100 begins");
    int count = GetOnCreateCallbackCount();
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0100 onCreateCount=%{public}d", count);
    napi_value result;
    napi_create_int32(env, count, &result);
    return result;
}

static napi_value NdkGetModObjExtCallbackCounts_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0200 begins");
    int count = GetOnDestroyCallbackCount();
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0200 onDestroyCount=%{public}d", count);
    napi_value result;
    napi_create_int32(env, count, &result);
    return result;
}

static napi_value NdkGetModObjExtCallbackCounts_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0300 begins");
    int count = GetOnConnectCallbackCount();
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0300 onConnectCount=%{public}d", count);
    napi_value result;
    napi_create_int32(env, count, &result);
    return result;
}

static napi_value NdkGetModObjExtCallbackCounts_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0400 begins");
    int count = GetOnDisconnectCallbackCount();
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetModObjExtCallbackCounts_0400 onDisconnectCount=%{public}d", count);
    napi_value result;
    napi_create_int32(env, count, &result);
    return result;
}

static napi_value NdkResetModObjExtCallbackCounts_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ResetModObjExtCallbackCounts_0100 begins");
    ResetCallbackCounts();
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ResetModObjExtCallbackCounts_0100 done");
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static int64_t g_connectionId = -1;

static void OnConnectOptionsCallback(OH_AbilityRuntime_ConnectOptions *connectOptions, AbilityBase_Element *element, OHIPCRemoteProxy *proxy)
{
    OH_LOG_INFO(LOG_APP, "OnConnectOptionsCallback invoked");
}

static void OnDisconnectOptionsCallback(OH_AbilityRuntime_ConnectOptions *connectOptions, AbilityBase_Element *element)
{
    OH_LOG_INFO(LOG_APP, "OnDisconnectOptionsCallback invoked");
}

static void OnFailedOptionsCallback(OH_AbilityRuntime_ConnectOptions *connectOptions, AbilityRuntime_ErrorCode code)
{
    OH_LOG_INFO(LOG_APP, "OnFailedOptionsCallback invoked errCode=%{public}d", code);
}

static napi_value NdkConnectMoeExtension_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectMoeExtension_0100 begins");
    ResetCallbackCounts();
    
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("MoeExtensionAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    
    OH_AbilityRuntime_ConnectOptions *connectOptions = OH_AbilityRuntime_CreateConnectOptions();
    OH_AbilityRuntime_ConnectOptions_SetOnConnectCallback(connectOptions, OnConnectOptionsCallback);
    OH_AbilityRuntime_ConnectOptions_SetOnDisconnectCallback(connectOptions, OnDisconnectOptionsCallback);
    OH_AbilityRuntime_ConnectOptions_SetOnFailedCallback(connectOptions, OnFailedOptionsCallback);
    
    g_connectionId = -1;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ConnectModularObjectExtensionAbility(want, connectOptions, &g_connectionId);
    
    OH_AbilityBase_DestroyWant(want);
    OH_AbilityRuntime_DestroyConnectOptions(connectOptions);
    
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ConnectMoeExtension_0100 errCode=%{public}d connectionId=%{public}lld", errCode, g_connectionId);
    napi_value result;
    napi_create_int64(env, g_connectionId, &result);
    return result;
}

static napi_value NdkDisconnectMoeExtension_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_DisconnectMoeExtension_0100 begins");
    
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_DisconnectModularObjectExtensionAbility(g_connectionId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_DisconnectMoeExtension_0100 errCode=%{public}d", errCode);
    g_connectionId = -1;
    
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkLaunchModeInProcess_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_LaunchModeInProcess_0100 begins");
    int32_t launchMode = OH_ABILITY_RUNTIME_LAUNCH_MODE_IN_PROCESS;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_LAUNCH_MODE_IN_PROCESS=%{public}d", launchMode);
    napi_value result;
    napi_create_int32(env, launchMode, &result);
    return result;
}

static napi_value NdkLaunchModeCrossProcess_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_LaunchModeCrossProcess_0100 begins");
    int32_t launchMode = OH_ABILITY_RUNTIME_LAUNCH_MODE_CROSS_PROCESS;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_LAUNCH_MODE_CROSS_PROCESS=%{public}d", launchMode);
    napi_value result;
    napi_create_int32(env, launchMode, &result);
    return result;
}

static napi_value NdkProcessModeBundle_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ProcessModeBundle_0100 begins");
    int32_t processMode = OH_ABILITY_RUNTIME_PROCESS_MODE_BUNDLE;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_PROCESS_MODE_BUNDLE=%{public}d", processMode);
    napi_value result;
    napi_create_int32(env, processMode, &result);
    return result;
}

static napi_value NdkProcessModeType_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ProcessModeType_0100 begins");
    int32_t processMode = OH_ABILITY_RUNTIME_PROCESS_MODE_TYPE;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_PROCESS_MODE_TYPE=%{public}d", processMode);
    napi_value result;
    napi_create_int32(env, processMode, &result);
    return result;
}

static napi_value NdkProcessModeInstance_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ProcessModeInstance_0100 begins");
    int32_t processMode = OH_ABILITY_RUNTIME_PROCESS_MODE_INSTANCE;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_PROCESS_MODE_INSTANCE=%{public}d", processMode);
    napi_value result;
    napi_create_int32(env, processMode, &result);
    return result;
}

static napi_value NdkThreadModeBundle_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ThreadModeBundle_0100 begins");
    int32_t threadMode = OH_ABILITY_RUNTIME_THREAD_MODE_BUNDLE;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_THREAD_MODE_BUNDLE=%{public}d", threadMode);
    napi_value result;
    napi_create_int32(env, threadMode, &result);
    return result;
}

static napi_value NdkThreadModeType_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ThreadModeType_0100 begins");
    int32_t threadMode = OH_ABILITY_RUNTIME_THREAD_MODE_TYPE;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_THREAD_MODE_TYPE=%{public}d", threadMode);
    napi_value result;
    napi_create_int32(env, threadMode, &result);
    return result;
}

static napi_value NdkThreadModeInstance_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ThreadModeInstance_0100 begins");
    int32_t threadMode = OH_ABILITY_RUNTIME_THREAD_MODE_INSTANCE;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_THREAD_MODE_INSTANCE=%{public}d", threadMode);
    napi_value result;
    napi_create_int32(env, threadMode, &result);
    return result;
}

static napi_value NdkThreadLaunchMode_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ThreadModeInstance_0100 begins");
    int32_t threadMode = OH_ABILITY_RUNTIME_LAUNCH_MODE_IN_PROCESS;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_LAUNCH_MODE_CROSS_PROCESS=%{public}d", threadMode);
    napi_value result;
    napi_create_int32(env, threadMode, &result);
    return result;
}

static napi_value NdkThreadLaunchMode_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ThreadModeInstance_0100 begins");
    int32_t threadMode = OH_ABILITY_RUNTIME_LAUNCH_MODE_CROSS_PROCESS;
    OH_LOG_INFO(LOG_APP, "OH_ABILITY_RUNTIME_LAUNCH_MODE_IN_PROCESS=%{public}d", threadMode);
    napi_value result;
    napi_create_int32(env, threadMode, &result);
    return result;
}

static napi_value NdkStartAbility_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0100 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0200 begins");
    AbilityBase_Element element;
    element.abilityName = nullptr;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    OH_AbilityBase_DestroyWant(want);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.err.bundle");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0300 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0400 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("errmodule");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0400 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0500 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbilityerr");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0500 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0900 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_0900 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1000 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1000 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_1100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1100 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_1200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryFormAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1200 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbility_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1600 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartAbility_1600 errCode=%{public}d", errCode);
    OH_AbilityBase_DestroyWant(want);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0100 begins");
    AbilityBase_Want* want = nullptr;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_DestroyWant(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0200 begins");
    AbilityBase_Want* want = nullptr;
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantElement(want, element);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0300 begins");
    AbilityBase_Want* want = nullptr;
    AbilityBase_Element *element;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantElement(want, element);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0400 begins");
    int32_t code = 401;
    AbilityBase_Element element;
    element.abilityName = "";
    element.moduleName = "";
    element.bundleName = "";
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    if (want == nullptr) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    AbilityBase_Element ourelement2;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantElement(want, &ourelement2);
    std::string result  = "OH_AbilityBase_GetWantElement bundleName:" + std::string(ourelement2.bundleName) + " " +
    "OH_AbilityBase_GetWantElement moduleName:" + std::string(ourelement2.moduleName) + " " +
    "OH_AbilityBase_GetWantElement abilityName:" + std::string(ourelement2.abilityName);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0400 native errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0500 begins");
    AbilityBase_Element element;
    AbilityBase_Want* want = nullptr;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0600 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, nullptr, "VALUE");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0700 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0800 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value1");
    errCode = OH_AbilityBase_SetWantCharParam(want, "key", "set second value");
    char outvalue[30];
    OH_AbilityBase_GetWantCharParam(want, "key", outvalue, sizeof(outvalue));
    std::string result  = "OH_AbilityBase_GetWantCharParam:" + std::string(outvalue);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0800 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0900 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(nullptr, "key", outvalue, sizeof(outvalue));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_0900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1000 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, nullptr, outvalue, sizeof(outvalue));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30] = { 0 };
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, "key100", outvalue, sizeof(outvalue));
    std::string result  = "OH_AbilityBase_GetWantCharParam:" + std::string(outvalue);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1100 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_1200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, "key", nullptr, sizeof(outvalue));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, "key", outvalue, NULL);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1400 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    char outvalue[30];
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantCharParam(want, "key", "value");
    errCode = OH_AbilityBase_GetWantCharParam(want, "key", outvalue, 1);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1500 begins");
    AbilityBase_Want* want = nullptr;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 100);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1600 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, nullptr, 100);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value WantNdk_1700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1700 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", NULL);
    int32_t fd = 100;
    AbilityBase_ErrorCode ret = OH_AbilityBase_GetWantFd(want, "fd", &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1700 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1700 fd=%{public}d", fd);
    if (ret == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value result;
        napi_create_int32(env, fd, &result);
        return result;
    } else {
        napi_value result;
        napi_create_int32(env, ret, &result);
        return result;
    }
}

static napi_value WantNdk_1800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1800 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd1", 1);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_AddWantFd(want, "fd2", 1);
    AbilityBase_ErrorCode errCode2 = OH_AbilityBase_AddWantFd(want, "fd3", 1);
    AbilityBase_ErrorCode errCode3 = OH_AbilityBase_AddWantFd(want, "fd4", 1);
    AbilityBase_ErrorCode errCode4 = OH_AbilityBase_AddWantFd(want, "fd5", 1);
    int32_t fd = 100;
    int32_t fd1 = 100;
    int32_t fd2 = 100;
    int32_t fd3 = 100;
    int32_t fd4 = 100;
    OH_AbilityBase_GetWantFd(want, "fd1", &fd);
    OH_AbilityBase_GetWantFd(want, "fd2", &fd1);
    OH_AbilityBase_GetWantFd(want, "fd3", &fd2);
    OH_AbilityBase_GetWantFd(want, "fd4", &fd3);
    OH_AbilityBase_GetWantFd(want, "fd5", &fd4);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1800 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1800 fd=%{public}d", fd);
    std::string result = "fd1:" + std::to_string(fd) + "fd2:" + std::to_string(fd1) + "fd3:" + std::to_string(fd2) +
    "fd4:" + std::to_string(fd3) + "fd5:" + std::to_string(fd4);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1800 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_1900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1900 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd1", 1);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_AddWantFd(want, "fd1", 2);
    AbilityBase_ErrorCode errCode2 = OH_AbilityBase_AddWantFd(want, "fd1", 3);
    AbilityBase_ErrorCode errCode3 = OH_AbilityBase_AddWantFd(want, "fd1", 4);
    AbilityBase_ErrorCode errCode4 = OH_AbilityBase_AddWantFd(want, "fd1", 5);
    int32_t fd = 100;
    OH_AbilityBase_GetWantFd(want, "fd1", &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1900 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1900 fd=%{public}d", fd);
    std::string result  = "fd1:" + std::to_string(fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_1900 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

static napi_value WantNdk_2000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2000 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", -1);
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2000 errCode=%{public}d", err);
    napi_value result;
    napi_create_int32(env, err, &result);
    return result;
}

static napi_value WantNdk_2100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 0);
    AbilityRuntime_ErrorCode err = OH_AbilityRuntime_StartSelfUIAbility(want);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2100 errCode=%{public}d", err);
    napi_value result;
    napi_create_int32(env, err, &result);
    return result;
}

static napi_value WantNdk_2200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 10);
    int32_t fd = 100;
    AbilityBase_ErrorCode errCode2 = OH_AbilityBase_GetWantFd(nullptr, "fd", &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2200 errCode=%{public}d", errCode2);
    napi_value result;
    napi_create_int32(env, errCode2, &result);
    return result;
}

static napi_value WantNdk_2300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 10);
    int32_t fd = 100;
    AbilityBase_ErrorCode errCode2 = OH_AbilityBase_GetWantFd(want, nullptr, &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2300 errCode=%{public}d", errCode2);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2300 fd=%{public}d", fd);
    napi_value result;
    napi_create_int32(env, errCode2, &result);
    return result;
}

static napi_value WantNdk_2400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2400 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_AddWantFd(want, "fd", 10);
    int32_t fd = -1;
    OH_AbilityBase_GetWantFd(want, "fd1", &fd);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2400 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2400 fd=%{public}d", fd);
    napi_value result;
    napi_create_int32(env, fd, &result);
    return result;
}

static napi_value WantNdk_2500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2500 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility1");
    element.bundleName = const_cast<char *>("com.example.myapplication");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantElement(want, element);
    AbilityBase_Element ourelement2;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantElement(want, &ourelement2);
    std::string result  = "OH_AbilityBase_GetWantElement bundleName:" + std::string(ourelement2.bundleName) + " " +
    "OH_AbilityBase_GetWantElement moduleName:" + std::string(ourelement2.moduleName) + " " +
    "OH_AbilityBase_GetWantElement abilityName:" + std::string(ourelement2.abilityName);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_WantNdk_2500 errCode=%{public}d", errCode);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}


static napi_value NdkStartSelfUIAbilityWithPidResult_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "NdkStartSelfUIAbilityWithPidResult_0100 begins");
    AbilityBase_Element element;
    int32_t pid = -1;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.acts.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_LOG_INFO(LOG_APP, "NdkStartSelfUIAbilityWithPidResult_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartSelfUIAbilityWithPidResult_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "NdkStartSelfUIAbilityWithPidResult_0200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility2");
    element.bundleName = const_cast<char *>("com.acts.example.startselfuiabilitytest");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t pid = -1;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbilityWithPidResult(want, options, &pid);
    OH_LOG_INFO(LOG_APP, "NdkStartSelfUIAbilityWithPidResult_0200 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_START_TIMEOUT) {
        napi_value napiRet;
        napi_create_int32(env, errCode, &napiRet);
        return napiRet;
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_MAIN_THREAD_NOT_SUPPORTED) {
        napi_value napiRet;
        napi_create_int32(env, errCode, &napiRet);
        return napiRet;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkApplicationContextGetVersionCode_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "NdkApplicationContextGetVersionCode_0100 begins");
    int64_t versionCode;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextGetVersionCode(&versionCode);
    OH_LOG_INFO(LOG_APP, "NdkApplicationContextGetVersionCode_0100 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, versionCode, &napiRet);
        return napiRet;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkApplicationContextGetVersionCode_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "NdkApplicationContextGetVersionCode_0200 begins");
    int64_t versionCode;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextGetVersionCode(nullptr);
    OH_LOG_INFO(LOG_APP, "NdkApplicationContextGetVersionCode_0200 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_int32(env, versionCode, &napiRet);
        return napiRet;
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_GET_APPLICATION_INFO_FAILED) {
        napi_value napiRet;
        napi_create_int32(env, errCode, &napiRet);
        return napiRet;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_DestroyStartOptions(&options);
    errCode = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, options);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0200 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_DestroyStartOptions(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0300 begins");
    AbilityBase_Element element;
    element.abilityName = nullptr;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(nullptr, options);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}


static napi_value NdkStartAbilityWithOptions_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0400 begins");
    AbilityBase_Element element;
    element.abilityName = nullptr;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_StartSelfUIAbilityWithStartOptions(want, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0500 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWithAnimation(nullptr, true);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0600 begins");
    bool withAnimation = false;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWithAnimation(nullptr, withAnimation);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0700 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowMode(nullptr, ABILITY_RUNTIME_WINDOW_MODE_FULL_SCREEN);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0800 begins");
    AbilityRuntime_WindowMode windowMode = ABILITY_RUNTIME_WINDOW_MODE_UNDEFINED;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowMode(nullptr, windowMode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_0800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1100 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsDisplayId(nullptr, 1);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1200 begins");
    int32_t displayId = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsDisplayId(nullptr, displayId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1300 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowLeft(nullptr, 200);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1400 begins");
    int32_t windowLeft = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowLeft(nullptr, windowLeft);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1500 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowTop(nullptr, 200);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1600 begins");
    int32_t windowTop = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowTop(nullptr, windowTop);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1700 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowWidth(nullptr, 200);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1800 begins");
    int32_t windowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowWidth(nullptr, windowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_1900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1900 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowHeight(nullptr, 200);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_1900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2000 begins");
    int32_t windowHeight = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowHeight(nullptr, windowHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2100 begins");
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }

    //创建参数结构体实例，并设置参数
    OH_Pixelmap_InitializationOptions *createOpts = nullptr;
    int32_t setWidth = 6;
    int32_t setHeight = 4;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, setWidth);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, setHeight);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    //创建Pixelmap实例
    OH_PixelmapNative *startWindowIcon = nullptr;
    Image_ErrorCode imgErrCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &startWindowIcon);
    if (imgErrCode != IMAGE_SUCCESS) {
        OH_PixelmapInitializationOptions_Release(createOpts);
    }
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartWindowIcon(nullptr, startWindowIcon);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2200 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartWindowIcon(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2300 begins");
    OH_PixelmapNative *startWindowIcon = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartWindowIcon(nullptr, &startWindowIcon);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2400 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartWindowIcon(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2500 begins");
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartWindowBackgroundColor(nullptr, "#00000000");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2600 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsStartWindowBackgroundColor(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_4400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsStartWindowBackgroundColor(options, "");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2700 begins");
    char *startWindowBackgroundColor = nullptr;
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColor(nullptr, &startWindowBackgroundColor, size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2800 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColor(options, nullptr, size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_2900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2900 begins");
    size_t supportedWindowModesSize = 3;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_2900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3000 begins");
    AbilityRuntime_SupportedWindowMode *supportedWindowModes = nullptr;
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_GetStartOptionsSupportedWindowModes(nullptr, &supportedWindowModes, size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3100 begins");
    size_t supportedWindowModesSize = 3;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3200 begins");
    size_t supportedWindowModesSize = -1;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3300 begins");
    size_t supportedWindowModesSize = 0;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3400 begins");
    size_t supportedWindowModesSize = -11;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3500 begins");
    size_t supportedWindowModesSize = 11;
    AbilityRuntime_SupportedWindowMode supportedWindowModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode;
    errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(nullptr, supportedWindowModes, supportedWindowModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3600 begins");
    AbilityRuntime_ErrorCode errCode;
    int32_t windowWidth = 100;
    errCode = OH_AbilityRuntime_SetStartOptionsMaxWindowWidth(nullptr, windowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3700 begins");
    int32_t maxWindowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowWidth(nullptr, maxWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3800 begins");
    AbilityRuntime_ErrorCode errCode;
    int32_t windowHeight = 100;
    errCode = OH_AbilityRuntime_SetStartOptionsMaxWindowHeight(nullptr, windowHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_3900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3900 begins");
    int32_t maxWindowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowHeight(nullptr, maxWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_3900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_4000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4000 begins");
    AbilityRuntime_ErrorCode errCode;
    int32_t minWindowWidth = 100;
    errCode = OH_AbilityRuntime_SetStartOptionsMinWindowWidth(nullptr, minWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_4100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4100 begins");
    int32_t maxWindowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMinWindowWidth(nullptr, maxWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_4200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4200 begins");
    AbilityRuntime_ErrorCode errCode;
    int32_t minWindowHeight = 100;
    errCode = OH_AbilityRuntime_SetStartOptionsMinWindowHeight(nullptr, minWindowHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartVisibility_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartVisibility_0100 begins");
    AbilityRuntime_StartVisibility visibility = AbilityRuntime_StartVisibility::ABILITY_RUNTIME_SHOW_UPON_START;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartVisibility(nullptr, visibility);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartVisibility_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartVisibility_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartVisibility_0200 begins");
    AbilityRuntime_StartVisibility visibility;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartVisibility(nullptr, visibility);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkStartVisibility_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkStartAbilityWithOptions_4300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4300 begins");
    int32_t maxWindowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMinWindowHeight(nullptr, maxWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartSelfUIAbilityWithStartOptions_4300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0100 begins");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantUri(nullptr, "this is a error uri");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantUri(want, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0300 begins");
    char uriBuffer[32] = {0};
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantUri(nullptr, uriBuffer, sizeof(uriBuffer));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0400 begins");
    AbilityBase_Element element;
    char uriBuffer[32] = {0};
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantUri(want, nullptr, sizeof(uriBuffer));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0500 begins");
    AbilityBase_Element element;
    char uriBuffer[32] = {0};
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantUri(want, "file://xxxxxxxx");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantUri(want, uriBuffer, 15);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0600 begins");
    AbilityBase_Element element;
    char uriBuffer[32] = {0};
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantUri(want, "file://xxxxxxxx");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantUri(want, uriBuffer, 14);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2200 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantUri(want, "");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2300 begins");
    AbilityBase_Element element;
    char uriBuffer[32] = {0};
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantUri(want, "");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantUri(want, uriBuffer, sizeof(uriBuffer));
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2300 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2300 uri=%{public}s", uriBuffer);
    if (errCode == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value result;
        napi_create_string_utf8(env, uriBuffer, strlen(uriBuffer), &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0700 begins");
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantInt32Param(nullptr, "keyInt", 32);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0800 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    int32_t intParam = 32;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantInt32Param(want, nullptr, intParam);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_0900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0900 begins");
    int32_t outElement = 0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantInt32Param(nullptr, "keyInt", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1000 begins");
    AbilityBase_Element element;
    int32_t outElement = 0;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantInt32Param(want, "keyInt", 32);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantInt32Param(want, nullptr, &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1100 begins");
    AbilityBase_Element element;
    int32_t outElement = 0;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantInt32Param(want, "keyInt", 32);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantInt32Param(want, "keyInt", nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2400 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantInt32Param(want, "", 32);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2500 begins");
    AbilityBase_Element element;
    int32_t outElement = 0;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantInt32Param(want, "", 32);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantInt32Param(want, "", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2500 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2500 outElement=%{public}d", outElement);
    if (errCode == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value result;
        napi_create_int32(env, outElement, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1200 begins");
    bool flag = false;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantBoolParam(nullptr, "keyBool", flag);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1300 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    bool flag = false;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantBoolParam(want, nullptr, flag);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1300 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1400 begins");
    bool outElement = 0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantBoolParam(nullptr, "keyBool", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1400 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1500 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    bool flag = false;
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantBoolParam(want, "keyBool", flag);
    bool outElement = false;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantBoolParam(nullptr, "keyBool", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1500 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1600 begins");
    AbilityBase_Element element;
    int32_t outElement = 0;     
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    bool flag = false;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantBoolParam(want, "keyBool", flag);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantBoolParam(want, "keyBool", nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2600 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantBoolParam(want, "", false);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2600 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2700 begins");
    AbilityBase_Element element;
    bool outElement = false;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantBoolParam(want, "", false);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantBoolParam(want, "", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2700 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2700 outElement=%{public}d", outElement);
    if (errCode == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value result;
        napi_get_boolean(env, outElement, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1700 begins");
    double param = 1.0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantDoubleParam(nullptr, "keyDouble", param);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1800 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    double param = 1.0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantDoubleParam(want, nullptr, param);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_1900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1900 begins");
    double outElement = 0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantDoubleParam(nullptr, "keyDouble", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_1900 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2000(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2000 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    double param = 1.0;
    AbilityBase_ErrorCode errCode1 = OH_AbilityBase_SetWantDoubleParam(want, "keyDouble", param);
    double outElement = false;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantDoubleParam(nullptr, "keyDouble", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2000 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0100 begins");
    AbilityBase_Element element;
    int32_t outElement = 0;     
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    double param = 1.0;
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantDoubleParam(want, "keyDouble", param);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantDoubleParam(want, "keyDouble", nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_0100 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2800 begins");
    AbilityBase_Element element;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    double param = 1.0;
    AbilityBase_ErrorCode errCode = OH_AbilityBase_SetWantDoubleParam(want, "", param);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2800 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkWantEx_2900(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2900 begins");
    AbilityBase_Element element;
    double outElement = 0;
    element.abilityName = const_cast<char *>("EntryAbility");
    element.bundleName = const_cast<char *>("com.example.startselfuiabilityrely");
    element.moduleName = const_cast<char *>("entry");
    AbilityBase_Want* want = OH_AbilityBase_CreateWant(element);
    double param = 1.0;
    AbilityBase_ErrorCode errCodeSet = OH_AbilityBase_SetWantDoubleParam(want, "", param);
    AbilityBase_ErrorCode errCode = OH_AbilityBase_GetWantDoubleParam(want, "", &outElement);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2900 errCode=%{public}d", errCode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NdkWantEx_2900 outElement=%{public}f", outElement);
    if (errCode == ABILITY_BASE_ERROR_CODE_NO_ERROR) {
        napi_value result;
        napi_create_double(env, outElement, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkSetIsolationUid_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_SetIsolationUid_0100 begins");
    Ability_NativeChildProcess_ErrCode ret =
        OH_Ability_ChildProcessConfigs_SetIsolationUid(nullptr, true);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_SetIsolationUid_0100 errCode=%{public}d", ret);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value NdkSetIsolationUid_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_SetIsolationUid_0200 begins");
    Ability_ChildProcessConfigs *configs = OH_Ability_CreateChildProcessConfigs();
    Ability_NativeChildProcess_ErrCode ret =
        OH_Ability_ChildProcessConfigs_SetIsolationUid(configs, true);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_SetIsolationUid_0200 errCode=%{public}d", ret);
    if(ret == NCP_NO_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_SetIsolationUid_0200 errCode=%{public}d", ret);
    }
    if(ret == NCP_ERR_INVALID_PID){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_SetIsolationUid_0200 errCode=%{public}d", ret);
    }
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value StartNativeChildProcess_0100(napi_env env, napi_callback_info info)
{
    int32_t pid = -1;
    NativeChildProcess_Args args;
    args.entryParams = NULL;
    args.fdList.head = NULL;
    
    NativeChildProcess_Options options = {
        .isolationMode = NCP_ISOLATION_MODE_ISOLATED
    };
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess before");
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_StartNativeChildProcess(
        "libentry.so:Main", args, options, &pid);
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_ErrCode: %{public}d", ret);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value StartNativeChildProcess_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartNativeChildProcess_0800 begins");
    int32_t pid = -1;
    NativeChildProcess_Args args;
    args.entryParams = NULL;
    args.fdList.head = NULL;
    
    NativeChildProcess_Options options = {
        .isolationMode = NCP_ISOLATION_MODE_ISOLATED
    };
    Ability_NativeChildProcess_ErrCode ret = OH_Ability_StartNativeChildProcess(
        "", args, options, &pid);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_StartNativeChildProcess_0800 errCode=%{public}d", ret);
    napi_value result;
    napi_create_int32(env, ret, &result);
    return result;
}

static napi_value StartNativeChildProcess_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_0700 begins");
    NativeChildProcess_Args *args_global = OH_Ability_GetCurrentChildProcessArgs();
    OH_LOG_INFO(LOG_APP, "===================Ability_NativeChildProcess_0700: %{public}d", args_global);
    if(args_global == nullptr){
      napi_value result;
      napi_create_int32(env, 0, &result);
      return result;
    } else {
      napi_value result;
      napi_create_int32(env, 1, &result);
      return result;
    }
}

static napi_value ContextGetLogPath_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0700 begins");
    char buffer[1024] = { 0 };
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextGetLogFileDir(buffer, 1024, &writeLength);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0700 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_string_utf8(env, buffer, NAPI_AUTO_LENGTH, &result);
    return result;

}

static napi_value ContextGetLogPath_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0100 begins");
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextGetLogFileDir(nullptr, 1024, &writeLength);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0100 errCode=%{public}d", errCode);
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_CONTEXT_NOT_EXIST){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0100 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0100 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0100 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value ContextGetLogPath_1600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_1600 begins");
    char buffer[1024] = { 0 };
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextGetLogFileDir(buffer, 1024, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_1600 errCode=%{public}d", errCode);
    if(errCode != NCP_NO_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_1600 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value ContextGetLogPath_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0200 begins");
    char buffer[1024] = { 0 };
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextGetLogFileDir(buffer, 0, &writeLength);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0200 errCode=%{public}d", errCode);
    if(errCode != NCP_NO_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0200 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value ContextGetLogPath_1500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_1500 begins");
    char buffer[1024] = { 0 };
    int32_t writeLength = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextGetLogFileDir(buffer, -1, &writeLength);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_1500 errCode=%{public}d", errCode);
    if(errCode != NCP_NO_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_1500 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value ContextGetLogPath_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0300 begins");
    char buffer[1024] = { 0 };
    int32_t writeLength = 5;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextGetLogFileDir(buffer, 100, &writeLength);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0300 errCode=%{public}d", errCode);
    if(errCode != NCP_NO_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0300 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_string_utf8(env, buffer, NAPI_AUTO_LENGTH, &result);
    return result;
}

static napi_value ContextGetLogPath_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0400 begins");
    char buffer[1024] = { 0 };
    int32_t writeLength = 200;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextGetLogFileDir(buffer, 10, &writeLength);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0400 errCode=%{public}d", errCode);
    if(errCode != NCP_NO_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_ContextGetLogPath_0400 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkKillSelfChildProcess_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_KillSelfChildProcess_0100 begins");
    size_t argc = 1;
    napi_value argv[1] = { NULL };
    napi_get_cb_info(env, info, &argc, argv, NULL, NULL);
    int32_t pid_temp = -1;
    napi_get_value_int32(env, argv[0], &pid_temp);
    Ability_NativeChildProcess_ErrCode errCode = OH_Ability_KillChildProcess(pid_temp);
    if(errCode == NCP_ERR_INVALID_PID){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_KillSelfChildProcess_0100 errCode=%{public}d", errCode);
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if(errCode == NCP_ERR_SERVICE_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_KillSelfChildProcess_0100 errCode=%{public}d", errCode);
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if(errCode == NCP_NO_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_KillSelfChildProcess_0100 errCode=%{public}d", errCode);
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}


static napi_value NdkKillSelfChildProcess_2600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_KillSelfChildProcess_2600 begins");
    int32_t pid_temp = -1;
    Ability_NativeChildProcess_ErrCode errCode = OH_Ability_KillChildProcess(pid_temp);
    if(errCode == NCP_ERR_INVALID_PID){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_KillSelfChildProcess_2600 errCode=%{public}d", errCode);
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if(errCode == NCP_ERR_SERVICE_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_KillSelfChildProcess_2600 errCode=%{public}d", errCode);
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if(errCode == NCP_NO_ERROR){
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_KillSelfChildProcess_2600 errCode=%{public}d", errCode);
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value NotifyPageChanged_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0400 begins");
    int32_t testPageNameLen = 32;
    int32_t testWindowId = 12; 
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextNotifyPageChanged(nullptr, testPageNameLen, testWindowId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0400 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_INTERNAL) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0400 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0400 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0400 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NotifyPageChanged_0500(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0500 begins");
    const char* testPageName = "testhomepage";
    int32_t testPageNameLen = -1;
    int32_t testWindowId = 12; 
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextNotifyPageChanged(testPageName, testPageNameLen, testWindowId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0500 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_INTERNAL) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0500 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0500 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0500 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NotifyPageChanged_0600(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0600 begins");
    const char* testPageName = "testhomepage";
    int32_t testPageNameLen = 32;
    int32_t testWindowId = 0; 
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextNotifyPageChanged(testPageName, testPageNameLen, testWindowId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0600 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_INTERNAL) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0600 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0600 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0600 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NotifyPageChanged_0700(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0700 begins");
    const char* testPageName = "testhomepage";
    int32_t testPageNameLen = 32;
    int32_t testWindowId = -1; 
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextNotifyPageChanged(testPageName, testPageNameLen, testWindowId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0700 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_INTERNAL) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0700 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0700 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0700 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}


static napi_value NotifyPageChanged_0800(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0800 begins");
    const char* testPageName = "testhomepage";
    int32_t testPageNameLen = 0;
    int32_t testWindowId = -1; 
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_ApplicationContextNotifyPageChanged(testPageName, testPageNameLen, testWindowId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0800 errCode=%{public}d", errCode);
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_INTERNAL) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0800 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0800 errCode=%{public}d", errCode);
    }
    if (errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_NotifyPageChanged_0800 errCode=%{public}d", errCode);
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value NdkGetStartOptionsWindowModeValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_WindowMode windowMode = ABILITY_RUNTIME_WINDOW_MODE_FULL_SCREEN;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowMode(options, windowMode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0100 set errCode=%{public}d", errCode);
    AbilityRuntime_WindowMode getWindowMode = ABILITY_RUNTIME_WINDOW_MODE_UNDEFINED;
    errCode = OH_AbilityRuntime_GetStartOptionsWindowModeValue(options, &getWindowMode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0100 get errCode=%{public}d, windowMode=%{public}d",
        errCode, getWindowMode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowModeValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0200 begins");
    AbilityRuntime_WindowMode windowMode = ABILITY_RUNTIME_WINDOW_MODE_UNDEFINED;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowModeValue(nullptr, &windowMode);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowModeValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowModeValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowModeValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsDisplayIdValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t setDisplayId = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsDisplayId(options, setDisplayId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0100 set errCode=%{public}d", errCode);
    int32_t getDisplayId = -1;
    errCode = OH_AbilityRuntime_GetStartOptionsDisplayIdValue(options, &getDisplayId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0100 get errCode=%{public}d, displayId=%{public}d",
        errCode, getDisplayId);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsDisplayIdValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0200 begins");
    int32_t displayId = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsDisplayIdValue(nullptr, &displayId);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsDisplayIdValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsDisplayIdValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsDisplayIdValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWithAnimationValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    bool setWithAnimation = true;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWithAnimation(options, setWithAnimation);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0100 set errCode=%{public}d", errCode);
    bool getWithAnimation = false;
    errCode = OH_AbilityRuntime_GetStartOptionsWithAnimationValue(options, &getWithAnimation);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0100 get errCode=%{public}d, withAnimation=%{public}d",
        errCode, getWithAnimation);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWithAnimationValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0200 begins");
    bool withAnimation = false;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWithAnimationValue(nullptr, &withAnimation);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWithAnimationValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWithAnimationValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWithAnimationValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowLeftValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t setWindowLeft = 100;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowLeft(options, setWindowLeft);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0100 set errCode=%{public}d", errCode);
    int32_t getWindowLeft = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsWindowLeftValue(options, &getWindowLeft);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0100 get errCode=%{public}d, windowLeft=%{public}d",
        errCode, getWindowLeft);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowLeftValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0200 begins");
    int32_t windowLeft = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowLeftValue(nullptr, &windowLeft);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowLeftValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowLeftValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowLeftValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowTopValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t setWindowTop = 200;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowTop(options, setWindowTop);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0100 set errCode=%{public}d", errCode);
    int32_t getWindowTop = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsWindowTopValue(options, &getWindowTop);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0100 get errCode=%{public}d, windowTop=%{public}d",
        errCode, getWindowTop);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowTopValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0200 begins");
    int32_t windowTop = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowTopValue(nullptr, &windowTop);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowTopValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowTopValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowTopValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowHeightValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t setWindowHeight = 480;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowHeight(options, setWindowHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0100 set errCode=%{public}d", errCode);
    int32_t getWindowHeight = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsWindowHeightValue(options, &getWindowHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0100 get errCode=%{public}d, windowHeight=%{public}d",
        errCode, getWindowHeight);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowHeightValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0200 begins");
    int32_t windowHeight = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowHeightValue(nullptr, &windowHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsWindowHeightValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowHeightValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowHeightValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsWindowWidthValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t setWindowWidth = 720;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsWindowWidth(options, setWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0100 set errCode=%{public}d", errCode);
    int32_t getWindowWidth = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsWindowWidthValue(options, &getWindowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0100 get errCode=%{public}d, windowWidth=%{public}d",
        errCode, getWindowWidth);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsWindowWidthValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0200 begins");
    int32_t windowWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowWidthValue(nullptr, &windowWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsWindowWidthValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsWindowWidthValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsWindowWidthValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsStartVisibilityValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_StartVisibility setVisibility = ABILITY_RUNTIME_SHOW_UPON_START;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartVisibility(options, setVisibility);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0100 set errCode=%{public}d", errCode);
    AbilityRuntime_StartVisibility getVisibility = ABILITY_RUNTIME_HIDE_UPON_START;
    errCode = OH_AbilityRuntime_GetStartOptionsStartVisibilityValue(options, &getVisibility);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0100 get errCode=%{public}d, visibility=%{public}d",
        errCode, getVisibility);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsStartVisibilityValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0200 begins");
    AbilityRuntime_StartVisibility visibility = ABILITY_RUNTIME_HIDE_UPON_START;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartVisibilityValue(nullptr, &visibility);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsStartVisibilityValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartVisibilityValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartVisibilityValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsStartWindowBackgroundColorValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsStartWindowBackgroundColor(options, "#FFFFFF");
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0100 set errCode=%{public}d", errCode);
    char *color = nullptr;
    size_t size = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue(options, &color, &size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0100 get errCode=%{public}d, size=%{public}zu",
        errCode, size);
    if (color != nullptr) {
        free(color);
        color = nullptr;
    }
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsStartWindowBackgroundColorValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0200 begins");
    char *color = nullptr;
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue(nullptr, &color, &size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsStartWindowBackgroundColorValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue(options, nullptr, &size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsStartWindowBackgroundColorValue_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0400 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    char *color = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue(options, &color, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsStartWindowBackgroundColorValue_0400 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsSupportedWindowModesValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    size_t setModesSize = 3;
    AbilityRuntime_SupportedWindowMode setModes[3] = {
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FULL_SCREEN,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_SPLIT,
        ABILITY_RUNTIME_SUPPORTED_WINDOW_MODE_FLOATING,
    };
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsSupportedWindowModes(options, setModes, setModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0100 set errCode=%{public}d", errCode);
    AbilityRuntime_SupportedWindowMode *getModes = nullptr;
    size_t getModesSize = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsSupportedWindowModesValue(options, &getModes, &getModesSize);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0100 get errCode=%{public}d, size=%{public}zu",
        errCode, getModesSize);
    if (getModes != nullptr) {
        free(getModes);
        getModes = nullptr;
    }
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsSupportedWindowModesValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0200 begins");
    AbilityRuntime_SupportedWindowMode *modes = nullptr;
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsSupportedWindowModesValue(nullptr, &modes, &size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsSupportedWindowModesValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    size_t size = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsSupportedWindowModesValue(options, nullptr, &size);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsSupportedWindowModesValue_0400(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0400 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_SupportedWindowMode *modes = nullptr;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsSupportedWindowModesValue(options, &modes, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsSupportedWindowModesValue_0400 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsMinWindowWidthValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t setMinWidth = 100;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsMinWindowWidth(options, setMinWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0100 set errCode=%{public}d", errCode);
    int32_t getMinWidth = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsMinWindowWidthValue(options, &getMinWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0100 get errCode=%{public}d, minWidth=%{public}d",
        errCode, getMinWidth);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsMinWindowWidthValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0200 begins");
    int32_t minWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMinWindowWidthValue(nullptr, &minWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsMinWindowWidthValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMinWindowWidthValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowWidthValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsMaxWindowWidthValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t setMaxWidth = 720;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsMaxWindowWidth(options, setMaxWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0100 set errCode=%{public}d", errCode);
    int32_t getMaxWidth = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowWidthValue(options, &getMaxWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0100 get errCode=%{public}d, maxWidth=%{public}d",
        errCode, getMaxWidth);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsMaxWindowWidthValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0200 begins");
    int32_t maxWidth = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowWidthValue(nullptr, &maxWidth);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsMaxWindowWidthValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowWidthValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowWidthValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsMinWindowHeightValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t setMinHeight = 100;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsMinWindowHeight(options, setMinHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0100 set errCode=%{public}d", errCode);
    int32_t getMinHeight = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsMinWindowHeightValue(options, &getMinHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0100 get errCode=%{public}d, minHeight=%{public}d",
        errCode, getMinHeight);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsMinWindowHeightValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0200 begins");
    int32_t minHeight = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMinWindowHeightValue(nullptr, &minHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsMinWindowHeightValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMinWindowHeightValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMinWindowHeightValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsMaxWindowHeightValue_0100(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0100 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    int32_t setMaxHeight = 480;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_SetStartOptionsMaxWindowHeight(options, setMaxHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0100 set errCode=%{public}d", errCode);
    int32_t getMaxHeight = 0;
    errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowHeightValue(options, &getMaxHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0100 get errCode=%{public}d, maxHeight=%{public}d",
        errCode, getMaxHeight);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    }
}

static napi_value NdkGetStartOptionsMaxWindowHeightValue_0200(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0200 begins");
    int32_t maxHeight = 0;
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowHeightValue(nullptr, &maxHeight);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0200 errCode=%{public}d", errCode);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

static napi_value NdkGetStartOptionsMaxWindowHeightValue_0300(napi_env env, napi_callback_info info)
{
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0300 begins");
    AbilityRuntime_StartOptions *options = OH_AbilityRuntime_CreateStartOptions();
    AbilityRuntime_ErrorCode errCode = OH_AbilityRuntime_GetStartOptionsMaxWindowHeightValue(options, nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_Ability_AbilityRuntime_GetStartOptionsMaxWindowHeightValue_0300 errCode=%{public}d", errCode);
    OH_AbilityRuntime_DestroyStartOptions(&options);
    napi_value result;
    if(errCode == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID){
        napi_value result;
        napi_create_int32(env, errCode, &result);
        return result;
    }else{
        napi_create_int32(env, -1, &result);
        return result;
    };
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "ndkStartAbility_0100", nullptr, NdkStartAbility_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0200", nullptr, NdkStartAbility_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0300", nullptr, NdkStartAbility_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0400", nullptr, NdkStartAbility_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0500", nullptr, NdkStartAbility_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_0900", nullptr, NdkStartAbility_0900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_1000", nullptr, NdkStartAbility_1000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_1100", nullptr, NdkStartAbility_1100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_1200", nullptr, NdkStartAbility_1200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbility_1600", nullptr, NdkStartAbility_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0100", nullptr, WantNdk_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0200", nullptr, WantNdk_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0300", nullptr, WantNdk_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0400", nullptr, WantNdk_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0500", nullptr, WantNdk_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0600", nullptr, WantNdk_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0700", nullptr, WantNdk_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0800", nullptr, WantNdk_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_0900", nullptr, WantNdk_0900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1000", nullptr, WantNdk_1000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1100", nullptr, WantNdk_1100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1200", nullptr, WantNdk_1200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1300", nullptr, WantNdk_1300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1400", nullptr, WantNdk_1400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1500", nullptr, WantNdk_1500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1600", nullptr, WantNdk_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1700", nullptr, WantNdk_1700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1800", nullptr, WantNdk_1800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_1900", nullptr, WantNdk_1900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2000", nullptr, WantNdk_2000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2100", nullptr, WantNdk_2100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2200", nullptr, WantNdk_2200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2200", nullptr, WantNdk_2200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2300", nullptr, WantNdk_2300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2400", nullptr, WantNdk_2400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "wantNdk_2500", nullptr, WantNdk_2500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0100", nullptr, NdkStartAbilityWithOptions_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0200", nullptr, NdkStartAbilityWithOptions_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0300", nullptr, NdkStartAbilityWithOptions_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0400", nullptr, NdkStartAbilityWithOptions_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0500", nullptr, NdkStartAbilityWithOptions_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0600", nullptr, NdkStartAbilityWithOptions_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0700", nullptr, NdkStartAbilityWithOptions_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_0800", nullptr, NdkStartAbilityWithOptions_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1100", nullptr, NdkStartAbilityWithOptions_1100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1200", nullptr, NdkStartAbilityWithOptions_1200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1300", nullptr, NdkStartAbilityWithOptions_1300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1400", nullptr, NdkStartAbilityWithOptions_1400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1500", nullptr, NdkStartAbilityWithOptions_1500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1600", nullptr, NdkStartAbilityWithOptions_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1700", nullptr, NdkStartAbilityWithOptions_1700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1800", nullptr, NdkStartAbilityWithOptions_1800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_1900", nullptr, NdkStartAbilityWithOptions_1900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2000", nullptr, NdkStartAbilityWithOptions_2000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2100", nullptr, NdkStartAbilityWithOptions_2100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2200", nullptr, NdkStartAbilityWithOptions_2200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2300", nullptr, NdkStartAbilityWithOptions_2300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2400", nullptr, NdkStartAbilityWithOptions_2400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2500", nullptr, NdkStartAbilityWithOptions_2500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2600", nullptr, NdkStartAbilityWithOptions_2600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2700", nullptr, NdkStartAbilityWithOptions_2700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2800", nullptr, NdkStartAbilityWithOptions_2800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_2900", nullptr, NdkStartAbilityWithOptions_2900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3000", nullptr, NdkStartAbilityWithOptions_3000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3100", nullptr, NdkStartAbilityWithOptions_3100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3200", nullptr, NdkStartAbilityWithOptions_3200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3300", nullptr, NdkStartAbilityWithOptions_3300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3400", nullptr, NdkStartAbilityWithOptions_3400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3500", nullptr, NdkStartAbilityWithOptions_3500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3600", nullptr, NdkStartAbilityWithOptions_3600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3700", nullptr, NdkStartAbilityWithOptions_3700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3800", nullptr, NdkStartAbilityWithOptions_3800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_3900", nullptr, NdkStartAbilityWithOptions_3900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_4000", nullptr, NdkStartAbilityWithOptions_4000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_4100", nullptr, NdkStartAbilityWithOptions_4100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_4200", nullptr, NdkStartAbilityWithOptions_4200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartAbilityWithOptions_4400", nullptr, NdkStartAbilityWithOptions_4400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0100", nullptr, NdkWantEx_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0200", nullptr, NdkWantEx_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0300", nullptr, NdkWantEx_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0400", nullptr, NdkWantEx_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0500", nullptr, NdkWantEx_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0600", nullptr, NdkWantEx_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0700", nullptr, NdkWantEx_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0800", nullptr, NdkWantEx_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_0900", nullptr, NdkWantEx_0900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1000", nullptr, NdkWantEx_1000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1100", nullptr, NdkWantEx_1100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1200", nullptr, NdkWantEx_1200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1300", nullptr, NdkWantEx_1300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1400", nullptr, NdkWantEx_1400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1500", nullptr, NdkWantEx_1500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1600", nullptr, NdkWantEx_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1700", nullptr, NdkWantEx_1700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1800", nullptr, NdkWantEx_1800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_1900", nullptr, NdkWantEx_1900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2000", nullptr, NdkWantEx_2000, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2100", nullptr, NdkWantEx_2100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2200", nullptr, NdkWantEx_2200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2300", nullptr, NdkWantEx_2300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2400", nullptr, NdkWantEx_2400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2500", nullptr, NdkWantEx_2500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2600", nullptr, NdkWantEx_2600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2700", nullptr, NdkWantEx_2700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2800", nullptr, NdkWantEx_2800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkWantEx_2900", nullptr, NdkWantEx_2900, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startNativeChildProcess_0100", nullptr, StartNativeChildProcess_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startNativeChildProcess_0700", nullptr, StartNativeChildProcess_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "startNativeChildProcess_0800", nullptr, StartNativeChildProcess_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartVisibility_0100", nullptr, NdkStartVisibility_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartVisibility_0200", nullptr, NdkStartVisibility_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartSelfUIAbilityWithPidResult_0100", nullptr, NdkStartSelfUIAbilityWithPidResult_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkStartSelfUIAbilityWithPidResult_0200", nullptr, NdkStartSelfUIAbilityWithPidResult_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkApplicationContextGetVersionCode_0100", nullptr, NdkApplicationContextGetVersionCode_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkApplicationContextGetVersionCode_0200", nullptr, NdkApplicationContextGetVersionCode_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkSetIsolationUid_0100", nullptr, NdkSetIsolationUid_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkSetIsolationUid_0200", nullptr, NdkSetIsolationUid_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "contextGetLogPath_0700", nullptr, ContextGetLogPath_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "contextGetLogPath_0100", nullptr, ContextGetLogPath_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "contextGetLogPath_0200", nullptr, ContextGetLogPath_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "contextGetLogPath_1500", nullptr, ContextGetLogPath_1500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "contextGetLogPath_0300", nullptr, ContextGetLogPath_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "contextGetLogPath_0400", nullptr, ContextGetLogPath_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "contextGetLogPath_1600", nullptr, ContextGetLogPath_1600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkKillSelfChildProcess_0100", nullptr, NdkKillSelfChildProcess_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkKillSelfChildProcess_2600", nullptr, NdkKillSelfChildProcess_2600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "notifyPageChanged_0400", nullptr, NotifyPageChanged_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "notifyPageChanged_0500", nullptr, NotifyPageChanged_0500, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "notifyPageChanged_0600", nullptr, NotifyPageChanged_0600, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "notifyPageChanged_0700", nullptr, NotifyPageChanged_0700, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "notifyPageChanged_0800", nullptr, NotifyPageChanged_0800, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoLaunchMode_0100", nullptr, NdkGetModObjExtInfoLaunchMode_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoLaunchMode_0200", nullptr, NdkGetModObjExtInfoLaunchMode_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoProcessMode_0100", nullptr, NdkGetModObjExtInfoProcessMode_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoProcessMode_0200", nullptr, NdkGetModObjExtInfoProcessMode_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoThreadMode_0100", nullptr, NdkGetModObjExtInfoThreadMode_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoThreadMode_0200", nullptr, NdkGetModObjExtInfoThreadMode_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoElementName_0100", nullptr, NdkGetModObjExtInfoElementName_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoElementName_0200", nullptr, NdkGetModObjExtInfoElementName_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoDisableState_0100", nullptr, NdkGetModObjExtInfoDisableState_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoDisableState_0200", nullptr, NdkGetModObjExtInfoDisableState_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkAcquireSelfModObjExtInfos_0100", nullptr, NdkAcquireSelfModObjExtInfos_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkReleaseAllExtensionInfos_0100", nullptr, NdkReleaseAllExtensionInfos_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetCountFromAllModObjExtInfos_0100", nullptr, NdkGetCountFromAllModObjExtInfos_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetCountFromAllModObjExtInfos_0200", nullptr, NdkGetCountFromAllModObjExtInfos_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoByIndex_0100", nullptr, NdkGetModObjExtInfoByIndex_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoByIndex_0200", nullptr, NdkGetModObjExtInfoByIndex_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtInfoByIndex_0300", nullptr, NdkGetModObjExtInfoByIndex_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtCtxGetBaseContext_0100", nullptr, NdkModObjExtCtxGetBaseContext_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtCtxGetBaseContext_0200", nullptr, NdkModObjExtCtxGetBaseContext_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtCtxStartSelfUIAbility_0100", nullptr, NdkModObjExtCtxStartSelfUIAbility_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtCtxStartSelfUIAbility_0200", nullptr, NdkModObjExtCtxStartSelfUIAbility_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtCtxStartSelfUIAbilityWithOptions_0100", nullptr, NdkModObjExtCtxStartSelfUIAbilityWithOptions_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtCtxStartSelfUIAbilityWithOptions_0200", nullptr, NdkModObjExtCtxStartSelfUIAbilityWithOptions_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtCtxStartSelfUIAbilityWithOptions_0300", nullptr, NdkModObjExtCtxStartSelfUIAbilityWithOptions_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtCtxTerminateSelf_0100", nullptr, NdkModObjExtCtxTerminateSelf_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityRegisterOnCreate_0100", nullptr, NdkModObjExtAbilityRegisterOnCreate_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityRegisterOnCreate_0200", nullptr, NdkModObjExtAbilityRegisterOnCreate_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityRegisterOnDestroy_0100", nullptr, NdkModObjExtAbilityRegisterOnDestroy_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityRegisterOnDestroy_0200", nullptr, NdkModObjExtAbilityRegisterOnDestroy_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityRegisterOnConnect_0100", nullptr, NdkModObjExtAbilityRegisterOnConnect_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityRegisterOnConnect_0200", nullptr, NdkModObjExtAbilityRegisterOnConnect_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityRegisterOnDisconnect_0100", nullptr, NdkModObjExtAbilityRegisterOnDisconnect_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityRegisterOnDisconnect_0200", nullptr, NdkModObjExtAbilityRegisterOnDisconnect_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityGetContext_0100", nullptr, NdkModObjExtAbilityGetContext_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityGetContext_0200", nullptr, NdkModObjExtAbilityGetContext_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityGetInstanceFromBase_0100", nullptr, NdkModObjExtAbilityGetInstanceFromBase_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkModObjExtAbilityGetInstanceFromBase_0200", nullptr, NdkModObjExtAbilityGetInstanceFromBase_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectModObjExtAbility_0100", nullptr, NdkConnectModObjExtAbility_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectModObjExtAbility_0200", nullptr, NdkConnectModObjExtAbility_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectModObjExtAbility_0300", nullptr, NdkConnectModObjExtAbility_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkDisconnectModObjExtAbility_0100", nullptr, NdkDisconnectModObjExtAbility_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkDisconnectModObjExtAbility_0200", nullptr, NdkDisconnectModObjExtAbility_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkDestroyConnectOptions_0100", nullptr, NdkDestroyConnectOptions_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectOptionsSetOnConnect_0100", nullptr, NdkConnectOptionsSetOnConnect_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectOptionsSetOnConnect_0200", nullptr, NdkConnectOptionsSetOnConnect_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectOptionsSetOnDisconnect_0100", nullptr, NdkConnectOptionsSetOnDisconnect_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectOptionsSetOnDisconnect_0200", nullptr, NdkConnectOptionsSetOnDisconnect_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectOptionsSetOnFailed_0100", nullptr, NdkConnectOptionsSetOnFailed_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectOptionsSetOnFailed_0200", nullptr, NdkConnectOptionsSetOnFailed_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtCallbackCounts_0100", nullptr, NdkGetModObjExtCallbackCounts_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtCallbackCounts_0200", nullptr, NdkGetModObjExtCallbackCounts_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtCallbackCounts_0300", nullptr, NdkGetModObjExtCallbackCounts_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetModObjExtCallbackCounts_0400", nullptr, NdkGetModObjExtCallbackCounts_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkResetModObjExtCallbackCounts_0100", nullptr, NdkResetModObjExtCallbackCounts_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkConnectMoeExtension_0100", nullptr, NdkConnectMoeExtension_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkDisconnectMoeExtension_0100", nullptr, NdkDisconnectMoeExtension_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkLaunchModeInProcess_0100", nullptr, NdkLaunchModeInProcess_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkLaunchModeCrossProcess_0100", nullptr, NdkLaunchModeCrossProcess_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkProcessModeBundle_0100", nullptr, NdkProcessModeBundle_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkProcessModeType_0100", nullptr, NdkProcessModeType_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkProcessModeInstance_0100", nullptr, NdkProcessModeInstance_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkThreadModeBundle_0100", nullptr, NdkThreadModeBundle_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkThreadModeType_0100", nullptr, NdkThreadModeType_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkThreadModeInstance_0100", nullptr, NdkThreadModeInstance_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkThreadLaunchMode_0100", nullptr, NdkThreadLaunchMode_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkThreadLaunchMode_0200", nullptr, NdkThreadLaunchMode_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsStartWindowBackgroundColorValue_0100", nullptr, NdkGetStartOptionsStartWindowBackgroundColorValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsStartWindowBackgroundColorValue_0200", nullptr, NdkGetStartOptionsStartWindowBackgroundColorValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsStartWindowBackgroundColorValue_0300", nullptr, NdkGetStartOptionsStartWindowBackgroundColorValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsStartWindowBackgroundColorValue_0400", nullptr, NdkGetStartOptionsStartWindowBackgroundColorValue_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsSupportedWindowModesValue_0100", nullptr, NdkGetStartOptionsSupportedWindowModesValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsSupportedWindowModesValue_0200", nullptr, NdkGetStartOptionsSupportedWindowModesValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsSupportedWindowModesValue_0300", nullptr, NdkGetStartOptionsSupportedWindowModesValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsSupportedWindowModesValue_0400", nullptr, NdkGetStartOptionsSupportedWindowModesValue_0400, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMinWindowWidthValue_0100", nullptr, NdkGetStartOptionsMinWindowWidthValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMinWindowWidthValue_0200", nullptr, NdkGetStartOptionsMinWindowWidthValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMinWindowWidthValue_0300", nullptr, NdkGetStartOptionsMinWindowWidthValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMaxWindowWidthValue_0100", nullptr, NdkGetStartOptionsMaxWindowWidthValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMaxWindowWidthValue_0200", nullptr, NdkGetStartOptionsMaxWindowWidthValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMaxWindowWidthValue_0300", nullptr, NdkGetStartOptionsMaxWindowWidthValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMinWindowHeightValue_0100", nullptr, NdkGetStartOptionsMinWindowHeightValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMinWindowHeightValue_0200", nullptr, NdkGetStartOptionsMinWindowHeightValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMinWindowHeightValue_0300", nullptr, NdkGetStartOptionsMinWindowHeightValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMaxWindowHeightValue_0100", nullptr, NdkGetStartOptionsMaxWindowHeightValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMaxWindowHeightValue_0200", nullptr, NdkGetStartOptionsMaxWindowHeightValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsMaxWindowHeightValue_0300", nullptr, NdkGetStartOptionsMaxWindowHeightValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowModeValue_0100", nullptr, NdkGetStartOptionsWindowModeValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowModeValue_0200", nullptr, NdkGetStartOptionsWindowModeValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowModeValue_0300", nullptr, NdkGetStartOptionsWindowModeValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsDisplayIdValue_0100", nullptr, NdkGetStartOptionsDisplayIdValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsDisplayIdValue_0200", nullptr, NdkGetStartOptionsDisplayIdValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsDisplayIdValue_0300", nullptr, NdkGetStartOptionsDisplayIdValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWithAnimationValue_0100", nullptr, NdkGetStartOptionsWithAnimationValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWithAnimationValue_0200", nullptr, NdkGetStartOptionsWithAnimationValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWithAnimationValue_0300", nullptr, NdkGetStartOptionsWithAnimationValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowLeftValue_0100", nullptr, NdkGetStartOptionsWindowLeftValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowLeftValue_0200", nullptr, NdkGetStartOptionsWindowLeftValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowLeftValue_0300", nullptr, NdkGetStartOptionsWindowLeftValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowTopValue_0100", nullptr, NdkGetStartOptionsWindowTopValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowTopValue_0200", nullptr, NdkGetStartOptionsWindowTopValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowTopValue_0300", nullptr, NdkGetStartOptionsWindowTopValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowHeightValue_0100", nullptr, NdkGetStartOptionsWindowHeightValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowHeightValue_0200", nullptr, NdkGetStartOptionsWindowHeightValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowHeightValue_0300", nullptr, NdkGetStartOptionsWindowHeightValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowWidthValue_0100", nullptr, NdkGetStartOptionsWindowWidthValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowWidthValue_0200", nullptr, NdkGetStartOptionsWindowWidthValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsWindowWidthValue_0300", nullptr, NdkGetStartOptionsWindowWidthValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsStartVisibilityValue_0100", nullptr, NdkGetStartOptionsStartVisibilityValue_0100, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsStartVisibilityValue_0200", nullptr, NdkGetStartOptionsStartVisibilityValue_0200, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ndkGetStartOptionsStartVisibilityValue_0300", nullptr, NdkGetStartOptionsStartVisibilityValue_0300, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};
} // namespace

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
