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

static napi_value TestArcListItemAutoScaleSet001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t itemAutoScale = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = itemAutoScale}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_ITEM_AUTO_SCALE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(arcList, NODE_ARC_LIST_ITEM_AUTO_SCALE)->value[PARAM_0].i32, itemAutoScale);
    NAPI_END;
}

static napi_value TestArcListItemAutoScaleSet002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t itemAutoScale = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = itemAutoScale}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_ITEM_AUTO_SCALE, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(arcList, NODE_ARC_LIST_ITEM_AUTO_SCALE)->value[PARAM_0].i32, itemAutoScale);
    NAPI_END;
}

static napi_value TestArcListItemAutoScaleGet001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t itemAutoScale = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = itemAutoScale}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(arcList, NODE_ARC_LIST_ITEM_AUTO_SCALE, &item);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_ITEM_AUTO_SCALE);
    ASSERT_EQ(result->value[PARAM_0].i32, itemAutoScale);
    NAPI_END;
}

static napi_value TestArcListItemAutoScaleGet002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_ITEM_AUTO_SCALE);
    ASSERT_EQ(result->value[PARAM_0].i32, PARAM_1);
    NAPI_END;
}

} // namespace ArkUICapiTest