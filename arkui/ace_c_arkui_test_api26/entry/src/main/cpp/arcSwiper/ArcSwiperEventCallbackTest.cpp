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
 
#include "ArcSwiperEventCallbackTest.h"
#include <string>
#include "../manager/PluginManagerTest.h"
#include "common/common.h"
#include <arkui/native_type.h>
#include <arkui/native_node.h>
#include <arkui/native_interface.h>
#define TEST_COMPONENT_NUMBER 100
 
namespace ArkUICapiTest {
 
napi_value ArcSwiperEventCallbackTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "arcSwiperTest", "CreateNativeNode");
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
 
    auto column = nodeAPI->createNode(ARKUI_NODE_COLUMN);
 
    auto swiper = nodeAPI->createNode(ARKUI_NODE_ARC_SWIPER);
    if (swiper == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "arcSwiperTest", "create arcSwiper failed");
    }
    nodeAPI->addChild(column, swiper);
 
    ArkUI_NumberValue width_value[] = {{.f32 = 200}};
    ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(swiper, NODE_WIDTH, &width_item);
    ArkUI_NumberValue height_value[] = {{.f32 = 250}};
    ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(swiper, NODE_HEIGHT, &height_item);
 
    ArkUI_AttributeItem id_item = {.string = "arc_swiper_call"};
    nodeAPI->setAttribute(swiper, NODE_ID, &id_item);
    auto swiperId = nodeAPI->getAttribute(swiper, NODE_ID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcSwiperTest", "swiperId = %{public}s", swiperId->string);
 
    for (int i = 0; i < 5; ++i) {
        ItemBuf[i] = nodeAPI->createNode(ARKUI_NODE_COLUMN);
        nodeAPI->addChild(swiper, ItemBuf[i]);
    
        ArkUI_NumberValue width_value[] = {{.f32 = 200}};
        ArkUI_AttributeItem width_item = {width_value, sizeof(width_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(ItemBuf[i], NODE_WIDTH, &width_item);
        ArkUI_NumberValue height_value[] = {{.f32 = 250}};
        ArkUI_AttributeItem height_item = {height_value, sizeof(height_value) / sizeof(ArkUI_NumberValue)};
        nodeAPI->setAttribute(ItemBuf[i], NODE_HEIGHT, &height_item);

        auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem content_item = {};
        content_item.string = "Swiper Item " + std::to_string(i);
        nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
        nodeAPI->addChild(ItemBuf[i], text);
    }
 
    nodeAPI->registerNodeEvent(swiper, NODE_ARC_SWIPER_EVENT_ON_CHANGE, 0, nullptr);
    nodeAPI->registerNodeEvent(swiper, NODE_ARC_SWIPER_EVENT_ON_ANIMATION_START, 0, nullptr);
    nodeAPI->registerNodeEvent(swiper, NODE_ARC_SWIPER_EVENT_ON_ANIMATION_END, 0, nullptr);
    nodeAPI->registerNodeEvent(swiper, NODE_ARC_SWIPER_EVENT_ON_GESTURE_SWIPE, 0, nullptr);
 
    nodeAPI->registerNodeEventReceiver([](ArkUI_NodeEvent *event) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcSwiperTest", "enter NodeEventReceiver");
        auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
 
        switch (eventType) {
            case NODE_ARC_SWIPER_EVENT_ON_CHANGE:
            {
                auto index = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[0].i32;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_SWIPER_EVENT_ON_CHANGE","index: %{public}d", index);
                break;
            }
                
            case NODE_ARC_SWIPER_EVENT_ON_ANIMATION_START:
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcSwiperTest", "NODE_ARC_SWIPER_EVENT_ON_ANIMATION_START");
                break;
            }
        
            case NODE_ARC_SWIPER_EVENT_ON_ANIMATION_END:
            {
                OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcSwiperTest", "NODE_ARC_SWIPER_EVENT_ON_ANIMATION_END");
                break;
            }
        
            case NODE_ARC_SWIPER_EVENT_ON_GESTURE_SWIPE:
            {
                auto offset = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event)->data[0].f32;
                OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "NODE_ARC_SWIPER_EVENT_ON_GESTURE_SWIPE","offset: %{public}f", offset);
                break;
            }
        }
    });
 
    std::string id(xComponentID);
    if (OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(id),
                                                    column) == INVALID_PARAM) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "ArcSwiperEventCallbackTest",
                        "OH_NativeXComponent_AttachNativeRootNode failed");
    }
    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, nullptr, "napi_create_object failed");
        return nullptr;
    }
    return exports;
}

ArcSwiperEventCallbackTest::~ArcSwiperEventCallbackTest()
{
}

} // namespace ArkUICapiTest