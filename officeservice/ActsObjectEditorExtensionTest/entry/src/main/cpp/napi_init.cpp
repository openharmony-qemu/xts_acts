/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include <cstdio>
#include <cstring>

#include <napi/native_api.h>
#include <ContentEmbedKit/content_embed/content_embed_common.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_extension.h>
#include "hilog/log.h"

namespace {
constexpr int32_t BUF_SIZE = 1024;
constexpr int32_t errorCodes_SIZE = 8;

static napi_value TestOHContentEmbedExtensionRegisterOnCreateFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 1;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnCreateFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED  && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionRegisterOnDestroyFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 2;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnDestroyFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionRegisterOnObjectAttachFunc(napi_env env,
    napi_callback_info info)
{
    int32_t testId = 3;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionUnRegisterOnObjectAttachFunc(napi_env env,
    napi_callback_info info)
{
    int32_t testId = 4;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_UnRegisterOnObjectAttachFunc(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionRegisterOnObjectDetachFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 5;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionUnRegisterOnObjectDetachFunc(napi_env env,
    napi_callback_info info)
{
    int32_t testId = 6;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_UnRegisterOnObjectDetachFunc(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionRegisterOnWriteToDataStreamFunc(napi_env env,
    napi_callback_info info)
{
    int32_t testId = 7;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionRegisterOnGetSnapshotFunc(napi_env env,
    napi_callback_info info)
{
    int32_t testId = 8;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionRegisterOnDoEditFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 9;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnDoEditFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionRegisterOnGetEditStatusFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 10;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionRegisterOnGetCapabilityFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 11;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionGetContentEmbedContext(napi_env env, napi_callback_info info)
{
    int32_t testId = 12;
    ContentEmbed_ExtensionContextHandle ceContext = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedContext(nullptr, &ceContext);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionGetContext(napi_env env, napi_callback_info info)
{
    int32_t testId = 13;
    AbilityRuntime_ContextHandle context = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContext(nullptr, &context);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionGetExtensionInstance(napi_env env, napi_callback_info info)
{
    int32_t testId = 14;
    ContentEmbed_ExtensionInstanceHandle ceInstance = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetExtensionInstance(nullptr, &ceInstance);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionGetContentEmbedDocument(napi_env env, napi_callback_info info)
{
    int32_t testId = 15;
    ContentEmbed_Document *ceDocument = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContentEmbedDocument(nullptr, &ceDocument);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionCallbackToOnUpdate(napi_env env, napi_callback_info info)
{
    int32_t testId = 16;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnUpdate(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionCallbackToOnError(napi_env env, napi_callback_info info)
{
    int32_t testId = 17;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnError(nullptr, CE_ERR_OK);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionCallbackToOnEditingFinished(napi_env env, napi_callback_info info)
{
    int32_t testId = 18;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnEditingFinished(nullptr, false);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionCallbackToOnExtensionStopped(napi_env env, napi_callback_info info)
{
    int32_t testId = 19;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnExtensionStopped(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionSetSnapshot(napi_env env, napi_callback_info info)
{
    int32_t testId = 20;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_SetSnapshot(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedExtensionContextStartSelfUIAbility(napi_env env, napi_callback_info info)
{
    int32_t testId = 21;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_ContextStartSelfUIAbility(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TestOHContentEmbedExtensionRegisterOnCreateFunc", nullptr,
            TestOHContentEmbedExtensionRegisterOnCreateFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionRegisterOnDestroyFunc", nullptr,
            TestOHContentEmbedExtensionRegisterOnDestroyFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionRegisterOnObjectAttachFunc", nullptr,
            TestOHContentEmbedExtensionRegisterOnObjectAttachFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionUnRegisterOnObjectAttachFunc", nullptr,
            TestOHContentEmbedExtensionUnRegisterOnObjectAttachFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionRegisterOnObjectDetachFunc", nullptr,
            TestOHContentEmbedExtensionRegisterOnObjectDetachFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionUnRegisterOnObjectDetachFunc", nullptr,
            TestOHContentEmbedExtensionUnRegisterOnObjectDetachFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionRegisterOnWriteToDataStreamFunc", nullptr,
            TestOHContentEmbedExtensionRegisterOnWriteToDataStreamFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionRegisterOnGetSnapshotFunc", nullptr,
            TestOHContentEmbedExtensionRegisterOnGetSnapshotFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionRegisterOnDoEditFunc", nullptr,
            TestOHContentEmbedExtensionRegisterOnDoEditFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionRegisterOnGetEditStatusFunc", nullptr,
            TestOHContentEmbedExtensionRegisterOnGetEditStatusFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionRegisterOnGetCapabilityFunc", nullptr,
            TestOHContentEmbedExtensionRegisterOnGetCapabilityFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionGetContentEmbedContext", nullptr,
            TestOHContentEmbedExtensionGetContentEmbedContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionGetContext", nullptr, TestOHContentEmbedExtensionGetContext,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionGetExtensionInstance", nullptr,
            TestOHContentEmbedExtensionGetExtensionInstance,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionGetContentEmbedDocument", nullptr,
            TestOHContentEmbedExtensionGetContentEmbedDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionCallbackToOnUpdate", nullptr, TestOHContentEmbedExtensionCallbackToOnUpdate,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionCallbackToOnError", nullptr, TestOHContentEmbedExtensionCallbackToOnError,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionCallbackToOnEditingFinished", nullptr,
            TestOHContentEmbedExtensionCallbackToOnEditingFinished,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionCallbackToOnExtensionStopped", nullptr,
            TestOHContentEmbedExtensionCallbackToOnExtensionStopped,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionSetSnapshot", nullptr, TestOHContentEmbedExtensionSetSnapshot,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedExtensionContextStartSelfUIAbility", nullptr,
            TestOHContentEmbedExtensionContextStartSelfUIAbility, nullptr, nullptr, nullptr, napi_default, nullptr},
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
