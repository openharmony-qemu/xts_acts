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
#include <arkui/native_node.h>
#include <arkui/node_attributes/text_common.h>
#include <hilog/log.h>

namespace ArkUICapiTest {

static napi_value TextStrokeTest_001(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .f32 = PARAM_5 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_WIDTH, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_WIDTH TextStrokeTest_001 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_WIDTH);
    ASSERT_EQ(itemptr->value[0].f32, PARAM_5);
    NAPI_END(text);
}

static napi_value TextStrokeTest_002(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .f32 = PARAM_0 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_WIDTH, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_WIDTH TextStrokeTest_002 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_WIDTH);
    ASSERT_EQ(itemptr->value[0].f32, PARAM_0);
    NAPI_END(text);
}

static napi_value TextStrokeTest_003(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .f32 = PARAM_NEGATIVE_1 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_WIDTH, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_WIDTH TextStrokeTest_003 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_WIDTH);
    ASSERT_EQ(itemptr->value[0].f32, PARAM_NEGATIVE_1);
    NAPI_END(text);
}

static napi_value TextStrokeTest_004(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .f32 = PARAM_100 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_WIDTH, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_WIDTH TextStrokeTest_004 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_WIDTH);
    ASSERT_EQ(itemptr->value[0].f32, PARAM_100);
    NAPI_END(text);
}

static napi_value TextStrokeTest_005(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .f32 = PARAM_10000 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_WIDTH, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_WIDTH TextStrokeTest_005 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_WIDTH);
    ASSERT_EQ(itemptr->value[0].f32, PARAM_10000);
    NAPI_END(text);
}

static napi_value TextStrokeTest_006(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem item = { nullptr, PARAM_0 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_WIDTH, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_WIDTH TextStrokeTest_006 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextStrokeTest_007(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_WIDTH, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_WIDTH TextStrokeTest_007 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextStrokeTest_008(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t setResult = nodeAPI->resetAttribute(text, NODE_TEXT_STROKE_WIDTH);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_WIDTH TextStrokeTest_008 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(text);
}

static napi_value TextStrokeTest_009(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_WIDTH);
    ASSERT_EQ(itemptr->value[0].f32, PARAM_0);
    NAPI_END(text);
}

static napi_value TextStrokeTest_010(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .f32 = PARAM_5 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_WIDTH, &item);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    int32_t resetResult = nodeAPI->resetAttribute(text, NODE_TEXT_STROKE_WIDTH);
    ASSERT_EQ(resetResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_WIDTH);
    ASSERT_EQ(itemptr->value[0].f32, PARAM_0);
    NAPI_END(text);
}

static napi_value TextStrokeTest_011(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .u32 = COLOR_RED }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_COLOR, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_COLOR TextStrokeTest_011 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_COLOR);
    ASSERT_EQ(itemptr->value[0].u32, COLOR_RED);
    NAPI_END(text);
}

static napi_value TextStrokeTest_012(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .u32 = COLOR_BLUE }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_COLOR, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_COLOR TextStrokeTest_012 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_COLOR);
    ASSERT_EQ(itemptr->value[0].u32, COLOR_BLUE);
    NAPI_END(text);
}

static napi_value TextStrokeTest_013(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .u32 = COLOR_BLACK }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_COLOR, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_COLOR TextStrokeTest_013 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_COLOR);
    ASSERT_EQ(itemptr->value[0].u32, COLOR_BLACK);
    NAPI_END(text);
}

static napi_value TextStrokeTest_014(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .u32 = COLOR_WHITE }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_COLOR, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_COLOR TextStrokeTest_014 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_COLOR);
    ASSERT_EQ(itemptr->value[0].u32, COLOR_WHITE);
    NAPI_END(text);
}

static napi_value TextStrokeTest_015(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .u32 = COLOR_ILLEGAL }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_COLOR, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_COLOR TextStrokeTest_015 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_COLOR);
    ASSERT_EQ(itemptr->value[0].u32, COLOR_ILLEGAL);
    NAPI_END(text);
}

static napi_value TextStrokeTest_016(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem item = { nullptr, PARAM_0 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_COLOR, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_COLOR TextStrokeTest_016 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextStrokeTest_017(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_COLOR, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_COLOR TextStrokeTest_017 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextStrokeTest_018(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t setResult = nodeAPI->resetAttribute(text, NODE_TEXT_STROKE_COLOR);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_COLOR TextStrokeTest_018 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(text);
}

static napi_value TextStrokeTest_019(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_COLOR);
    if (itemptr == nullptr) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    NAPI_END(text);
}

static napi_value TextStrokeTest_020(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .u32 = COLOR_RED }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_COLOR, &item);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    int32_t resetResult = nodeAPI->resetAttribute(text, NODE_TEXT_STROKE_COLOR);
    ASSERT_EQ(resetResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_COLOR);
    if (itemptr == nullptr) {
        napi_value errorResult = nullptr;
        napi_create_int32(env, PARAM_NEGATIVE_1, &errorResult);
        return errorResult;
    }
    ASSERT_NE(itemptr->value[0].u32, COLOR_RED);
    NAPI_END(text);
}

static napi_value TextStrokeTest_021(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_0 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_021 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(text);
}

static napi_value TextStrokeTest_022(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_1 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_022 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_1);
    NAPI_END(text);
}

static napi_value TextStrokeTest_023(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_2 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_023 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_2);
    NAPI_END(text);
}

static napi_value TextStrokeTest_024(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_NEGATIVE_1 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(text);
}

static napi_value TextStrokeTest_025(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_100 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(text);
}

static napi_value TextStrokeTest_026(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_AttributeItem item = { nullptr, PARAM_0 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_026 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextStrokeTest_027(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, nullptr);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_027 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END(text);
}

static napi_value TextStrokeTest_028(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    int32_t setResult = nodeAPI->resetAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_028 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END(text);
}

static napi_value TextStrokeTest_029(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(text);
}

static napi_value TextStrokeTest_030(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .i32 = PARAM_1 }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    int32_t resetResult = nodeAPI->resetAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(resetResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, PARAM_0);
    NAPI_END(text);
}

static napi_value TextStrokeTest_031(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_MITER_JOIN }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_031 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, OH_ARKUI_STROKE_JOIN_STYLE_MITER_JOIN);
    NAPI_END(text);
}

static napi_value TextStrokeTest_032(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_ROUND_JOIN }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_032 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, OH_ARKUI_STROKE_JOIN_STYLE_ROUND_JOIN);
    NAPI_END(text);
}

static napi_value TextStrokeTest_033(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_BEVEL_JOIN }};
    ArkUI_AttributeItem item = { value, PARAM_1 };
    int32_t setResult = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_033 setResult=%{public}d", setResult);
    ASSERT_EQ(setResult, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, OH_ARKUI_STROKE_JOIN_STYLE_BEVEL_JOIN);
    NAPI_END(text);
}

static napi_value TextStrokeTest_034(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value1[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_MITER_JOIN }};
    ArkUI_AttributeItem item1 = { value1, PARAM_1 };
    int32_t setResult1 = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item1);
    ASSERT_EQ(setResult1, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_NumberValue value2[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_ROUND_JOIN }};
    ArkUI_AttributeItem item2 = { value2, PARAM_1 };
    int32_t setResult2 = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_034 setResult2=%{public}d", setResult2);
    ASSERT_EQ(setResult2, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, OH_ARKUI_STROKE_JOIN_STYLE_ROUND_JOIN);
    NAPI_END(text);
}

static napi_value TextStrokeTest_035(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value1[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_ROUND_JOIN }};
    ArkUI_AttributeItem item1 = { value1, PARAM_1 };
    int32_t setResult1 = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item1);
    ASSERT_EQ(setResult1, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_NumberValue value2[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_BEVEL_JOIN }};
    ArkUI_AttributeItem item2 = { value2, PARAM_1 };
    int32_t setResult2 = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_035 setResult2=%{public}d", setResult2);
    ASSERT_EQ(setResult2, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, OH_ARKUI_STROKE_JOIN_STYLE_BEVEL_JOIN);
    NAPI_END(text);
}

static napi_value TextStrokeTest_036(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value1[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_BEVEL_JOIN }};
    ArkUI_AttributeItem item1 = { value1, PARAM_1 };
    int32_t setResult1 = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item1);
    ASSERT_EQ(setResult1, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_NumberValue value2[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_MITER_JOIN }};
    ArkUI_AttributeItem item2 = { value2, PARAM_1 };
    int32_t setResult2 = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_036 setResult2=%{public}d", setResult2);
    ASSERT_EQ(setResult2, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, OH_ARKUI_STROKE_JOIN_STYLE_MITER_JOIN);
    NAPI_END(text);
}

static napi_value TextStrokeTest_037(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value1[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_MITER_JOIN }};
    ArkUI_AttributeItem item1 = { value1, PARAM_1 };
    int32_t setResult1 = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item1);
    ASSERT_EQ(setResult1, ARKUI_ERROR_CODE_NO_ERROR);
    ArkUI_NumberValue value2[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_MITER_JOIN }};
    ArkUI_AttributeItem item2 = { value2, PARAM_1 };
    int32_t setResult2 = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item2);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_037 setResult2=%{public}d", setResult2);
    ASSERT_EQ(setResult2, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, OH_ARKUI_STROKE_JOIN_STYLE_MITER_JOIN);
    NAPI_END(text);
}

static napi_value TextStrokeTest_038(napi_env env, napi_callback_info info)
{
    NAPI_START(text, ARKUI_NODE_TEXT);
    ArkUI_NumberValue value1[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_MITER_JOIN }};
    ArkUI_AttributeItem item1 = { value1, PARAM_1 };
    nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item1);
    ArkUI_NumberValue value2[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_ROUND_JOIN }};
    ArkUI_AttributeItem item2 = { value2, PARAM_1 };
    nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item2);
    ArkUI_NumberValue value3[] = {{ .i32 = OH_ARKUI_STROKE_JOIN_STYLE_BEVEL_JOIN }};
    ArkUI_AttributeItem item3 = { value3, PARAM_1 };
    int32_t setResult3 = nodeAPI->setAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE, &item3);
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Manager",
        "NODE_TEXT_STROKE_JOIN_STYLE TextStrokeTest_038 setResult3=%{public}d", setResult3);
    ASSERT_EQ(setResult3, ARKUI_ERROR_CODE_NO_ERROR);
    const ArkUI_AttributeItem* itemptr = nodeAPI->getAttribute(text, NODE_TEXT_STROKE_JOIN_STYLE);
    ASSERT_EQ(itemptr->value[0].i32, OH_ARKUI_STROKE_JOIN_STYLE_BEVEL_JOIN);
    NAPI_END(text);
}

}
