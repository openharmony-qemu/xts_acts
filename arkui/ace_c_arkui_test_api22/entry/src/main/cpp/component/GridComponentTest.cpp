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

#include "GridComponentTest.h"

namespace ArkUICapiTest {
void GridComponent::SetColumnTemplateItemFillPolicy(int32_t fillPolicy)
{
    ArkUI_NumberValue value[] = {{.i32 = fillPolicy}};
    ArkUI_AttributeItem item = {value, sizeof(value) / sizeof(ArkUI_NumberValue)};
    _nodeAPI->setAttribute(_component, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY, &item);
}

int32_t GridComponent::GetColumnTemplateItemFillPolicy()
{
    int32_t ret = -1;
    auto attr = _nodeAPI->getAttribute(_component, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY);
    if (attr) {
        ret = attr->value[0].i32;
    }
    return ret;
}

void GridComponent::ResetColumnTemplateItemFillPolicy()
{
    _nodeAPI->resetAttribute(_component, NODE_GRID_COLUMN_TEMPLATE_ITEMFILLPOLICY);
}

void GridComponent::SetGridColumnsTemplate(const std::string& str)
{
    ArkUI_AttributeItem item = { .string = str.c_str() };
    _nodeAPI->setAttribute(_component, NODE_GRID_COLUMN_TEMPLATE, &item);
}

std::string GridComponent::GetGridColumnsTemplate()
{
    std::string ret;
    auto attr = _nodeAPI->getAttribute(_component, NODE_GRID_COLUMN_TEMPLATE);
    if (attr) {
        ret = attr->string;
    }
    return ret;
}

void GridComponent::ResetGridColumnsTemplate()
{
    _nodeAPI->resetAttribute(_component, NODE_GRID_COLUMN_TEMPLATE);
}

void GridComponent::SetGridColumnsGap(float val)
{
    ArkUI_NumberValue value[] = { { .f32 = val } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_GRID_COLUMN_GAP, &item);
}
void GridComponent::SetGridRowsGap(float val)
{
    ArkUI_NumberValue value[] = { { .f32 = val } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_GRID_ROW_GAP, &item);
}
void GridComponent::SetGridCachedCount(int32_t cachedCount)
{
    ArkUI_NumberValue value[] = { { .i32 = cachedCount } };
    ArkUI_AttributeItem item = { value, 1 };
    _nodeAPI->setAttribute(_component, NODE_GRID_CACHED_COUNT, &item);
}
void GridComponent::SetScrollTo(float hOffset, float vOffset, const std::vector<int32_t>& optionalParams)
{
    auto value = new ArkUI_NumberValue[2 + static_cast<int32_t>(optionalParams.size())];
    value[0] = { .f32 = hOffset };
    value[1] = { .f32 = vOffset };
    for (int32_t i = 0; i < optionalParams.size(); i++) {
        value[2 + i] = { .i32 = optionalParams[i] };
    }
    ArkUI_AttributeItem item = { value, 2 + static_cast<int32_t>(optionalParams.size()) };
    _nodeAPI->setAttribute(_component, NODE_SCROLL_OFFSET, &item);
}

void GridComponent::SetBackToTop(int32_t isBackToTop)
{
    ArkUI_NumberValue value[] = {{.i32 = isBackToTop}};
    ArkUI_AttributeItem item = {value, 1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BACK_TO_TOP, &item);
}

void GridComponent::SetGridLayoutOptions(ArkUI_GridLayoutOptions* option)
{
    if (option == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "wangyu SetGridLayoutOptions",
                     "wangyu SetGridLayoutOptions option == nullptr");
    }
    ArkUI_AttributeItem item = {.object = option};
    auto size = item.size;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "wangyu SetGridLayoutOptions",
                 "SetGridLayoutOptions size: %{public}d", size);
    _nodeAPI->setAttribute(_component, NODE_GRID_LAYOUT_OPTIONS, &item);
}

void GridComponent::ResetGridLayoutOptions()
{
    _nodeAPI->resetAttribute(_component, NODE_GRID_LAYOUT_OPTIONS);
}

ArkUI_GridLayoutOptions* GridComponent::GetGridLayoutOptions()
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "wangyu",
                 "GetGridLayoutOptions begin");
    auto item = _nodeAPI->getAttribute(_component, NODE_GRID_LAYOUT_OPTIONS);
    if (item == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "wangyu",
                     "GetGridLayoutOptions -1");
        return nullptr;
    }
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "wangyu",
                     "GetGridLayoutOptions end");
    return reinterpret_cast<ArkUI_GridLayoutOptions*>(item->object);
}

static void processScrollBarOnUpdate(
    ArkUI_NativeNodeAPI_1* nodeAPI, ArkUI_NodeEvent* event, ArkUI_NodeHandle nodeHandler)
{
    ArkUI_NumberValue background_color_value[] = { { .u32 = COLOR_YELLOW } };
    ArkUI_AttributeItem background_color_item = { background_color_value,
        sizeof(background_color_value) / sizeof(ArkUI_NumberValue) };
    nodeAPI->setAttribute(nodeHandler, NODE_BACKGROUND_COLOR, &background_color_item);
    ArkUI_NumberValue value[PARAM_2];
    OH_ArkUI_NodeEvent_GetNumberValue(event, 0, value);
    OH_ArkUI_NodeEvent_GetNumberValue(event, 1, value);
    auto index = value[PARAM_0].i32;
    auto offset = value[PARAM_1].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest",
        "processScrollBarOnUpdate index: %{public}d, offset: %{public}f", index, offset);
    
    ArkUI_NumberValue bar_value[] = {{.f32 = 100}, {.f32 = 1000}};
    auto ret = OH_ArkUI_NodeEvent_SetReturnNumberValue(event, bar_value, 2);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest",
        "processScrollBarOnUpdate setReturnNumberValue ret: %{public}d", ret);
    OH_ArkUI_NodeEvent_GetNumberValue(event, 0, value);
    OH_ArkUI_NodeEvent_GetNumberValue(event, 1, value);
    auto index1 = value[PARAM_0].i32;
    auto offset1 = value[PARAM_1].f32;
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "GridTest",
        "processScrollBarOnUpdate-1 index1: %{public}d, offset1: %{public}f", index1, offset1);
}
void GridComponent::OnNodeEvent(ArkUI_NodeEvent* event)
{
    auto eventType = OH_ArkUI_NodeEvent_GetEventType(event);
    if (eventMap_.find(eventType) != eventMap_.end()) {
        eventMap_[eventType](event);
    }
}

static void OnEventReceive(ArkUI_NodeEvent* event)
{
    if (event == nullptr) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "GridTest",
            "GridTest OnEventReceive: event is null");
        return;
    }
    int32_t eventId = OH_ArkUI_NodeEvent_GetTargetId(event);
    ArkUI_NativeNodeAPI_1* nodeAPI = nullptr;
    OH_ArkUI_GetModuleInterface(ARKUI_NATIVE_NODE, ArkUI_NativeNodeAPI_1, nodeAPI);
    auto nodeHandler = OH_ArkUI_NodeEvent_GetNodeHandle(event);
    switch (eventId) {
        case ON_SCROLL_UPDATE: {
            processScrollBarOnUpdate(nodeAPI, event, nodeHandler);
            return;
        }
        default:
            break;
    }
}

void GridComponent::SetOnGridReachEnd(OnGridReachEnd onReachEnd)
{
    auto onReachEndCallback = [onReachEnd](ArkUI_NodeEvent*) {
        if (onReachEnd) {
            onReachEnd();
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_REACH_END] = onReachEndCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_REACH_END, 0, nullptr);
}

void GridComponent::SetOnGridReachStart(OnGridSReachStart onReachStart)
{
    auto onReachStartCallback = [onReachStart](ArkUI_NodeEvent*) {
        if (onReachStart) {
            onReachStart();
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_REACH_START] = onReachStartCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_REACH_START, 0, nullptr);
}

void GridComponent::SetOnGridScrollFrameBegin(OnGridScrollFrameBegin onScrollFrameBegin)
{
    auto onGridScrollFrameBegin = [onScrollFrameBegin](ArkUI_NodeEvent* event) {
        if (onScrollFrameBegin) {
            ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
            float offset = result->data[0].f32;
            int32_t state = result->data[1].i32;
            onScrollFrameBegin(offset, state);
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN] = onGridScrollFrameBegin;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_SCROLL_FRAME_BEGIN, 0, nullptr);
}

void GridComponent::SetOnGridScrollStop(OnGridScrollStop onScrollStop)
{
    auto onScrollStopCallback = [onScrollStop](ArkUI_NodeEvent*) {
        if (onScrollStop) {
            onScrollStop();
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_SCROLL_STOP] = onScrollStopCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_SCROLL_STOP, 0, nullptr);
}

void GridComponent::SetOnGridScrollStart(OnGridScrollStart onScrollStart)
{
    auto onScrollStartCallback = [onScrollStart](ArkUI_NodeEvent*) {
        if (onScrollStart) {
            onScrollStart();
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_SCROLL_START] = onScrollStartCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_SCROLL_START, 0, nullptr);
}

void GridComponent::SetOnGridWillScroll(OnGridWillScroll onWillScroll)
{
    auto onWillScrollCallback = [onWillScroll](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onWillScroll) {
            float offset = result->data[0].f32;
            int32_t state = result->data[1].i32;
            int32_t source =  result->data[1].i32;
            onWillScroll(offset, state, source);
        }
    };
    eventMap_[NODE_GRID_ON_WILL_SCROLL] = onWillScrollCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_WILL_SCROLL, 0, nullptr);
}

void GridComponent::SetOnGridDidScroll(OnGridDidScroll onDidScroll)
{
    auto onDidScrollCallback = [onDidScroll](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onDidScroll) {
            float offset = result->data[PARAM_0].f32;
            int32_t state = result->data[PARAM_1].i32;
            onDidScroll(offset, state);
        }
    };
    eventMap_[NODE_GRID_ON_DID_SCROLL] = onDidScrollCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_DID_SCROLL, 0, nullptr);
}

void GridComponent::SetOnGridWillStopDragging(OnGridWillStopDragging onWillStopDragging)
{
    auto onDidScrollCallback = [onWillStopDragging](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onWillStopDragging) {
            float velocity = result->data[0].f32;
            onWillStopDragging(velocity);
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING] = onDidScrollCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_WILL_STOP_DRAGGING, 0, nullptr);
}

void GridComponent::SetOnGridScrollIndex(OnGridScrollIndex onGridScrollIndex)
{
    auto onGridScrollIndexCallback = [onGridScrollIndex](ArkUI_NodeEvent* event) {
        ArkUI_NodeComponentEvent* result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onGridScrollIndex) {
            int32_t first = result->data[0].i32;
            int32_t last = result->data[1].i32;
            onGridScrollIndex(first, last);
        }
    };
    eventMap_[NODE_GRID_ON_SCROLL_INDEX] = onGridScrollIndexCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_SCROLL_INDEX, 0, nullptr);
}

void GridComponent::SetOnScrollBarUpdate()
{
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_SCROLL_BAR_UPDATE, ON_SCROLL_UPDATE, nullptr);
    _nodeAPI->registerNodeEventReceiver(&OnEventReceive);
}

void GridComponent::SetGridNestedScroll(int32_t forward, int32_t backward)
{
    ArkUI_NumberValue value[] = {{.i32 = forward}, {.i32 = backward}};
    ArkUI_AttributeItem item = {value, PARAM_2};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_NESTED_SCROLL, &item);
}

void GridComponent::SetOnScrollIndex(OnScrollIndex onScrollIndex)
{
    auto onScrollIndexCallback = [onScrollIndex](ArkUI_NodeEvent *event) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onScrollIndex) {
            int32_t first = result->data[PARAM_0].i32;
            int32_t last = result->data[PARAM_1].i32;
            onScrollIndex(first, last);
        }
    };
    eventMap_[NODE_GRID_ON_SCROLL_INDEX] = onScrollIndexCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_SCROLL_INDEX, PARAM_0, nullptr);
}

void GridComponent::SetColumnsTemplate(const std::string &str)
{
    ArkUI_AttributeItem item = {.string = str.c_str()};
    _nodeAPI->setAttribute(_component, NODE_GRID_COLUMN_TEMPLATE, &item);
}

void GridComponent::SetRowsTemplate(const std::string &str)
{
    ArkUI_AttributeItem item = {.string = str.c_str()};
    _nodeAPI->setAttribute(_component, NODE_GRID_ROW_TEMPLATE, &item);
}

void GridComponent::SetGridScrollToIndex(int32_t index)
{
    ArkUI_NumberValue value[] = {{.i32 = index}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    _nodeAPI->setAttribute(_component, NODE_WATER_FLOW_SCROLL_TO_INDEX, &item);
}

void GridComponent::SetGridScrollToIndex(int32_t index, int32_t animation)
{
    ArkUI_NumberValue value[] = {{.i32 = index}, {.i32 = animation}};
    ArkUI_AttributeItem item = {value, PARAM_2};
    _nodeAPI->setAttribute(_component, NODE_WATER_FLOW_SCROLL_TO_INDEX, &item);
}

void GridComponent::SetGridScrollToIndex(int32_t index, int32_t animation, int32_t alignment)
{
    ArkUI_NumberValue value[] = {{.i32 = index}, {.i32 = animation}, {.i32 = alignment}};
    ArkUI_AttributeItem item = {value, PARAM_3};
    _nodeAPI->setAttribute(_component, NODE_WATER_FLOW_SCROLL_TO_INDEX, &item);
}

void GridComponent::SetItemConstraintSize(float minWidth, float maxWidth, float minHeight, float maxHeight)
{
    ArkUI_NumberValue value[] = {{.f32 = minWidth}, {.f32 = maxWidth}, {.f32 = minHeight}, {.f32 = maxHeight}};
    ArkUI_AttributeItem item = {value, PARAM_3};
    _nodeAPI->setAttribute(_component, NODE_WATER_FLOW_ITEM_CONSTRAINT_SIZE, &item);
}

void GridComponent::SetGridScrollBar(int32_t barState)
{
    ArkUI_NumberValue value[] = {{.i32 = barState}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BAR_DISPLAY_MODE, &item);
}

void GridComponent::SetGridScrollBarWidth(float width)
{
    ArkUI_NumberValue value[] = {{.f32 = width}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BAR_WIDTH, &item);
}

void GridComponent::SetGridScrollBarColor(uint32_t color)
{
    ArkUI_NumberValue value[] = {{.u32 = color}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BAR_COLOR, &item);
}

void GridComponent::SetGridEnableScrollInteraction(bool enableScrollInteraction)
{
    ArkUI_NumberValue value[] = {{.i32 = enableScrollInteraction}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_ENABLE_SCROLL_INTERACTION, &item);
}

void GridComponent::SetGridFriction(float friction)
{
    ArkUI_NumberValue value[] = {{.f32 = friction}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_FRICTION, &item);
}

void GridComponent::SetGridEdgeEffect(int32_t edgeEffect, bool alwaysEnabled)
{
    ArkUI_NumberValue value[] = {{.i32 = edgeEffect}, {.i32 = alwaysEnabled}};
    ArkUI_AttributeItem item = {value, PARAM_2};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_EDGE_EFFECT, &item);
}

void GridComponent::SetScrollEdge(int32_t type)
{
    ArkUI_NumberValue value[] = {{.i32 = type}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_EDGE, &item);
}

void GridComponent::SetScrollPage(bool next)
{
    ArkUI_NumberValue value[] = {{.i32 = next}};
    ArkUI_AttributeItem item = {value, PARAM_1};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_PAGE, &item);
}

void GridComponent::SetScrollPage(bool next, bool animation)
{
    ArkUI_NumberValue value[] = {{.i32 = next}, {.i32 = animation}};
    ArkUI_AttributeItem item = {value, PARAM_2};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_PAGE, &item);
}

void GridComponent::SetScrollBy(float hDistance, float vDistance)
{
    ArkUI_NumberValue value[] = {{.f32 = hDistance}, {.f32 = vDistance}};
    ArkUI_AttributeItem item = {value, PARAM_2};
    _nodeAPI->setAttribute(_component, NODE_SCROLL_BY, &item);
}

void GridComponent::SetOnWillScroll(OnWillScroll onWillScroll)
{
    auto onWillScrollCallback = [onWillScroll](ArkUI_NodeEvent *event) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        float offset = result->data[PARAM_0].f32;
        int32_t state = result->data[PARAM_1].i32;
        int32_t source = result->data[PARAM_2].i32;
        if (onWillScroll) {
            onWillScroll(offset, state, source);
        }
    };
    eventMap_[NODE_GRID_ON_WILL_SCROLL] = onWillScrollCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_WILL_SCROLL, PARAM_0, nullptr);
}

void GridComponent::SetOnReachStart(OnReachStart onReachStart)
{
    auto onReachStartCallback = [onReachStart](ArkUI_NodeEvent *) {
        if (onReachStart) {
            onReachStart();
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_REACH_START] = onReachStartCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_REACH_START, PARAM_0, nullptr);
}

void GridComponent::SetOnReachEnd(OnReachEnd onReachEnd)
{
    auto onReachEndCallback = [onReachEnd](ArkUI_NodeEvent *) {
        if (onReachEnd) {
            onReachEnd();
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_REACH_END] = onReachEndCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_REACH_END, PARAM_0, nullptr);
}

void GridComponent::SetOnScrollStart(OnScrollStart onScrollStart)
{
    auto onScrollStartCallback = [onScrollStart](ArkUI_NodeEvent*) {
        if (onScrollStart) {
            onScrollStart();
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_SCROLL_START] = onScrollStartCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_SCROLL_START, 0, nullptr);
}

void GridComponent::SetOnScrollStop(OnScrollStop onScrollStop)
{
    auto onScrollStopCallback = [onScrollStop](ArkUI_NodeEvent *) {
        if (onScrollStop) {
            onScrollStop();
        }
    };
    eventMap_[NODE_SCROLL_EVENT_ON_SCROLL_STOP] = onScrollStopCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_SCROLL_EVENT_ON_SCROLL_STOP, PARAM_0, nullptr);
}

void GridComponent::SetOnDidScroll(OnDidScroll onDidScroll)
{
    auto onDidScrollCallback = [onDidScroll](ArkUI_NodeEvent *event) {
        ArkUI_NodeComponentEvent *result = OH_ArkUI_NodeEvent_GetNodeComponentEvent(event);
        if (onDidScroll) {
            float offset = result->data[PARAM_0].f32;
            int32_t state = result->data[PARAM_1].i32;
            onDidScroll(offset, state);
        }
    };
    eventMap_[NODE_GRID_ON_DID_SCROLL] = onDidScrollCallback;
    _nodeAPI->registerNodeEvent(_component, NODE_GRID_ON_DID_SCROLL, PARAM_0, nullptr);
}

void GridComponent::SetGridRowsTemplate(const std::string& str)
{
    ArkUI_AttributeItem item = { .string = str.c_str() };
    _nodeAPI->setAttribute(_component, NODE_GRID_ROW_TEMPLATE, &item);
}
} // namespace ArkUICapiTest