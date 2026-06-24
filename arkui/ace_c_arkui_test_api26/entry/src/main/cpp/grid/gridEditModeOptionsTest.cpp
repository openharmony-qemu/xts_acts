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

#define PARAM_1013017 1013017
#define PARAM_1013009 1013009

namespace ArkUICapiTest {

static napi_value GridEditModeOptionsTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "GridEditModeOptionsTest_001 result=%{public}d", NODE_GRID_EDIT_MODE_OPTIONS);
    ASSERT_EQ(NODE_GRID_EDIT_MODE_OPTIONS, PARAM_1013017);
    NAPI_END;
}

static napi_value GridEditModeOptionsTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_GRID_EDIT_MODE_OPTION_DELETE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_EDIT_MODE_OPTIONS, &value_item);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_EDIT_MODE_OPTIONS)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_GRID_EDIT_MODE_OPTION_DELETE);
    NAPI_END;
}

static napi_value GridEditModeOptionsTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);

    ArkUI_NumberValue value[] = {{.i32 = ARKUI_GRID_EDIT_MODE_OPTION_NONE}};
    ArkUI_AttributeItem value_item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_EDIT_MODE_OPTIONS, &value_item);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_EDIT_MODE_OPTIONS)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_GRID_EDIT_MODE_OPTION_NONE);
    NAPI_END;
}

static napi_value GridEditModeOptionsTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    int32_t emptyBranch = napi_undefined;
    ArkUI_NumberValue value[] = {{.i32 = emptyBranch}};
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(grid, NODE_GRID_EDIT_MODE_OPTIONS, &valueItem);
    auto ret1 = nodeAPI->getAttribute(grid, NODE_GRID_EDIT_MODE_OPTIONS)->value[PARAM_0].i32;
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(ret1, ARKUI_GRID_EDIT_MODE_OPTION_NONE);
    NAPI_END;
}

static napi_value GridEditModeChangeTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(grid, ARKUI_NODE_GRID);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "GridEditModeChangeTest_001 result=%{public}d", NODE_GRID_ON_EDIT_MODE_CHANGE);
    ASSERT_EQ(NODE_GRID_ON_EDIT_MODE_CHANGE, PARAM_1013009);
    NAPI_END;
}
}