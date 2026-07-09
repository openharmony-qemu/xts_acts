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
#include <thread>
#include <cstdint>
#include <string>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_render.h>

#define PARAM_1000 1000
#define PARAM_1019013 1019013

namespace ArkUICapiTest {

static napi_value TestArcListFlingSpeedLimit001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    float flingSpeedLimit = PARAM_200;
    ArkUI_NumberValue value[] = {{.f32 = flingSpeedLimit}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT, &item);
    ASSERT_EQ(ret, SUCCESS);
    std::this_thread::sleep_for(std::chrono::seconds(PARAM_1));
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT);
    ASSERT_EQ(result->value[PARAM_0].f32, flingSpeedLimit);
    NAPI_END;
}

static napi_value TestArcListFlingSpeedLimit002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    float flingSpeedLimit = PARAM_1000;
    ArkUI_NumberValue value[] = {{.f32 = flingSpeedLimit}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT, &item);
    ASSERT_EQ(ret, SUCCESS);
    std::this_thread::sleep_for(std::chrono::seconds(PARAM_1));
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT);
    ASSERT_EQ(result->value[PARAM_0].f32, flingSpeedLimit);
    NAPI_END;
}

static napi_value TestArcListFlingSpeedLimit003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto ret1 = nodeAPI->resetAttribute(arcList, NODE_ARC_LIST_FADING_EDGE);
    ASSERT_EQ(ret1, SUCCESS);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT);
    ASSERT_EQ(result != nullptr, true);
    NAPI_END;
}

static napi_value TestArcListFlingSpeedLimit004(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
      "TestArcListFlingSpeedLimit004 result=%{public}d", NODE_ARC_LIST_FLING_SPEED_LIMIT);
    ASSERT_EQ(NODE_ARC_LIST_FLING_SPEED_LIMIT, PARAM_1019013);
    NAPI_END;
}

} // namespace ArkUICapiTest