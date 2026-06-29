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

static napi_value LinearGradientTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_LinearGradientOptions_SetAngle(linearGradientOptions, PARAM_90_POINT_0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_002 SetAngle ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_LinearGradientOptions_SetAngle(nullptr, PARAM_90_POINT_0);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_003 SetAngle nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LinearGradientTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    OH_ArkUI_LinearGradientOptions_SetAngle(linearGradientOptions, PARAM_90_POINT_0);
    float angle = PARAM_0;
    auto ret = OH_ArkUI_LinearGradientOptions_GetAngle(linearGradientOptions, &angle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_004 GetAngle ret=%{public}d angle=%{public}f", ret, angle);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    float angle = PARAM_0;
    auto ret = OH_ArkUI_LinearGradientOptions_GetAngle(nullptr, &angle);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_005 GetAngle nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LinearGradientTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_LinearGradientOptions_GetAngle(linearGradientOptions, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_006 GetAngle nullptr angle ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_LinearGradientOptions_SetDirection(linearGradientOptions,
        ArkUI_LinearGradientDirection(PARAM_4));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_007 SetDirection ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_LinearGradientOptions_SetDirection(nullptr,
        ArkUI_LinearGradientDirection(PARAM_4));
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_008 SetDirection nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LinearGradientTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    OH_ArkUI_LinearGradientOptions_SetDirection(linearGradientOptions,
        ArkUI_LinearGradientDirection(PARAM_4));
    ArkUI_LinearGradientDirection direction = ArkUI_LinearGradientDirection(PARAM_0);
    auto ret = OH_ArkUI_LinearGradientOptions_GetDirection(linearGradientOptions, &direction);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_009 GetDirection ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_LinearGradientDirection direction = ArkUI_LinearGradientDirection(PARAM_0);
    auto ret = OH_ArkUI_LinearGradientOptions_GetDirection(nullptr, &direction);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_010 GetDirection nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LinearGradientTest_011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_LinearGradientOptions_GetDirection(linearGradientOptions, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_011 GetDirection nullptr direction ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_LinearGradientOptions_SetRepeating(linearGradientOptions, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_012 SetRepeating ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_013(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto ret = OH_ArkUI_LinearGradientOptions_SetRepeating(nullptr, true);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_013 SetRepeating nullptr ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LinearGradientTest_014(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    OH_ArkUI_LinearGradientOptions_SetRepeating(linearGradientOptions, true);
    bool repeating = false;
    auto ret = OH_ArkUI_LinearGradientOptions_GetRepeating(linearGradientOptions, &repeating);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_014 GetRepeating ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_015(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    bool repeating = false;
    auto ret = OH_ArkUI_LinearGradientOptions_GetRepeating(nullptr, &repeating);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_015 GetRepeating nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LinearGradientTest_016(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_LinearGradientOptions_GetRepeating(linearGradientOptions, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_016 GetRepeating nullptr repeating ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_017(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    auto ret = OH_ArkUI_LinearGradientOptions_SetColorStop(linearGradientOptions, colors, stops, PARAM_3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_017 SetColorStop ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_018(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    auto ret = OH_ArkUI_LinearGradientOptions_SetColorStop(nullptr, colors, stops, PARAM_3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_018 SetColorStop nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LinearGradientTest_019(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    auto ret = OH_ArkUI_LinearGradientOptions_SetColorStop(linearGradientOptions, nullptr, stops, PARAM_3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_019 SetColorStop nullptr colors ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_020(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    auto ret = OH_ArkUI_LinearGradientOptions_SetColorStop(linearGradientOptions, colors, nullptr, PARAM_3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_020 SetColorStop nullptr stops ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_021(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    OH_ArkUI_LinearGradientOptions_SetColorStop(linearGradientOptions, colors, stops, PARAM_3);
    uint32_t outColors[PARAM_3] = { PARAM_0 };
    float outStops[PARAM_3] = { PARAM_0 };
    int32_t writeLength = PARAM_0;
    auto ret = OH_ArkUI_LinearGradientOptions_GetColorStop(linearGradientOptions, outColors, outStops,
        PARAM_3, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_021 GetColorStop ret=%{public}d writeLength=%{public}d", ret, writeLength);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_022(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    uint32_t outColors[PARAM_3] = { PARAM_0 };
    float outStops[PARAM_3] = { PARAM_0 };
    int32_t writeLength = PARAM_0;
    auto ret = OH_ArkUI_LinearGradientOptions_GetColorStop(nullptr, outColors, outStops,
        PARAM_3, &writeLength);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_022 GetColorStop nullptr options ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value LinearGradientTest_023(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    ASSERT_EQ((paragraphStyle != nullptr), true);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(text);
}

static napi_value LinearGradientTest_024(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    ASSERT_EQ((paragraphStyle != nullptr), true);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    OH_ArkUI_LinearGradientOptions_SetAngle(linearGradientOptions, PARAM_90_POINT_0);
    OH_ArkUI_LinearGradientOptions_SetDirection(linearGradientOptions,
        ArkUI_LinearGradientDirection(PARAM_4));
    OH_ArkUI_LinearGradientOptions_SetRepeating(linearGradientOptions, true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    OH_ArkUI_LinearGradientOptions_SetColorStop(linearGradientOptions, colors, stops, PARAM_3);
    auto ret = OH_ArkUI_ParagraphStyle_SetLinearGradient(paragraphStyle, linearGradientOptions);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_024 SetLinearGradient ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(text);
}

static napi_value LinearGradientTest_025(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_SetLinearGradient(nullptr, linearGradientOptions);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_025 SetLinearGradient nullptr paragraphStyle ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_026(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    ASSERT_EQ((paragraphStyle != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_SetLinearGradient(paragraphStyle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_026 SetLinearGradient nullptr linearGradient ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(text);
}

static napi_value LinearGradientTest_027(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    ASSERT_EQ((paragraphStyle != nullptr), true);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    OH_ArkUI_LinearGradientOptions_SetAngle(linearGradientOptions, PARAM_90_POINT_0);
    OH_ArkUI_LinearGradientOptions_SetDirection(linearGradientOptions,
        ArkUI_LinearGradientDirection(PARAM_4));
    OH_ArkUI_LinearGradientOptions_SetRepeating(linearGradientOptions, true);
    uint32_t colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE };
    float stops[] = { PARAM_0_POINT_2, PARAM_0_POINT_5, PARAM_1_POINT_0 };
    OH_ArkUI_LinearGradientOptions_SetColorStop(linearGradientOptions, colors, stops, PARAM_3);
    OH_ArkUI_ParagraphStyle_SetLinearGradient(paragraphStyle, linearGradientOptions);
    auto getGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((getGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_GetLinearGradient(paragraphStyle, getGradientOptions);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_027 GetLinearGradient ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_NO_ERROR);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    OH_ArkUI_LinearGradientOptions_Destroy(getGradientOptions);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(text);
}

static napi_value LinearGradientTest_028(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto linearGradientOptions = OH_ArkUI_LinearGradientOptions_Create();
    ASSERT_EQ((linearGradientOptions != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_GetLinearGradient(nullptr, linearGradientOptions);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_028 GetLinearGradient nullptr paragraphStyle ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_LinearGradientOptions_Destroy(linearGradientOptions);
    NAPI_END(text);
}

static napi_value LinearGradientTest_029(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    auto paragraphStyle = OH_ArkUI_ParagraphStyle_Create();
    ASSERT_EQ((paragraphStyle != nullptr), true);
    auto ret = OH_ArkUI_ParagraphStyle_GetLinearGradient(paragraphStyle, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "LinearGradientTest_029 GetLinearGradient nullptr linearGradient ret=%{public}d", ret);
    ASSERT_EQ(ret, ARKUI_ERROR_CODE_PARAM_INVALID);
    OH_ArkUI_ParagraphStyle_Destroy(paragraphStyle);
    NAPI_END(text);
}

}