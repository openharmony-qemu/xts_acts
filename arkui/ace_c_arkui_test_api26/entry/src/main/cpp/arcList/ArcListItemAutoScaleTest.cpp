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

static auto CreateArcListItemAutoScale(ArkUI_NodeHandle column)
{
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto arcList = nodeAPI->createNode(ARKUI_NODE_ARC_LIST);
    auto item1 = nodeAPI->createNode(ARKUI_NODE_ARC_LIST_ITEM);
    auto item2 = nodeAPI->createNode(ARKUI_NODE_ARC_LIST_ITEM);
    auto item3 = nodeAPI->createNode(ARKUI_NODE_ARC_LIST_ITEM);
    nodeAPI->addChild(column, arcList);
    nodeAPI->addChild(arcList, item1);
    nodeAPI->addChild(arcList, item2);
    nodeAPI->addChild(arcList, item3);
    return arcList;
}
static napi_value TestArcListItemAutoScale001(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto arcList = CreateArcListItemAutoScale(column);
    auto item1 = nodeAPI->createNode(ARKUI_NODE_ARC_LIST_ITEM);
    nodeAPI->addChild(arcList, item1);
    int32_t itemAutoScale = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = itemAutoScale}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(item1, NODE_ARC_LIST_ITEM_AUTO_SCALE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(item1, NODE_ARC_LIST_ITEM_AUTO_SCALE);
    ASSERT_EQ(result->value[PARAM_0].i32, itemAutoScale);
    NAPI_END;
}

static napi_value TestArcListItemAutoScale002(napi_env env, napi_callback_info info)
{
    NAPI_START(column, ARKUI_NODE_COLUMN);
    auto arcList = CreateArcListItemAutoScale(column);
    auto item1 = nodeAPI->createNode(ARKUI_NODE_ARC_LIST_ITEM);
    nodeAPI->addChild(arcList, item1);
    int32_t itemAutoScale = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = itemAutoScale}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(item1, NODE_ARC_LIST_ITEM_AUTO_SCALE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(item1, NODE_ARC_LIST_ITEM_AUTO_SCALE);
    ASSERT_EQ(result->value[PARAM_0].i32, itemAutoScale);
    NAPI_END;
}

static napi_value TestArcListItemAutoScale003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto ret1 = nodeAPI->resetAttribute(arcList, NODE_ARC_LIST_ITEM_AUTO_SCALE);
    ASSERT_EQ(ret1, SUCCESS);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_ITEM_AUTO_SCALE);
    ASSERT_EQ(result->value[PARAM_0].i32, PARAM_1);
    NAPI_END;
}

} // namespace ArkUICapiTest