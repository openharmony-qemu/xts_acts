/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include <hilog/log.h>

void initializeText1(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text1";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_CONTENT)->string, "");
}

void initializeText2(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    // typographyStyle表示段落样式
    OH_Drawing_TypographyStyle *typographyStyle = OH_Drawing_CreateTypographyStyle();
    // 文字居中显示
    OH_Drawing_SetTypographyTextAlign(typographyStyle, OH_Drawing_TextAlign::TEXT_ALIGN_CENTER);
    OH_Drawing_SetTypographyTextMaxLines(typographyStyle, 10);
    ArkUI_StyledString *styledString = OH_ArkUI_StyledString_Create(typographyStyle, OH_Drawing_CreateFontCollection());
    // 创建文本样式，设置字体和颜色
    OH_Drawing_TextStyle *textStyle = OH_Drawing_CreateTextStyle();
    OH_Drawing_SetTextStyleFontSize(textStyle, 28);
    OH_Drawing_SetTextStyleColor(textStyle, OH_Drawing_ColorSetArgb(0xFF, 0x70, 0x70, 0x70));
    // 文本样式的设置有顺序
    OH_ArkUI_StyledString_PushTextStyle(styledString, textStyle);
    OH_ArkUI_StyledString_AddText(styledString, "子线程创建 Text2");
    OH_ArkUI_StyledString_PopTextStyle(styledString);
    OH_Drawing_Typography *typography = OH_ArkUI_StyledString_CreateTypography(styledString);
    OH_Drawing_TypographyLayout(typography, 400);
    ArkUI_AttributeItem styledStringItem = {.object = styledString};
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT_WITH_STYLED_STRING, &styledStringItem);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_CONTENT_WITH_STYLED_STRING);
// TODO: 不会打印 NODE_TEXT_CONTENT_WITH_STYLED_STRING
//    OH_LOG_INFO(LOG_APP, "node_text_content_with_styled_string_value: %{public}",
//                nodeAPI->getAttribute(textNode, NODE_TEXT_CONTENT_WITH_STYLED_STRING)->object);
//    OH_LOG_INFO(LOG_APP,
//                "node_text_content_with_styled_string_value: textContent: %{public}s textAlign: %{public}d fontColor: "
//                "0x%{public}x",
//                nodeAPI->getAttribute(textNode, NODE_TEXT_CONTENT)->string,
//                nodeAPI->getAttribute(textNode, NODE_TEXT_ALIGN)->value[0].i32,
//                nodeAPI->getAttribute(textNode, NODE_FONT_COLOR)->value[0].u32);
    OH_ArkUI_StyledString_Destroy(styledString);
}

void initializeText3(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text3";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_immutable_font_weight_value[] = {{.i32 = 1030}};
    ArkUI_AttributeItem text_immutable_font_weight_item = {.value = text_immutable_font_weight_value, .size = 1};
    nodeAPI->setAttribute(textNode, NODE_IMMUTABLE_FONT_WEIGHT, &text_immutable_font_weight_item);
    nodeAPI->resetAttribute(textNode, NODE_IMMUTABLE_FONT_WEIGHT);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_IMMUTABLE_FONT_WEIGHT)->value->i32, 10);
}

void initializeText4(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text4";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_font_color_value[] = {{.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem text_font_color_item = {.value = text_font_color_value, .size = 1};
    nodeAPI->setAttribute(textNode, NODE_FONT_COLOR, &text_font_color_item);
    nodeAPI->resetAttribute(textNode, NODE_FONT_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_FONT_COLOR)->value->u32, 0xCE000000);
}

void initializeText5(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text5";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_text_line_count_value[] = {{.i32 = 2}};
    ArkUI_AttributeItem text_text_line_count_item = {.value = text_text_line_count_value, .size = 1};
    nodeAPI->setAttribute(textNode, NODE_TEXT_LINE_COUNT, &text_text_line_count_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_LINE_COUNT);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_LINE_COUNT)->value->i32, 0);
}

void initializeText6(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text6";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_CONTENT);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_CONTENT)->string, "");
}

void initializeText7(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text7";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_font_size_value[] = {{.f32 = 20}};
    ArkUI_AttributeItem text_font_size_item = {text_font_size_value,
                                               sizeof(text_font_size_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_FONT_SIZE, &text_font_size_item);
    nodeAPI->resetAttribute(textNode, NODE_FONT_SIZE);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_FONT_SIZE)->value->f32，16);
}

void initializeText8(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text8";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_font_style_value[] = {{.i32 = ARKUI_FONT_STYLE_ITALIC}};
    ArkUI_AttributeItem text_font_style_item = {text_font_style_value,
                                                sizeof(text_font_style_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_FONT_STYLE, &text_font_style_item);
    nodeAPI->resetAttribute(textNode, NODE_FONT_STYLE);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_FONT_STYLE)->value->i32, 0);
}

void initializeText9(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text9";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_font_weight_value[] = {{.i32 = ARKUI_FONT_WEIGHT_BOLD}};
    ArkUI_AttributeItem text_font_weight_item = {text_font_weight_value,
                                                 sizeof(text_font_weight_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_FONT_WEIGHT, &text_font_weight_item);
    nodeAPI->resetAttribute(textNode, NODE_FONT_WEIGHT);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_FONT_WEIGHT)->value->i32, 10);
}

void initializeText10(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text10";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_line_height_value[] = {{.f32 = 30}};
    ArkUI_AttributeItem text_line_height_item = {text_line_height_value,
                                                 sizeof(text_line_height_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_LINE_HEIGHT, &text_line_height_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_LINE_HEIGHT);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_LINE_HEIGHT)->value->f32, 0);
}

void initializeText11(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text11";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_decoration_value[] = {{.i32 = ARKUI_TEXT_DECORATION_TYPE_LINE_THROUGH}, {.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem text_decoration_item = {text_decoration_value,
                                                sizeof(text_decoration_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_DECORATION, &text_decoration_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_DECORATION);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_DECORATION)->value[0].i32, 0);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_DECORATION)->value[1].u32, 0xFF000000);
}

void initializeText12(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text12";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_case_value[] = {{.i32 = ARKUI_TEXT_CASE_UPPER}};
    ArkUI_AttributeItem text_case_item = {text_case_value, sizeof(text_case_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_CASE, &text_case_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_CASE);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_CASE)->value->i32, 0);
}

void initializeText13(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text13";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_letter_spacing_value[] = {{.f32 = 3}};
    ArkUI_AttributeItem text_letter_spacing_item = {text_letter_spacing_value,
                                                    sizeof(text_letter_spacing_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_LETTER_SPACING, &text_letter_spacing_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_LETTER_SPACING);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_LETTER_SPACING)->value->f32, 0);
}

void initializeText14(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text144444444444444444444444444444444444444444444444444444";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_max_lines_value[] = {{.i32 = 2}};
    ArkUI_AttributeItem text_max_lines_item = {text_max_lines_value,
                                               sizeof(text_max_lines_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_MAX_LINES, &text_max_lines_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_MAX_LINES);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_MAX_LINES)->value->i32, 1000000);
}

void initializeText15(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text15";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_align_value[] = {{.i32 = ARKUI_TEXT_ALIGNMENT_END}};
    ArkUI_AttributeItem text_align_item = {text_align_value, sizeof(text_align_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_ALIGN, &text_align_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_ALIGN);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_ALIGN)->value->i32, 0);
}

void initializeText16(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text1666666666666666666666666666666666666666666666666";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_max_lines_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem text_max_lines_item = {text_max_lines_value,
                                               sizeof(text_max_lines_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_MAX_LINES, &text_max_lines_item);
    ArkUI_NumberValue text_overflow_value[] = {{.i32 = ARKUI_TEXT_OVERFLOW_ELLIPSIS}};
    ArkUI_AttributeItem text_overflow_item = {text_overflow_value,
                                              sizeof(text_overflow_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_OVERFLOW, &text_overflow_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_OVERFLOW);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_OVERFLOW)->value->i32, 0);
}

void initializeText17(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text17";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_AttributeItem text_font_family_item = {.string = "HarmonyOS Sans"};
    nodeAPI->setAttribute(textNode, NODE_FONT_FAMILY, &text_font_family_item);
    nodeAPI->resetAttribute(textNode, NODE_FONT_FAMILY);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_FONT_FAMILY)->string, "HarmonyOS Sans");
}

void initializeText18(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text18";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_copy_option_value[] = {{.i32 = ARKUI_COPY_OPTIONS_IN_APP}};
    ArkUI_AttributeItem text_copy_option_item = {text_copy_option_value,
                                                 sizeof(text_copy_option_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_COPY_OPTION, &text_copy_option_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_COPY_OPTION);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_COPY_OPTION)->value->i32, 0);

    ArkUI_NumberValue text_selected_background_color_value[] = {{.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem text_selected_background_color_item = {
        text_selected_background_color_value, sizeof(text_selected_background_color_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_SELECTED_BACKGROUND_COLOR, &text_selected_background_color_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_SELECTED_BACKGROUND_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_SELECTED_BACKGROUND_COLOR)->value->i32, 0x330A59F7);
}

void initializeText19(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text19";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_baseline_offset_value[] = {{.f32 = -20}};
    ArkUI_AttributeItem text_baseline_offset_item = {text_baseline_offset_value,
                                                     sizeof(text_baseline_offset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_BASELINE_OFFSET, &text_baseline_offset_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_BASELINE_OFFSET);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_BASELINE_OFFSET)->value->f32, 0);
}

void initializeText20(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text20";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_shadow_value[] = {
        {.f32 = 10}, {.i32 = ARKUI_SHADOW_TYPE_COLOR}, {.u32 = 0xFFFF0000}, {.f32 = 2}, {.f32 = 2}};
    ArkUI_AttributeItem text_shadow_item = {text_shadow_value, sizeof(text_shadow_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_TEXT_SHADOW, &text_shadow_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_TEXT_SHADOW);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textNode, NODE_TEXT_TEXT_SHADOW);
    ASSERT_EQ(result->value[0].f32, 0);
    ASSERT_EQ(result->value[1].i32, 0);
    ASSERT_EQ(result->value[2].u32, 0xFF000000);
    ASSERT_EQ(result->value[3].f32, 0);
    ASSERT_EQ(result->value[4].f32, 0);
}

void initializeText21(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string =
        "子线程创建 Text211111111111111111111111111111111111111111111111111111111111111111111111111111";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_min_font_size_value[] = {{.f32 = 10}};
    ArkUI_AttributeItem text_min_font_size_item = {text_min_font_size_value,
                                                   sizeof(text_min_font_size_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_MIN_FONT_SIZE, &text_min_font_size_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_MIN_FONT_SIZE);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_MIN_FONT_SIZE)->value->f32, 0);
    ArkUI_NumberValue text_max_font_size_value[] = {{.f32 = 30}};
    ArkUI_AttributeItem text_max_font_size_item = {text_max_font_size_value,
                                                   sizeof(text_max_font_size_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_MAX_FONT_SIZE, &text_max_font_size_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_MAX_FONT_SIZE);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_MAX_FONT_SIZE)->value->f32, 0);
    ArkUI_NumberValue text_max_lines_value[] = {{.i32 = 2}};
    ArkUI_AttributeItem text_max_lines_item = {text_max_lines_value,
                                               sizeof(text_max_lines_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_MAX_LINES, &text_max_lines_item);
}

void initializeText22(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text22";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_font_value[] = {
        {.f32 = 20}, {.i32 = ARKUI_FONT_WEIGHT_NORMAL}, {.i32 = ARKUI_FONT_STYLE_ITALIC}};
    ArkUI_AttributeItem text_font_item = {text_font_value, sizeof(text_font_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_FONT, &text_font_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_FONT);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textNode, NODE_TEXT_FONT);
    ASSERT_EQ(result->value[0].f32, 16);
    ASSERT_EQ(result->value[1].i32, 10);
    ASSERT_EQ(result->value[2].i32, 0);
}

void initializeText23(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text23333333333333333333333333333333333333333333333333333333333333";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_max_lines_value[] = {{.i32 = 2}};
    ArkUI_AttributeItem text_max_lines_item = {text_max_lines_value,
                                               sizeof(text_max_lines_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_MAX_LINES, &text_max_lines_item);

    ArkUI_NumberValue text_height_adaptive_policy_value[] = {
        {.i32 = ARKUI_TEXT_HEIGHT_ADAPTIVE_POLICY_MAX_LINES_FIRST}};
    ArkUI_AttributeItem text_height_adaptive_policy_item = {
        text_height_adaptive_policy_value, sizeof(text_height_adaptive_policy_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_HEIGHT_ADAPTIVE_POLICY, &text_height_adaptive_policy_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_HEIGHT_ADAPTIVE_POLICY);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textNode, NODE_TEXT_HEIGHT_ADAPTIVE_POLICY);
    ASSERT_EQ(result->value[0].i32, 0);
}

void initializeText24(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text24";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_indent_value[] = {{.f32 = 30}};
    ArkUI_AttributeItem text_indent_item = {text_indent_value, sizeof(text_indent_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_INDENT, &text_indent_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_INDENT);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textNode, NODE_TEXT_INDENT);
    ASSERT_EQ(result->value[0].f32, 0);
}

void initializeText25(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text2555555555555555555555555555 hello world hello world";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_max_lines_value[] = {{.i32 = 3}};
    ArkUI_AttributeItem text_max_lines_item = {text_max_lines_value,
                                               sizeof(text_max_lines_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_MAX_LINES, &text_max_lines_item);
    ArkUI_NumberValue text_word_break_value[] = {{.i32 = WORD_BREAK_TYPE_BREAK_WORD}};
    ArkUI_AttributeItem text_word_break_item = {text_word_break_value,
                                                sizeof(text_word_break_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_WORD_BREAK, &text_word_break_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_WORD_BREAK);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textNode, NODE_TEXT_WORD_BREAK);
    ASSERT_EQ(result->value[0].i32, 2);
}

void initializeText26(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text26666666666666666666666666666666666";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_max_lines_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem text_max_lines_item = {text_max_lines_value,
                                               sizeof(text_max_lines_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_MAX_LINES, &text_max_lines_item);
    ArkUI_NumberValue text_overflow_value[] = {{.i32 = ARKUI_TEXT_OVERFLOW_ELLIPSIS}};
    ArkUI_AttributeItem text_overflow_item = {text_overflow_value,
                                              sizeof(text_overflow_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_OVERFLOW, &text_overflow_item);
    ArkUI_NumberValue text_ellipsis_value[] = {{.i32 = ARKUI_ELLIPSIS_MODE_CENTER}};
    ArkUI_AttributeItem text_ellipsis_item = {text_ellipsis_value,
                                              sizeof(text_ellipsis_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_ELLIPSIS_MODE, &text_ellipsis_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_ELLIPSIS_MODE);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textNode, NODE_TEXT_ELLIPSIS_MODE);
    ASSERT_EQ(result->value[0].i32, 2);
}

void initializeText27(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text27,The line spacing of this context is set to 20_px, and the spacing is "
                          "effective only between the lines.";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_line_spacing_value[] = {{.f32 = 20}};
    ArkUI_AttributeItem text_line_spacing_item = {text_line_spacing_value,
                                                  sizeof(text_line_spacing_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_LINE_SPACING, &text_line_spacing_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_LINE_SPACING);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textNode, NODE_TEXT_LINE_SPACING);
    ASSERT_EQ(result->value[0].f32, 0);
}

void initializeText28(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text28,This is ss01 on : 0123456789";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_AttributeItem text_font_feature_item = {.string = "\"ss01\" on"};
    nodeAPI->setAttribute(textNode, NODE_FONT_FEATURE, &text_font_feature_item);
    nodeAPI->resetAttribute(textNode, NODE_FONT_FEATURE);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textNode, NODE_FONT_FEATURE);
    ASSERT_EQ(result->string, "");
}

void initializeText29(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text29, xxx@email.com";
    nodeAPI->setAttribute(textNode, NODE_TEXT_CONTENT, &content_item);

    ArkUI_NumberValue text_enable_data_detector_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem text_enable_data_detector_item = {
        text_enable_data_detector_value, sizeof(text_enable_data_detector_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_ENABLE_DATA_DETECTOR, &text_enable_data_detector_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_ENABLE_DATA_DETECTOR);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textNode, NODE_TEXT_ENABLE_DATA_DETECTOR);
    ASSERT_EQ(result->value[0].i32, 0);
    ArkUI_NumberValue text_enable_data_detector_config_value[] = {{.i32 = ARKUI_TEXT_DATA_DETECTOR_TYPE_EMAIL}};
    ArkUI_AttributeItem text_enable_data_detector_config_item = {text_enable_data_detector_config_value,
                                                                 sizeof(text_enable_data_detector_config_value) /
                                                                     sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textNode, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG, &text_enable_data_detector_config_item);
    nodeAPI->resetAttribute(textNode, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG);
    ASSERT_EQ(nodeAPI->getAttribute(textNode, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG)->value->i32, 0);
}

void (*initTextFunctions[])(ArkUI_NativeNodeAPI_1 *, ArkUI_NodeHandle) = {
    initializeText1,  initializeText2,  initializeText3,  initializeText4,  initializeText5,  initializeText6,
    initializeText7,  initializeText8,  initializeText9,  initializeText10, initializeText11, initializeText12,
    initializeText13, initializeText14, initializeText15, initializeText16, initializeText17, initializeText18,
    initializeText19, initializeText20, initializeText21, initializeText22, initializeText23, initializeText24,
    initializeText25, initializeText26, initializeText27, initializeText28, initializeText29};

void InitText(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    // 子线程创建组件,设和读属性
    const int textCount = sizeof(initTextFunctions) / sizeof(initTextFunctions[0]);
    for (int i = 0; i < textCount; i++) {
        auto Text = nodeAPI->createNode(ARKUI_NODE_TEXT);
        nodeList.push_back(Text);
        initTextFunctions[i](nodeAPI, Text);
    }
}

void RunOnSubThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    InitText(nodeAPI, nodeList);
}

void RunOnUIThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    auto text1 = nodeList[0];
    if (text1) {
        ASSERT_EQ(nodeAPI->getAttribute(text1, NODE_TEXT_CONTENT)->string, "子线程创建 Text1");
    }

    auto text2 = nodeList[1];
    if (text2) {
    }

    auto text3 = nodeList[2];
    if (text3) {
        ASSERT_EQ(nodeAPI->getAttribute(text3, NODE_IMMUTABLE_FONT_WEIGHT)->value->i32, 1030);
    }

    auto text4 = nodeList[3];
    if (text4) {
        ASSERT_EQ(nodeAPI->getAttribute(text4, NODE_FONT_COLOR)->value->u32, 0xFFFF0000);
    }

    auto text5 = nodeList[4];
    if (text5) {
        ASSERT_EQ(nodeAPI->getAttribute(text5, NODE_TEXT_LINE_COUNT)->value->i32, 2);
    }

    auto text6 = nodeList[5];
    if (text6) {
        ASSERT_EQ(nodeAPI->getAttribute(text6, NODE_TEXT_CONTENT)->string, "子线程创建 Text6");
    }

    auto text7 = nodeList[6];
    if (text7) {
        ASSERT_EQ(nodeAPI->getAttribute(text7, NODE_FONT_SIZE)->value->f32，20);
    }

    auto text8 = nodeList[7];
    if (text8) {
        ASSERT_EQ(nodeAPI->getAttribute(text8, NODE_FONT_STYLE)->value->i32, ARKUI_FONT_STYLE_ITALIC);
    }

    auto text9 = nodeList[8];
    if (text9) {
        ASSERT_EQ(nodeAPI->getAttribute(text9, NODE_FONT_WEIGHT)->value->i32, ARKUI_FONT_WEIGHT_BOLD);
    }

    auto text10 = nodeList[9];
    if (text10) {
        ASSERT_EQ(nodeAPI->getAttribute(text10, NODE_TEXT_LINE_HEIGHT)->value->f32, 30);
    }

    auto text11 = nodeList[10];
    if (text11) {
        ASSERT_EQ(nodeAPI->getAttribute(text11, NODE_TEXT_DECORATION)->value[0].i32,
                  ARKUI_TEXT_DECORATION_TYPE_LINE_THROUGH);
        ASSERT_EQ(nodeAPI->getAttribute(text11, NODE_TEXT_DECORATION)->value[1].u32, 0xFFFF0000);
    }

    auto text12 = nodeList[11];
    if (text12) {
        ASSERT_EQ(nodeAPI->getAttribute(text12, NODE_TEXT_CASE)->value->i32, ARKUI_TEXT_CASE_UPPER);
    }

    auto text13 = nodeList[12];
    if (text13) {
        ASSERT_EQ(nodeAPI->getAttribute(text13, NODE_TEXT_LETTER_SPACING)->value->f32, 3);
    }

    auto text14 = nodeList[13];
    if (text14) {
        ASSERT_EQ(nodeAPI->getAttribute(text14, NODE_TEXT_MAX_LINES)->value->i32, 2);
    }

    auto text15 = nodeList[14];
    if (text15) {
        ASSERT_EQ(nodeAPI->getAttribute(text15, NODE_TEXT_ALIGN)->value->i32, ARKUI_TEXT_ALIGNMENT_END);
    }

    auto text16 = nodeList[15];
    if (text16) {
        ASSERT_EQ(nodeAPI->getAttribute(text16, NODE_TEXT_OVERFLOW)->value->i32, ARKUI_TEXT_OVERFLOW_ELLIPSIS);
    }

    auto text17 = nodeList[16];
    if (text17) {
        ASSERT_EQ(nodeAPI->getAttribute(text17, NODE_FONT_FAMILY)->string, "HarmonyOS Sans");
    }

    auto text18 = nodeList[17];
    if (text18) {
        ASSERT_EQ(nodeAPI->getAttribute(text18, NODE_TEXT_COPY_OPTION)->value->i32, ARKUI_COPY_OPTIONS_IN_APP);
        ASSERT_EQ(nodeAPI->getAttribute(text18, NODE_TEXT_SELECTED_BACKGROUND_COLOR)->value->i32, 0xFFFF0000);
    }

    auto text19 = nodeList[18];
    if (text19) {
        ASSERT_EQ(nodeAPI->getAttribute(text19, NODE_TEXT_BASELINE_OFFSET)->value->f32, -20);
    }

    auto text20 = nodeList[19];
    if (text20) {
        const ArkUI_AttributeItem *resultText20 = nodeAPI->getAttribute(text20, NODE_TEXT_TEXT_SHADOW);
        ASSERT_EQ(resultText20->value[0].f32, 10);
        ASSERT_EQ(resultText20->value[1].i32, ARKUI_SHADOW_TYPE_COLOR);
        ASSERT_EQ(resultText20->value[2].u32, 0xFFFF0000);
        ASSERT_EQ(resultText20->value[3].f32, 2);
        ASSERT_EQ(resultText20->value[4].f32, 2);
    }

    auto text21 = nodeList[20];
    if (text21) {
        ASSERT_EQ(nodeAPI->getAttribute(text21, NODE_TEXT_MIN_FONT_SIZE)->value->f32, 10);
        ASSERT_EQ(nodeAPI->getAttribute(text21, NODE_TEXT_MAX_FONT_SIZE)->value->f32, 30);
    }

    auto text22 = nodeList[21];
    if (text22) {
        const ArkUI_AttributeItem *resultText22 = nodeAPI->getAttribute(text22, NODE_TEXT_FONT);
        ASSERT_EQ(resultText22->value[0].f32, 20);
        ASSERT_EQ(resultText22->value[1].i32, ARKUI_FONT_WEIGHT_NORMAL);
        ASSERT_EQ(resultText22->value[2].i32, ARKUI_FONT_STYLE_ITALIC);
    }

    auto text23 = nodeList[22];
    if (text23) {
        ASSERT_EQ(nodeAPI->getAttribute(text23, NODE_TEXT_HEIGHT_ADAPTIVE_POLICY)->value[0].i32,
                  ARKUI_TEXT_HEIGHT_ADAPTIVE_POLICY_MAX_LINES_FIRST);
    }

    auto text24 = nodeList[23];
    if (text24) {
        ASSERT_EQ(nodeAPI->getAttribute(text24, NODE_TEXT_INDENT)->value[0].f32, 30);
    }

    auto text25 = nodeList[24];
    if (text25) {
        ASSERT_EQ(nodeAPI->getAttribute(text25, NODE_TEXT_WORD_BREAK)->value[0].i32, WORD_BREAK_TYPE_BREAK_WORD);
    }

    auto text26 = nodeList[25];
    if (text26) {
        ASSERT_EQ(nodeAPI->getAttribute(text26, NODE_TEXT_ELLIPSIS_MODE)->value[0].i32, ARKUI_ELLIPSIS_MODE_CENTER);
    }

    auto text27 = nodeList[26];
    if (text27) {
        ASSERT_EQ(nodeAPI->getAttribute(text27, NODE_TEXT_LINE_SPACING)->value[0].f32, 20);
    }

    auto text28 = nodeList[27];
    if (text28) {
        ASSERT_EQ(nodeAPI->getAttribute(text28, NODE_FONT_FEATURE)->string, "\"ss01\" on");
    }

    auto text29 = nodeList[28];
    if (text29) {
        ASSERT_EQ(nodeAPI->getAttribute(text29, NODE_TEXT_ENABLE_DATA_DETECTOR)->value[0].i32, 1);
        ASSERT_EQ(nodeAPI->getAttribute(text29, NODE_TEXT_ENABLE_DATA_DETECTOR_CONFIG)->value->i32,
                  ARKUI_TEXT_DATA_DETECTOR_TYPE_EMAIL);
    }
}