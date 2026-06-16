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

#include "common/common.h"

namespace ArkUICapiTest {

static napi_value TestArcListFlingSpeedLimitSet001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    float flingSpeedLimit = PARAM_1000;
    ArkUI_NumberValue value[] = {{.f32 = flingSpeedLimit}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT)->value[PARAM_0].f32, flingSpeedLimit);
    NAPI_END;
}

static napi_value TestArcListFlingSpeedLimitSet002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    float flingSpeedLimit = PARAM_2000;
    ArkUI_NumberValue value[] = {{.f32 = flingSpeedLimit}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT)->value[PARAM_0].f32, flingSpeedLimit);
    NAPI_END;
}

static napi_value TestArcListFlingSpeedLimitSet003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    float flingSpeedLimit = PARAM_NEGATIVE_100;
    ArkUI_NumberValue value[] = {{.f32 = flingSpeedLimit}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestArcListFlingSpeedLimitGet001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    float flingSpeedLimit = PARAM_1000;
    ArkUI_NumberValue value[] = {{.f32 = flingSpeedLimit}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT, &item);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT);
    ASSERT_EQ(result->value[PARAM_0].f32, flingSpeedLimit);
    NAPI_END;
}

static napi_value TestArcListFlingSpeedLimitGet002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_FLING_SPEED_LIMIT);
    ASSERT_EQ(result->value[PARAM_0].f32, PARAM_1000);
    NAPI_END;
}

} // namespace ArkUICapiTest