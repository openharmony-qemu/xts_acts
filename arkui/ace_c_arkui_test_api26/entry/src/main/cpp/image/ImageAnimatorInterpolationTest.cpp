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

// NODE_IMAGE_ANIMATOR_INTERPOLATION (value 19007) is introduced in API 26.0.1.
// It may not be defined in earlier SDK headers; define a local alias for compatibility.
#ifndef NODE_IMAGE_ANIMATOR_INTERPOLATION
#define NODE_IMAGE_ANIMATOR_INTERPOLATION static_cast<ArkUI_NodeAttributeType>(19007)
#endif

static napi_value TestImageAnimatorInterpolation001(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    int32_t interpolation = ARKUI_IMAGE_INTERPOLATION_NONE;
    ArkUI_NumberValue value[] = {{.i32 = interpolation}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result->value[PARAM_0].i32, interpolation);
    NAPI_END;
}

static napi_value TestImageAnimatorInterpolation002(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    int32_t interpolation = ARKUI_IMAGE_INTERPOLATION_LOW;
    ArkUI_NumberValue value[] = {{.i32 = interpolation}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result->value[PARAM_0].i32, interpolation);
    NAPI_END;
}

static napi_value TestImageAnimatorInterpolation003(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    int32_t interpolation = ARKUI_IMAGE_INTERPOLATION_MEDIUM;
    ArkUI_NumberValue value[] = {{.i32 = interpolation}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result->value[PARAM_0].i32, interpolation);
    NAPI_END;
}

static napi_value TestImageAnimatorInterpolation004(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    int32_t interpolation = ARKUI_IMAGE_INTERPOLATION_HIGH;
    ArkUI_NumberValue value[] = {{.i32 = interpolation}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result->value[PARAM_0].i32, interpolation);
    NAPI_END;
}

static napi_value TestImageAnimatorInterpolation005(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    auto result = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result->value[PARAM_0].i32, ARKUI_IMAGE_INTERPOLATION_LOW);
    NAPI_END;
}

static napi_value TestImageAnimatorInterpolation006(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    auto ret = nodeAPI->resetAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result->value[PARAM_0].i32, ARKUI_IMAGE_INTERPOLATION_LOW);
    NAPI_END;
}

static napi_value TestImageAnimatorInterpolation007(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    int32_t interpolation = ARKUI_IMAGE_INTERPOLATION_HIGH;
    ArkUI_NumberValue value[] = {{.i32 = interpolation}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret1 = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION, &item);
    ASSERT_EQ(ret1, SUCCESS);
    auto result1 = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result1->value[PARAM_0].i32, interpolation);
    auto ret2 = nodeAPI->resetAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(ret2, SUCCESS);
    auto result2 = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result2->value[PARAM_0].i32, ARKUI_IMAGE_INTERPOLATION_LOW);
    NAPI_END;
}

static napi_value TestImageAnimatorInterpolation008(napi_env env, napi_callback_info info)
{
    NAPI_START(imageAnimator, ARKUI_NODE_IMAGE_ANIMATOR);
    int32_t interpolationNone = ARKUI_IMAGE_INTERPOLATION_NONE;
    ArkUI_NumberValue valueNone[] = {{.i32 = interpolationNone}};
    ArkUI_AttributeItem itemNone = {valueNone, sizeof(valueNone) / sizeof(ArkUI_NumberValue)};
    auto ret1 = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION, &itemNone);
    ASSERT_EQ(ret1, SUCCESS);
    auto result1 = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result1->value[PARAM_0].i32, interpolationNone);

    int32_t interpolationMedium = ARKUI_IMAGE_INTERPOLATION_MEDIUM;
    ArkUI_NumberValue valueMedium[] = {{.i32 = interpolationMedium}};
    ArkUI_AttributeItem itemMedium = {valueMedium, sizeof(valueMedium) / sizeof(ArkUI_NumberValue)};
    auto ret2 = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION, &itemMedium);
    ASSERT_EQ(ret2, SUCCESS);
    auto result2 = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result2->value[PARAM_0].i32, interpolationMedium);

    int32_t interpolationHigh = ARKUI_IMAGE_INTERPOLATION_HIGH;
    ArkUI_NumberValue valueHigh[] = {{.i32 = interpolationHigh}};
    ArkUI_AttributeItem itemHigh = {valueHigh, sizeof(valueHigh) / sizeof(ArkUI_NumberValue)};
    auto ret3 = nodeAPI->setAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION, &itemHigh);
    ASSERT_EQ(ret3, SUCCESS);
    auto result3 = nodeAPI->getAttribute(imageAnimator, NODE_IMAGE_ANIMATOR_INTERPOLATION);
    ASSERT_EQ(result3->value[PARAM_0].i32, interpolationHigh);
    NAPI_END;
}

} // namespace ArkUICapiTest
