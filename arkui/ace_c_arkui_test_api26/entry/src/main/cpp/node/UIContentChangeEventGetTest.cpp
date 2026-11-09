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

#include "common/common.h"
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#include <arkui/native_node_napi.h>
#include <arkui/ui_info_collection.h>
#include <arkui/ui_json_wrapper.h>
#include "UIContentChangeEventGetTest.h"

static ArkUI_NativeNodeAPI_1 *api = nullptr;
static uint64_t subscriptionId = 0;

static ArkUI_NodeHandle getTypeNode = nullptr;
static ArkUI_NodeHandle getTimestampNode = nullptr;
static ArkUI_NodeHandle getContextNode = nullptr;
static ArkUI_NodeHandle getJsonNode = nullptr;

namespace ArkUICapiTest {

static void SetResultColor(ArkUI_NodeHandle node, bool success)
{
    if ((node == nullptr) || (api == nullptr)) {
        return;
    }
    ArkUI_NumberValue color[] = { { .u32 = success ? 0xFF00FF00 : 0xFFFF0000 } };
    ArkUI_AttributeItem item = { color, 1 };
    api->setAttribute(node, NODE_BACKGROUND_COLOR, &item);
}

static void OnContentChange(const OH_ArkUI_NativeModule_UIContentChangeEvent *event, void *userData)
{
    (void)userData;
    if (event == nullptr) {
        return;
    }

    OH_ArkUI_NativeModule_UIContentChangeEventType eventType = OH_ARKUI_NATIVEMODULE_EVENT_PAGE_CHANGE_START;
    auto typeRet = OH_ArkUI_NativeModule_UIContentChangeEventGetType(event, &eventType);
    SetResultColor(getTypeNode, typeRet == ARKUI_ERROR_CODE_NO_ERROR);

    uint64_t nanoTimestamp = 0;
    auto timestampRet = OH_ArkUI_NativeModule_UIContentChangeEventGetTimestamp(event, &nanoTimestamp);
    SetResultColor(getTimestampNode, timestampRet == ARKUI_ERROR_CODE_NO_ERROR);

    ArkUI_ContextHandle uiContext = nullptr;
    auto contextRet = OH_ArkUI_NativeModule_UIContentChangeEventGetContext(event, &uiContext);
    SetResultColor(getContextNode, contextRet == ARKUI_ERROR_CODE_NO_ERROR);

    const OH_ArkUI_NativeModule_UIJsonWrapper *json = nullptr;
    auto jsonRet = OH_ArkUI_NativeModule_UIContentChangeEventGetContentChangeEventJson(event, &json);
    SetResultColor(getJsonNode, jsonRet == ARKUI_ERROR_CODE_NO_ERROR);

    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "UIContentChangeEventGetTest",
        "typeRet=%{public}d timestampRet=%{public}d contextRet=%{public}d jsonRet=%{public}d",
        static_cast<int32_t>(typeRet), static_cast<int32_t>(timestampRet),
        static_cast<int32_t>(contextRet), static_cast<int32_t>(jsonRet));
}

static ArkUI_NodeHandle CreateResultNode(const char *nodeId, const char *text, ArkUI_NodeHandle parent)
{
    auto node = api->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem contentItem = { .string = text };
    api->setAttribute(node, NODE_TEXT_CONTENT, &contentItem);
    ArkUI_AttributeItem idItem = { .string = nodeId };
    api->setAttribute(node, NODE_ID, &idItem);
    ArkUI_NumberValue width[] = { { .f32 = SIZE_150 } };
    ArkUI_AttributeItem widthItem = { width, 1 };
    api->setAttribute(node, NODE_WIDTH, &widthItem);
    ArkUI_NumberValue height[] = { { .f32 = SIZE_30 } };
    ArkUI_AttributeItem heightItem = { height, 1 };
    api->setAttribute(node, NODE_HEIGHT, &heightItem);
    ArkUI_NumberValue red[] = { { .u32 = 0xFFFF0000 } };
    ArkUI_AttributeItem redItem = { red, 1 };
    api->setAttribute(node, NODE_BACKGROUND_COLOR, &redItem);
    api->addChild(parent, node);
    return node;
}

napi_value UIContentChangeEventGetTest::UIContentChangeEventGetTest001(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    ArkUI_NodeContentHandle handle;
    OH_ArkUI_GetNodeContentFromNapiValue(env, args[0], &handle);
    if (!handle) {
        return nullptr;
    }

    if (!api) {
        OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, api);
    }

    ArkUI_NodeHandle root = api->createNode(ARKUI_NODE_COLUMN);
    getTypeNode = CreateResultNode("getTypeResultNode", "GetType", root);
    getTimestampNode = CreateResultNode("getTimestampResultNode", "GetTimestamp", root);
    getContextNode = CreateResultNode("getContextResultNode", "GetContext", root);
    getJsonNode = CreateResultNode("getJsonResultNode", "GetContentChangeEventJson", root);
    OH_ArkUI_NodeContent_AddNode(handle, root);

    ArkUI_ContextHandle ctx = OH_ArkUI_GetContextByNode(root);
    if (ctx) {
        if (subscriptionId != 0) {
            OH_ArkUI_NativeModule_UnRegisterUIContentChangeEvent(ctx, subscriptionId);
            subscriptionId = 0;
        }
        uint64_t newSubscriptionId = 0;
        auto ret = OH_ArkUI_NativeModule_RegisterUIContentChangeEvent(ctx, true,
            OH_ARKUI_NATIVEMODULE_EVENT_CATEGORY_ALL, 0, nullptr, OnContentChange, &newSubscriptionId);
        if (ret == ARKUI_ERROR_CODE_NO_ERROR) {
            subscriptionId = newSubscriptionId;
        }
    }
    return nullptr;
}

} // namespace ArkUICapiTest
