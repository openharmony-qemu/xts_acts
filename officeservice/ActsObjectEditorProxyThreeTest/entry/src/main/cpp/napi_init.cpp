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

#define LOG_TAG "ContentEmbed_TEST"

#include <cstdio>
#include <cstring>
#include <cstdint>

#include <napi/native_api.h>
#include <ContentEmbedKit/content_embed/content_embed_common.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_proxy.h>
#include "hilog/log.h"
#include "ObjectEditor.h"

static napi_value TestProxyGetContentEmbedInfo_LocaleInvalid(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* invalidLocales[] = {
        "", "z", "zhh", "12", "zh-", "-CN", "zh-C", "zh-CHINA",
        "zh-12", "zh-1234", "zh_", "zh_CN", "ZH-CN", "Zh-Cn",
        "zh#CN", "zh@CN", "zh CN", "zh Hans CN", "zh-HansCN"};
    for (size_t i = 0; i < sizeof(invalidLocales) / sizeof(invalidLocales[0]); i++) {
        ContentEmbed_Info *infoObj = nullptr;
        ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid:%{public}zu create code: %{public}d",
            i, code);
        if (code != CE_ERR_OK) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_GetContentEmbedInfo(invalidLocales[i], infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid:%{public}zu get code: %{public}d",
            i, code);
        if (code != CE_ERR_OK && code != CE_ERR_PARAM_INVALID) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_DestroyContentEmbedInfo(infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid:%{public}zu destroy code: %{public}d",
            i, code);
    }
    napi_create_int32(env, CE_ERR_OK, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_LocaleInvalid2(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* invalidLocales[] = {
        "zh-Hans-CN-US", "zh-Hans-CN-", "zh-Han", "zh-Hanss-CN", "zh-12345-CN",
        "zh-CN-", "abc", "xyz-CN", "zh-XX", "zh-Hans-XX", "en-US-GB",
        "zh-Hans-CN-Variant", "zh~Hans~CN", "zh|Hans|CN", "\x00", "\x7f",
        "zh Hans CN", "zh--CN", "-zh-CN", "zh-CN-"};
    for (size_t i = 0; i < sizeof(invalidLocales) / sizeof(invalidLocales[0]); i++) {
        ContentEmbed_Info *infoObj = nullptr;
        ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid2:%{public}zu create code: %{public}d",
            i, code);
        if (code != CE_ERR_OK) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_GetContentEmbedInfo(invalidLocales[i], infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid2:%{public}zu get code: %{public}d",
            i, code);
        if (code != CE_ERR_OK && code != CE_ERR_PARAM_INVALID) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_DestroyContentEmbedInfo(infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid2:%{public}zu destroy code: %{public}d",
            i, code);
    }
    napi_create_int32(env, CE_ERR_OK, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_LocaleInvalid3(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* invalidLocales[] = {
        "zh-001", "zh-AA", "zh-ZZ", "qaa-Qaaa-QM", "i-default", "x-private",
        "en-Latn-US-u-ca-gregory", "zh-Hans-CN-u-", "zh-Hans-CN-x-", "zh-x-private",
        "x-", "zh-Hans-CN-x", "zh-Hans-CN-x-", "zh-Hans-CN-x-priv", "zh-CN-Hans",
        "CN-zh", "zh-Hans-CN-Hans", "zh-Hans-CN-CN", "zh-Hans-CN-123", "en-US-x-lvariant"};
    for (size_t i = 0; i < sizeof(invalidLocales) / sizeof(invalidLocales[0]); i++) {
        ContentEmbed_Info *infoObj = nullptr;
        ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid3:%{public}zu create code: %{public}d",
            i, code);
        if (code != CE_ERR_OK) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_GetContentEmbedInfo(invalidLocales[i], infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid3:%{public}zu get code: %{public}d",
            i, code);
        if (code != CE_ERR_OK && code != CE_ERR_PARAM_INVALID) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_DestroyContentEmbedInfo(infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid3:%{public}zu destroy code: %{public}d",
            i, code);
    }
    napi_create_int32(env, CE_ERR_OK, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_LocaleInvalid4(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* invalidLocales[] = {
        "zh-Hans-CN-u-nu-latn-cu-cny", "\u4e2d\u56fd", "zh-\u4e2d\u56fd", "zh-CN-\u4e2d\u56fd",
        "zh-Hans-\u4e2d\u56fd", "zh-Hans-CN-\u4e2d\u56fd", "zh\u4e2d\u56fd", "123-CN",
        "zh-123456", "zh-CN-123456", "zh-Hans-CN-1234567890",
        "zh-Hans-CN-abcdefghijklmnopqrstuvwxyz", "zh-Hans-CN-ABCDEFGHIJKLMNOPQRSTUVWXYZ"};
    for (size_t i = 0; i < sizeof(invalidLocales) / sizeof(invalidLocales[0]); i++) {
        ContentEmbed_Info *infoObj = nullptr;
        ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid4:%{public}zu create code: %{public}d",
            i, code);
        if (code != CE_ERR_OK) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_GetContentEmbedInfo(invalidLocales[i], infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid4:%{public}zu get code: %{public}d",
            i, code);
        if (code != CE_ERR_OK && code != CE_ERR_PARAM_INVALID) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_DestroyContentEmbedInfo(infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid4:%{public}zu destroy code: %{public}d",
            i, code);
    }
    napi_create_int32(env, CE_ERR_OK, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_LocaleInvalid5(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* invalidLocales[] = {
        "zh-Hans-CN-abc-123-xyz", "zh-Hans-CN-abc-123-xyz-456",
        "zh-Hans-CN-abc-123-xyz-456-789", "zh-Hans-CN-abc-123-xyz-456-789-0ab",
        "zh-Hans-CN-u-ca-gregory-u-nu-latn", "zh-Hans-CN-u-ca-gregory-x-private",
        "zh-Hans-CN-x-private-u-ca-gregory", "zh-Hans-CN-u-ca-gregory-x-private-u-nu-latn",
        "zh-Hans-CN-001", "zh-Hans-001", "en-001", "zh-150", "zh-030", "zh-Hans-035",
        "qaa-Qaaa-QM-x-private", "en-US-x-u-ca-gregory", "en-US-x-u-ca-gregory-x-another"};
    for (size_t i = 0; i < sizeof(invalidLocales) / sizeof(invalidLocales[0]); i++) {
        ContentEmbed_Info *infoObj = nullptr;
        ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid5:%{public}zu create code: %{public}d",
            i, code);
        if (code != CE_ERR_OK) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_GetContentEmbedInfo(invalidLocales[i], infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid5:%{public}zu get code: %{public}d",
            i, code);
        if (code != CE_ERR_OK && code != CE_ERR_PARAM_INVALID) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_DestroyContentEmbedInfo(infoObj);
        OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_LocaleInvalid5:%{public}zu destroy code: %{public}d",
            i, code);
    }
    napi_create_int32(env, CE_ERR_OK, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_LocaleInvalid(napi_env env, napi_callback_info info)
{
    napi_value result;
    const char* invalidLocales[] = {
        "zh-Hans-CN-abc-123-xyz", "zh-Hans-CN-abc-123-xyz-456",
        "zh-Hans-CN-abc-123-xyz-456-789", "zh-Hans-CN-abc-123-xyz-456-789-0ab",
        "zh-Hans-CN-u-ca-gregory-u-nu-latn", "zh-Hans-CN-u-ca-gregory-x-private",
        "zh-Hans-CN-x-private-u-ca-gregory", "zh-Hans-CN-u-ca-gregory-x-private-u-nu-latn",
        "zh-Hans-CN-001", "zh-Hans-001", "en-001", "zh-150", "zh-030", "zh-Hans-035",
        "qaa-Qaaa-QM-x-private", "en-US-x-u-ca-gregory", "en-US-x-u-ca-gregory-x-another"};
    char oeid[] = "000209FF-BBBB-DDDD-CAAA-000000000046";
    for (size_t i = 0; i < sizeof(invalidLocales) / sizeof(invalidLocales[0]); i++) {
        ContentEmbed_Format *format = nullptr;
        ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
        OH_LOG_INFO(LOG_APP,
            "TestProxyGetContentEmbedFormatByOEidAndLocale_LocaleInvalid:%{public}zu create code: %{public}d",
            i, code);
        if (code != CE_ERR_OK) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(oeid, invalidLocales[i], format);
        OH_LOG_INFO(LOG_APP,
            "TestProxyGetContentEmbedFormatByOEidAndLocale_LocaleInvalid:%{public}zu get code: %{public}d",
            i, code);
        if (code != CE_ERR_OK && code != CE_ERR_PARAM_INVALID) {
            napi_create_int32(env, -1, &result);
            return result;
        }
        code = OH_ContentEmbed_DestroyContentEmbedFormat(format);
        OH_LOG_INFO(LOG_APP,
            "TestProxyGetContentEmbedFormatByOEidAndLocale_LocaleInvalid:%{public}zu destroy code: %{public}d",
            i, code);
    }
    napi_create_int32(env, CE_ERR_OK, &result);
    return result;
}

static napi_value TestProxyDestroyContentEmbedInfo_NullInfo(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyContentEmbedInfo(nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedInfo_NullInfo failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDestroyContentEmbedInfo_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Info *embedInfo = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedInfo(&embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedInfo_Normal create code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_DestroyContentEmbedInfo(embedInfo);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedInfo_Normal destroy code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedInfo_ParamInvalid(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetContentEmbedInfo(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetContentEmbedInfo_ParamInvalid failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatCountFromInfo_ParamInvalid(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetFormatCountFromInfo(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatCountFromInfo_ParamInvalid failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetFormatFromInfo_ParamInvalid(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetFormatFromInfo(nullptr, 0, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetFormatFromInfo_ParamInvalid failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDestroyContentEmbedFormat_ParamInvalid(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyContentEmbedFormat(nullptr);
    OH_LOG_INFO(LOG_APP, "OH_ContentEmbed_DestroyContentEmbedFormat failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyDestroyContentEmbedFormat_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateContentEmbedFormat(&format);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedFormat_Normal create code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_DestroyContentEmbedFormat(format);
    OH_LOG_INFO(LOG_APP, "TestProxyDestroyContentEmbedFormat_Normal destroy code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetContentEmbedFormatByOEidAndLocale_ParamInvalid(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale(nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestProxyGetContentEmbedFormatByOEidAndLocale_ParamInvalid failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetOEidFromFormat_ParamInvalid(napi_env env, napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetOEidFromFormat(nullptr, nullptr);
    OH_LOG_INFO(LOG_APP, "TestProxyGetOEidFromFormat_ParamInvalid failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetNameAndDescriptionFromFormat_ParamInvalid(napi_env env,
    napi_callback_info info)
{
    ContentEmbed_ErrorCode code = OH_ContentEmbed_GetNameAndDescriptionFromFormat(nullptr, nullptr, nullptr);
    OH_LOG_INFO(LOG_APP,
        "TestProxyGetNameAndDescriptionFromFormat_ParamInvalid failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_LocaleInvalid", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_LocaleInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_LocaleInvalid", nullptr,
            TestProxyGetContentEmbedInfo_LocaleInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_LocaleInvalid2", nullptr,
            TestProxyGetContentEmbedInfo_LocaleInvalid2,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_LocaleInvalid3", nullptr,
            TestProxyGetContentEmbedInfo_LocaleInvalid3,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_LocaleInvalid4", nullptr,
            TestProxyGetContentEmbedInfo_LocaleInvalid4,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_LocaleInvalid5", nullptr,
            TestProxyGetContentEmbedInfo_LocaleInvalid5,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyContentEmbedInfo_NullInfo", nullptr,
            TestProxyDestroyContentEmbedInfo_NullInfo,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyContentEmbedInfo_Normal", nullptr,
            TestProxyDestroyContentEmbedInfo_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedInfo_ParamInvalid", nullptr,
            TestProxyGetContentEmbedInfo_ParamInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatCountFromInfo_ParamInvalid", nullptr,
            TestProxyGetFormatCountFromInfo_ParamInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetFormatFromInfo_ParamInvalid", nullptr,
            TestProxyGetFormatFromInfo_ParamInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyContentEmbedFormat_ParamInvalid", nullptr,
            TestProxyDestroyContentEmbedFormat_ParamInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDestroyContentEmbedFormat_Normal", nullptr,
            TestProxyDestroyContentEmbedFormat_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetContentEmbedFormatByOEidAndLocale_ParamInvalid", nullptr,
            TestProxyGetContentEmbedFormatByOEidAndLocale_ParamInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetOEidFromFormat_ParamInvalid", nullptr,
            TestProxyGetOEidFromFormat_ParamInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetNameAndDescriptionFromFormat_ParamInvalid", nullptr,
            TestProxyGetNameAndDescriptionFromFormat_ParamInvalid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"initObjectServiceConnect", nullptr,
            initObjectServiceConnect,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetContent_Normal", nullptr,
            TestExtensionGetContent_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetEmbedContent_Normal", nullptr,
            TestExtensionGetEmbedContent_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetExtensionInstance_Normal", nullptr,
            TestExtensionGetExtensionInstance_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnCreateFunc_Normal", nullptr,
            TestExtensionRegisterOnCreateFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnDestroyFunc_Normal", nullptr,
            TestExtensionRegisterOnDestroyFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnObjectAttachFunc_Normal", nullptr,
            TestExtensionRegisterOnObjectAttachFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionUnRegisterOnObjectAttachFunc_Normal", nullptr,
            TestExtensionUnRegisterOnObjectAttachFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnObjectDetachFunc_Normal", nullptr,
            TestExtensionRegisterOnObjectDetachFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionUnRegisterOnObjectDetachFunc_Normal", nullptr,
            TestExtensionUnRegisterOnObjectDetachFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnWriteToDataStreamFunc_Normal", nullptr,
            TestExtensionRegisterOnWriteToDataStreamFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnGetSnapshotFunc_Normal", nullptr,
            TestExtensionRegisterOnGetSnapshotFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnDoEditFunc_Normal", nullptr,
            TestExtensionRegisterOnDoEditFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnGetEditStatusFunc_Normal", nullptr,
            TestExtensionRegisterOnGetEditStatusFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionRegisterOnGetCapabilityFunc_Normal", nullptr,
            TestExtensionRegisterOnGetCapabilityFunc_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetContentEmbedDocument_Normal", nullptr,
            TestExtensionGetContentEmbedDocument_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnUpdate_Normal", nullptr,
            TestExtensionCallbackToOnUpdate_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnError_Normal", nullptr,
            TestExtensionCallbackToOnError_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnEditingFinished_Normal", nullptr,
            TestExtensionCallbackToOnEditingFinished_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnExtensionStopped_Normal", nullptr,
            TestExtensionCallbackToOnExtensionStopped_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionSetSnapshot_Normal", nullptr,
            TestExtensionSetSnapshot_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionContextStartSelfUIAbility_Normal", nullptr,
            TestExtensionContextStartSelfUIAbility_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal", nullptr,
            TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionContextTerminateAbility_Normal", nullptr,
            TestExtensionContextTerminateAbility_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyStopWork_Normal", nullptr,
            TestProxyStopWork_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDoEdit_Normal", nullptr,
            TestProxyDoEdit_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetEditStatus_Normal", nullptr,
            TestProxyGetEditStatus_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetCapability_Normal", nullptr,
            TestProxyGetCapability_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetSnapshot_Normal", nullptr,
            TestProxyGetSnapshot_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyStartWork_Normal", nullptr,
            TestProxyStartWork_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDoEdit_NotSupported", nullptr,
            TestProxyDoEdit_NotSupported,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyDoEdit_ExtensionError", nullptr,
            TestProxyDoEdit_ExtensionError,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetEditStatus_ExtensionError", nullptr,
            TestProxyGetEditStatus_ExtensionError,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetCapability_ExtensionError", nullptr,
            TestProxyGetCapability_ExtensionError,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetSnapshot_NotSupported", nullptr,
            TestProxyGetSnapshot_NotSupported,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyGetSnapshot_ExtensionError", nullptr,
            TestProxyGetSnapshot_ExtensionError,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestProxyMultiExtension_Normal", nullptr,
            TestProxyMultiExtension_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamRead_StreamFailed", nullptr,
            TestStreamRead_StreamFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamWrite_StreamFailed", nullptr,
            TestStreamWrite_StreamFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetPosition_StreamFailed", nullptr,
            TestStreamGetPosition_StreamFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestStreamGetSize_StreamFailed", nullptr,
            TestStreamGetSize_StreamFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module napiModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void)
{
    napi_module_register(&napiModule);
}
