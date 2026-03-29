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
#include <ContentEmbedKit/content_embed/content_embed_proxy.h>
#include "hilog/log.h"

namespace {
static napi_value TestOHContentEmbedCreateContentEmbedInfo(napi_env env, napi_callback_info info)
{
    int32_t testId = 1;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(nullptr);
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

static napi_value TestOHContentEmbedDestroyContentEmbedInfo(napi_env env, napi_callback_info info)
{
    int32_t testId = 2;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyContentEmbedInfo(nullptr);
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

static napi_value TestOHContentEmbedGetContentEmbedInfo(napi_env env, napi_callback_info info)
{
    int32_t testId = 3;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetContentEmbedInfo(nullptr, nullptr);
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

static napi_value TestOHContentEmbedGetFormatCountFromInfo(napi_env env, napi_callback_info info)
{
    int32_t testId = 4;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetFormatCountFromInfo(nullptr, nullptr);
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

static napi_value TestOHContentEmbedGetFormatFromInfo(napi_env env, napi_callback_info info)
{
    int32_t testId = 5;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetFormatFromInfo(nullptr, 0, nullptr);
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

static napi_value TestOHContentEmbedCreateContentEmbedFormat(napi_env env, napi_callback_info info)
{
    int32_t testId = 6;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(nullptr);
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

static napi_value TestOHContentEmbedDestroyContentEmbedFormat(napi_env env, napi_callback_info info)
{
    int32_t testId = 7;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyContentEmbedFormat(nullptr);
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

static napi_value TestOHContentEmbedGetContentEmbedFormatByHmidAndLocale(napi_env env, napi_callback_info info)
{
    int32_t testId = 8;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetContentEmbedFormatByHmidAndLocale(nullptr, nullptr, nullptr);
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

static napi_value TestOHContentEmbedGetHmidFromFormat(napi_env env, napi_callback_info info)
{
    int32_t testId = 9;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetHmidFromFormat(nullptr, nullptr);
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

static napi_value TestOHContentEmbedGetNameAndDescriptionFromFormat(napi_env env, napi_callback_info info)
{
    int32_t testId = 10;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetNameAndDescriptionFromFormat(nullptr, nullptr, nullptr);
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

static napi_value TestOHContentEmbedGetIconFromFormat(napi_env env, napi_callback_info info)
{
    int32_t testId = 11;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetIconFromFormat(nullptr, nullptr);
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

static napi_value TestOHContentEmbedGetFileNameExtensionsFromFormat(napi_env env, napi_callback_info info)
{
    int32_t testId = 12;
    unsigned int count = 0;
    char **result = OH_ContentEmbed_GetFileNameExtensionsFromFormat(nullptr, &count);
    if (result != nullptr) {
        napi_value napiResult;
        napi_create_int32(env, testId, &napiResult);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed", testId);
        return napiResult;
    }
    napi_value napiResult;
    napi_create_int32(env, 0, &napiResult);
    return napiResult;
}

static napi_value TestOHContentEmbedCreateExtensionProxy(napi_env env, napi_callback_info info)
{
    int32_t testId = 13;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateExtensionProxy(nullptr, nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDestroyExtensionProxy(napi_env env, napi_callback_info info)
{
    int32_t testId = 14;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyExtensionProxy(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyRegisterOnUpdateFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 15;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnUpdateFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyRegisterOnErrorFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 16;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnErrorFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyRegisterOnEditingFinishedFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 17;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnEditingFinishedFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyRegisterOnExtensionStoppedFunc(napi_env env, napi_callback_info info)
{
    int32_t testId = 18;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_RegisterOnExtensionStoppedFunc(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyStartWork(napi_env env, napi_callback_info info)
{
    int32_t testId = 19;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_StartWork(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyStopWork(napi_env env, napi_callback_info info)
{
    int32_t testId = 20;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_StopWork(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyGetSnapshot(napi_env env, napi_callback_info info)
{
    int32_t testId = 21;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetSnapshot(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyDoEdit(napi_env env, napi_callback_info info)
{
    int32_t testId = 22;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_DoEdit(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyGetEditStatus(napi_env env, napi_callback_info info)
{
    int32_t testId = 23;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetEditStatus(nullptr, nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyGetCapability(napi_env env, napi_callback_info info)
{
    int32_t testId = 24;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetCapability(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedProxyGetDocument(napi_env env, napi_callback_info info)
{
    int32_t testId = 25;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Proxy_GetDocument(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_IN_DLP_SANDBOX && code != CE_ERR_PARAM_INVALID) {
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
        {"TestOHContentEmbedCreateContentEmbedInfo", nullptr, TestOHContentEmbedCreateContentEmbedInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDestroyContentEmbedInfo", nullptr, TestOHContentEmbedDestroyContentEmbedInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedGetContentEmbedInfo", nullptr, TestOHContentEmbedGetContentEmbedInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedGetFormatCountFromInfo", nullptr, TestOHContentEmbedGetFormatCountFromInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedGetFormatFromInfo", nullptr, TestOHContentEmbedGetFormatFromInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedCreateContentEmbedFormat", nullptr, TestOHContentEmbedCreateContentEmbedFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDestroyContentEmbedFormat", nullptr, TestOHContentEmbedDestroyContentEmbedFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedGetContentEmbedFormatByHmidAndLocale", nullptr,
            TestOHContentEmbedGetContentEmbedFormatByHmidAndLocale,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedGetHmidFromFormat", nullptr, TestOHContentEmbedGetHmidFromFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedGetNameAndDescriptionFromFormat", nullptr,
            TestOHContentEmbedGetNameAndDescriptionFromFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedGetIconFromFormat", nullptr, TestOHContentEmbedGetIconFromFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedGetFileNameExtensionsFromFormat", nullptr,
            TestOHContentEmbedGetFileNameExtensionsFromFormat,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedCreateExtensionProxy", nullptr, TestOHContentEmbedCreateExtensionProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDestroyExtensionProxy", nullptr, TestOHContentEmbedDestroyExtensionProxy,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyRegisterOnUpdateFunc", nullptr, TestOHContentEmbedProxyRegisterOnUpdateFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyRegisterOnErrorFunc", nullptr, TestOHContentEmbedProxyRegisterOnErrorFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyRegisterOnEditingFinishedFunc", nullptr,
            TestOHContentEmbedProxyRegisterOnEditingFinishedFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyRegisterOnExtensionStoppedFunc", nullptr,
            TestOHContentEmbedProxyRegisterOnExtensionStoppedFunc,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyStartWork", nullptr, TestOHContentEmbedProxyStartWork,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyStopWork", nullptr, TestOHContentEmbedProxyStopWork,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyGetSnapshot", nullptr, TestOHContentEmbedProxyGetSnapshot,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyDoEdit", nullptr, TestOHContentEmbedProxyDoEdit,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyGetEditStatus", nullptr, TestOHContentEmbedProxyGetEditStatus,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyGetCapability", nullptr, TestOHContentEmbedProxyGetCapability,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedProxyGetDocument", nullptr, TestOHContentEmbedProxyGetDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
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
