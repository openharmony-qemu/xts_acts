/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

#define PARAM_1002029 1002029

namespace ArkUICapiTest {

static napi_value ScrollBarHeightTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "ScrollBarHeightTest_001 result=%{public}d", NODE_SCROLL_BAR_HEIGHT);
    ASSERT_EQ(NODE_SCROLL_BAR_HEIGHT, PARAM_1002029);
    NAPI_END;
}

static napi_value ScrollBarHeightTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);

    ArkUI_NumberValue value[] = {{.f32 = SIZE_10}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_HEIGHT, &value_item);
    auto ret1 = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_HEIGHT)->value[PARAM_0].f32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SIZE_10);
    NAPI_END;
}

static napi_value ScrollBarHeightTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);

    ArkUI_NumberValue value[] = {{.f32 = SIZE_20}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_HEIGHT, &value_item);
    auto ret1 = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_HEIGHT)->value[PARAM_0].f32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, SIZE_20);
    NAPI_END;
}

static napi_value ScrollBarHeightTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(scroll, ARKUI_NODE_SCROLL);
    float emptyBranch = 0.0f;
    ArkUI_NumberValue value[] = {{.f32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(scroll, NODE_SCROLL_BAR_HEIGHT, &valueItem);
    auto ret1 = nodeAPI->getAttribute(scroll, NODE_SCROLL_BAR_HEIGHT)->value[PARAM_0].f32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, emptyBranch);
    NAPI_END;
}
}