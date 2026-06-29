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

#define PARAM_1013016 1013016

namespace ArkUICapiTest {

static napi_value GridEnableEditModeTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "GridEnableEditModeTest_001 result=%{public}d", NODE_GRID_ENABLE_EDIT_MODE);
    ASSERT_EQ(NODE_GRID_ENABLE_EDIT_MODE, PARAM_1013016);
    NAPI_END;
}

static napi_value GridEnableEditModeTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {{.i32 = true}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_ENABLE_EDIT_MODE, &value_item);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_ENABLE_EDIT_MODE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, true);
    NAPI_END;
}

static napi_value GridEnableEditModeTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {{.i32 = false}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_ENABLE_EDIT_MODE, &value_item);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_ENABLE_EDIT_MODE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
}

static napi_value GridEnableEditModeTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    int32_t emptyBranch = napi_undefined;
    ArkUI_NumberValue value[] = {{.i32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_ENABLE_EDIT_MODE, &valueItem);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_ENABLE_EDIT_MODE)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, false);
    NAPI_END;
}
}