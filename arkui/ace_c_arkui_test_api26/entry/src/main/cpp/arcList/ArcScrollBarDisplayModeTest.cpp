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
#define PARAM_1021001 1021001

namespace ArkUICapiTest {

static napi_value TestArcScrollBarDisplayMode001(napi_env env, napi_callback_info info)
{
    NAPI_START(scrollBar, ARKUI_NODE_ARC_SCROLL_BAR);
    int32_t displayMode = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = displayMode}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scrollBar, NODE_ARC_SCROLL_BAR_DISPLAY_MODE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(scrollBar, NODE_ARC_SCROLL_BAR_DISPLAY_MODE);
    ASSERT_EQ(result->value[PARAM_0].i32, displayMode);
    NAPI_END;
}

static napi_value TestArcScrollBarDisplayMode002(napi_env env, napi_callback_info info)
{
    NAPI_START(scrollBar, ARKUI_NODE_ARC_SCROLL_BAR);
    int32_t displayMode = PARAM_2;
    ArkUI_NumberValue value[] = {{.i32 = displayMode}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scrollBar, NODE_ARC_SCROLL_BAR_DISPLAY_MODE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(scrollBar, NODE_ARC_SCROLL_BAR_DISPLAY_MODE);
    ASSERT_EQ(result->value[PARAM_0].i32, displayMode);
    NAPI_END;
}

static napi_value TestArcScrollBarDisplayMode003(napi_env env, napi_callback_info info)
{
    NAPI_START(scrollBar, ARKUI_NODE_ARC_SCROLL_BAR);
    int32_t displayMode = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = displayMode}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scrollBar, NODE_ARC_SCROLL_BAR_DISPLAY_MODE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(scrollBar, NODE_ARC_SCROLL_BAR_DISPLAY_MODE);
    ASSERT_EQ(result->value[PARAM_0].i32, displayMode);
    NAPI_END;
}

static napi_value TestArcScrollBarDisplayMode004(napi_env env, napi_callback_info info)
{
    NAPI_START(scrollBar, ARKUI_NODE_ARC_SCROLL_BAR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
      "TestArcScrollBarDisplayMode004 result=%{public}d", NODE_ARC_SCROLL_BAR_DISPLAY_MODE);
    ASSERT_EQ(NODE_ARC_SCROLL_BAR_DISPLAY_MODE, PARAM_1021001);
    NAPI_END;
}

} // namespace ArkUICapiTest