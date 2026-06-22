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
 
#include "ArcListEventCallbackTest.h"
#include <string>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#define TEST_COMPONENT_NUMBER 100
 
namespace ArkUICapiTest {
 
napi_value ArcListEventCallbackTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "arcListTest", "CreateNativeNode");
    ArkUI_NodeHandle ItemBuf[TEST_COMPONENT_NUMBER];
 
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
 
    // 创建column节点组件
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
 
    // 创建arclist节点组件
    auto list = nodeAPI->createNode(ARKUI_NODE_ARC_LIST);
    if (list == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "arcListTest", "create arclist failed");
    }
    nodeAPI->addChild(column, list);
 
    // arcList组件属性--scrollToindex
    ArkUI_NumberValue scrollToindex_value[] = {{.i32 = 3}};
    ArkUI_AttributeItem scrollToindex_item = {scrollToindex_value, sizeof(scrollToindex_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_ARC_LIST_SCROLL_TO_INDEX, &scrollToindex_item);
 
    // arcList组件属性--childrenmainsize
    auto childrenmainsize = OH_ArkUI_ListChildrenMainSizeOption_Create();
    OH_ArkUI_ListChildrenMainSizeOption_SetDefaultMainSize(childrenmainsize, 100);
    ArkUI_AttributeItem childrenmainsize_item = {.object = childrenmainsize};
    nodeAPI->setAttribute(list, NODE_ARC_LIST_CHILDREN_MAIN_SIZE, &childrenmainsize_item);
 
    // arcList组件属性-- header
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "Test attribute of the C API";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "create text = %{public}p", &text);
 
    ArkUI_AttributeItem item = {.object = text};
    nodeAPI->setAttribute(list, NODE_ARC_LIST_SET_HEADER, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "create item = %{public}p object = %{public}p", &item, item.object);
    auto header = nodeAPI->getAttribute(list, NODE_ARC_LIST_SET_HEADER);
    auto headertext = nodeAPI->getAttribute(static_cast<ArkUI_NodeHandle>(header->object), NODE_TEXT_CONTENT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "headertext = %{public}s", headertext->string);
 
    nodeAPI->resetAttribute(list, NODE_ARC_LIST_SET_HEADER);
    header = nodeAPI->getAttribute(list, NODE_ARC_LIST_SET_HEADER);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "NODE_ARC_LIST_SET_HEADER = %{public}p", header->object);
 
    // 通用属性
    ArkUI_NumberValue width_value[] = {{.f32 = 200}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_WIDTH, &width_item);
    ArkUI_NumberValue height_value[] = {{.f32 = 250}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(list, NODE_HEIGHT, &height_item);
 
    ArkUI_AttributeItem id_item = {.string = "arc_list_call"};    
    nodeAPI->setAttribute(list, NODE_ID, &id_item);
    auto listid = nodeAPI->getAttribute(list, NODE_ID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "listid = %{public}s", listid->string);
 
    for (int i = 0; i < 5; ++i) {
        // 创建arcListItem组件，添加trace打点
        ItemBuf[i] = nodeAPI->createNode(ARKUI_NODE_ARC_LIST_ITEM);
        nodeAPI->addChild(list, ItemBuf[i]);
    
        // 通用属性
        ArkUI_NumberValue width_value[] = {{.f32 = 200}};
        ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(ItemBuf[i], NODE_WIDTH, &width_item);
        ArkUI_NumberValue height_value[] = {{.f32 = 100}};
        ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(ItemBuf[i], NODE_HEIGHT, &height_item);
        ArkUI_NumberValue bordercolor[] = {{.u32 = 0xFFFFFFF}};
        ArkUI_AttributeItem bordercolor_item = {bordercolor, sizeof(bordercolor) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(ItemBuf[i], NODE_BORDER_COLOR, &bordercolor_item);
    
        // arcListItem组件属性--autoscale
        auto autoscale = nodeAPI->getAttribute(list, NODE_ARC_LIST_ITEM_AUTO_SCALE);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "NODE_ARC_LIST_ITEM_AUTO_SCALE = %{public}d", autoscale->value->i32);
        ArkUI_NumberValue autoscale_value[] = {{.i32 = 0}};
        ArkUI_AttributeItem autoscale_item = { autoscale_value, sizeof(autoscale_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(ItemBuf[i], NODE_ARC_LIST_ITEM_AUTO_SCALE, &autoscale_item);
        autoscale = nodeAPI->getAttribute(ItemBuf[i], NODE_ARC_LIST_ITEM_AUTO_SCALE);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "NODE_ARC_LIST_ITEM_AUTO_SCALE = %{public}d", autoscale->value->i32);
        nodeAPI->resetAttribute(ItemBuf[i], NODE_ARC_LIST_ITEM_AUTO_SCALE);
        autoscale = nodeAPI->getAttribute(ItemBuf[i], NODE_ARC_LIST_ITEM_AUTO_SCALE);
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "NODE_ARC_LIST_ITEM_AUTO_SCALE = %{public}d", autoscale->value->i32);
    
        // arcListItem组件属性--SWIPE_ACTION
        auto textsw = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem content_item = {};
        content_item.string = "swipeActionText";
        nodeAPI->setAttribute(textsw, NODE_TEXT_CONTENT, &content_item);
    
        auto swipeAction = OH_ArkUI_ListItemSwipeActionOption_Create();
        auto swipeActionItem = OH_ArkUI_ListItemSwipeActionItem_Create();
        OH_ArkUI_ListItemSwipeActionItem_SetContent(swipeActionItem, textsw);
        OH_ArkUI_ListItemSwipeActionOption_SetStart(swipeAction, swipeActionItem);
        ArkUI_AttributeItem swipeActionitem = {.object = swipeAction};
        nodeAPI->setAttribute(ItemBuf[i], NODE_ARC_LIST_ITEM_SWIPE_ACTION, &swipeActionitem);
    }
    //创建arcscrollbar
    auto scrollBar = nodeAPI->createNode(ARKUI_NODE_ARC_SCROLL_BAR);
    nodeAPI->addChild(column, scrollBar);
    
    //绑定arclist
    ArkUI_AttributeItem scrolleritem = {.object = list};
    nodeAPI->setAttribute(scrollBar, NODE_ARC_SCROLL_BAR_BIND_SCROLLABLE, &scrolleritem);
 
    //arclist绑定事件
    nodeAPI->registerNodeEvent(list, NODE_ARC_LIST_ON_SCROLL_INDEX, 0, nullptr);
    nodeAPI->registerNodeEvent(list, NODE_ARC_LIST_ON_REACH_START, 0, nullptr);
    nodeAPI->registerNodeEvent(list, NODE_ARC_LIST_ON_REACH_END, 0, nullptr);
    nodeAPI->registerNodeEvent(list, NODE_ARC_LIST_ON_SCROLL_START, 0, nullptr);
    nodeAPI->registerNodeEvent(list, NODE_ARC_LIST_ON_SCROLL_STOP, 0, nullptr);
    nodeAPI->registerNodeEvent(list, NODE_ARC_LIST_ON_WILL_SCROLL, 0, nullptr);
    nodeAPI->registerNodeEvent(list, NODE_ARC_LIST_ON_DID_SCROLL, 0, nullptr);
 
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "enter NodeEventReceiver");
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
 
        switch (eventType) {
            case NODE_ARC_LIST_ON_SCROLL_INDEX: 
            {
                auto start = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[0].i32;
                auto end = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[1].i32;
                auto center = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[2].i32;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_LIST_ON_SCROLL_INDEX","start: %{public}d", start);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_LIST_ON_SCROLL_INDEX","end: %{public}d", end);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_LIST_ON_SCROLL_INDEX","center: %{public}d", center);
                break;
            }
                
            case NODE_ARC_LIST_ON_REACH_START:
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "NODE_ARC_LIST_ON_REACH_START ");
                break;
            }
        
            case NODE_ARC_LIST_ON_REACH_END:
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "NODE_ARC_LIST_ON_REACH_END ");
                break;
            }
        
            case NODE_ARC_LIST_ON_SCROLL_START:
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "NODE_ARC_LIST_ON_SCROLL_START");
                break;
            }
        
            case NODE_ARC_LIST_ON_SCROLL_STOP:
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "NODE_ARC_LIST_ON_SCROLL_STOP");
                break;
            }
        
            case NODE_ARC_LIST_ON_WILL_SCROLL:
            {
                auto distance = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[0].f32;
                auto state = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[1].i32;
                auto source = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[2].i32;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_LIST_ON_WILL_SCROLL","distance: %{public}f", distance);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_LIST_ON_WILL_SCROLL","state: %{public}d", state);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_LIST_ON_WILL_SCROLL","source: %{public}d", source);
                break;
            }
        
            case NODE_ARC_LIST_ON_DID_SCROLL:
            {
                auto distance = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[0].f32;
                auto state = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[1].i32;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_LIST_ON_DID_SCROLL","distance: %{public}f", distance);
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_LIST_ON_DID_SCROLL","state: %{public}d", state);
                break;
            }
        }
    });
 
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                    column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ArcListEventCallbackTest",
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