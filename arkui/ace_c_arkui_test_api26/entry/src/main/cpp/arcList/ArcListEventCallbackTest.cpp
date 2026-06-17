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
#include <atomic>
#include <string>

namespace ArkUICapiTest {

constexpr int32_t ARKUI_ERROR_CODE_NO_ERROR = 0;
constexpr int32_t ITEM_COUNT = 20;
constexpr float ITEM_HEIGHT = 50.0f;

static std::atomic<bool> g_onScrollIndexCalled(false);
static std::atomic<bool> g_onReachStartCalled(false);
static std::atomic<bool> g_onReachEndCalled(false);
static std::atomic<bool> g_onScrollStartCalled(false);
static std::atomic<bool> g_onScrollStopCalled(false);
static std::atomic<bool> g_onWillScrollCalled(false);
static std::atomic<bool> g_onDidScrollCalled(false);

static ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;

static void OnScrollIndexHandler(ArkUI_NodeEvent* event)
{
    g_onScrollIndexCalled = true;
    auto nodeHandle = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    if (nodeHandle) {
        ArkUI_NumberValue greenValue[] = { { .u32 = 0xFF00FF00 } };
        ArkUI_AttributeItem greenItem = { greenValue, 1 };
        nodeAPI->setAttribute(nodeHandle, NODE_BACKGROUND_COLOR, &greenItem);
    }
}

static void OnReachStartHandler(ArkUI_NodeEvent* event)
{
    g_onReachStartCalled = true;
}

static void OnReachEndHandler(ArkUI_NodeEvent* event)
{
    g_onReachEndCalled = true;
}

static void OnScrollStartHandler(ArkUI_NodeEvent* event)
{
    g_onScrollStartCalled = true;
}

static void OnScrollStopHandler(ArkUI_NodeEvent* event)
{
    g_onScrollStopCalled = true;
}

static void OnWillScrollHandler(ArkUI_NodeEvent* event)
{
    g_onWillScrollCalled = true;
}

static void OnDidScrollHandler(ArkUI_NodeEvent* event)
{
    g_onDidScrollCalled = true;
}

static napi_value CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = { nullptr };
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    size_t length = 64;
    size_t strLength = 0;
    char xComponentID[64] = { 0 };
    napi_get_value_string_utf8(env, args[0], xComponentID, length, &strLength);

    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    if (nodeAPI == nullptr) {
        return nullptr;
    }

    auto arcList = nodeAPI->createNode(ARKUI_NODE_ARC_LIST);
    
    ArkUI_AttributeItem idItem = { .string = "ArcListScrollTest" };
    nodeAPI->setAttribute(arcList, NODE_ID, &idItem);

    ArkUI_NumberValue widthValue[] = { { .f32 = 300.0f } };
    ArkUI_AttributeItem widthItem = { widthValue, 1 };
    nodeAPI->setAttribute(arcList, NODE_WIDTH, &widthItem);

    ArkUI_NumberValue heightValue[] = { { .f32 = 400.0f } };
    ArkUI_AttributeItem heightItem = { heightValue, 1 };
    nodeAPI->setAttribute(arcList, NODE_HEIGHT, &heightItem);

    for (int32_t i = 0; i < ITEM_COUNT; i++) {
        auto item = nodeAPI->createNode(ARKUI_NODE_TEXT);
        
        std::string text = "Item " + std::to_string(i);
        ArkUI_AttributeItem textItem = { .string = text.c_str() };
        nodeAPI->setAttribute(item, NODE_TEXT_CONTENT, &textItem);

        ArkUI_NumberValue fontSizeValue[] = { { .f32 = 16.0f } };
        ArkUI_AttributeItem fontSizeItem = { fontSizeValue, 1 };
        nodeAPI->setAttribute(item, NODE_FONT_SIZE, &fontSizeItem);

        ArkUI_NumberValue itemHeightValue[] = { { .f32 = ITEM_HEIGHT } };
        ArkUI_AttributeItem itemHeightItem = { itemHeightValue, 1 };
        nodeAPI->setAttribute(item, NODE_HEIGHT, &itemHeightItem);

        ArkUI_NumberValue itemWidthValue[] = { { .f32 = 280.0f } };
        ArkUI_AttributeItem itemWidthItem = { itemWidthValue, 1 };
        nodeAPI->setAttribute(item, NODE_WIDTH, &itemWidthItem);

        ArkUI_NumberValue bgColorValue[] = { { .u32 = 0xFFEEEEEE } };
        ArkUI_AttributeItem bgColorItem = { bgColorValue, 1 };
        nodeAPI->setAttribute(item, NODE_BACKGROUND_COLOR, &bgColorItem);

        nodeAPI->addChild(arcList, item);
    }

    nodeAPI->registerNodeEvent(arcList, NODE_ARC_LIST_ON_SCROLL_INDEX, 0, nullptr);
    nodeAPI->registerNodeEvent(arcList, NODE_ARC_LIST_ON_REACH_START, 0, nullptr);
    nodeAPI->registerNodeEvent(arcList, NODE_ARC_LIST_ON_REACH_END, 0, nullptr);
    nodeAPI->registerNodeEvent(arcList, NODE_ARC_LIST_ON_SCROLL_START, 0, nullptr);
    nodeAPI->registerNodeEvent(arcList, NODE_ARC_LIST_ON_SCROLL_STOP, 0, nullptr);
    nodeAPI->registerNodeEvent(arcList, NODE_ARC_LIST_ON_WILL_SCROLL, 0, nullptr);
    nodeAPI->registerNodeEvent(arcList, NODE_ARC_LIST_ON_DID_SCROLL, 0, nullptr);

    nodeAPI->registerNodeEventReceiver(arcList, [](ArkUI_NodeEvent* event) {
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
        switch (eventType) {
            case NODE_ARC_LIST_ON_SCROLL_INDEX:
                OnScrollIndexHandler(event);
                break;
            case NODE_ARC_LIST_ON_REACH_START:
                OnReachStartHandler(event);
                break;
            case NODE_ARC_LIST_ON_REACH_END:
                OnReachEndHandler(event);
                break;
            case NODE_ARC_LIST_ON_SCROLL_START:
                OnScrollStartHandler(event);
                break;
            case NODE_ARC_LIST_ON_SCROLL_STOP:
                OnScrollStopHandler(event);
                break;
            case NODE_ARC_LIST_ON_WILL_SCROLL:
                OnWillScrollHandler(event);
                break;
            case NODE_ARC_LIST_ON_DID_SCROLL:
                OnDidScrollHandler(event);
                break;
        }
    });

    std::string id(xComponentID);
    OH_NativeXComponent_AttachNativeRootNode(
        PluginManager::GetInstance()->GetNativeXComponent(id), arcList);

    napi_value exports;
    napi_create_object(env, &exports);
    return exports;
}

static napi_value ResetEventFlags(napi_env env, napi_callback_info info)
{
    g_onScrollIndexCalled = false;
    g_onReachStartCalled = false;
    g_onReachEndCalled = false;
    g_onScrollStartCalled = false;
    g_onScrollStopCalled = false;
    g_onWillScrollCalled = false;
    g_onDidScrollCalled = false;
    NAPI_END;
}

static napi_value GetScrollIndexCalled(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_boolean(env, g_onScrollIndexCalled.load(), &result);
    return result;
}

static napi_value GetReachStartCalled(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_boolean(env, g_onReachStartCalled.load(), &result);
    return result;
}

static napi_value GetReachEndCalled(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_boolean(env, g_onReachEndCalled.load(), &result);
    return result;
}

static napi_value GetScrollStartCalled(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_boolean(env, g_onScrollStartCalled.load(), &result);
    return result;
}

static napi_value GetScrollStopCalled(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_boolean(env, g_onScrollStopCalled.load(), &result);
    return result;
}

static napi_value GetWillScrollCalled(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_boolean(env, g_onWillScrollCalled.load(), &result);
    return result;
}

static napi_value GetDidScrollCalled(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_get_boolean(env, g_onDidScrollCalled.load(), &result);
    return result;
}

}