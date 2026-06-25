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
#include "common/common.h"
#include "manager/PluginManagerTest.h"
#include <arkui/native_render.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_node.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value TextInputGradientTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float angle = PARAM_90_POINT_0;
    ArkUI_LinearGradientDirection direction = ArkUI_LinearGradientDirection(PARAM_4);
    int32_t flag = PARAM_0;
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    ArkUI_ColorStop colorStop = { .colors = colors, .stops = stops, .size = PARAM_3 };
    ArkUI_NumberValue value[] = { { .f32 = angle }, { .i32 = direction }, { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_3, .object = &colorStop };
    int32_t setResult = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_LINEAR_GRADIENT, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_INPUT_LINEAR_GRADIENT TextInputGradientTest_001 setResult=%{public}d",
        setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_LINEAR_GRADIENT);
    ASSERT_EQ(itemptr->value[1].i32, direction);
    ASSERT_EQ(itemptr->value[2].i32, flag);
    NAPI_END(textInput);
}

static napi_value TextInputGradientTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(textInput, ARKUI_NODE_TEXT_INPUT);
    float x = PARAM_90_POINT_0;
    float y = PARAM_90_POINT_0;
    float radius = PARAM_90_POINT_0;
    int32_t flag = PARAM_0;
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    ArkUI_ColorStop colorStop = { .colors = colors, .stops = stops, .size = PARAM_3 };
    ArkUI_NumberValue value[] = { { .f32 = x }, { .f32 = y }, { .f32 = radius }, { .i32 = flag } };
    ArkUI_AttributeItem item = { .value = value, .size = PARAM_4, .object = &colorStop };
    int32_t setResult = nodeAPI->setAttribute(textInput, NODE_TEXT_INPUT_RADIAL_GRADIENT, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_INPUT_RADIAL_GRADIENT TextInputGradientTest_002 setResult=%{public}d",
        setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(textInput, NODE_TEXT_INPUT_RADIAL_GRADIENT);
    ASSERT_EQ(itemptr->value[3].i32, flag);
    NAPI_END(textInput);
}

}