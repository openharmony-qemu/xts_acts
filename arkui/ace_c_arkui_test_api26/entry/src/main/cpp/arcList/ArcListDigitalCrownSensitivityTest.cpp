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

static napi_value TestArcListDigitalCrownSensitivity001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t sensitivity = ARKUI_CROWN_SENSITIVITY_MEDIUM;
    ArkUI_NumberValue value[] = {{.i32 = sensitivity}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY, &item);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListDigitalCrownSensitivity001",
        "NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY = %{public}d", result->value[0].i32);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(result->value[PARAM_0].i32, sensitivity);
    NAPI_END;
}

static napi_value TestArcListDigitalCrownSensitivity002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CROWN_SENSITIVITY_HIGH}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY, &item);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListDigitalCrownSensitivity002",
        "NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY = %{public}d", result->value[0].i32);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListDigitalCrownSensitivity003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CROWN_SENSITIVITY_LOW}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY, &item);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListDigitalCrownSensitivity003",
        "NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY = %{public}d", result->value[0].i32);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}

static napi_value TestArcListDigitalCrownSensitivity004(napi_env env, napi_callback_info info)
{
    NAPI_START(arcList, ARKUI_NODE_ARC_LIST);
    int32_t sensitivity = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = sensitivity}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY, &item);
    auto ret1 = nodeAPI->resetAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY);
    ASSERT_EQ(ret1, SUCCESS);
    auto result = nodeAPI->getAttribute(arcList, NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcListDigitalCrownSensitivity004",
        "NODE_ARC_LIST_DIGITAL_CROWN_SENSITIVITY = %{public}d", result->value[0].i32);
    ASSERT_EQ(result != nullptr, true);
    NAPI_END;
}

} // namespace ArkUICapiTest