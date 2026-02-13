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

#include "SwiperFakeTest.h"
#include <string>
#include <arkui/native_interface.h>
#include <memory>
#include "common/common.h"
#include "napi/native_api.h"
#include <arkui/native_node.h>
#include <arkui/native_type.h>
#include <hilog/log.h>
#include <arkui/native_node_napi.h>

namespace ConstIde {
const float TEXT_WIDTH_VP = 200.0f;        // 宽度
const float TEXT_HEIGHT_VP = 200.0f;       // 高度
const uint32_t TEXT_BG_COLOR = 0xFFAFEEEE; // 淡蓝色
const int32_t TEXT_ALIGN_CENTER = 1;       // 居中
const float TEXT_FONT_SIZE_VP = 30.0f;     // 字体大小

const uint32_t NUMBER_0 = 0;
const uint32_t NUMBER_1 = 1;
const uint32_t BACKGROUND_COLOR = 0x2AA1A6B1;
} // namespace ConstIde

const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
static ArkUI_NativeNodeAPI_1 *nodeAPI_ = reinterpret_cast<ArkUI_NativeNodeAPI_1 *>(
    OH_ArkUI_QueryModuleInterfaceByName(ARKUI_NATIVE_NODE, "ArkUI_NativeNodeAPI_1"));
ArkUI_ContextHandle g_contextHandle = nullptr;
int g_dragCount = PARAM_10;
ArkUI_NodeHandle swiper = nullptr;
typedef void (*FakeCallback)(uint64_t nanoTimestamp, uint32_t frameCount, void *userData);
FakeCallback callback = [](uint64_t nanoTimestamp, uint32_t frameCount, void *userData) {
    OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq g_dragCount %{public}d", g_dragCount);
    if (g_dragCount > 0) {
        bool ret = false;
        OH_ArkUI_Swiper_FakeDragBy(swiper, PARAM_NEGATIVE_3, &ret);
        OH_ArkUI_PostFrameCallback(g_contextHandle, nullptr, callback);
        --g_dragCount;
    } else {
        bool ret = false;
        OH_ArkUI_Swiper_StopFakeDrag(swiper, &ret);
    }
};

namespace ArkUICapiTest {
 napi_value SwiperFakeTest::CreateNativeSwiperNode(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode env or info is null");
        return nullptr;
    }
    size_t argCnt = PARAM_2;
    napi_value args[2] = {nullptr, nullptr};
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "CreateNativeNode napi_get_cb_info failed");
    }
    ArkUI_NodeContentHandle nodeContentHandle = nullptr;

    OH_ArkUI_GetNodeContentFromNapiValue(env, args[ConstIde::NUMBER_0], &nodeContentHandle);
    OH_ArkUI_GetContextFromNapiValue(env, args[1], &g_contextHandle);

    const int size = PARAM_11;
    // 设置swiper内容为0,1,2……
    const char *arr[size] = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"};
    swiper = nodeAPI_->createNode(ARKUI_NODE_SWIPER);

    for (int j = ConstIde::NUMBER_0; j < size; j++) {
        ArkUI_NodeHandle textNode = nodeAPI_->createNode(ARKUI_NODE_TEXT);
        ArkUI_AttributeItem content = {.string = arr[j]};
        nodeAPI_->setAttribute(textNode, NODE_TEXT_CONTENT, &content);

        ArkUI_NumberValue value[] = {0};
        ArkUI_AttributeItem item = {.value = value, .size = 1};
        value[ConstIde::NUMBER_0].f32 = ConstIde::TEXT_HEIGHT_VP;
        nodeAPI_->setAttribute(textNode, NODE_HEIGHT, &item);
        value[ConstIde::NUMBER_0].u32 = ConstIde::TEXT_BG_COLOR;
        nodeAPI_->setAttribute(textNode, NODE_BACKGROUND_COLOR, &item);
        value[ConstIde::NUMBER_0].i32 = ConstIde::TEXT_ALIGN_CENTER;
        nodeAPI_->setAttribute(textNode, NODE_TEXT_ALIGN, &item);
        value[ConstIde::NUMBER_0].f32 = ConstIde::TEXT_FONT_SIZE_VP;
        nodeAPI_->setAttribute(textNode, NODE_FONT_SIZE, &item);

        ArkUI_AttributeItem textId = {.string = "SwiperAutoPlayText"};
        nodeAPI_->setAttribute(textNode, NODE_ID, &textId);
        nodeAPI_->addChild(swiper, textNode);
    }
    ArkUI_NumberValue value[] = {};
    ArkUI_AttributeItem item = {.value = value, .size = 1};
    ArkUI_NodeHandle buttonText = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = PARAM_200;
    nodeAPI_->setAttribute(buttonText, NODE_WIDTH, &item);
    value[0].f32 = SIZE_50;
    nodeAPI_->setAttribute(buttonText, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText, NODE_BACKGROUND_COLOR, &item);
    ArkUI_AttributeItem content = {.string = "start fake drag"};
    nodeAPI_->setAttribute(buttonText, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText, NODE_ON_CLICK, PARAM_1, nullptr);

    ArkUI_NodeHandle buttonText2 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = PARAM_200;
    nodeAPI_->setAttribute(buttonText2, NODE_WIDTH, &item);
    value[0].f32 = SIZE_50;
    nodeAPI_->setAttribute(buttonText2, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFFD700; // 金色
    nodeAPI_->setAttribute(buttonText2, NODE_BACKGROUND_COLOR, &item);
    content = {.string = "fake drag 100"};
    nodeAPI_->setAttribute(buttonText2, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText2, NODE_ON_CLICK, PARAM_2, nullptr);

    ArkUI_NodeHandle buttonText3 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = PARAM_200;
    nodeAPI_->setAttribute(buttonText3, NODE_WIDTH, &item);
    value[0].f32 = SIZE_50;
    nodeAPI_->setAttribute(buttonText3, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText3, NODE_BACKGROUND_COLOR, &item);
    content = {.string = "fake drag -100"};
    nodeAPI_->setAttribute(buttonText3, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText3, NODE_ON_CLICK, PARAM_3, nullptr);

    ArkUI_NodeHandle buttonText4 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = PARAM_200;
    nodeAPI_->setAttribute(buttonText4, NODE_WIDTH, &item);
    value[0].f32 = SIZE_50;
    nodeAPI_->setAttribute(buttonText4, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFFD700; // 金色
    nodeAPI_->setAttribute(buttonText4, NODE_BACKGROUND_COLOR, &item);
    content = {.string = "stop fake drag"};
    nodeAPI_->setAttribute(buttonText4, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText4, NODE_ON_CLICK, PARAM_4, nullptr);

    ArkUI_NodeHandle buttonText5 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = PARAM_200;
    nodeAPI_->setAttribute(buttonText5, NODE_WIDTH, &item);
    value[0].f32 = SIZE_50;
    nodeAPI_->setAttribute(buttonText5, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText5, NODE_BACKGROUND_COLOR, &item);
    content = {.string = "模拟连续划动"};
    nodeAPI_->setAttribute(buttonText5, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText5, NODE_ON_CLICK, PARAM_5, nullptr);

    ArkUI_NodeHandle buttonText6 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = PARAM_200;
    nodeAPI_->setAttribute(buttonText6, NODE_WIDTH, &item);
    value[0].f32 = SIZE_50;
    nodeAPI_->setAttribute(buttonText6, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFFD700; // 金色
    nodeAPI_->setAttribute(buttonText6, NODE_BACKGROUND_COLOR, &item);
    content = {.string = "showprev"};
    nodeAPI_->setAttribute(buttonText6, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText6, NODE_ON_CLICK, PARAM_6, nullptr);

    ArkUI_NodeHandle buttonText7 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = PARAM_200;
    nodeAPI_->setAttribute(buttonText7, NODE_WIDTH, &item);
    value[0].f32 = SIZE_50;
    nodeAPI_->setAttribute(buttonText7, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText7, NODE_BACKGROUND_COLOR, &item);
    content = {.string = "shownext"};
    nodeAPI_->setAttribute(buttonText7, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText7, NODE_ON_CLICK, PARAM_7, nullptr);

    ArkUI_NodeHandle buttonText8 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = PARAM_200;
    nodeAPI_->setAttribute(buttonText8, NODE_WIDTH, &item);
    value[0].f32 = SIZE_50;
    nodeAPI_->setAttribute(buttonText8, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFFD700; // 金色
    nodeAPI_->setAttribute(buttonText8, NODE_BACKGROUND_COLOR, &item);
    content = {.string = "异常值"};
    nodeAPI_->setAttribute(buttonText8, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText8, NODE_ON_CLICK, PARAM_8, nullptr);
    
    ArkUI_NodeHandle buttonText9 = nodeAPI_->createNode(ARKUI_NODE_TEXT);
    value[0].f32 = PARAM_200;
    nodeAPI_->setAttribute(buttonText9, NODE_WIDTH, &item);
    value[0].f32 = SIZE_50;
    nodeAPI_->setAttribute(buttonText9, NODE_HEIGHT, &item);
    value[0].u32 = 0xFFFF00FF; // 红色
    nodeAPI_->setAttribute(buttonText9, NODE_BACKGROUND_COLOR, &item);
    content = {.string = "isfakedragging"};
    nodeAPI_->setAttribute(buttonText9, NODE_TEXT_CONTENT, &content);
    nodeAPI_->registerNodeEvent(buttonText9, NODE_ON_CLICK, PARAM_9, nullptr);

    auto onclick = [](ArkUI_NodeEvent *event) {
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == 100) {
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_1) {
            bool ret = false;
            int32_t codeErr = OH_ArkUI_Swiper_StartFakeDrag(swiper, &ret);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
                         "hzq OH_ArkUI_Swiper_StartFakeDrag %{public}d %{public}d", ret, codeErr);
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_2) {
            bool ret = false;
            int32_t codeErr = OH_ArkUI_Swiper_FakeDragBy(swiper, PARAM_100, &ret);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
                         "hzq OH_ArkUI_Swiper_FakeDragBy100 %{public}d %{public}d", ret, codeErr);
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_3) {
            bool ret = false;
            int32_t codeErr = OH_ArkUI_Swiper_FakeDragBy(swiper, -100, &ret);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
                         "hzq OH_ArkUI_Swiper_FakeDragBy-100 %{public}d %{public}d", ret, codeErr);
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_4) {
            bool ret = false;
            int32_t codeErr = OH_ArkUI_Swiper_StopFakeDrag(swiper, &ret);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_StopFakeDrag %{public}d %{public}d",
                         ret, codeErr);
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_5) {
            bool ret = false;
            OH_ArkUI_Swiper_StartFakeDrag(swiper, &ret);
            g_dragCount = PARAM_10;
            int32_t PostFrameCallbackRet;
            PostFrameCallbackRet = OH_ArkUI_PostFrameCallback(g_contextHandle, nullptr, callback);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_PostFrameCallback %{public}d",
                         PostFrameCallbackRet);
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_6) {
            int32_t codeErr = OH_ArkUI_Swiper_ShowPrevious(swiper);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_StopFakeDrag %{public}d", codeErr);
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_7) {
            int32_t codeErr = OH_ArkUI_Swiper_ShowNext(swiper);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_StopFakeDrag %{public}d", codeErr);
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == PARAM_8) {
            bool ret = false;
            int32_t codeErr = OH_ArkUI_Swiper_StartFakeDrag(nullptr, &ret);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
                         "hzq OH_ArkUI_Swiper_StartFakeDrag %{public}d %{public}d", ret, codeErr);
            codeErr = OH_ArkUI_Swiper_FakeDragBy(nullptr, PARAM_100, &ret);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
                         "hzq OH_ArkUI_Swiper_FakeDragBy %{public}d %{public}d", ret, codeErr);
            codeErr = OH_ArkUI_Swiper_StopFakeDrag(nullptr, &ret);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
                         "hzq OH_ArkUI_Swiper_StopFakeDrag %{public}d %{public}d", ret, codeErr);
            codeErr = OH_ArkUI_Swiper_IsFakeDragging(nullptr, &ret);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
                         "hzq OH_ArkUI_Swiper_IsFakeDragging %{public}d %{public}d", ret, codeErr);
            codeErr = OH_ArkUI_Swiper_ShowPrevious(nullptr);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_ShowPrevious %{public}d", codeErr);
            codeErr = OH_ArkUI_Swiper_ShowNext(nullptr);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager", "hzq OH_ArkUI_Swiper_ShowNext %{public}d", codeErr);
        }
        if (OH_ArkUI_NodeEvent_GetTargetId(event) == 9) {
            bool ret = false;
            int32_t codeErr = OH_ArkUI_Swiper_IsFakeDragging(swiper, &ret);
            OH_LOG_Print(LOG_APP, LOG_INFO, 0xFF00, "Manager",
                "hzq OH_ArkUI_Swiper_IsFakeDragging %{public}d %{public}d", ret, codeErr);
        }
    };
    nodeAPI_->registerNodeEventReceiver(onclick);

    value[0].f32 = SIZE_300;
    nodeAPI_->setAttribute(swiper, NODE_WIDTH, &item);

    ArkUI_NodeHandle root_ = nodeAPI_->createNode(ARKUI_NODE_COLUMN);
    nodeAPI_->addChild(root_, swiper);
    nodeAPI_->addChild(root_, buttonText);
    nodeAPI_->addChild(root_, buttonText2);
    nodeAPI_->addChild(root_, buttonText3);
    nodeAPI_->addChild(root_, buttonText4);
    nodeAPI_->addChild(root_, buttonText5);
    nodeAPI_->addChild(root_, buttonText6);
    nodeAPI_->addChild(root_, buttonText7);
    nodeAPI_->addChild(root_, buttonText8);
    nodeAPI_->addChild(root_, buttonText9);

    // 挂载节点
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "Manager", "OH_ArkUI_GetBasicNodeAPI after");
    if (nodeAPI_ != nullptr) {
        if (nodeAPI_->createNode != nullptr && nodeAPI_->addChild != nullptr) {
            OH_ArkUI_NodeContent_AddNode(nodeContentHandle, root_);
        }
    }
    return nullptr;
}
}