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

void initializeImageSpan1(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *imageSpanNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "test.png";
    nodeAPI->setAttribute(imageSpanNode, NODE_IMAGE_SPAN_SRC, &content_item);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpanNode, NODE_IMAGE_SPAN_SRC)->string, "test.png");

    ArkUI_NumberValue image_span_vertical_alignment_value[] = {{.i32 = ARKUI_IMAGE_SPAN_ALIGNMENT_BOTTOM}};
    ArkUI_AttributeItem image_span_vertical_alignment_item = {image_span_vertical_alignment_value, 1};
    nodeAPI->setAttribute(imageSpanNode, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT, &image_span_vertical_alignment_item);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpanNode, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT)->value->i32,
              ARKUI_IMAGE_SPAN_ALIGNMENT_BOTTOM);

    ArkUI_NumberValue image_span_baseline_offset_value[] = {{.f32 = 10}};
    ArkUI_AttributeItem image_span_baseline_offset_item = {image_span_baseline_offset_value, 1};
    nodeAPI->setAttribute(imageSpanNode, NODE_IMAGE_SPAN_BASELINE_OFFSET, &image_span_baseline_offset_item);
    const ArkUI_AttributeItem *result = nodeAPI->getAttribute(imageSpanNode, NODE_IMAGE_SPAN_BASELINE_OFFSET);
    ASSERT_EQ(result->value[0].f32, 10);
}

void initializeImageSpan2(ArkUI_NativeNodeAPI_1 *nodeAPI, ArkUI_Node *imageSpanNode) {
    ArkUI_AttributeItem content_item = {};
    content_item.string = "test.png";
    nodeAPI->setAttribute(imageSpanNode, NODE_IMAGE_SPAN_SRC, &content_item);

    ArkUI_AttributeItem image_span_alt_item = {.string = "test.png"};
    nodeAPI->setAttribute(imageSpanNode, NODE_IMAGE_SPAN_ALT, &image_span_alt_item);
    ASSERT_EQ(nodeAPI->getAttribute(imageSpanNode, NODE_IMAGE_SPAN_ALT)->string, "test.png");
}

void (*initImageSpanFunctions[])(ArkUI_NativeNodeAPI_1 *, ArkUI_NodeHandle) = {initializeImageSpan1,
                                                                               initializeImageSpan2};

void InitImageSpan(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    // 子线程创建组件,设和读属性
    const int imageSpanCount = sizeof(initImageSpanFunctions) / sizeof(initImageSpanFunctions[0]);
    for (int i = 0; i < imageSpanCount; i++) {
        auto ImageSpan = nodeAPI->createNode(ARKUI_NODE_IMAGE_SPAN);
        nodeList.push_back(ImageSpan);
        initImageSpanFunctions[i](nodeAPI, ImageSpan);
    }
}

void RunOnSubThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    InitImageSpan(nodeAPI, nodeList);
}

void RunOnUIThread(ArkUI_NativeNodeAPI_1 *nodeAPI, std::vector<ArkUI_NodeHandle> &nodeList) {
    auto imagespan1 = nodeList[0];
    if (imagespan1) {
        ASSERT_EQ(nodeAPI->getAttribute(imagespan1, NODE_IMAGE_SPAN_SRC)->string, "test.png");
        ASSERT_EQ(nodeAPI->getAttribute(imagespan1, NODE_IMAGE_SPAN_VERTICAL_ALIGNMENT)->value->i32,
                  ARKUI_IMAGE_SPAN_ALIGNMENT_BOTTOM);
        ASSERT_EQ(nodeAPI->getAttribute(imagespan1, NODE_IMAGE_SPAN_BASELINE_OFFSET)->value[0].f32, 10);
    }
    auto imagespan2 = nodeList[0];
    if (imagespan2) {
        ASSERT_EQ(nodeAPI->getAttribute(imagespan2, NODE_IMAGE_SPAN_ALT)->string, "test.png");
    }
}