/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include <AbilityKit/ability_runtime/ability_runtime_common.h>
#include <string>
#include <js_native_api_types.h>
#include "AbilityKit/ability_runtime/modular_object_extension_manager.h"
#include "AbilityKit/ability_runtime/modular_object_extension_ability.h"
#include "AbilityKit/ability_runtime/modular_object_extension_context.h"
#include "ActsCapiModularObjectTest.h"
#include "hilog/log.h"

napi_value ModularObject_0100(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos ret=%{public}d", ret);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        napi_value napiRet;
        napi_create_string_utf8(env, std::to_string(ret).c_str(), NAPI_AUTO_LENGTH, &napiRet);
        return napiRet;
    }
    size_t count = 0;
    ret = OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos(allExtensionInfos, &count);
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos ret=%{public}d", ret);
    OH_LOG_INFO(LOG_APP, "count=%{public}zu", count);
    std::string result  = "count=" + std::to_string(count) + "\n";
    for (size_t index = 0; index < count; ++index) {
        OH_AbilityRuntime_ModObjExtensionInfoHandle info = NULL;
        ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, index, &info);
        OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_GetModObjExtensionInfoByIndex ret=%{public}d", ret);
        AbilityBase_Element element;
        ret = OH_AbilityRuntime_GetModularObjectExtensionInfoElementName(info, &element);
        OH_LOG_INFO(LOG_APP, "bundleName=%{public}s", element.bundleName);
        OH_LOG_INFO(LOG_APP, "moduleName=%{public}s", element.moduleName);
        OH_LOG_INFO(LOG_APP, "abilityName=%{public}s", element.abilityName);
        OH_AbilityRuntime_LaunchMode launchMode;
        ret = OH_AbilityRuntime_GetModularObjectExtensionInfoLaunchMode(info, &launchMode);
        OH_LOG_INFO(LOG_APP, "launchMode=%{public}d", launchMode);
        OH_AbilityRuntime_ProcessMode processMode;
        ret = OH_AbilityRuntime_GetModularObjectExtensionInfoProcessMode(info, &processMode);
        OH_LOG_INFO(LOG_APP, "processMode=%{public}d", processMode);
        OH_AbilityRuntime_ThreadMode threadMode;
        ret = OH_AbilityRuntime_GetModularObjectExtensionInfoThreadMode(info, &threadMode);
        OH_LOG_INFO(LOG_APP, "threadMode=%{public}d", threadMode);
        bool isDisabled = true;
        ret = OH_AbilityRuntime_GetModularObjectExtensionInfoDisableState(info, &isDisabled);
        OH_LOG_INFO(LOG_APP, "isDisabled=%{public}d", isDisabled);
        result += "index=" + std::to_string(index) + " | bundleName=" + element.bundleName
            + " | moduleName=" + element.moduleName + " | abilityName=" + element.abilityName
            + " | launchMode=" + std::to_string(launchMode) + " | processMode=" + std::to_string(processMode)
            + " | threadMode=" + std::to_string(threadMode) + " | isDisabled=" + std::to_string(isDisabled) + "\n";
    }
    ret = OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    OH_LOG_INFO(LOG_APP, "OH_AbilityRuntime_ReleaseAllExtensionInfos ret=%{public}d", ret);
    napi_value sum;
    napi_create_string_utf8(env, result.c_str(), result.size(), &sum);
    return sum;
}

napi_value ModularObject_0200(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    // Pass nullptr to test error handling
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_0200: AcquireSelfModularObjectExtensionInfos ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_0300(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    OH_LOG_INFO(LOG_APP, "ModularObject_0300: AcquireSelfModularObjectExtensionInfos ret=%{public}d", ret);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    size_t count = 0;
    ret = OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos(allExtensionInfos, &count);
    OH_LOG_INFO(LOG_APP, "ModularObject_0300: GetCountFromAllModObjExtensionInfos ret=%{public}d, count=%{public}zu",
        ret, count);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = "success: count=" + std::to_string(count);
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_0400(napi_env env, napi_callback_info info)
{
    size_t count = 0;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos(nullptr, &count);
    OH_LOG_INFO(LOG_APP, "ModularObject_0400: GetCountFromAllModObjExtensionInfos ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_0500(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    OH_LOG_INFO(LOG_APP, "ModularObject_0500: GetModObjExtensionInfoByIndex ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR && extensionInfo != NULL) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_0600(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(nullptr, 0, &extensionInfo);
    OH_LOG_INFO(LOG_APP, "ModularObject_0600: GetModObjExtensionInfoByIndex ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_0700(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    size_t count = 0;
    OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos(allExtensionInfos, &count);
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, count + 1, &extensionInfo);
    OH_LOG_INFO(LOG_APP, "ModularObject_0700: GetModObjExtensionInfoByIndex ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_0800(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_0800: GetModObjExtensionInfoByIndex ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_0900(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_LaunchMode launchMode;
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoLaunchMode(extensionInfo, &launchMode);
    OH_LOG_INFO(LOG_APP, "ModularObject_0900: GetModularObjectExtensionInfoLaunchMode ret=%{public}d, \
        launchMode=%{public}d", ret, launchMode);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = "success: launchMode=" + std::to_string(launchMode);
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1000(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_LaunchMode launchMode;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetModularObjectExtensionInfoLaunchMode(nullptr, &launchMode);
    OH_LOG_INFO(LOG_APP, "ModularObject_1000: GetModularObjectExtensionInfoLaunchMode ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1100(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoLaunchMode(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_1100: GetModularObjectExtensionInfoLaunchMode ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1200(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ProcessMode processMode;
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoProcessMode(extensionInfo, &processMode);
    OH_LOG_INFO(LOG_APP, "ModularObject_1200: GetModularObjectExtensionInfoProcessMode ret=%{public}d, \
        processMode=%{public}d", ret, processMode);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = "success: processMode=" + std::to_string(processMode);
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1300(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_ProcessMode processMode;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetModularObjectExtensionInfoProcessMode(nullptr, &processMode);
    OH_LOG_INFO(LOG_APP, "ModularObject_1300: GetProcessMode with nullptr extensionInfo ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1400(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoProcessMode(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_1400: GetProcessMode with nullptr processMode ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1500(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ThreadMode threadMode;
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoThreadMode(extensionInfo, &threadMode);
    OH_LOG_INFO(LOG_APP, "ModularObject_1500: GetModularObjectExtensionInfoThreadMode ret=%{public}d, \
        threadMode=%{public}d", ret, threadMode);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = "success: threadMode=" + std::to_string(threadMode);
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1600(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_ThreadMode threadMode;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetModularObjectExtensionInfoThreadMode(nullptr, &threadMode);
    OH_LOG_INFO(LOG_APP, "ModularObject_1600: GetModularObjectExtensionInfoThreadMode ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1700(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoThreadMode(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_1700: GetModularObjectExtensionInfoThreadMode ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1800(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    AbilityBase_Element element;
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoElementName(extensionInfo, &element);
    OH_LOG_INFO(LOG_APP, "ModularObject_1800: GetModularObjectExtensionInfoElementName ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        OH_LOG_INFO(LOG_APP, "bundleName=%{public}s", element.bundleName);
        OH_LOG_INFO(LOG_APP, "moduleName=%{public}s", element.moduleName);
        OH_LOG_INFO(LOG_APP, "abilityName=%{public}s", element.abilityName);
        result = "success: bundleName=" + std::string(element.bundleName) +
                 ", moduleName=" + std::string(element.moduleName) +
                 ", abilityName=" + std::string(element.abilityName);
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_1900(napi_env env, napi_callback_info info)
{
    AbilityBase_Element element;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetModularObjectExtensionInfoElementName(nullptr, &element);
    OH_LOG_INFO(LOG_APP, "ModularObject_1900: GetModularObjectExtensionInfoElementName ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2000(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoElementName(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_2000: GetModularObjectExtensionInfoElementName ret=%{public}d", ret);

    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2100(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    bool isDisabled = false;
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoDisableState(extensionInfo, &isDisabled);
    OH_LOG_INFO(LOG_APP, "ModularObject_2100: GetModularObjectExtensionInfoDisableState ret=%{public}d, \
        isDisabled=%{public}d", ret, isDisabled);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = "success: isDisabled=" + std::to_string(isDisabled);
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2200(napi_env env, napi_callback_info info)
{
    bool isDisabled = false;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_GetModularObjectExtensionInfoDisableState(nullptr, &isDisabled);
    OH_LOG_INFO(LOG_APP, "ModularObject_2200: GetModularObjectExtensionInfoDisableState ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2300(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, 0, &extensionInfo);
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    ret = OH_AbilityRuntime_GetModularObjectExtensionInfoDisableState(extensionInfo, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_2300: GetModularObjectExtensionInfoDisableState ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2400(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    ret = OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    OH_LOG_INFO(LOG_APP, "ModularObject_2400: ReleaseAllExtensionInfos ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        size_t count = 0;
        ret = OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos(allExtensionInfos, &count);
        OH_LOG_INFO(LOG_APP, "ModularObject_2400: GetCountFromAllModObjExtensionInfos ret=%{public}d", ret);
        if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
            result = "success";
        } else {
            result = std::to_string(ret);
        }
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2500(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_AllModObjExtensionInfosHandle allExtensionInfos = NULL;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_AcquireSelfModularObjectExtensionInfos(&allExtensionInfos);
    std::string result;
    if (ret != ABILITY_RUNTIME_ERROR_CODE_NO_ERROR) {
        result = std::to_string(ret);
        napi_value napiRet;
        napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
        return napiRet;
    }
    size_t count = 0;
    OH_AbilityRuntime_GetCountFromAllModObjExtensionInfos(allExtensionInfos, &count);
    OH_AbilityRuntime_ModObjExtensionInfoHandle extensionInfo = NULL;
    size_t index = -1;
    ret = OH_AbilityRuntime_GetModObjExtensionInfoByIndex(allExtensionInfos, index, &extensionInfo);
    OH_LOG_INFO(LOG_APP, "ModularObject_0700: GetModObjExtensionInfoByIndex ret=%{public}d", ret);
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    OH_AbilityRuntime_ReleaseAllExtensionInfos(&allExtensionInfos);
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2600(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnCreateFunc(
        nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_2600: RegisterOnCreateFunc ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2700(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDestroyFunc(
        nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_2700: RegisterOnDestroyFunc ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2800(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnConnectFunc(
        nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_2800: RegisterOnConnectFunc ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_2900(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionAbility_RegisterOnDisconnectFunc(
        nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_2900: RegisterOnDisconnectFunc ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_3000(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_ModObjExtensionContextHandle context = nullptr;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionAbility_GetContextFromInstance(
        nullptr, &context);
    OH_LOG_INFO(LOG_APP, "ModularObject_3000: GetContextFromInstance ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_3100(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_ModObjExtensionInstanceHandle modObjInstance = nullptr;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionAbility_GetInstanceFromBase(
        nullptr, &modObjInstance);
    OH_LOG_INFO(LOG_APP, "ModularObject_3100: GetInstanceFromBase ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_3200(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ContextHandle baseContext = nullptr;
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionContext_GetBaseContext(
        nullptr, &baseContext);
    OH_LOG_INFO(LOG_APP, "ModularObject_3200: GetBaseContext ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_3300(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbility(
        nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_3300: StartSelfUIAbility ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_3400(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbilityWithStartOptions(
        nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_3400: StartSelfUIAbilityWithStartOptions ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_3500(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ErrorCode ret = OH_AbilityRuntime_ModObjExtensionContext_TerminateSelf(nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_3500: TerminateSelf ret=%{public}d", ret);
    std::string result;
    if (ret == ABILITY_RUNTIME_ERROR_CODE_PARAM_INVALID) {
        result = "success";
    } else {
        result = std::to_string(ret);
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_3600(napi_env env, napi_callback_info info)
{
    OHIPCRemoteStub* stub = OH_AbilityRuntime_ModObjExtensionContext_CreateIPCRemoteStub(
        nullptr, nullptr, nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_3600: CreateIPCRemoteStub stub=%{public}p", stub);
    std::string result;
    if (stub == nullptr) {
        result = "success";
    } else {
        result = "stub is not null";
    }
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_3700(napi_env env, napi_callback_info info)
{
    OH_AbilityRuntime_ModObjExtensionContext_DestroyIPCRemoteStub(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "ModularObject_3700: DestroyIPCRemoteStub called with nullptr");
    std::string result = "success";
    napi_value napiRet;
    napi_create_string_utf8(env, result.c_str(), result.size(), &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_0100(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_VISIBILITY_VERIFICATION_FAILED;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_VISIBILITY_VERIFICATION_FAILED=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_0200(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_STATIC_CFG_PERMISSION;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_STATIC_CFG_PERMISSION=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_0300(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_CROSS_USER_OPERATION;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_CROSS_USER_OPERATION=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_0400(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_NO_RUNNING_ABILITIES_WITH_UI;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_NO_RUNNING_ABILITIES_WITH_UI=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_0500(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_UPPER_RATE_LIMIT;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_UPPER_RATE_LIMIT=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_0600(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_UPPER_CONNECTION_NUMBER_LIMIT;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_UPPER_CONNECTION_NUMBER_LIMIT=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_0700(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_PROPERTY_NOT_FOUND;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_PROPERTY_NOT_FOUND=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_0800(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_TYPE_MISMATCH;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_TYPE_MISMATCH=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_0900(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_SEND_REQUEST_FAILED;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_SEND_REQUEST_FAILED=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}

napi_value ModularObject_ErrCode_1000(napi_env env, napi_callback_info info)
{
    int32_t errCode = ABILITY_RUNTIME_ERROR_CODE_CROSS_APP_IN_PROCESS;
    OH_LOG_INFO(LOG_APP, "ABILITY_RUNTIME_ERROR_CODE_CROSS_APP_IN_PROCESS=%{public}d", errCode);
    napi_value napiRet;
    napi_create_int32(env, errCode, &napiRet);
    return napiRet;
}
