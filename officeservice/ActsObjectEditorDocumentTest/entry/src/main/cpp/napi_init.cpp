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

#include <string>
#include <cstdint>
#include <hilog/log.h>
#include <rawfile/raw_file_manager.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>

using namespace std;

namespace {
const size_t BUF_SIZE = 4096;

static napi_value TestOHContentEmbedCreateDocumentByHmid(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    int32_t testId = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(nullptr, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedCreateDocumentByFile(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_Document *document = nullptr;
    int32_t testId = 1;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByFile(nullptr,
        strlen(filePath), false, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByFile(filePath, 0, false, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByFile(filePath, 0, false, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByFile(filePath, strlen(filePath), false, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedLoadDocumentFromFile(napi_env env, napi_callback_info info)
{
    char filePath[] = "/data/test/test.docx";
    ContentEmbed_Document *document = nullptr;
    int32_t testId = 1;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_LoadDocumentFromFile(nullptr,
        strlen(filePath), &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_LoadDocumentFromFile(filePath, 0, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_LoadDocumentFromFile(filePath, 0, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_LoadDocumentFromFile(filePath, strlen(filePath), &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_NULL_POINTER) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDocumentRead(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    uint8_t buffer[BUF_SIZE] = {0};
    size_t readSize = 0;
    int32_t testId = 0;
    napi_value result;
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_Read(nullptr, BUF_SIZE, document, 0, &readSize);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Document_Read(buffer, BUF_SIZE, nullptr, 0, &readSize);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Document_Read(buffer, BUF_SIZE, document, 0, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        testId++;
        code = OH_ContentEmbed_Document_Read(buffer, BUF_SIZE, document, 0, &readSize);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_STORAGE_OPERATION_FAILED) {
            napi_create_int32(env, testId, &result);
            OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDocumentGetHmid(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    char hmidOut[BUF_SIZE] = {0};
    int32_t testId = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetHmid(nullptr, hmidOut);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Document_GetHmid(document, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        testId++;
        code = OH_ContentEmbed_Document_GetHmid(document, hmidOut);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
            napi_value result;
            napi_create_int32(env, testId, &result);
            OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
            return result;
        }
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDocumentIsLinking(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    bool isLinking = false;
    int32_t testId = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_IsLinking(nullptr, &isLinking);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Document_IsLinking(document, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        testId++;
        code = OH_ContentEmbed_Document_IsLinking(document, &isLinking);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
            napi_value result;
            napi_create_int32(env, testId, &result);
            OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
            return result;
        }
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDocumentGetNativeFilePath(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    char nativeFilePath[BUF_SIZE] = {0};
    int32_t testId = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetNativeFilePath(nullptr, nativeFilePath);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Document_GetNativeFilePath(document, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        testId++;
        code = OH_ContentEmbed_Document_GetNativeFilePath(document, nativeFilePath);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
            napi_value result;
            napi_create_int32(env, testId, &result);
            OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
            return result;
        }
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDocumentGetRootStorage(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    int32_t testId = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetRootStorage(nullptr, &storage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Document_GetRootStorage(document, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        testId++;
        code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
            napi_value result;
            napi_create_int32(env, testId, &result);
            OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
            return result;
        }
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDocumentFlush(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    int32_t testId = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_Flush(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        testId++;
        code = OH_ContentEmbed_Document_Flush(document);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_FILE_OPERATION_FAILED) {
            napi_value result;
            napi_create_int32(env, testId, &result);
            OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
            return result;
        }
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDocumentCreateStorage(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testStorage";
    int32_t testId = 1;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CreateStorage(nullptr, name, &storage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_CreateStorage(storage, nullptr, &storage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_CreateStorage(storage, name, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
        if (code == CE_ERR_OK && storage != nullptr) {
            testId++;
            code = OH_ContentEmbed_Storage_CreateStorage(storage, name, &storage);
            if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
                napi_create_int32(env, testId, &result);
                OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
                return result;
            }
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestGetStorageParameterValidation(napi_env env, int32_t &testId)
{
    ContentEmbed_Storage *parentStorage = nullptr;
    ContentEmbed_Storage *childStorage = nullptr;
    char name[] = "testStorage";

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetStorage(nullptr, name, &childStorage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_GetStorage(parentStorage, nullptr, &childStorage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_GetStorage(parentStorage, name, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageGetStorage(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *parentStorage = nullptr;
    ContentEmbed_Storage *childStorage = nullptr;
    char name[] = "testStorage";
    int32_t testId = 0;
    napi_value result;
    napi_value paramResult = TestGetStorageParameterValidation(env, testId);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &parentStorage);
    if (code != CE_ERR_OK || parentStorage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(parentStorage, name, &childStorage);
    if (code != CE_ERR_OK || childStorage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    OH_ContentEmbed_DestroyStorage(childStorage);
    testId++;
    code = OH_ContentEmbed_Storage_GetStorage(parentStorage, name, &childStorage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedStorageCreateStream(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    int32_t testId = 1;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CreateStream(nullptr, name, &stream);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_CreateStream(storage, nullptr, &stream);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_CreateStream(storage, name, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
        if (code == CE_ERR_OK && storage != nullptr) {
            testId++;
            code = OH_ContentEmbed_Storage_CreateStream(storage, name, &stream);
            if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
                napi_create_int32(env, testId, &result);
                OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
                return result;
            }
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestGetStreamParameterValidation(napi_env env, int32_t &testId)
{
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetStream(nullptr, name, &stream);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_GetStream(storage, nullptr, &stream);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_GetStream(storage, name, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageGetStream(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    char name[] = "testStream";
    int32_t testId = 0;
    napi_value result;
    napi_value paramResult = TestGetStreamParameterValidation(env, testId);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code == CE_ERR_OK && storage != nullptr) {
        code = OH_ContentEmbed_Storage_CreateStream(storage, name, &stream);
        if (code == CE_ERR_OK && stream != nullptr) {
            OH_ContentEmbed_DestroyStream(stream);
            testId++;
            code = OH_ContentEmbed_Storage_GetStream(storage, name, &stream);
            if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
                napi_create_int32(env, testId, &result);
                OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
                return result;
            }
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedStorageDeleteEntry(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    char name[] = "testEntry";
    int32_t testId = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_DeleteEntry(nullptr, name);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_DeleteEntry(storage, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
        if (code == CE_ERR_OK && storage != nullptr) {
            testId++;
            code = OH_ContentEmbed_Storage_DeleteEntry(storage, name);
            if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_STORAGE_OPERATION_FAILED) {
                napi_value result;
                napi_create_int32(env, testId, &result);
                OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
                return result;
            }
        }
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDeleteStorage(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    int32_t testId = 1;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyStorage(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code == CE_ERR_OK && storage != nullptr) {
        testId++;
        code = OH_ContentEmbed_DestroyStorage(storage);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
            napi_create_int32(env, testId, &result);
            OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
            return result;
        }
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStreamReadParameterValidation(napi_env env, int32_t &testId)
{
    ContentEmbed_Stream *stream = nullptr;
    unsigned char *buffer = nullptr;
    size_t readSize = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Read(nullptr, &buffer, BUF_SIZE, &readSize);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_Read(stream, nullptr, BUF_SIZE, &readSize);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_Read(stream, &buffer, BUF_SIZE, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStreamRead(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    unsigned char *buffer = nullptr;
    size_t readSize = 0;
    int32_t testId = 0;
    napi_value result;

    napi_value paramResult = TestStreamReadParameterValidation(env, testId);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_Read(stream, &buffer, BUF_SIZE, &readSize);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStreamWriteParameterValidation(napi_env env, int32_t &testId)
{
    ContentEmbed_Stream *stream = nullptr;
    uint8_t buffer[BUF_SIZE] = {0};
    size_t writeSize = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Write(nullptr, buffer, BUF_SIZE, &writeSize);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_Write(stream, nullptr, BUF_SIZE, &writeSize);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_Write(stream, buffer, BUF_SIZE, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStreamWrite(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    uint8_t buffer[BUF_SIZE] = {0};
    size_t writeSize = 0;
    int32_t testId = 0;
    napi_value result;

    napi_value paramResult = TestStreamWriteParameterValidation(env, testId);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_Write(stream, buffer, BUF_SIZE, &writeSize);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedStreamSeek(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    size_t position = 0;
    int32_t testId = 1;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_Seek(nullptr, position);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_Seek(stream, position);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStreamGetPositionParameterValidation(napi_env env, int32_t &testId)
{
    ContentEmbed_Stream *stream = nullptr;
    size_t position = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_GetPosition(nullptr, &position);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_GetPosition(stream, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStreamGetPosition(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    size_t position = 0;
    int32_t testId = 0;
    napi_value result;

    napi_value paramResult = TestStreamGetPositionParameterValidation(env, testId);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_GetPosition(stream, &position);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStreamGetSizeParameterValidation(napi_env env, int32_t &testId)
{
    ContentEmbed_Stream *stream = nullptr;
    size_t size = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Stream_GetSize(nullptr, &size);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_GetSize(stream, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStreamGetSize(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    size_t size = 0;
    int32_t testId = 0;
    napi_value result;

    napi_value paramResult = TestStreamGetSizeParameterValidation(env, testId);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Stream_GetSize(stream, &size);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDestroyStream(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Stream *stream = nullptr;
    int32_t testId = 1;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyStream(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_value result;
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_value result;
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStream(storage, "testStream", &stream);
    if (code != CE_ERR_OK || stream == nullptr) {
        napi_value result;
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_DestroyStream(stream);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedDestroyDocument(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    int32_t testId = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_DestroyDocument(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        testId++;
        code = OH_ContentEmbed_DestroyDocument(document);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
            napi_value result;
            napi_create_int32(env, testId, &result);
            OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
            return result;
        }
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedStorageDeleteAllEntry(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    int32_t testId = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_DeleteAllEntry(nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document != nullptr) {
        code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
        if (code == CE_ERR_OK && storage != nullptr) {
            testId++;
            code = OH_ContentEmbed_Storage_DeleteAllEntry(storage);
            if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
                napi_value result;
                napi_create_int32(env, testId, &result);
                OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
                return result;
            }
        }
    }
    napi_value result;
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageGetHmidParameterValidation(napi_env env, int32_t &testId)
{
    ContentEmbed_Storage *storage = nullptr;
    char hmidOut[BUF_SIZE] = {0};

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetHmid(nullptr, hmidOut, BUF_SIZE);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_GetHmid(storage, nullptr, BUF_SIZE);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_GetHmid(storage, hmidOut, 0);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageGetHmid(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    char hmidOut[BUF_SIZE] = {0};
    int32_t testId = 0;
    napi_value result;

    napi_value paramResult = TestStorageGetHmidParameterValidation(env, testId);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_GetHmid(storage, hmidOut, BUF_SIZE);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageSetHmidParameterValidation(napi_env env, int32_t &testId,
    char *hmid)
{
    ContentEmbed_Storage *storage = nullptr;
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_SetHmid(nullptr, hmid, BUF_SIZE);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_SetHmid(storage, nullptr, BUF_SIZE);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_SetHmid(storage, hmid, 0);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageSetHmid(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    int32_t testId = 0;
    napi_value result;

    napi_value paramResult = TestStorageSetHmidParameterValidation(env, testId, hmid);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_SetHmid(storage, hmid, BUF_SIZE);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestOHContentEmbedStorageElements(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    int32_t testId = 1;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_Create(&elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageElementsGetCountParameterValidation(napi_env env, int32_t &testId,
    ContentEmbed_StorageElements *&elements)
{
    size_t count = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetCount(nullptr, &count);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElements_Create(&elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageElementsGetCount(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    size_t count = 0;
    int32_t testId = 0;
    napi_value result;

    napi_value paramResult = TestStorageElementsGetCountParameterValidation(env, testId, elements);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElements_GetCount(elements, &count);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageElementsGetElementParameterValidation(napi_env env, int32_t &testId,
    ContentEmbed_StorageElements *&elements)
{
    ContentEmbed_StorageElement *element = nullptr;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetElement(nullptr, 0, &element);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElements_Create(&elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageElementsGetElement(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_StorageElement *element = nullptr;
    size_t count = 0;
    int32_t testId = 0;
    napi_value result;
    napi_value paramResult = TestStorageElementsGetElementParameterValidation(env, testId, elements);
    if (paramResult != nullptr) {
        return paramResult;
    }
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_StorageElements_GetCount(elements, &count);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        return result;
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageElementGetNameParameterValidation(napi_env env, int32_t &testId,
    ContentEmbed_StorageElements *&elements)
{
    char name[BUF_SIZE] = {0};

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetName(nullptr, name, BUF_SIZE);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElements_Create(&elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetNameCreateDocument(napi_env env, int32_t &testId,
    ContentEmbed_Document *&document, ContentEmbed_Storage *&storage)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    napi_value result;
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetNameProcessElement(napi_env env, int32_t &testId,
    ContentEmbed_StorageElements *elements, ContentEmbed_StorageElement *&element)
{
    char name[BUF_SIZE] = {0};
    size_t count = 0;
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetCount(elements, &count);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    if (count > 0) {
        code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
            OH_ContentEmbed_StorageElements_Destroy(elements);
            napi_create_int32(env, 0, &result);
            return result;
        }
        testId++;
        code = OH_ContentEmbed_StorageElement_GetName(element, name, BUF_SIZE);
        if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
            OH_ContentEmbed_StorageElements_Destroy(elements);
            napi_create_int32(env, testId, &result);
            OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
            return result;
        }
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageElementGetName(napi_env env, napi_callback_info info)
{
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    ContentEmbed_StorageElement *element = nullptr;
    int32_t testId = 0;
    napi_value result;

    napi_value paramResult = TestStorageElementGetNameParameterValidation(env, testId, elements);
    if (paramResult != nullptr) {
        return paramResult;
    }
    napi_value docResult = TestStorageElementGetNameCreateDocument(env, testId, document, storage);
    if (docResult != nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        return docResult;
    }
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    napi_value elementResult = TestStorageElementGetNameProcessElement(env, testId, elements, element);
    if (elementResult != nullptr) {
        return elementResult;
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageElementGetCTimeParameterValidation(napi_env env,
    int32_t &testId, ContentEmbed_StorageElements *&elements)
{
    uint64_t ctime = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetCTime(nullptr, &ctime);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElements_Create(&elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetCTimeCreateDocument(napi_env env, const char *hmid,
    ContentEmbed_Document *&document, ContentEmbed_StorageElements *elements,
    int32_t &testId)
{
    napi_value result;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetCTimeGetRootStorage(napi_env env,
    ContentEmbed_Document *document, ContentEmbed_Storage *&storage,
    ContentEmbed_StorageElements *elements)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetCTimeGetElements(napi_env env,
    ContentEmbed_Storage *storage, ContentEmbed_StorageElements *elements)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetCTimeGetCount(napi_env env,
    ContentEmbed_StorageElements *elements, size_t &count)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetCount(elements, &count);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetCTimeGetElementAndTest(napi_env env,
    ContentEmbed_StorageElements *elements, uint64_t &ctime, int32_t &testId)
{
    napi_value result;
    ContentEmbed_StorageElement *element = nullptr;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElement_GetCTime(element, &ctime);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageElementGetCTime(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    uint64_t ctime = 0;
    size_t count = 0;
    int32_t testId = 0;
    napi_value result;
    napi_value paramResult = TestStorageElementGetCTimeParameterValidation(env, testId, elements);
    if (paramResult != nullptr) {
        return paramResult;
    }
    napi_value createDocResult = TestStorageElementGetCTimeCreateDocument(env, hmid, document,
        elements, testId);
    if (createDocResult != nullptr) {
        return createDocResult;
    }
    napi_value getStorageResult = TestStorageElementGetCTimeGetRootStorage(env, document, storage, elements);
    if (getStorageResult != nullptr) {
        return getStorageResult;
    }
    napi_value getElementsResult = TestStorageElementGetCTimeGetElements(env, storage, elements);
    if (getElementsResult != nullptr) {
        return getElementsResult;
    }
    napi_value getCountResult = TestStorageElementGetCTimeGetCount(env, elements, count);
    if (getCountResult != nullptr) {
        return getCountResult;
    }
    if (count > 0) {
        napi_value getElementResult = TestStorageElementGetCTimeGetElementAndTest(env, elements,
            ctime, testId);
        if (getElementResult != nullptr) {
            return getElementResult;
        }
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageElementGetMTimeParameterValidation(napi_env env,
    int32_t &testId, ContentEmbed_StorageElements *&elements)
{
    uint64_t mtime = 0;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_GetMTime(nullptr, &mtime);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElements_Create(&elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetMTimeCreateDocument(napi_env env, const char *hmid,
    ContentEmbed_Document *&document, ContentEmbed_StorageElements *elements,
    int32_t &testId)
{
    napi_value result;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetMTimeGetRootStorage(napi_env env,
    ContentEmbed_Document *document, ContentEmbed_Storage *&storage,
    ContentEmbed_StorageElements *elements)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetMTimeGetElements(napi_env env,
    ContentEmbed_Storage *storage, ContentEmbed_StorageElements *elements)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetMTimeGetCount(napi_env env,
    ContentEmbed_StorageElements *elements, size_t &count)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetCount(elements, &count);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementGetMTimeGetElementAndTest(napi_env env,
    ContentEmbed_StorageElements *elements, uint64_t &mtime, int32_t &testId)
{
    napi_value result;
    ContentEmbed_StorageElement *element = nullptr;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElement_GetMTime(element, &mtime);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageElementGetMTime(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    uint64_t mtime = 0;
    size_t count = 0;
    int32_t testId = 0;
    napi_value result;
    napi_value paramResult = TestStorageElementGetMTimeParameterValidation(env, testId, elements);
    if (paramResult != nullptr) {
        return paramResult;
    }
    napi_value createDocResult = TestStorageElementGetMTimeCreateDocument(env, hmid, document,
        elements, testId);
    if (createDocResult != nullptr) {
        return createDocResult;
    }
    napi_value getStorageResult = TestStorageElementGetMTimeGetRootStorage(env, document, storage, elements);
    if (getStorageResult != nullptr) {
        return getStorageResult;
    }
    napi_value getElementsResult = TestStorageElementGetMTimeGetElements(env, storage, elements);
    if (getElementsResult != nullptr) {
        return getElementsResult;
    }
    napi_value getCountResult = TestStorageElementGetMTimeGetCount(env, elements, count);
    if (getCountResult != nullptr) {
        return getCountResult;
    }
    if (count > 0) {
        napi_value getElementResult = TestStorageElementGetMTimeGetElementAndTest(env, elements, mtime, testId);
        if (getElementResult != nullptr) {
            return getElementResult;
        }
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageElementIsStorageParameterValidation(napi_env env,
    int32_t &testId, ContentEmbed_StorageElements *&elements)
{
    bool isStorage = false;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_IsStorage(nullptr, &isStorage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElements_Create(&elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStorageCreateDocument(napi_env env, const char *hmid,
    ContentEmbed_Document *&document, ContentEmbed_StorageElements *elements,
    int32_t &testId)
{
    napi_value result;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStorageGetRootStorage(napi_env env,
    ContentEmbed_Document *document, ContentEmbed_Storage *&storage,
    ContentEmbed_StorageElements *elements)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStorageGetElements(napi_env env,
    ContentEmbed_Storage *storage, ContentEmbed_StorageElements *elements)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStorageGetCount(napi_env env,
    ContentEmbed_StorageElements *elements, size_t &count)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetCount(elements, &count);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStorageGetElementAndTest(napi_env env,
    ContentEmbed_StorageElements *elements, bool &isStorage, int32_t &testId)
{
    napi_value result;
    ContentEmbed_StorageElement *element = nullptr;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElement_IsStorage(element, &isStorage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageElementIsStorage(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    bool isStorage = false;
    size_t count = 0;
    int32_t testId = 0;
    napi_value result;
    napi_value paramResult = TestStorageElementIsStorageParameterValidation(env, testId, elements);
    if (paramResult != nullptr) {
        return paramResult;
    }
    napi_value createDocResult = TestStorageElementIsStorageCreateDocument(env, hmid, document,
        elements, testId);
    if (createDocResult != nullptr) {
        return createDocResult;
    }
    napi_value getStorageResult = TestStorageElementIsStorageGetRootStorage(env, document, storage, elements);
    if (getStorageResult != nullptr) {
        return getStorageResult;
    }
    napi_value getElementsResult = TestStorageElementIsStorageGetElements(env, storage, elements);
    if (getElementsResult != nullptr) {
        return getElementsResult;
    }
    napi_value getCountResult = TestStorageElementIsStorageGetCount(env, elements, count);
    if (getCountResult != nullptr) {
        return getCountResult;
    }
    if (count > 0) {
        napi_value getElementResult = TestStorageElementIsStorageGetElementAndTest(env, elements,
            isStorage, testId);
        if (getElementResult != nullptr) {
            return getElementResult;
        }
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageElementIsStreamParameterValidation(napi_env env,
    int32_t &testId, ContentEmbed_StorageElements *&elements)
{
    bool isStream = false;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElement_IsStream(nullptr, &isStream);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElements_Create(&elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStreamCreateDocument(napi_env env, const char *hmid,
    ContentEmbed_Document *&document, ContentEmbed_StorageElements *elements,
    int32_t &testId)
{
    napi_value result;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStreamGetRootStorage(napi_env env,
    ContentEmbed_Document *document, ContentEmbed_Storage *&storage,
    ContentEmbed_StorageElements *elements)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStreamGetElements(napi_env env,
    ContentEmbed_Storage *storage, ContentEmbed_StorageElements *elements)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_GetElements(storage, elements);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStreamGetCount(napi_env env,
    ContentEmbed_StorageElements *elements, size_t &count)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetCount(elements, &count);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageElementIsStreamGetElementAndTest(napi_env env,
    ContentEmbed_StorageElements *elements, bool &isStream, int32_t &testId)
{
    napi_value result;
    ContentEmbed_StorageElement *element = nullptr;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_StorageElements_GetElement(elements, 0, &element);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, 0, &result);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_StorageElement_IsStream(element, &isStream);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_StorageElements_Destroy(elements);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageElementIsStream(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_StorageElements *elements = nullptr;
    bool isStream = false;
    size_t count = 0;
    int32_t testId = 0;
    napi_value result;
    napi_value paramResult = TestStorageElementIsStreamParameterValidation(env, testId, elements);
    if (paramResult != nullptr) {
        return paramResult;
    }
    napi_value createDocResult = TestStorageElementIsStreamCreateDocument(env, hmid, document,
        elements, testId);
    if (createDocResult != nullptr) {
        return createDocResult;
    }
    napi_value getStorageResult = TestStorageElementIsStreamGetRootStorage(env, document, storage, elements);
    if (getStorageResult != nullptr) {
        return getStorageResult;
    }
    napi_value getElementsResult = TestStorageElementIsStreamGetElements(env, storage, elements);
    if (getElementsResult != nullptr) {
        return getElementsResult;
    }
    napi_value getCountResult = TestStorageElementIsStreamGetCount(env, elements, count);
    if (getCountResult != nullptr) {
        return getCountResult;
    }
    if (count > 0) {
        napi_value getElementResult = TestStorageElementIsStreamGetElementAndTest(env, elements,
            isStream, testId);
        if (getElementResult != nullptr) {
            return getElementResult;
        }
    }
    OH_ContentEmbed_StorageElements_Destroy(elements);
    napi_create_int32(env, 0, &result);
    return result;
}

static napi_value TestStorageCopyToParameterValidation(napi_env env,
    ContentEmbed_Storage *storage, int32_t &testId)
{
    napi_value result;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CopyTo(nullptr, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_CopyTo(storage, nullptr);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    testId++;
    code = OH_ContentEmbed_Storage_CopyTo(nullptr, storage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_PARAM_INVALID) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageCopyToCreateDocument(napi_env env, const char *hmid,
    ContentEmbed_Document *&document, int32_t &testId)
{
    napi_value result;
    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_CreateDocumentByHmid(hmid, &document);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    if (document == nullptr) {
        napi_create_int32(env, testId, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageCopyToGetRootStorage(napi_env env,
    ContentEmbed_Document *document, ContentEmbed_Storage *&storage)
{
    napi_value result;

    ContentEmbed_ErrorCode code = OH_ContentEmbed_Document_GetRootStorage(document, &storage);
    if (code != CE_ERR_OK || storage == nullptr) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageCopyToCreateDestStorage(napi_env env,
    ContentEmbed_Storage *storage, ContentEmbed_Storage *&srcStorage,
    ContentEmbed_Storage *&destStorage)
{
    napi_value result;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CreateStorage(storage, "srcStorage", &srcStorage);
    if (code != CE_ERR_OK || srcStorage == nullptr) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    code = OH_ContentEmbed_Storage_CreateStorage(storage, "destStorage", &destStorage);
    if (code != CE_ERR_OK || destStorage == nullptr) {
        napi_create_int32(env, 1, &result);
        return result;
    }
    return nullptr;
}

static napi_value TestStorageCopyToCopyStorage(napi_env env,
    ContentEmbed_Storage *storage, ContentEmbed_Storage *destStorage, int32_t &testId)
{
    napi_value result;

    testId++;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Storage_CopyTo(storage, destStorage);
    if (code != CE_ERR_DEVICE_NOT_SUPPORTED && code != CE_ERR_OK) {
        OH_ContentEmbed_DestroyStorage(destStorage);
        napi_create_int32(env, testId, &result);
        OH_LOG_ERROR(LOG_APP, "test%{public}d failed code: %{public}d", testId, code);
        return result;
    }
    return nullptr;
}

static napi_value TestOHContentEmbedStorageCopyTo(napi_env env, napi_callback_info info)
{
    char hmid[] = "000209FF-0000-0000-C000-000000000046";
    ContentEmbed_Document *document = nullptr;
    ContentEmbed_Storage *storage = nullptr;
    ContentEmbed_Storage *srcStorage = nullptr;
    ContentEmbed_Storage *destStorage = nullptr;
    int32_t testId = 0;
    napi_value result;
    napi_value createDocResult = TestStorageCopyToCreateDocument(env, hmid, document, testId);
    if (createDocResult != nullptr) {
        return createDocResult;
    }
    napi_value getStorageResult = TestStorageCopyToGetRootStorage(env, document, storage);
    if (getStorageResult != nullptr) {
        return getStorageResult;
    }
    napi_value paramResult = TestStorageCopyToParameterValidation(env, storage, testId);
    if (paramResult != nullptr) {
        return paramResult;
    }
    napi_value createDestResult = TestStorageCopyToCreateDestStorage(env, storage, srcStorage, destStorage);
    if (createDestResult != nullptr) {
        return createDestResult;
    }
    napi_value copyResult = TestStorageCopyToCopyStorage(env, srcStorage, destStorage, testId);
    if (copyResult != nullptr) {
        return copyResult;
    }
    OH_ContentEmbed_DestroyStorage(storage);
    OH_ContentEmbed_DestroyStorage(srcStorage);
    OH_ContentEmbed_DestroyStorage(destStorage);
    napi_create_int32(env, 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"TestOHContentEmbedCreateDocumentByHmid", nullptr,
            TestOHContentEmbedCreateDocumentByHmid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedCreateDocumentByFile", nullptr,
            TestOHContentEmbedCreateDocumentByFile,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedLoadDocumentFromFile", nullptr,
            TestOHContentEmbedLoadDocumentFromFile,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDocumentRead", nullptr,
            TestOHContentEmbedDocumentRead,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDocumentGetHmid", nullptr,
            TestOHContentEmbedDocumentGetHmid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDocumentIsLinking", nullptr,
            TestOHContentEmbedDocumentIsLinking,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDocumentGetNativeFilePath", nullptr,
            TestOHContentEmbedDocumentGetNativeFilePath,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDocumentGetRootStorage", nullptr,
            TestOHContentEmbedDocumentGetRootStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDocumentFlush", nullptr,
            TestOHContentEmbedDocumentFlush,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDocumentCreateStorage", nullptr,
            TestOHContentEmbedDocumentCreateStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageGetStorage", nullptr,
            TestOHContentEmbedStorageGetStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageCreateStream", nullptr,
            TestOHContentEmbedStorageCreateStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageGetStream", nullptr,
            TestOHContentEmbedStorageGetStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageDeleteEntry", nullptr,
            TestOHContentEmbedStorageDeleteEntry,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDeleteStorage", nullptr,
            TestOHContentEmbedDeleteStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStreamRead", nullptr,
            TestOHContentEmbedStreamRead,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStreamWrite", nullptr,
            TestOHContentEmbedStreamWrite,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStreamSeek", nullptr,
            TestOHContentEmbedStreamSeek,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStreamGetPosition", nullptr,
            TestOHContentEmbedStreamGetPosition,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStreamGetSize", nullptr,
            TestOHContentEmbedStreamGetSize,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDestroyStream", nullptr,
            TestOHContentEmbedDestroyStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedDestroyDocument", nullptr,
            TestOHContentEmbedDestroyDocument,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageDeleteAllEntry", nullptr,
            TestOHContentEmbedStorageDeleteAllEntry,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageGetHmid", nullptr,
            TestOHContentEmbedStorageGetHmid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageSetHmid", nullptr,
            TestOHContentEmbedStorageSetHmid,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageElements", nullptr,
            TestOHContentEmbedStorageElements,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageElementsGetCount", nullptr,
            TestOHContentEmbedStorageElementsGetCount,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageElementGetName", nullptr,
            TestOHContentEmbedStorageElementGetName,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageElementGetCTime", nullptr,
            TestOHContentEmbedStorageElementGetCTime,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageElementGetMTime", nullptr,
            TestOHContentEmbedStorageElementGetMTime,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageElementIsStorage", nullptr,
            TestOHContentEmbedStorageElementIsStorage,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageElementIsStream", nullptr,
            TestOHContentEmbedStorageElementIsStream,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestOHContentEmbedStorageCopyTo", nullptr,
            TestOHContentEmbedStorageCopyTo,
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
