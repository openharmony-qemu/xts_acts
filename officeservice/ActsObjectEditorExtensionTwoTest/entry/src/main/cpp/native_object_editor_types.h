/*
 * Copyright (c) Huawei Device Co., Ltd. 2026-2026. All rights reserved.
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

#ifndef XTS_NATIVE_OBJECT_EDITOR_TYPES_H
#define XTS_NATIVE_OBJECT_EDITOR_TYPES_H

#include <atomic>
#include <mutex>
#include <string>
#include <unordered_map>
#include <vector>

#include <AbilityKit/ability_runtime/extension_ability.h>
#include <ContentEmbedKit/content_embed/content_embed_extension.h>

struct Context {
};

struct AbilityRuntime_Context {
    int32_t type;
    std::weak_ptr<Context> context;
};

struct Extension {
};

struct AbilityRuntime_ExtensionInstance {
    int32_t type;
    std::weak_ptr<Extension> extension;
};

struct ObjectEditorDocument {
};

struct ContentEmbed_Document {
    std::string oeid;
    bool linking = false;
    std::string tmpFileUri;
    std::string oriFileUri;
    std::string nativeFileUri;
    std::string snapshotUri;
    std::unique_ptr<ObjectEditorDocument> oeDocumentInner = nullptr;
};

struct ContentEmbed_ExtensionInstance : public AbilityRuntime_ExtensionInstance {
    OH_ContentEmbed_Extension_OnCreateFunc onCreateFunc = nullptr;
    OH_ContentEmbed_Extension_OnDestroyFunc onDestroyFunc = nullptr;
    OH_ContentEmbed_Extension_OnObjectAttachFunc onObjectAttachFunc = nullptr;
    OH_ContentEmbed_Extension_OnObjectDetachFunc onObjectDetachFunc = nullptr;
    std::mutex objectsMutex;
    std::unordered_map<std::string, std::shared_ptr<ContentEmbed_Object>> objects;
};

struct ContentEmbed_Object {
    std::shared_ptr<ContentEmbed_ExtensionInstance> ceInstance = nullptr;
    ContentEmbed_Document *document = nullptr;
    void* clientCb = nullptr;
    OH_ContentEmbed_Extension_OnWriteToDataStreamFunc onWriteToDataStreamFunc = nullptr;
    OH_ContentEmbed_Extension_OnGetSnapshotFunc onGetSnapshotFunc = nullptr;
    OH_ContentEmbed_Extension_OnDoEditFunc onDoEditFunc = nullptr;
    OH_ContentEmbed_Extension_OnGetEditStatusFunc onGetEditStatusFunc = nullptr;
    OH_ContentEmbed_Extension_OnGetCapabilityFunc onGetCapabilityFunc = nullptr;
    uint32_t callerTokenId = 0;
};

struct ContentEmbed_ExtensionContext : public AbilityRuntime_Context {
    std::atomic<bool> isStopping_ { false };
};

#endif // XTS_NATIVE_OBJECT_EDITOR_TYPES_H
