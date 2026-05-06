/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "ContentEmbed_TEST"

#include <string>
#include <cstdint>
#include <hilog/log.h>
#include <rawfile/raw_file_manager.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>

using namespace std;

namespace {
const size_t BUF_SIZE = 4096;

static napi_value TestDocumentGetNativeFilePath_OEIDIsEmpty(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    char nativeFilePath[BUF_SIZE] = {0};
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetNativeFilePath_OEIDIsEmpty create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    document = nullptr;
    code = OH_ContentEmbed_Document_GetNativeFilePath(document, document);
    OH_LOG_INFO(LOG_APP, "TestDocumentGetNativeFilePath_OEIDIsEmpty failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestStorageSetOEid_OEIDIsEmpty(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_OEIDIsEmpty create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_OEIDIsEmpty get root storage code: %{public}d", code);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_SetOEid(storage, "", BUF_SIZE);
    OH_LOG_INFO(LOG_APP, "TestStorageSetOEid_OEIDIsEmpty failed code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestProxyGetOEidFromFormat_OEIDIsEmpty(napi_env env, napi_callback_info info)
{
    ContentEmbed_Format *format = nullptr;
    code = OH_ContentEmbed_GetOEidFromFormat(format, "");
    OH_LOG_INFO(LOG_APP, "TestProxyGetOEidFromFormat_NullOEid code: %{public}d", code);
    if (code == CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value  TestCreateDocumentByOEid_OEIDIsValid(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_OEIDIsValid code1: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_OEIDIsValid code2: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_CreateDocumentByOEid("", &document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_OEIDIsValid code3: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_CreateDocumentByOEid(
        "000209FF-0000-0000-C000000209FF-0000-0000-C000000209FF-0000-0000-C000",&document);
    OH_LOG_INFO(LOG_APP, "TestCreateDocumentByOEid_OEIDIsValid code3: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageCreateStorage_NameIsValid(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid create document code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code1: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "/", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code2: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "\\", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code3: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, ":", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code4: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "!", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameIsValid code5: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageCreateStorage_NameExceedMaxLen(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameExceedMaxLen create document code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameExceedMaxLen get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char name[] = {"OH_ContentEmbed_Document_GetRootStorageOH_ContentEmbed_Document_GetRootStorage111111111111"};
    code = OH_ContentEmbed_Storage_CreateStorage(storage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageCreateStorage_NameExceedMaxLen code1: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageGetStorage_NameIsValid(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid create document code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_ValidParam get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, "", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code1: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, "/", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code2: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, "\\", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code3: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, ":", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code4: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetStorage(storage, "!", &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameIsValid code5: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageGetStorage_NameExceedMaxLen(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameExceedMaxLen create document code: %{public}d", code);
    napi_value result;
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameExceedMaxLen get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    char name[] = {"TestStorageGetStorage_NameExceedMaxLenTestStorageGetStorage_NameExceedMaxLen11111234"};
    code = OH_ContentEmbed_Storage_GetStorage(storage, name, &storage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStorage_NameExceedMaxLen code1: %{public}d", code);
    if (code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
    return result;
}

static napi_value TestStorageGetStream_StreamFailed(napi_env env, napi_callback_info info)
{
    char oeid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByOEid(oeid, &document);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StreamFailed create document code: %{public}d", code);
    if (code == CE_ERR_DEVICE_NOT_SUPPORTED) {
        napi_create_int32(env, code, &result);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Storage *rootStorage = nullptr;
    code = OH_ContentEmbed_Document_GetRootStorage(document, &rootStorage);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StreamFailed get root storage code: %{public}d", code);
    if (code != CE_ERR_OK) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    ContentEmbed_Stream *stream = nullptr;
    char streamName[] = "nonexistentStream";
    code = OH_ContentEmbed_Storage_GetStream(rootStorage, streamName, &stream);
    OH_LOG_INFO(LOG_APP, "TestStorageGetStream_StreamFailed get stream code: %{public}d", code);
    // 期望返回 CE_ERR_STREAM_OPERATION_FAILED (35300006)
    if (code == CE_ERR_STREAM_OPERATION_FAILED) {
        napi_create_int32(env, code, &result);
        OH_ContentEmbed_DestroyDocument(document);
        return result;
    }
    napi_create_int32(env, -1, &result);
    OH_ContentEmbed_DestroyDocument(document);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TestDocumentGetNativeFilePath_OEIDIsEmpty", nullptr,
            TestDocumentGetNativeFilePath_OEIDIsEmpty,
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
