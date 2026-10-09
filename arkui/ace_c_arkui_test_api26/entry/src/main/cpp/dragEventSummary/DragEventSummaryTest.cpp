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

#include "DragEventSummaryTest.h"
#include "../common/common.h"
#include "../manager/PluginManagerTest.h"
#include <arkui/native_interface.h>
#include <arkui/native_node.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/drag_and_drop.h>
#include <database/udmf/udmf.h>
#include <database/udmf/udmf_err_code.h>
#include <database/udmf/udmf_meta.h>
#include <database/udmf/uds.h>
#include <cstring>
#include <cstdio>
#include <sstream>

namespace ArkUICapiTest {

static ArkUI_NativeNodeAPI_1 *g_nodeAPI = nullptr;
static ArkUI_NodeHandle g_dragImage = nullptr;
static ArkUI_NodeHandle g_dropArea = nullptr;
static ArkUI_NodeHandle g_resultText = nullptr;

static void UpdateResultText(const char *text)
{
    if (!g_resultText || !g_nodeAPI) {
        return;
    }
    ArkUI_AttributeItem item = {.string = text};
    g_nodeAPI->setAttribute(g_resultText, NODE_TEXT_CONTENT, &item);
}

static void OnDragStart(ArkUI_NodeEvent *event)
{
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    if (!dragEvent) {
        return;
    }
    OH_UdmfRecord *record = OH_UdmfRecord_Create();
    OH_UdsPlainText *textValue = OH_UdsPlainText_Create();
    OH_UdsPlainText_SetContent(textValue, "drag test data for GetSummary");
    OH_UdmfRecord_AddPlainText(record, textValue);
    OH_UdmfData *data = OH_UdmfData_Create();
    OH_UdmfData_AddRecord(data, record);
    OH_ArkUI_DragEvent_SetData(dragEvent, data);
    OH_UdmfData_Destroy(data);
    OH_UdmfRecord_Destroy(record);
    OH_UdsPlainText_Destroy(textValue);
}

static void OnDragEnter(ArkUI_NodeEvent *event)
{
    auto dragEvent = OH_ArkUI_NodeEvent_GetDragEvent(event);
    std::stringstream ss;
    ss << "results:";

    if (dragEvent) {
        OH_UDMF_Summary *summary = OH_UDMF_CreateSummary();
        int32_t ret1 = OH_ArkUI_DragEvent_GetSummary(dragEvent, summary);
        ss << "TC1=" << ret1 << ";";
        OH_UDMF_DestroySummary(summary);

        int32_t ret2 = OH_ArkUI_DragEvent_GetSummary(nullptr, summary);
        ss << "TC2=" << ret2 << ";";

        OH_UDMF_Summary *summary2 = OH_UDMF_CreateSummary();
        int32_t ret3 = OH_ArkUI_DragEvent_GetSummary(dragEvent, nullptr);
        ss << "TC3=" << ret3 << ";";
        OH_UDMF_DestroySummary(summary2);

        int32_t ret4 = OH_ArkUI_DragEvent_GetSummary(nullptr, nullptr);
        ss << "TC4=" << ret4 << ";";

        char fakeBuf[256] = {0};
        ArkUI_DragEvent *fakeEvent = (ArkUI_DragEvent *)fakeBuf;
        OH_UDMF_Summary *summary3 = OH_UDMF_CreateSummary();
        int32_t ret5 = OH_ArkUI_DragEvent_GetSummary(fakeEvent, summary3);
        ss << "TC5=" << ret5 << ";";
        OH_UDMF_DestroySummary(summary3);

        char fakeSummaryBuf[1024] = {0};
        int32_t ret6 = OH_ArkUI_DragEvent_GetSummary(dragEvent, (OH_UDMF_Summary *)fakeSummaryBuf);
        ss << "TC6=" << ret6 << ";";

        OH_UDMF_Summary *summary4 = OH_UDMF_CreateSummary();
        OH_UDMF_DestroySummary(summary4);
        int32_t ret7 = OH_ArkUI_DragEvent_GetSummary(dragEvent, summary4);
        ss << "TC7=" << ret7 << ";";
    } else {
        ss << "dragEvent=null;";
    }

    std::string result = ss.str();
    UpdateResultText(result.c_str());
}

static void NodeEventReceiver(ArkUI_NodeEvent *event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    ArkUI_NodeHandle node = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    if (node == g_dragImage) {
        if (eventType == NODE_ON_DRAG_START) {
            OnDragStart(event);
        }
    } else if (node == g_dropArea) {
        if (eventType == NODE_ON_DRAG_ENTER) {
            OnDragEnter(event);
        }
    }
}

static ArkUI_NodeHandle CreateDraggableImage()
{
    auto image = g_nodeAPI->createNode(ARKUI_NODE_IMAGE);
    ArkUI_AttributeItem srcItem = {.string = "/resources/base/media/icon.png"};
    g_nodeAPI->setAttribute(image, NODE_IMAGE_SRC, &srcItem);
    ArkUI_NumberValue w[] = {{.f32 = 100.0f}};
    ArkUI_AttributeItem wItem = {w, 1};
    g_nodeAPI->setAttribute(image, NODE_WIDTH, &wItem);
    ArkUI_NumberValue h[] = {{.f32 = 100.0f}};
    ArkUI_AttributeItem hItem = {h, 1};
    g_nodeAPI->setAttribute(image, NODE_HEIGHT, &hItem);
    ArkUI_AttributeItem idItem = {.string = "drag_image"};
    g_nodeAPI->setAttribute(image, NODE_ID, &idItem);
    OH_ArkUI_SetNodeDraggable(image, true);
    g_nodeAPI->registerNodeEvent(image, NODE_ON_DRAG_START, 0, nullptr);
    g_nodeAPI->addNodeEventReceiver(image, NodeEventReceiver);
    return image;
}

static ArkUI_NodeHandle CreateDropArea()
{
    auto area = g_nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem textItem = {.string = "Drop Here"};
    g_nodeAPI->setAttribute(area, NODE_TEXT_CONTENT, &textItem);
    ArkUI_NumberValue w[] = {{.f32 = 300.0f}};
    ArkUI_AttributeItem wItem = {w, 1};
    g_nodeAPI->setAttribute(area, NODE_WIDTH, &wItem);
    ArkUI_NumberValue h[] = {{.f32 = 100.0f}};
    ArkUI_AttributeItem hItem = {h, 1};
    g_nodeAPI->setAttribute(area, NODE_HEIGHT, &hItem);
    ArkUI_NumberValue border[] = {{.f32 = 2.0f}};
    ArkUI_AttributeItem borderItem = {border, 1};
    g_nodeAPI->setAttribute(area, NODE_BORDER_WIDTH, &borderItem);
    ArkUI_NumberValue align[] = {{.i32 = ARKUI_TEXT_ALIGNMENT_CENTER}};
    ArkUI_AttributeItem alignItem = {align, 1};
    g_nodeAPI->setAttribute(area, NODE_TEXT_ALIGN, &alignItem);
    ArkUI_NumberValue fontSize[] = {{.f32 = 14.0f}};
    ArkUI_AttributeItem fontItem = {fontSize, 1};
    g_nodeAPI->setAttribute(area, NODE_FONT_SIZE, &fontItem);
    ArkUI_NumberValue bg[] = {{.u32 = 0xFFE8EEF7}};
    ArkUI_AttributeItem bgItem = {bg, 1};
    g_nodeAPI->setAttribute(area, NODE_BACKGROUND_COLOR, &bgItem);
    ArkUI_AttributeItem idItem = {.string = "drop_area"};
    g_nodeAPI->setAttribute(area, NODE_ID, &idItem);
    OH_ArkUI_AllowNodeAllDropDataTypes(area);
    g_nodeAPI->registerNodeEvent(area, NODE_ON_DRAG_ENTER, 0, nullptr);
    g_nodeAPI->registerNodeEvent(area, NODE_ON_DROP, 0, nullptr);
    g_nodeAPI->addNodeEventReceiver(area, NodeEventReceiver);
    return area;
}

static ArkUI_NodeHandle CreateResultText()
{
    auto text = g_nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem contentItem = {.string = "waiting drag..."};
    g_nodeAPI->setAttribute(text, NODE_TEXT_CONTENT, &contentItem);
    ArkUI_NumberValue fontSize[] = {{.f32 = 14.0f}};
    ArkUI_AttributeItem fontItem = {fontSize, 1};
    g_nodeAPI->setAttribute(text, NODE_FONT_SIZE, &fontItem);
    ArkUI_AttributeItem idItem = {.string = "result_text"};
    g_nodeAPI->setAttribute(text, NODE_ID, &idItem);
    return text;
}

napi_value DragEventSummaryTest::CreateNativeNode(napi_env env, napi_callback_info info)
{
    size_t argCnt = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok || argCnt < 1) {
        return nullptr;
    }
    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = {'\0'};
    size_t length;
    if (napi_get_value_string_utf8(env, args[0], idStr, OH_XCOMPONENT_ID_LEN_MAX + 1, &length) != napi_ok) {
        return nullptr;
    }

    g_nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, g_nodeAPI);
    if (!g_nodeAPI) {
        return nullptr;
    }

    auto root = g_nodeAPI->createNode(ARKUI_NODE_COLUMN);

    auto title = g_nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem titleItem = {.string = "DragEvent_GetSummary Test"};
    g_nodeAPI->setAttribute(title, NODE_TEXT_CONTENT, &titleItem);
    ArkUI_NumberValue titleFontSize[] = {{.f32 = 18.0f}};
    ArkUI_AttributeItem titleFontItem = {titleFontSize, 1};
    g_nodeAPI->setAttribute(title, NODE_FONT_SIZE, &titleFontItem);
    g_nodeAPI->addChild(root, title);

    auto hint = g_nodeAPI->createNode(ARKUI_NODE_TEXT);
    ArkUI_AttributeItem hintItem = {.string = "Drag image to drop area"};
    g_nodeAPI->setAttribute(hint, NODE_TEXT_CONTENT, &hintItem);
    g_nodeAPI->addChild(root, hint);

    g_dragImage = CreateDraggableImage();
    g_nodeAPI->addChild(root, g_dragImage);

    g_dropArea = CreateDropArea();
    g_nodeAPI->addChild(root, g_dropArea);

    g_resultText = CreateResultText();
    g_nodeAPI->addChild(root, g_resultText);

    g_nodeAPI->registerNodeEventReceiver(NodeEventReceiver);

    std::string idString(idStr);
    OH_NativeXComponent_AttachNativeRootNode(PluginManager::GetInstance()->GetNativeXComponent(idString), root);
    return nullptr;
}

}
