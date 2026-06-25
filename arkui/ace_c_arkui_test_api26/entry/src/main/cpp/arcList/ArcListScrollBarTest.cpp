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

static napi_value TestArcListScrollBar001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t scrollBar = ARKUI_SCROLL_BAR_DISPLAY_MODE_AUTO;
    ArkUI_NumberValue value[] = {{.i32 = scrollBar}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR);
    ASSERT_EQ(result->value[PARAM_0].i32, scrollBar);
    NAPI_END;
}

static napi_value TestArcListScrollBar002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t scrollBar = ARKUI_SCROLL_BAR_DISPLAY_MODE_OFF;
    ArkUI_NumberValue value[] = {{.i32 = scrollBar}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR);
    ASSERT_EQ(result->value[PARAM_0].i32, scrollBar);
    NAPI_END;
}

static napi_value TestArcListScrollBar003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t scrollBar = ARKUI_SCROLL_BAR_DISPLAY_MODE_ON;
    ArkUI_NumberValue value[] = {{.i32 = scrollBar}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR);
    ASSERT_EQ(result->value[PARAM_0].i32, scrollBar);
    NAPI_END;
}

static napi_value TestArcListScrollBar004(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto ret1 = nodeAPI->resetAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR);
    ASSERT_EQ(ret1, SUCCESS);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_SCROLL_BAR);
    ASSERT_EQ(result->value[PARAM_0].i32, ARKUI_SCROLL_BAR_DISPLAY_MODE_AUTO);
    NAPI_END;
}

} // namespace ArkUICapiTest