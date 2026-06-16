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

static napi_value TestArcListDigitalCrownSensitivitySet001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t sensitivity = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = sensitivity}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY)->value[PARAM_0].i32, sensitivity);
    NAPI_END;
}

static napi_value TestArcListDigitalCrownSensitivitySet002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t sensitivity = PARAM_2;
    ArkUI_NumberValue value[] = {{.i32 = sensitivity}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY, &item);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(nodeAPI->getAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY)->value[PARAM_0].i32, sensitivity);
    NAPI_END;
}

static napi_value TestArcListDigitalCrownSensitivitySet003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t sensitivity = PARAM_NEGATIVE_1;
    ArkUI_NumberValue value[] = {{.i32 = sensitivity}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY, &item);
    ASSERT_EQ(ret, INVALID_PARAM);
    NAPI_END;
}

static napi_value TestArcListDigitalCrownSensitivityGet001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t sensitivity = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = sensitivity}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY, &item);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY);
    ASSERT_EQ(result->value[PARAM_0].i32, sensitivity);
    NAPI_END;
}

static napi_value TestArcListDigitalCrownSensitivityGet002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY);
    ASSERT_EQ(result != nullptr, true);
    NAPI_END;
}

} // namespace ArkUICapiTest