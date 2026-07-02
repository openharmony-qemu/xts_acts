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
#include <arkui/native_type.h>
#include <arkui/styled_string.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value RadialGradientTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_RadialGradientOptions_SetCenterX(radialGradientOptions, PARAM_0_POINT_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_002 SetCenterX ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_RadialGradientOptions_SetCenterX(nullptr, PARAM_0_POINT_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_003 SetCenterX nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    OH_ArkUI_RadialGradientOptions_SetCenterX(radialGradientOptions, PARAM_0_POINT_5);
    float centerX = PARAM_0;
    auto ret = OH_ArkUI_RadialGradientOptions_GetCenterX(radialGradientOptions, &centerX);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_004 GetCenterX ret=%{public}d centerX=%{public}f", ret, centerX);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float centerX = PARAM_0;
    auto ret = OH_ArkUI_RadialGradientOptions_GetCenterX(nullptr, &centerX);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_005 GetCenterX nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_RadialGradientOptions_GetCenterX(radialGradientOptions, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_006 GetCenterX nullptr centerX ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_RadialGradientOptions_SetCenterY(radialGradientOptions, PARAM_0_POINT_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_007 SetCenterY ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_RadialGradientOptions_SetCenterY(nullptr, PARAM_0_POINT_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_008 SetCenterY nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    OH_ArkUI_RadialGradientOptions_SetCenterY(radialGradientOptions, PARAM_0_POINT_5);
    float centerY = PARAM_0;
    auto ret = OH_ArkUI_RadialGradientOptions_GetCenterY(radialGradientOptions, &centerY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_009 GetCenterY ret=%{public}d centerY=%{public}f", ret, centerY);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float centerY = PARAM_0;
    auto ret = OH_ArkUI_RadialGradientOptions_GetCenterY(nullptr, &centerY);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_010 GetCenterY nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_RadialGradientOptions_GetCenterY(radialGradientOptions, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_011 GetCenterY nullptr centerY ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_RadialGradientOptions_SetRadius(radialGradientOptions, PARAM_0_POINT_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_012 SetRadius ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_013(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_RadialGradientOptions_SetRadius(nullptr, PARAM_0_POINT_5);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_013 SetRadius nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_014(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    OH_ArkUI_RadialGradientOptions_SetRadius(radialGradientOptions, PARAM_0_POINT_5);
    float radius = PARAM_0;
    auto ret = OH_ArkUI_RadialGradientOptions_GetRadius(radialGradientOptions, &radius);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_014 GetRadius ret=%{public}d radius=%{public}f", ret, radius);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_015(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float radius = PARAM_0;
    auto ret = OH_ArkUI_RadialGradientOptions_GetRadius(nullptr, &radius);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_015 GetRadius nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_016(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_RadialGradientOptions_GetRadius(radialGradientOptions, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_016 GetRadius nullptr radius ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_017(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_RadialGradientOptions_SetRepeating(radialGradientOptions, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_017 SetRepeating ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_018(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_RadialGradientOptions_SetRepeating(nullptr, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_018 SetRepeating nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_019(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    OH_ArkUI_RadialGradientOptions_SetRepeating(radialGradientOptions, true);
    bool repeating = false;
    auto ret = OH_ArkUI_RadialGradientOptions_GetRepeating(radialGradientOptions, &repeating);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_019 GetRepeating ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_020(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    bool repeating = false;
    auto ret = OH_ArkUI_RadialGradientOptions_GetRepeating(nullptr, &repeating);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_020 GetRepeating nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_021(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_RadialGradientOptions_GetRepeating(radialGradientOptions, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_021 GetRepeating nullptr repeating ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_022(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    auto ret = OH_ArkUI_RadialGradientOptions_SetColorStop(radialGradientOptions, colors, stops, PARAM_3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_022 SetColorStop ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_023(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    auto ret = OH_ArkUI_RadialGradientOptions_SetColorStop(nullptr, colors, stops, PARAM_3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_023 SetColorStop nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_024(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    auto ret = OH_ArkUI_RadialGradientOptions_SetColorStop(radialGradientOptions, nullptr, stops, PARAM_3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_024 SetColorStop nullptr colors ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_025(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    auto ret = OH_ArkUI_RadialGradientOptions_SetColorStop(radialGradientOptions, colors, nullptr, PARAM_3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_025 SetColorStop nullptr stops ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_026(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    OH_ArkUI_RadialGradientOptions_SetColorStop(radialGradientOptions, colors, stops, PARAM_3);
    uint32_t outColors[PARAM_3] = { PARAM_0 };
    float outStops[PARAM_3] = { PARAM_0 };
    int32_t writeLength = PARAM_0;
    auto ret = OH_ArkUI_RadialGradientOptions_GetColorStop(radialGradientOptions, outColors, outStops,
        PARAM_3, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_026 GetColorStop ret=%{public}d writeLength=%{public}d", ret, writeLength);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_027(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t outColors[PARAM_3] = { PARAM_0 };
    float outStops[PARAM_3] = { PARAM_0 };
    int32_t writeLength = PARAM_0;
    auto ret = OH_ArkUI_RadialGradientOptions_GetColorStop(nullptr, outColors, outStops,
        PARAM_3, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_027 GetColorStop nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value RadialGradientTest_028(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    ASSERT_EQ((paragraphStyle != nullptr), true);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    OH_ArkUI_RadialGradientOptions_SetCenterX(radialGradientOptions, PARAM_0_POINT_5);
    OH_ArkUI_RadialGradientOptions_SetCenterY(radialGradientOptions, PARAM_0_POINT_5);
    OH_ArkUI_RadialGradientOptions_SetRadius(radialGradientOptions, PARAM_0_POINT_5);
    OH_ArkUI_RadialGradientOptions_SetRepeating(radialGradientOptions, true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    OH_ArkUI_RadialGradientOptions_SetColorStop(radialGradientOptions, colors, stops, PARAM_3);
    auto ret = OH_ArkUI_ParagraphStyle_SetRadialGradient(paragraphStyle, radialGradientOptions);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_028 SetRadialGradient ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(text);
}

static napi_value RadialGradientTest_029(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_SetRadialGradient(nullptr, radialGradientOptions);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_029 SetRadialGradient nullptr paragraphStyle ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_030(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    ASSERT_EQ((paragraphStyle != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_SetRadialGradient(paragraphStyle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_030 SetRadialGradient nullptr radialGradient ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(text);
}

static napi_value RadialGradientTest_031(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    ASSERT_EQ((paragraphStyle != nullptr), true);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    OH_ArkUI_RadialGradientOptions_SetCenterX(radialGradientOptions, PARAM_0_POINT_5);
    OH_ArkUI_RadialGradientOptions_SetCenterY(radialGradientOptions, PARAM_0_POINT_5);
    OH_ArkUI_RadialGradientOptions_SetRadius(radialGradientOptions, PARAM_0_POINT_5);
    OH_ArkUI_RadialGradientOptions_SetRepeating(radialGradientOptions, true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    OH_ArkUI_RadialGradientOptions_SetColorStop(radialGradientOptions, colors, stops, PARAM_3);
    OH_ArkUI_ParagraphStyle_SetRadialGradient(paragraphStyle, radialGradientOptions);
    auto getGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((getGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_GetRadialGradient(paragraphStyle, getGradientOptions);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_031 GetRadialGradient ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    OH_ArkUI_RadialGradientOptions_Destroy(getGradientOptions);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(text);
}

static napi_value RadialGradientTest_032(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto radialGradientOptions = OH_ArkUI_RadialGradientOptions_Create();
    ASSERT_EQ((radialGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_GetRadialGradient(nullptr, radialGradientOptions);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_032 GetRadialGradient nullptr paragraphStyle ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_RadialGradientOptions_Destroy(radialGradientOptions);
    NAPI_END(text);
}

static napi_value RadialGradientTest_033(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    ASSERT_EQ((paragraphStyle != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_GetRadialGradient(paragraphStyle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "RadialGradientTest_033 GetRadialGradient nullptr radialGradient ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(text);
}

}