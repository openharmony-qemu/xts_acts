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

#include "../common/common.h"
#include "../manager/PluginManagerTest.h"

#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_render.h>

namespace ArkUICapiTest {

static auto SetArcItemSwipeAction(ArkUI_NodeHandle arcList, ArkUI_ListItemSwipeActionOption* option)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    ArkUI_AttributeItem item = {};
    item.object = option;
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_ITEM_SWIPE_ACTION, &item);
    return ret;
}

static auto CreateArcSwipeAction()
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto textsw = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "swipeActionText";
    nodeAPI->setAttribute(textsw, NODE_TEXT_CONTENT, &content_item);
    auto option = OH_ArkUI_ListItemSwipeActionOption_Create();
    auto item1 = OH_ArkUI_ListItemSwipeActionItem_Create();
    OH_ArkUI_ListItemSwipeActionItem_SetContent(item1, textsw);
    OH_ArkUI_ListItemSwipeActionOption_SetStart(option, item1);
    return option;
}

static napi_value TestArcListItemSwipeAction001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto option = CreateArcSwipeAction();
    auto ret = SetArcItemSwipeAction(arcList, option);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListItemSwipeAction002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto option = nullptr;
    auto ret = SetArcItemSwipeAction(arcList, option);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestArcListItemSwipeAction003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto ret = nodeAPI->resetAttribute(arcList, NODE_ARC_LIST_ITEM_SWIPE_ACTION);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListItemSwipeAction004(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto option = CreateArcSwipeAction();
    OH_ArkUI_ListItemSwipeActionOption_Dispose(option);
    option = nullptr;
    auto ret = SetArcItemSwipeAction(arcList, option);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

} // namespace ArkUICapiTest