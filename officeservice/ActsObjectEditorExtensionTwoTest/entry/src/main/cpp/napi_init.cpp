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

#include <napi/native_api.h>
#include <ContentEmbedKit/content_embed/content_embed_common.h>
#include <ContentEmbedKit/content_embed/content_embed_document.h>
#include <ContentEmbedKit/content_embed/content_embed_extension.h>
#include "hilog/log.h"
#include "native_object_editor_types.h"

namespace {
constexpr int32_t BUF_SIZE = 1024;
constexpr int32_t errorCodes_SIZE = 8;

// ============================== Callback stubs ==============================

static void NativeOnCreateCallback(ContentEmbed_ExtensionInstanceHandle instance, AbilityBase_Want *want)
{
    OH_LOG_INFO(LOG_APP, "NativeOnCreateCallback call");
}

static void NativeOnDestroyCallback(ContentEmbed_ExtensionInstanceHandle instance)
{
    OH_LOG_INFO(LOG_APP, "NativeOnDestroyCallback call");
}

static void NativeOnObjectAttachCallback(ContentEmbed_ExtensionInstanceHandle instance,
    ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "NativeOnObjectAttachCallback call");
}

static void NativeOnObjectDetachCallback(ContentEmbed_ExtensionInstanceHandle instance,
    ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "NativeOnObjectDetachCallback call");
}

static void NativeOnWriteToDataStreamCallback(ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "NativeOnWriteToDataStreamCallback call");
}

static void NativeOnGetSnapshotCallback(ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "NativeOnGetSnapshotCallback call");
}

static void NativeOnDoEditCallback(ContentEmbed_ObjectHandle object)
{
    OH_LOG_INFO(LOG_APP, "NativeOnDoEditCallback call");
}

static void NativeOnGetEditStatusCallback(ContentEmbed_ObjectHandle object, bool *isEditing, bool *isModified)
{
    OH_LOG_INFO(LOG_APP, "NativeOnGetEditStatusCallback call");
}

static void NativeOnGetCapabilityCallback(ContentEmbed_ObjectHandle object, uint32_t *bitmask)
{
    OH_LOG_INFO(LOG_APP, "NativeOnGetCapabilityCallback call");
}

// ============================== Register tests (CE_ERR_OK) ==============================

static napi_value TestExtensionRegisterOnCreateFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle instance = new ContentEmbed_ExtensionInstance;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnCreateFunc(instance, NativeOnCreateCallback);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnCreateFunc_Normal code: %{public}d", code);
    delete instance;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnDestroyFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle instance = new ContentEmbed_ExtensionInstance;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnDestroyFunc(instance, NativeOnDestroyCallback);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDestroyFunc_Normal code: %{public}d", code);
    delete instance;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnObjectAttachFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle instance = new ContentEmbed_ExtensionInstance;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnObjectAttachFunc(instance, NativeOnObjectAttachCallback);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectAttachFunc_Normal code: %{public}d", code);
    delete instance;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionUnRegisterOnObjectAttachFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle instance = new ContentEmbed_ExtensionInstance;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_UnRegisterOnObjectAttachFunc(instance);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectAttachFunc_Normal code: %{public}d", code);
    delete instance;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnObjectDetachFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle instance = new ContentEmbed_ExtensionInstance;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnObjectDetachFunc(instance, NativeOnObjectDetachCallback);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnObjectDetachFunc_Normal code: %{public}d", code);
    delete instance;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionUnRegisterOnObjectDetachFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle instance = new ContentEmbed_ExtensionInstance;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_UnRegisterOnObjectDetachFunc(instance);
    OH_LOG_INFO(LOG_APP, "TestExtensionUnRegisterOnObjectDetachFunc_Normal code: %{public}d", code);
    delete instance;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnWriteToDataStreamFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc(object, NativeOnWriteToDataStreamCallback);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnWriteToDataStreamFunc_Normal code: %{public}d", code);
    delete object;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnGetSnapshotFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc(object, NativeOnGetSnapshotCallback);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetSnapshotFunc_Normal code: %{public}d", code);
    delete object;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnDoEditFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnDoEditFunc(object, NativeOnDoEditCallback);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnDoEditFunc_Normal code: %{public}d", code);
    delete object;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnGetEditStatusFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc(object, NativeOnGetEditStatusCallback);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetEditStatusFunc_Normal code: %{public}d", code);
    delete object;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionRegisterOnGetCapabilityFunc_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc(object, NativeOnGetCapabilityCallback);
    OH_LOG_INFO(LOG_APP, "TestExtensionRegisterOnGetCapabilityFunc_Normal code: %{public}d", code);
    delete object;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

// ============================== Get tests (CE_ERR_OK) ==============================

static napi_value TestExtensionGetContext_Normal(napi_env env, napi_callback_info info)
{
    AbilityRuntime_Context contextStorage;
    ContentEmbed_ExtensionContextHandle ceContext =
        reinterpret_cast<ContentEmbed_ExtensionContextHandle>(&contextStorage);
    AbilityRuntime_ContextHandle context = nullptr;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_GetContext(ceContext, &context);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContext_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetExtensionInstance_Normal(napi_env env, napi_callback_info info)
{
    AbilityRuntime_ExtensionInstance baseStorage;
    AbilityRuntime_ExtensionInstanceHandle baseInstance =
        reinterpret_cast<AbilityRuntime_ExtensionInstanceHandle>(&baseStorage);
    ContentEmbed_ExtensionInstanceHandle ceInstance = nullptr;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_GetExtensionInstance(baseInstance, &ceInstance);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetExtensionInstance_Normal code: %{public}d", code);
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionGetContentEmbedDocument_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object;
    object->document = new ContentEmbed_Document();
    ContentEmbed_Document *ceDocument = nullptr;
    ContentEmbed_ErrorCode code =
        OH_ContentEmbed_Extension_GetContentEmbedDocument(object, &ceDocument);
    OH_LOG_INFO(LOG_APP, "TestExtensionGetContentEmbedDocument_Normal code: %{public}d", code);
    delete object->document;
    delete object;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

// ============================== Callback tests (CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED) ==============================
// Zero-initialized buffer: clientCb (sptr) is null → hits NOT_REGISTERED branch
// before the document null check (CE_ERR_NULL_POINTER).

static napi_value TestExtensionCallbackToOnUpdate_CallbackNotRegistered(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object();
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnUpdate(object);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_CallbackNotRegistered code: %{public}d", code);
    delete object;
    if (code == CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnError_CallbackNotRegistered(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object();
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnError(object, CE_ERR_OK);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_CallbackNotRegistered code: %{public}d", code);
    delete object;
    if (code == CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnEditingFinished_CallbackNotRegistered(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object();
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnEditingFinished(object, false);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_CallbackNotRegistered code: %{public}d", code);
    delete object;
    if (code == CE_ERR_CLIENT_CALLBACK_NOT_REGISTERED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnExtensionStopped_Normal(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle instance = new ContentEmbed_ExtensionInstance;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnExtensionStopped(instance);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_Normal code: %{public}d", code);
    delete instance;
    if (code == CE_ERR_OK) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

// ============================== Callback tests (CE_ERR_CLIENT_CALLBACK_FAILED) ==============================
// Mock IObjectEditorClientCallback subclass: all methods return ERR_INVALID_VALUE (non-ERR_OK),
// triggering CE_ERR_CLIENT_CALLBACK_FAILED in the NDK layer.

class MockClientCallbackFailed : public IObjectEditorClientCallback {
public:
    ErrCode OnUpdate(std::unique_ptr<ObjectEditorDocument> &document) override
    {
        return ERR_INVALID_VALUE;
    }
    ErrCode OnError(ContentEmbed_ErrorCode error) override
    {
        return ERR_INVALID_VALUE;
    }
    ErrCode OnStopEdit(bool dataModified) override
    {
        return ERR_INVALID_VALUE;
    }
    ErrCode OnExtensionStopped() override
    {
        return ERR_INVALID_VALUE;
    }
};

static napi_value TestExtensionCallbackToOnUpdate_CallbackFailed(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object();
    object->clientCb = new MockClientCallbackFailed();
    object->document = new ContentEmbed_Document();
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnUpdate(object);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnUpdate_CallbackFailed code: %{public}d", code);
    delete object->document;
    delete object;
    if (code == CE_ERR_CLIENT_CALLBACK_FAILED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnError_CallbackFailed(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object();
    object->clientCb = new MockClientCallbackFailed();
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnError(object, CE_ERR_OK);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnError_CallbackFailed code: %{public}d", code);
    delete object;
    if (code == CE_ERR_CLIENT_CALLBACK_FAILED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnEditingFinished_CallbackFailed(napi_env env, napi_callback_info info)
{
    ContentEmbed_ObjectHandle object = new ContentEmbed_Object();
    object->clientCb = new MockClientCallbackFailed();
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnEditingFinished(object, false);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnEditingFinished_CallbackFailed code: %{public}d", code);
    delete object;
    if (code == CE_ERR_CLIENT_CALLBACK_FAILED) {
        napi_value result;
        napi_create_int32(env, code, &result);
        return result;
    }
    napi_value result;
    napi_create_int32(env, -1, &result);
    return result;
}

static napi_value TestExtensionCallbackToOnExtensionStopped_CallbackFailed(napi_env env, napi_callback_info info)
{
    ContentEmbed_ExtensionInstanceHandle instance = new ContentEmbed_ExtensionInstance;
    auto object = std::make_shared<ContentEmbed_Object>();
    object->clientCb = new MockClientCallbackFailed();
    instance->objects["test_object"] = object;
    ContentEmbed_ErrorCode code = OH_ContentEmbed_Extension_CallbackToOnExtensionStopped(instance);
    OH_LOG_INFO(LOG_APP, "TestExtensionCallbackToOnExtensionStopped_CallbackFailed code: %{public}d", code);
    delete instance;
    if (code == CE_ERR_CLIENT_CALLBACK_FAILED) {
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
        {"TestExtensionGetContext_Normal", nullptr,
            TestExtensionGetContext_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetExtensionInstance_Normal", nullptr,
            TestExtensionGetExtensionInstance_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionGetContentEmbedDocument_Normal", nullptr,
            TestExtensionGetContentEmbedDocument_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnUpdate_CallbackNotRegistered", nullptr,
            TestExtensionCallbackToOnUpdate_CallbackNotRegistered,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnError_CallbackNotRegistered", nullptr,
            TestExtensionCallbackToOnError_CallbackNotRegistered,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnEditingFinished_CallbackNotRegistered", nullptr,
            TestExtensionCallbackToOnEditingFinished_CallbackNotRegistered,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnExtensionStopped_Normal", nullptr,
            TestExtensionCallbackToOnExtensionStopped_Normal,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnUpdate_CallbackFailed", nullptr,
            TestExtensionCallbackToOnUpdate_CallbackFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnError_CallbackFailed", nullptr,
            TestExtensionCallbackToOnError_CallbackFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnEditingFinished_CallbackFailed", nullptr,
            TestExtensionCallbackToOnEditingFinished_CallbackFailed,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"TestExtensionCallbackToOnExtensionStopped_CallbackFailed", nullptr,
            TestExtensionCallbackToOnExtensionStopped_CallbackFailed,
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
