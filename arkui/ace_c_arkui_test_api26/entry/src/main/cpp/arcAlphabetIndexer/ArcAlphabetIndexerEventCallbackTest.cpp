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
 
#include "ArcAlphabetIndexerEventCallbackTest.h"
#include <string>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
 
namespace ArkUICapiTest {
 
napi_value ArcAlphabetIndexerEventCallbackTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "arcAlphabetIndexerTest", "CreateNativeNode");
 
    size_t argc = PARAM_1;
    napi_value args[PARAM_1] = {nullptr};
    napi_get_cb_info( env , info , &argc , args , nullptr , nullptr );
    size_t length = 64;
    size_t strLength = PARAM_0;
    char xComponentID[PARAM_64] = {PARAM_0};
    napi_get_value_string_utf8( env , args[PARAM_0] , xComponentID , length , &strLength );
 
    if ((env == nullptr) || (info == nullptr)) {
        return nullptr;
    }
 
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
 
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
 
    auto indexer = nodeAPI->createNode(ARKUI_NODE_ARC_ALPHABET_INDEXER);
    if (indexer == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "arcAlphabetIndexerTest", "create arcAlphabetIndexer failed");
    }
    nodeAPI->addChild(column, indexer);
 
    ArkUI_NumberValue width_value[] = {{.f32 = 200}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(indexer, NODE_WIDTH, &width_item);
    ArkUI_NumberValue height_value[] = {{.f32 = 150}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(indexer, NODE_HEIGHT, &height_item);
 
    ArkUI_AttributeItem id_item = {.string = "arc_alphabet_indexer_call"};
    nodeAPI->setAttribute(indexer, NODE_ID, &id_item);
    auto indexerId = nodeAPI->getAttribute(indexer, NODE_ID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcAlphabetIndexerTest", "indexerId = %{public}s", indexerId->string);
 
    const char* arrayValue[] = {
        "#", "A", "B", "C", "D", "E", "F", "G"
    };
    ArkUI_AttributeItem array_item = {.size = PARAM_8, .object = arrayValue};
    nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_ARRAY, &array_item);
    ArkUI_NumberValue value[] = {{.i32 = PARAM_0}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED, &item);
    ArkUI_NumberValue selected_color_value[] = {{.u32 = COLOR_BLUE}};
    ArkUI_AttributeItem selected_color_item = {selected_color_value, sizeof(selected_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(indexer, NODE_ARC_ALPHABET_INDEXER_SELECTED_COLOR, &selected_color_item);
 
    nodeAPI->registerNodeEvent(indexer, NODE_ARC_ALPHABET_INDEXER_EVENT_ON_SELECT, 0, nullptr);
 
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcAlphabetIndexerTest", "enter NodeEventReceiver");
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
 
        switch (eventType) {
            case NODE_ARC_ALPHABET_INDEXER_EVENT_ON_SELECT:
            {
                auto *commonEvent = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
                auto index = commonEvent->data[0].i32;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_ALPHABET_INDEXER_EVENT_ON_SELECT","index: %{public}d", index);
            }
            default:
                break;
        }
    });
 
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                    column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ArcAlphabetIndexerEventCallbackTest",
                        "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}
 
} // namespace ArkUICapiTest