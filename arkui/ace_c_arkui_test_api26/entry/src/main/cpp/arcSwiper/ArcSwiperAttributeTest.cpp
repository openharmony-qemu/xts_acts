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
 
static napi_value TestArcSwiperDuration001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t duration = PARAM_1000;
    ArkUI_NumberValue value[] = {{.i32 = duration}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_DURATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DURATION);
    ASSERT_EQ(result->value[PARAM_0].i32, duration);
    NAPI_END;
}
 
static napi_value TestArcSwiperDuration002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t duration = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = duration}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_DURATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DURATION);
    ASSERT_EQ(result->value[PARAM_0].i32, duration);
    NAPI_END;
}
 
static napi_value TestArcSwiperDuration003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    auto ret1 = nodeAPI->resetAttribute(arcSwiper, NODE_ARC_SWIPER_DURATION);
    ASSERT_EQ(ret1, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DURATION);
    ASSERT_EQ(result->value[PARAM_0].i32, SIZE_400);
    NAPI_END;
}
 
static napi_value TestArcSwiperEffectMode001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t effectMode = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = effectMode}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_EFFECT_MODE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_EFFECT_MODE);
    ASSERT_EQ(result->value[PARAM_0].i32, effectMode);
    NAPI_END;
}
 
static napi_value TestArcSwiperEffectMode002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t effectMode = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = effectMode}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_EFFECT_MODE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_EFFECT_MODE);
    ASSERT_EQ(result->value[PARAM_0].i32, effectMode);
    NAPI_END;
}
 
static napi_value TestArcSwiperVertical001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t vertical = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = vertical}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_VERTICAL, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_VERTICAL);
    ASSERT_EQ(result->value[PARAM_0].i32, vertical);
    NAPI_END;
}
 
static napi_value TestArcSwiperVertical002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t vertical = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = vertical}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_VERTICAL, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_VERTICAL);
    ASSERT_EQ(result->value[PARAM_0].i32, vertical);
    NAPI_END;
}
 
static napi_value TestArcSwiperIndicator001(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto arcSwiper = nodeAPI->createNode(ARKUI_NODE_ARC_SWIPER);
    int isShow = true;
    int direction = OH_ARKUI_ARCDIRECTION_THREE_CLOCK_DIRECTION;
    uint32_t unSelectedColor = 0xff0000ff;
    uint32_t selectedColor = 0xFF3D9DB4;
    uint32_t backgroundColor = COLOR_YELLOW;
    uint32_t colors[] = {0xffff0000, 0xffffff00, 0xffffffff};
    float stops[] = {0.0, 0.5, 1.0};
    ArkUI_ColorStop colorStop{colors, stops, 3};
    ArkUI_NumberValue value[] = { 
        { .i32 = isShow }, 
        { .i32 = direction },
        { .u32 = unSelectedColor }, 
        { .u32 = selectedColor }, 
        { .u32 = backgroundColor } 
    };
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto setResult = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_INDICATOR, &valueItem);
    ASSERT_EQ(setResult, SUCCESS);
    NAPI_END;
}
 
static napi_value TestArcSwiperIndicator002(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto arcSwiper = nodeAPI->createNode(ARKUI_NODE_ARC_SWIPER);
    int isShow = true;
    int direction = OH_ARKUI_ARCDIRECTION_SIX_CLOCK_DIRECTION;
    uint32_t unSelectedColor = COLOR_GRAY;
    uint32_t selectedColor = COLOR_RED;
    uint32_t backgroundColor = COLOR_YELLOW;
    uint32_t colors[] = {0xffff0000, 0xffffff00, 0xffffffff};
    float stops[] = {0.0, 0.5, 1.0};
    ArkUI_ColorStop colorStop{colors, stops, 3};
    ArkUI_NumberValue value[] = { 
        { .i32 = isShow }, 
        { .i32 = direction },
        { .u32 = unSelectedColor }, 
        { .u32 = selectedColor }, 
        { .u32 = backgroundColor } 
    };
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto setResult = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_INDICATOR, &valueItem);
    ASSERT_EQ(setResult, SUCCESS);
    NAPI_END;
}
 
static napi_value TestArcSwiperIndicator003(napi_env env, napi_callback_info info)
{
    ArkUI_NativeNodeAPI_1 *nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto arcSwiper = nodeAPI->createNode(ARKUI_NODE_ARC_SWIPER);
    int isShow = false;
    int direction = OH_ARKUI_ARCDIRECTION_NINE_CLOCK_DIRECTION;
    uint32_t unSelectedColor = 0xff0000ff;
    uint32_t selectedColor = 0xFF3D9DB4;
    uint32_t backgroundColor = 0xff00ff00;
    uint32_t colors[] = {0xffff0000, 0xffffff00, 0xffffffff};
    float stops[] = {0.0, 0.5, 1.0};
    ArkUI_ColorStop colorStop{colors, stops, 3};
    ArkUI_NumberValue value[] = { 
        { .i32 = isShow }, 
        { .i32 = direction },
        { .u32 = unSelectedColor }, 
        { .u32 = selectedColor }, 
        { .u32 = backgroundColor } 
    };
    ArkUI_AttributeItem valueItem = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    valueItem.object = &colorStop;
    auto setResult = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_INDICATOR, &valueItem);
    ASSERT_EQ(setResult, SUCCESS);
    NAPI_END;
}
 
static napi_value TestArcSwiperDisableSwipe001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t disableSwipe = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = disableSwipe}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_SWIPE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_SWIPE);
    ASSERT_EQ(result->value[PARAM_0].i32, disableSwipe);
    NAPI_END;
}
 
static napi_value TestArcSwiperDisableSwipe002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t disableSwipe = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = disableSwipe}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_SWIPE, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_SWIPE);
    ASSERT_EQ(result->value[PARAM_0].i32, disableSwipe);
    NAPI_END;
}
 
static napi_value TestArcSwiperDisableTransitionAnimation001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t disableTransition = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = disableTransition}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_TRANSITION_ANIMATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_TRANSITION_ANIMATION);
    ASSERT_EQ(result->value[PARAM_0].i32, disableTransition);
    NAPI_END;
}
 
static napi_value TestArcSwiperDisableTransitionAnimation002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t disableTransition = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = disableTransition}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_TRANSITION_ANIMATION, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DISABLE_TRANSITION_ANIMATION);
    ASSERT_EQ(result->value[PARAM_0].i32, disableTransition);
    NAPI_END;
}
 
static napi_value TestArcSwiperDigitalCrownSensitivity001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t sensitivity = ARKUI_CROWN_SENSITIVITY_MEDIUM;
    ArkUI_NumberValue value[] = {{.i32 = sensitivity}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY, &item);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcSwiperDigitalCrownSensitivity001",
        "NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY = %{public}d", result->value[0].i32);
    ASSERT_EQ(ret, SUCCESS);
    ASSERT_EQ(result->value[PARAM_0].i32, sensitivity);
    NAPI_END;
}
 
static napi_value TestArcSwiperDigitalCrownSensitivity002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CROWN_SENSITIVITY_HIGH}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY, &item);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcSwiperDigitalCrownSensitivity002",
        "NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY = %{public}d", result->value[PARAM_0].i32);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
 
static napi_value TestArcSwiperDigitalCrownSensitivity003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    ArkUI_NumberValue value[] = {{.i32 = ARKUI_CROWN_SENSITIVITY_LOW}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY, &item);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "TestArcSwiperDigitalCrownSensitivity003",
        "NODE_ARC_SWIPER_DIGITAL_CROWN_SENSITIVITY = %{public}d", result->value[PARAM_0].i32);
    ASSERT_EQ(ret, SUCCESS);
    NAPI_END;
}
 
static napi_value TestArcSwiperIndex001(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t index = PARAM_0;
    ArkUI_NumberValue value[] = {{.i32 = index}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_INDEX, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_INDEX);
    ASSERT_EQ(result->value[PARAM_0].i32, index);
    NAPI_END;
}
 
static napi_value TestArcSwiperIndex002(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    int32_t index = PARAM_1;
    ArkUI_NumberValue value[] = {{.i32 = index}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    auto ret = nodeAPI->setAttribute(arcSwiper, NODE_ARC_SWIPER_INDEX, &item);
    ASSERT_EQ(ret, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_INDEX);
    ASSERT_EQ(result->value[PARAM_0].i32, index);
    NAPI_END;
}
 
static napi_value TestArcSwiperIndex003(napi_env env, napi_callback_info info)
{
    NAPI_START(arcSwiper, ARKUI_NODE_ARC_SWIPER);
    auto ret1 = nodeAPI->resetAttribute(arcSwiper, NODE_ARC_SWIPER_INDEX);
    ASSERT_EQ(ret1, SUCCESS);
    auto result = nodeAPI->getAttribute(arcSwiper, NODE_ARC_SWIPER_INDEX);
    ASSERT_EQ(result->value[PARAM_0].i32, PARAM_0);
    NAPI_END;
}
 
} // namespace ArkUICapiTest