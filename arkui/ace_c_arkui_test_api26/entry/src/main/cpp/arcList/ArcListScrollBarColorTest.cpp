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

static napi_value TestArcListScrollBarColor001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    uint32_t scrollBarColor = COLOR_RED;
    ArkUI_NumberValue value[] = {{.u32 = scrollBarColor}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR_COLOR);
    ASSERT_EQ(result->value[PARAM_0].u32, scrollBarColor);
    NAPI_END;
}

static napi_value TestArcListScrollBarColor002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    uint32_t scrollBarColor = COLOR_BLUE;
    ArkUI_NumberValue value[] = {{.u32 = scrollBarColor}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR_COLOR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR_COLOR);
    ASSERT_EQ(result->value[PARAM_0].u32, scrollBarColor);
    NAPI_END;
}

static napi_value TestArcListScrollBarColor003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    uint32_t scrollBarColor = COLOR_GREEN;
    ArkUI_NumberValue value[] = {{.u32 = scrollBarColor}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR_COLOR, &item);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR_COLOR);
    ASSERT_EQ(result->value[PARAM_0].u32, scrollBarColor);
    NAPI_END;
}

} // namespace ArkUICapiTest