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

#include "CoastingAxisTest.h"
#include <asm-generic/stat.h>
#include <cstdint>
#include <iostream>
#include <linux/if.h>
#include <linux/if_link.h>
#include <linux/mroute6.h>
#include <linux/quota.h>
#include <string>
#include <cstdio>
#include "napi/native_api.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <arkui/native_node.h>
#include <arkui/native_animate.h>
#include <arkui/native_node_napi.h>
#include <arkui/native_type.h>
#include <arkui/native_interface.h>
#include <arkui/native_type.h>
#include <arkui/native_gesture.h>
#include <arkui/native_key_event.h>
#include <hilog/log.h>

static long long g_timeStamp = 100;
static float g_deltaX = 10.0;
static float g_deltaY = 10.0;
static int g_phase = 10;
static int g_subKind = 1;
static int g_eventTypeId = 9;


namespace ArkUICapiTest {

typedef int ArkUI_Bool;
typedef int ArkUI_Int32;
typedef unsigned int ArkUI_Uint32;
typedef long long ArkUI_Int64;
typedef float ArkUI_Float32;
typedef double ArkUI_Float64;
typedef const char* ArkUI_CharPtr;
typedef unsigned long long ArkUI_Uint64;

struct ArkUI_UIInputEvent_ {
    ArkUI_UIInputEvent_Type inputType;
    ArkUI_Int32 eventTypeId;
    void* inputEvent;
    bool isCloned = false;
};

struct ArkUiCoastingAxisEvent {
    ArkUI_Int64 timeStamp;
    ArkUI_Float32 deltaX;
    ArkUI_Float32 deltaY;
    ArkUI_Int32 subKind;
    ArkUI_Int32 phase;
    bool stopPropagation;
};

napi_value CoastingAxisTest::CoastingAxisEventTest_a(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest", "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUiCoastingAxisEvent *coastingAxisEvent = new ArkUiCoastingAxisEvent;
    coastingAxisEvent->timeStamp = g_timeStamp;
    coastingAxisEvent->deltaX = g_deltaX;
    coastingAxisEvent->deltaY = g_deltaY;
    coastingAxisEvent->phase = g_phase;
    coastingAxisEvent->subKind = g_subKind;
    coastingAxisEvent->stopPropagation = false;
    ArkUI_UIInputEvent_ *event = new ArkUI_UIInputEvent_;
    event->eventTypeId = g_eventTypeId;
    auto coastingAxis = (ArkUI_CoastingAxisEvent *)coastingAxisEvent;
    event->inputEvent = (void *)coastingAxis;
    ArkUI_CoastingAxisEvent *axisEvent = OH_ArkUI_UIInputEvent_GetCoastingAxisEvent((ArkUI_UIInputEvent *)event);
    auto time = OH_ArkUI_CoastingAxisEvent_GetEventTime(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_GetEventTime %{public}lld", time);
    ASSERT_EQ(time, g_timeStamp);
    auto deltaX = OH_ArkUI_CoastingAxisEvent_GetDeltaX(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaX %{public}f", deltaX);
    ASSERT_EQ(deltaX, g_deltaX);
    auto deltaY = OH_ArkUI_CoastingAxisEvent_GetDeltaY(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaY %{public}f", deltaY);
    ASSERT_EQ(deltaY, g_deltaY);
    auto phase = (int32_t)OH_ArkUI_CoastingAxisEvent_GetPhase(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_GetPhase %{public}d", phase);
    ASSERT_EQ(phase, g_phase);
    auto propagation = OH_ArkUI_CoastingAxisEvent_SetPropagation(axisEvent, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_a",
        "OH_ArkUI_CoastingAxisEvent_SetPropagation %{public}d", propagation);
    ASSERT_EQ(propagation, ARKUI_ERROR_CODE_NO_ERROR);
    NAPI_END;
}

napi_value CoastingAxisTest::CoastingAxisEventTest_b(napi_env env, napi_callback_info info)
{
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "CreateNativeNode");
    NAPI_START(customSpan, ARKUI_NODE_CUSTOM_SPAN);
    ArkUI_UIInputEvent *event = NULL;
    ArkUI_CoastingAxisEvent *axisEvent = OH_ArkUI_UIInputEvent_GetCoastingAxisEvent(event);
    auto time = OH_ArkUI_CoastingAxisEvent_GetEventTime(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_GetEventTime %{public}lld", time);
    ASSERT_EQ(time, 0);
    auto deltaX = OH_ArkUI_CoastingAxisEvent_GetDeltaX(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaX %{public}f", deltaX);
    ASSERT_EQ(deltaX, 0);
    auto deltaY = OH_ArkUI_CoastingAxisEvent_GetDeltaY(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_GetDeltaY %{public}f", deltaY);
    ASSERT_EQ(deltaY, 0);
    auto phase = (int32_t)OH_ArkUI_CoastingAxisEvent_GetPhase(axisEvent);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_GetPhase %{public}d", phase);
    ASSERT_EQ(phase, 0);
    auto propagation = OH_ArkUI_CoastingAxisEvent_SetPropagation(axisEvent, true);
    OH_LOG_Print(LOG_APP, LOG_INFO, LOG_PRINT_DOMAIN, "CoastingAxisEventTest_b",
        "OH_ArkUI_CoastingAxisEvent_SetPropagation %{public}d", propagation);
    ASSERT_EQ(propagation, ARKUI_ERROR_CODE_PARAM_INVALID);
    NAPI_END;
}
} // namespace ArkUICapiTest