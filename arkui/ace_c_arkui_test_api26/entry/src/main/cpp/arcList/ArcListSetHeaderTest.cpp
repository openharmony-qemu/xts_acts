/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

static napi_value TestArcListSetHeader001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto header = nodeAPI->createNode(ARKUI_NODE_COLUMN);
    ArkUI_AttributeItem item = {.object = header};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_SET_HEADER, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListSetHeader002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto header = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem item = {.object = header};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_SET_HEADER, &item);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListSetHeader003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto text = nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem content_item = {};
    content_item.string = "Test attribute of the C API";
    nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &content_item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "create text = %{public}p", &text);

    ArkUI_AttributeItem item = {.object = text};
    auto ret nodeAPI->setAttribute(arcList, NODE_ARC_LIST_SET_HEADER, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "create item = %{public}p object = %{public}p",
     &item, item.object);
    auto header = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_SET_HEADER);
    auto headertext = nodeAPI->getAttribute(static_cast<ArkUI_NodeHandle>(header->object), NODE_TEXT_CONTENT);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "arcListTest", "headertext = %{public}s", headertext->string);

    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListSetHeader004(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto ret1 = nodeAPI->resetAttribute(arcList, NODE_ARC_LIST_SET_HEADER);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_SET_HEADER);
    ASSERT_EQ(ret1, SUCCESS);
    ASSERT_EQ(result, nullptr);
    NAPI_END;
}

} // namespace ArkUICapiTest