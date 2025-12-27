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

void initializeSpan1(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *spanNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "子线程创建 Span1";
    nodeAPI->setAttribute(spanNode, NODE_SPAN_CONTENT, &content_item);
    ASSERT_EQ(nodeAPI->getAttribute(spanNode, NODE_SPAN_CONTENT)->string, "子线程创建 Span1");

    ArkUI_NumberValue span_text_background_style_value[] = {
        {.u32 = 0xFFFF0000}, {.f32 = 3}, {.f32 = 3}, {.f32 = 3}, {.f32 = 3}};
    ArkUI_AttributeItem span_text_background_style_item = {span_text_background_style_value, 1};
    nodeAPI->setAttribute(spanNode, NODE_SPAN_TEXT_BACKGROUND_STYLE, &span_text_background_style_item);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(spanNode, NODE_SPAN_TEXT_BACKGROUND_STYLE);
    ASSERT_EQ(result->value[0].u32, 0xFFFF0000);
    ASSERT_EQ(result->value[1].f32, 3);
    ASSERT_EQ(result->value[2].f32, 3);
    ASSERT_EQ(result->value[3].f32, 3);
    ASSERT_EQ(result->value[4].f32, 3);

    ArkUI_NumberValue span_baseline_offset_value[] = {{.f32 = 30}};
    ArkUI_AttributeItem span_baseline_offset_item = {span_baseline_offset_value, 1};
    nodeAPI->setAttribute(spanNode, NODE_SPAN_BASELINE_OFFSET, &span_baseline_offset_item);
    ASSERT_EQ(nodeAPI->getAttribute(spanNode, NODE_SPAN_BASELINE_OFFSET)->value->f32, 30);
}

void (*initSpanFunctions[])(ArkUI_NativeNodeAPI_1 *, ArkUI_NodeHandle) = {initializeSpan1};

void InitSpan(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    // 子线程创建组件,设和读属性
    const int spanCount = sizeof(initSpanFunctions) / sizeof(initSpanFunctions[0]);
    for (int i = 0; i < spanCount; i++) {
        auto Span = nodeAPI->createNode(ARKUI_NODE_SPAN);
        nodeList.push_back(Span);
        initSpanFunctions[i](nodeAPI, Span);
    }
}

void RunOnSubThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    InitSpan(nodeAPI, nodeList);
}

void RunOnUIThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    auto span1 = nodeList[0];
    if (span1) {
        ASSERT_EQ(nodeAPI->getAttribute(span1, NODE_SPAN_CONTENT)->string, "子线程创建 Span1");
        ASSERT_EQ(nodeAPI->getAttribute(span1, NODE_SPAN_TEXT_BACKGROUND_STYLE), 0xFFFF0000);
        ASSERT_EQ(nodeAPI->getAttribute(span1, NODE_SPAN_TEXT_BACKGROUND_STYLE), 3);
        ASSERT_EQ(nodeAPI->getAttribute(span1, NODE_SPAN_TEXT_BACKGROUND_STYLE), 3);
        ASSERT_EQ(nodeAPI->getAttribute(span1, NODE_SPAN_TEXT_BACKGROUND_STYLE), 3);
        ASSERT_EQ(nodeAPI->getAttribute(span1, NODE_SPAN_TEXT_BACKGROUND_STYLE), 3);
        ASSERT_EQ(nodeAPI->getAttribute(span1, NODE_SPAN_BASELINE_OFFSET)->value->f32, 30);
    }
}