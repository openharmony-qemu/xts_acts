/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include "napi/native_api.h"
#include "multimodalinput/oh_input_manager.h"
#include "multimodalinput/oh_key_code.h"
#include "hilog/log.h"

void KeyEventCallback(const struct Input_KeyEvent* keyEvent)
{
    OH_Input_GetKeyEventAction(keyEvent);
    OH_Input_GetKeyEventKeyCode(keyEvent);
    OH_Input_GetKeyEventWindowId(keyEvent);
    OH_Input_GetKeyEventDisplayId(keyEvent);
}

void MouseEventCallback(const struct Input_MouseEvent* mouseEvent)
{
    OH_Input_GetMouseEventAction(mouseEvent);
    OH_Input_GetMouseEventDisplayX(mouseEvent);
    OH_Input_GetMouseEventDisplayY(mouseEvent);
    OH_Input_GetMouseEventWindowId(mouseEvent);
    OH_Input_GetMouseEventDisplayId(mouseEvent);
}

void TouchEventCallback(const struct Input_TouchEvent* touchEvent)
{
    OH_Input_GetTouchEventAction(touchEvent);
    OH_Input_GetTouchEventFingerId(touchEvent);
    OH_Input_GetTouchEventWindowId(touchEvent);
    OH_Input_GetTouchEventDisplayId(touchEvent);
}

void AxisEventCallbackAll(const struct Input_AxisEvent* axisEvent)
{
    InputEvent_AxisAction axisAction = AXIS_ACTION_BEGIN;
    OH_Input_GetAxisEventAction(axisEvent, &axisAction);
    InputEvent_AxisEventType sourceType = AXIS_EVENT_TYPE_PINCH;
    OH_Input_GetAxisEventType(axisEvent, &sourceType);
    InputEvent_SourceType axisEventType = SOURCE_TYPE_MOUSE;
    OH_Input_GetAxisEventSourceType(axisEvent, &axisEventType);
}

void AxisEventCallback(const struct Input_AxisEvent* axisEvent)
{
    InputEvent_AxisAction axisAction = AXIS_ACTION_BEGIN;
    OH_Input_GetAxisEventAction(axisEvent, &axisAction);
    InputEvent_AxisEventType sourceType = AXIS_EVENT_TYPE_PINCH;
    OH_Input_GetAxisEventType(axisEvent, &sourceType);
    InputEvent_SourceType axisEventType = SOURCE_TYPE_MOUSE;
    OH_Input_GetAxisEventSourceType(axisEvent, &axisEventType);
}

static napi_value AddKeyEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddKeyEventMonitor(KeyEventCallback);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_RemoveKeyEventMonitor(KeyEventCallback);
    return result;
}

static napi_value AddMouseEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddMouseEventMonitor(MouseEventCallback);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_RemoveMouseEventMonitor(MouseEventCallback);
    return result;
}

static napi_value AddTouchEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddTouchEventMonitor(TouchEventCallback);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_RemoveTouchEventMonitor(TouchEventCallback);
    return result;
}

static napi_value AddAxisEventMonitorForAllException(napi_env env, napi_callback_info info)
{
    napi_value result;
    Input_Result retResult = OH_Input_AddAxisEventMonitorForAll(AxisEventCallbackAll);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_RemoveAxisEventMonitorForAll(AxisEventCallbackAll);
    return result;
}

static napi_value AddAxisEventMonitorException(napi_env env, napi_callback_info info)
{
    napi_value result;
    InputEvent_AxisEventType axisEventType = AXIS_EVENT_TYPE_PINCH;
    Input_Result retResult = OH_Input_AddAxisEventMonitor(axisEventType, AxisEventCallback);
    napi_create_int32(env, (retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_RemoveAxisEventMonitor(axisEventType, AxisEventCallback);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"AddKeyEventMonitorException", nullptr, AddKeyEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddMouseEventMonitorException", nullptr, AddMouseEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddTouchEventMonitorException", nullptr, AddTouchEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitorForAllException", nullptr, AddAxisEventMonitorForAllException, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddAxisEventMonitorException", nullptr, AddAxisEventMonitorException, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libinputndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
