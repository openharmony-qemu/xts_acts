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

void initializeTextArea1(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textAreaNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "123";
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_TEXT, &content_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_TEXT);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_TEXT)->string, "");
    ArkUI_AttributeItem text_area_placeholder_item = {.string = "子线程创建 TextArea1"};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER, &text_area_placeholder_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER)->string, "");
    ArkUI_NumberValue text_area_max_length_value[] = {{.i32 = 20}};
    ArkUI_AttributeItem text_area_max_length_item = {text_area_max_length_value,
                                                     sizeof(text_area_max_length_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_MAX_LENGTH, &text_area_max_length_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_MAX_LENGTH);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_MAX_LENGTH)->value->i32, 20);
    ArkUI_NumberValue text_area_placeholder_color_value[] = {{.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem text_area_placeholder_color_item = {text_area_placeholder_color_value, 1};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER_COLOR, &text_area_placeholder_color_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER_COLOR)->value->u32, 0xFFFF0000);

    ArkUI_NumberValue text_area_placeholder_font_value[] = {
        {.f32 = 10}, {.i32 = ARKUI_FONT_STYLE_ITALIC}, {.i32 = ARKUI_FONT_WEIGHT_NORMAL}};
    ArkUI_AttributeItem text_area_placeholder_font_item = {
        text_area_placeholder_font_value, sizeof(text_area_placeholder_font_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER_FONT, &text_area_placeholder_font_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER_FONT);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER_FONT);
    ASSERT_EQ(result->value[0].f32, 16);
    ASSERT_EQ(result->value[1].f32, 0);
    ASSERT_EQ(result->value[2].f32, 10);
    ArkUI_NumberValue text_area_caret_color_value[] = {{.u32 = 0xFFFFFF00}};
    ArkUI_AttributeItem text_area_caret_color_item = {text_area_caret_color_value, 1};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_CARET_COLOR, &text_area_caret_color_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_CARET_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_CARET_COLOR)->value->u32, 0xFFFFFF00);
    ArkUI_NumberValue text_area_editing_value[] = {{.i32 = 0}};
    ArkUI_AttributeItem text_area_editing_item = {text_area_editing_value, 1};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_EDITING, &text_area_editing_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_EDITING);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_EDITING)->value->i32, 0);

    ArkUI_NumberValue text_area_type_value[] = {{.i32 = ARKUI_TEXTAREA_TYPE_NUMBER}};
    ArkUI_AttributeItem text_area_type_item = {text_area_type_value,
                                               sizeof(text_area_type_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_TYPE, &text_area_type_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_TYPE);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_TYPE)->value->i32, 0);

    ArkUI_NumberValue text_area_show_counter_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem text_area_show_counter_item = {
        text_area_show_counter_value, sizeof(text_area_show_counter_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_SHOW_COUNTER, &text_area_show_counter_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_SHOW_COUNTER);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_SHOW_COUNTER)->value->i32, 0);

    ArkUI_NumberValue text_area_selection_menu_hidden_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem text_area_selection_menu_hidden_item = {text_area_selection_menu_hidden_value,
                                                                sizeof(text_area_selection_menu_hidden_value) /
                                                                    sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_SELECTION_MENU_HIDDEN, &text_area_selection_menu_hidden_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_SELECTION_MENU_HIDDEN);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_SELECTION_MENU_HIDDEN)->value->i32, 1);

    ArkUI_NumberValue text_area_blur_on_submit_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem text_area_blur_on_submit_item = {
        text_area_blur_on_submit_value, sizeof(text_area_blur_on_submit_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_BLUR_ON_SUBMIT, &text_area_blur_on_submit_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_BLUR_ON_SUBMIT);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_BLUR_ON_SUBMIT)->value->i32, 0);
}

void initializeTextArea2(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textAreaNode) {
    ArkUI_AttributeItem text_area_placeholder_item = {.string = "子线程创建 TextArea2, 只允许字母输入"};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_PLACEHOLDER, &text_area_placeholder_item);
    ArkUI_NumberValue text_area_type_value[] = {{.i32 = ARKUI_TEXTAREA_TYPE_NORMAL}};
    ArkUI_AttributeItem text_area_type_item = {text_area_type_value,
                                               sizeof(text_area_type_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_TYPE, &text_area_type_item);
    ArkUI_AttributeItem text_area_input_filter_item = {.string = "[a-zA-Z]+"};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_INPUT_FILTER, &text_area_input_filter_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_INPUT_FILTER);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_INPUT_FILTER)->string, "");

    ArkUI_NumberValue text_area_selected_background_color_value[] = {{.u32 = 0xFFFF0000}};
    ArkUI_AttributeItem text_area_selected_background_color_item = {text_area_selected_background_color_value, 1};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_SELECTED_BACKGROUND_COLOR,
                          &text_area_selected_background_color_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_SELECTED_BACKGROUND_COLOR);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_SELECTED_BACKGROUND_COLOR)->value->u32, 0x330A59F7);

    ArkUI_NumberValue text_area_enter_key_type_value[] = {{.i32 = ARKUI_ENTER_KEY_TYPE_SEARCH}};
    ArkUI_AttributeItem text_area_enter_key_type_item = {
        text_area_enter_key_type_value, sizeof(text_area_enter_key_type_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_ENTER_KEY_TYPE, &text_area_enter_key_type_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_ENTER_KEY_TYPE);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value->i32, 6);

    ArkUI_NumberValue text_area_caret_offset_value[] = {{.i32 = 2}};
    ArkUI_AttributeItem text_area_caret_offset_item = {
        text_area_caret_offset_value, sizeof(text_area_caret_offset_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_CARET_OFFSET, &text_area_caret_offset_item);
    const ArkUI_AttributeItem *caret_offset = nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_CARET_OFFSET);
    ASSERT_EQ(caret_offset->value[0].i32, 0);
}

void initializeTextArea3(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textAreaNode) {
    ArkUI_NumberValue text_area_enable_keyboard_on_focus_value[] = {{.i32 = 0}};
    ArkUI_AttributeItem text_area_enable_keyboard_on_focus_item = {text_area_enable_keyboard_on_focus_value,
                                                                   sizeof(text_area_enable_keyboard_on_focus_value) /
                                                                       sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_ENABLE_KEYBOARD_ON_FOCUS,
                          &text_area_enable_keyboard_on_focus_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_ENABLE_KEYBOARD_ON_FOCUS);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_ENABLE_KEYBOARD_ON_FOCUS)->value->i32, 1);
}

// NOTE: https://developer.huawei.com/consumer/cn/doc/harmonyos-references/capi-native-node-h#arkui_nodeattributetype
// NODE_TEXT_AREA_CONTENT_RECT 只显示了获取，没有设置
void initializeTextArea4(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textAreaNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 TextArea4";
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_TEXT, &content_item);

    const ArkUI_AttributeItem *content_rect = nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_CONTENT_RECT);
    ASSERT_EQ(content_rect->value[0].f32, content_rect->value[0].f32);
    ASSERT_EQ(content_rect->value[1].f32, content_rect->value[1].f32);
    ASSERT_EQ(content_rect->value[2].f32, content_rect->value[2].f32);
    ASSERT_EQ(content_rect->value[3].f32, content_rect->value[3].f32);
    const ArkUI_AttributeItem *content_line_count =
        nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_CONTENT_LINE_COUNT);
    ASSERT_EQ(content_line_count->value[0].i32, content_line_count->value[0].i32);
}

void initializeTextArea5(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textAreaNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text5";
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_TEXT, &content_item);

    ArkUI_NumberValue text_area_text_selection_value[] = {{.i32 = 1}, {.i32 = 3}};
    ArkUI_AttributeItem text_area_text_selection_item = {.value = text_area_text_selection_value, .size = 1};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_TEXT_SELECTION, &text_area_text_selection_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_TEXT_SELECTION);
    const ArkUI_AttributeItem *text_selection = nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_TEXT_SELECTION);
    ASSERT_EQ(text_selection->value[0].i32, 11);
    ASSERT_EQ(text_selection->value[1].i32, 11);
}

void initializeTextArea6(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textAreaNode) {
    ArkUI_NumberValue text_area_enable_auto_fill_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem text_area_enable_auto_fill_item = {
        text_area_enable_auto_fill_value, sizeof(text_area_enable_auto_fill_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_ENABLE_AUTO_FILL, &text_area_enable_auto_fill_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_ENABLE_AUTO_FILL);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_ENABLE_AUTO_FILL)->value->i32, 1);

    ArkUI_NumberValue text_area_content_type_value[] = {{.i32 = ARKUI_TEXTINPUT_CONTENT_TYPE_CITY_ADDRESS}};
    ArkUI_AttributeItem text_area_content_type_item = {
        text_area_content_type_value, sizeof(text_area_content_type_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_CONTENT_TYPE, &text_area_content_type_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_CONTENT_TYPE);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_CONTENT_TYPE)->value->i32, -1);
}

void initializeTextArea7(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textAreaNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text7";
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_TEXT, &content_item);

    ArkUI_NumberValue text_area_show_keyboard_on_focus_value[] = {{.i32 = 0}};
    ArkUI_AttributeItem text_area_show_keyboard_on_focus_item = {text_area_show_keyboard_on_focus_value,
                                                                 sizeof(text_area_show_keyboard_on_focus_value) /
                                                                     sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_SHOW_KEYBOARD_ON_FOCUS, &text_area_show_keyboard_on_focus_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_SHOW_KEYBOARD_ON_FOCUS);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_SHOW_KEYBOARD_ON_FOCUS)->value->i32, 1);


    ArkUI_NumberValue text_area_number_of_lines_value[] = {{.i32 = 3}};
    ArkUI_AttributeItem text_area_number_of_lines_item = {
        text_area_number_of_lines_value, sizeof(text_area_number_of_lines_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_NUMBER_OF_LINES, &text_area_number_of_lines_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_NUMBER_OF_LINES);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_NUMBER_OF_LINES)->value->i32, -1);

    ArkUI_NumberValue text_area_letter_spacing_value[] = {{.i32 = 5}};
    ArkUI_AttributeItem text_area_letter_spacing_item = {
        text_area_letter_spacing_value, sizeof(text_area_letter_spacing_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_LETTER_SPACING, &text_area_letter_spacing_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_LETTER_SPACING);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_LETTER_SPACING)->value->i32, 0);

    ArkUI_NumberValue text_area_enable_preview_text_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem text_area_enable_preview_text_item = {
        text_area_enable_preview_text_value, sizeof(text_area_enable_preview_text_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT, &text_area_enable_preview_text_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT)->value->i32, 1);

    ArkUI_NumberValue text_area_half_leading_value[] = {{.i32 = 1}};
    ArkUI_AttributeItem text_area_half_leading_item = {
        text_area_half_leading_value, sizeof(text_area_half_leading_value) / sizeof(ArkUI_NumberValue)};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_HALF_LEADING, &text_area_half_leading_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_HALF_LEADING);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_HALF_LEADING)->value->i32, 0);

    ArkUI_NumberValue text_area_keyboard_appearance_value[] = {{.i32 = ARKUI_KEYBOARD_APPEARANCE_DARK_IMMERSIVE}};
    ArkUI_AttributeItem text_area_keyboard_appearance_item = {text_area_keyboard_appearance_value, 1};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_KEYBOARD_APPEARANCE, &text_area_keyboard_appearance_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_KEYBOARD_APPEARANCE);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_KEYBOARD_APPEARANCE)->value->i32, 0);
}

void initializeTextArea8(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *textAreaNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Text8";
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_TEXT, &content_item);

    ArkUI_NumberValue text_area_line_height_value[] = {{.i32 = 10}};
    ArkUI_AttributeItem text_area_line_height_item = {text_area_line_height_value, 1};
    nodeAPI->setAttribute(textAreaNode, NODE_TEXT_AREA_LINE_HEIGHT, &text_area_line_height_item);
    nodeAPI->resetAttribute(textAreaNode, NODE_TEXT_AREA_LINE_HEIGHT);
    ASSERT_EQ(nodeAPI->getAttribute(textAreaNode, NODE_TEXT_AREA_LINE_HEIGHT)->value->i32, 0);
}

// 定义TextArea初始化函数数组
void (*initTextAreaFunctions[])(ArkUI_NativeNodeAPI_1 *, ArkUI_NodeHandle) = {
    initializeTextArea1, initializeTextArea2, initializeTextArea3, initializeTextArea4,
    initializeTextArea5, initializeTextArea6, initializeTextArea7, initializeTextArea8};

void InitTextArea(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    // 子线程创建组件,设和读属性
    const int textAreaCount = sizeof(initTextAreaFunctions) / sizeof(initTextAreaFunctions[0]);
    for (int i = 0; i < textAreaCount; i++) {
        auto TextArea = nodeAPI->createNode(ARKUI_NODE_TEXT_AREA);
        nodeList.push_back(TextArea);
        initTextAreaFunctions[i](nodeAPI, TextArea);
    }
}

void RunOnSubThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    InitTextArea(nodeAPI, nodeList);
}

void RunOnUIThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    auto textArea1 = nodeList[0];
    if (textArea1) {
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_TEXT)->string, "");
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_PLACEHOLDER)->string, "");
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_MAX_LENGTH)->value->i32, 20);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_PLACEHOLDER_COLOR)->value->u32, 0xFFFF0000);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[0].f32, 16);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[1].f32, 0);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_PLACEHOLDER_FONT)->value[2].f32, 10);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_CARET_COLOR)->value->u32, 0xFFFFFF00);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_EDITING)->value->i32, 0);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_TYPE)->value->i32, 0);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_SHOW_COUNTER)->value->i32, 0);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_SELECTION_MENU_HIDDEN)->value->i32, 1);
        ASSERT_EQ(nodeAPI->getAttribute(textArea1, NODE_TEXT_AREA_BLUR_ON_SUBMIT)->value->i32, 0);
    }
    auto textArea2 = nodeList[1];
    if (textArea2) {
        ASSERT_EQ(nodeAPI->getAttribute(textArea2, NODE_TEXT_AREA_INPUT_FILTER)->string, "");
        ASSERT_EQ(nodeAPI->getAttribute(textArea2, NODE_TEXT_AREA_SELECTED_BACKGROUND_COLOR)->value->u32, 0x330A59F7);
        ASSERT_EQ(nodeAPI->getAttribute(textArea2, NODE_TEXT_AREA_ENTER_KEY_TYPE)->value->i32, 6);
        ASSERT_EQ(nodeAPI->getAttribute(textArea2, NODE_TEXT_AREA_CARET_OFFSET)->value[0].i32, 1);
    }
    auto textArea3 = nodeList[2];
    if (textArea3) {
        ASSERT_EQ(nodeAPI->getAttribute(textArea3, NODE_TEXT_AREA_ENABLE_KEYBOARD_ON_FOCUS)->value->i32, 0);
    }
    auto textArea4 = nodeList[3];
    if (textArea4) {
        const ArkUI_AttributeItem *content_rect = nodeAPI->getAttribute(textArea4, NODE_TEXT_AREA_CONTENT_RECT);
        ASSERT_EQ(content_rect->value[0].f32, content_rect->value[0].f32);
        ASSERT_EQ(content_rect->value[1].f32, content_rect->value[1].f32);
        ASSERT_EQ(content_rect->value[2].f32, content_rect->value[2].f32);
        ASSERT_EQ(content_rect->value[3].f32, content_rect->value[3].f32);
        const ArkUI_AttributeItem *content_line_count =
            nodeAPI->getAttribute(textArea4, NODE_TEXT_AREA_CONTENT_LINE_COUNT);
        ASSERT_EQ(content_line_count->value[0].i32, content_line_count->value[0].i32);
    }
    auto textArea5 = nodeList[4];
    if (textArea5) {
        const ArkUI_AttributeItem *text_selection = nodeAPI->getAttribute(textArea5, NODE_TEXT_AREA_TEXT_SELECTION);
        ASSERT_EQ(text_selection->value[0].i32, 11);
        ASSERT_EQ(text_selection->value[1].i32, 31);
    }
    auto textArea6 = nodeList[5];
    if (textArea6) {
        ASSERT_EQ(nodeAPI->getAttribute(textArea6, NODE_TEXT_AREA_ENABLE_AUTO_FILL)->value->i32, 1);
        ASSERT_EQ(nodeAPI->getAttribute(textArea6, NODE_TEXT_AREA_CONTENT_TYPE)->value->i32, -1);
    }
    auto textArea7 = nodeList[6];
    if (textArea7) {
        ASSERT_EQ(nodeAPI->getAttribute(textArea7, NODE_TEXT_AREA_SHOW_KEYBOARD_ON_FOCUS)->value->i32, 1);
        ASSERT_EQ(nodeAPI->getAttribute(textArea7, NODE_TEXT_AREA_NUMBER_OF_LINES)->value->i32, -1);
        ASSERT_EQ(nodeAPI->getAttribute(textArea7, NODE_TEXT_AREA_LETTER_SPACING)->value->i32, 0);
        ASSERT_EQ(nodeAPI->getAttribute(textArea7, NODE_TEXT_AREA_ENABLE_PREVIEW_TEXT)->value->i32, 1);
        ASSERT_EQ(nodeAPI->getAttribute(textArea7, NODE_TEXT_AREA_HALF_LEADING)->value->i32, 0);
        ASSERT_EQ(nodeAPI->getAttribute(textArea7, NODE_TEXT_AREA_KEYBOARD_APPEARANCE)->value->i32, 0);
    }
    auto textArea8 = nodeList[7];
    if (textArea7) {
        ASSERT_EQ(nodeAPI->getAttribute(textArea8, NODE_TEXT_AREA_LINE_HEIGHT)->value->i32, 0);
    }
}