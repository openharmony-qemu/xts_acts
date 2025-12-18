/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "multimodalinput/oh_pointer_style.h"
#include "hilog/log.h"
#include <bits/alltypes.h>
#include <thread>
#include <iostream>

#undef LOG_TAG
#define LOG_TAG "MMI"

const int GLOBAL_RESMGR = 0xFF00;
const char *TAG = "[SensorCapiSample]";

void HookCallback(const Input_KeyEvent *keyEvent)
{
    int32_t eventId{-1};
    if (OH_Input_GetKeyEventId(keyEvent, &eventId) != INPUT_SUCCESS) {
        return;
    }
}

static napi_value QueryMaxTouchPoints1(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_Result retResult = OH_Input_QueryMaxTouchPoints(nullptr);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_QueryMaxTouchPoints_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_PARAMETER_ERROR) ? 1 : 0, &result);
    return result;
}

static napi_value QueryMaxTouchPoints2(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t count;
    int32_t minCount = -1;
    int32_t maxCount = 10;
    Input_Result retResult = OH_Input_QueryMaxTouchPoints(&count);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_QueryMaxTouchPoints_0200 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_SUCCESS && (count >= minCount && count <= maxCount)) ? 1 : 0, &result);
    return result;
}

static napi_value InjectTouchEventGlobal1(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalX(touchEvent, 100);
    OH_Input_SetTouchEventGlobalY(touchEvent, 100);
    OH_Input_SetTouchEventAction(touchEvent, 1);
    int32_t retResult = OH_Input_InjectTouchEventGlobal(touchEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectTouchEventGlobal_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (touchEvent != nullptr && retResult == INPUT_PERMISSION_DENIED) ? 1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value InjectTouchEventGlobal2(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalX(touchEvent, 100);
    int32_t globalX = OH_Input_GetTouchEventGlobalX(touchEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectTouchEventGlobal_0200 globalX:%{public}d", globalX);
    napi_create_int32(env, (touchEvent != nullptr && globalX == 100) ? 1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value InjectTouchEventGlobal3(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_TouchEvent* touchEvent = OH_Input_CreateTouchEvent();
    OH_Input_SetTouchEventGlobalY(touchEvent, 100);
    int32_t globalY = OH_Input_GetTouchEventGlobalY(touchEvent);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_InjectTouchEventGlobal_0300 globalY:%{public}d", globalY);
    napi_create_int32(env, (touchEvent != nullptr && globalY == 100) ? 1 : 0, &result);
    OH_Input_DestroyTouchEvent(&touchEvent);
    return result;
}

static napi_value AxisEventGlobal1(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    OH_Input_SetAxisEventGlobalX(axisEvent, 100);
    int32_t globalX;
    Input_Result retResult = OH_Input_GetAxisEventGlobalX(axisEvent, &globalX);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_AxisEventGlobal_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (globalX == 100 && retResult == INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value AxisEventGlobal2(napi_env env, napi_callback_info info)
{
    napi_value result;

    struct Input_AxisEvent* axisEvent = OH_Input_CreateAxisEvent();
    OH_Input_SetAxisEventGlobalY(axisEvent, 99);
    int32_t globalY;
    Input_Result retResult = OH_Input_GetAxisEventGlobalY(axisEvent, &globalY);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_AxisEventGlobal_0200 retResult:%{public}d", retResult);
    napi_create_int32(env, (globalY == 99 && retResult == INPUT_SUCCESS) ? 1 : 0, &result);
    OH_Input_DestroyAxisEvent(&axisEvent);
    return result;
}

static napi_value GetKeyEventId1(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t eventId;
    struct Input_KeyEvent *keyEvent = OH_Input_CreateKeyEvent();
    Input_Result retResult = OH_Input_GetKeyEventId(keyEvent, &eventId);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_GetKeyEventId_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_SUCCESS) ? 1 : 0, &result);
    return result;
}

static napi_value AddKeyEventHook1(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_Result retResult = OH_Input_AddKeyEventHook(HookCallback);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_AddKeyEventHook_0100 retResult:%{public}d", retResult);
    napi_create_int32(env,
        (retResult == INPUT_PERMISSION_DENIED || retResult == INPUT_SERVICE_EXCEPTION ||
        retResult == INPUT_DEVICE_NOT_SUPPORTED) ? 1 : 0, &result);
    return result;
}

static napi_value RemoveKeyEventHook1(napi_env env, napi_callback_info info)
{
    napi_value result;

    Input_Result retResult = OH_Input_RemoveKeyEventHook(HookCallback);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_RemoveKeyEventHook_0100 retResult:%{public}d", retResult);
    napi_create_int32(env, (retResult == INPUT_SUCCESS || retResult == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    return result;
}

static napi_value DispatchToNextHandler1(napi_env env, napi_callback_info info)
{
    napi_value result;

    int32_t eventId;
    struct Input_KeyEvent* keyEvent = OH_Input_CreateKeyEvent();
    OH_Input_GetKeyEventId(keyEvent, &eventId);
    Input_Result retResult = OH_Input_DispatchToNextHandler(eventId);
    OH_LOG_INFO(LOG_APP, "SUB_MMI_Input_Api_DispatchToNextHandler_0100 retResult:%{public}d", retResult);
    napi_create_int32(env,
        (retResult == INPUT_PARAMETER_ERROR || retResult == INPUT_SERVICE_EXCEPTION) ? 1 : 0, &result);
    OH_Input_DestroyKeyEvent(&keyEvent);
    return result;
}

static napi_value KeyCode1(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t KEYCODE_HOME = 1;
    int32_t KEYCODE_BACK = 2;
    int32_t KEYCODE_SEARCH = 9;
    int32_t KEYCODE_MEDIA_PLAY_PAUSE = 10;
    int32_t KEYCODE_MEDIA_STOP = 11;
    int32_t KEYCODE_MEDIA_NEXT = 12;
    int32_t KEYCODE_MEDIA_PREVIOUS = 13;
    int32_t KEYCODE_MEDIA_REWIND = 14;
    int32_t KEYCODE_MEDIA_FAST_FORWARD = 15;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_HOME == KEYCODE_HOME && Input_KeyCode::KEYCODE_BACK == KEYCODE_BACK &&
                      Input_KeyCode::KEYCODE_SEARCH == KEYCODE_SEARCH &&
                      Input_KeyCode::KEYCODE_MEDIA_PLAY_PAUSE == KEYCODE_MEDIA_PLAY_PAUSE &&
                      Input_KeyCode::KEYCODE_MEDIA_STOP == KEYCODE_MEDIA_STOP &&
                      Input_KeyCode::KEYCODE_MEDIA_NEXT == KEYCODE_MEDIA_NEXT &&
                      Input_KeyCode::KEYCODE_MEDIA_PREVIOUS == KEYCODE_MEDIA_PREVIOUS &&
                      Input_KeyCode::KEYCODE_MEDIA_REWIND == KEYCODE_MEDIA_REWIND &&
                      Input_KeyCode::KEYCODE_MEDIA_FAST_FORWARD == KEYCODE_MEDIA_FAST_FORWARD) ? 1 : 0, &result);
    return result;
}

static napi_value KeyCode2(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t KEYCODE_VIRTUAL_MULTITASK = 2210;
    int32_t KEYCODE_BUTTON_A = 2301;
    int32_t KEYCODE_BUTTON_B = 2302;
    int32_t KEYCODE_BUTTON_X = 2304;
    int32_t KEYCODE_BUTTON_Y = 2305;
    int32_t KEYCODE_BUTTON_L1 = 2307;
    int32_t KEYCODE_BUTTON_R1 = 2308;
    int32_t KEYCODE_BUTTON_L2 = 2309;
    int32_t KEYCODE_BUTTON_R2 = 2310;
    napi_create_int32(env,
                      (Input_KeyCode::KEYCODE_VIRTUAL_MULTITASK == KEYCODE_VIRTUAL_MULTITASK &&
                      Input_KeyCode::KEYCODE_BUTTON_A == KEYCODE_BUTTON_A &&
                      Input_KeyCode::KEYCODE_BUTTON_B == KEYCODE_BUTTON_B &&
                      Input_KeyCode::KEYCODE_BUTTON_X == KEYCODE_BUTTON_X &&
                      Input_KeyCode::KEYCODE_BUTTON_Y == KEYCODE_BUTTON_Y &&
                      Input_KeyCode::KEYCODE_BUTTON_L1 == KEYCODE_BUTTON_L1 &&
                      Input_KeyCode::KEYCODE_BUTTON_R1 == KEYCODE_BUTTON_R1 &&
                      Input_KeyCode::KEYCODE_BUTTON_L2 == KEYCODE_BUTTON_L2 &&
                      Input_KeyCode::KEYCODE_BUTTON_R2 == KEYCODE_BUTTON_R2
                      ) ? 1 : 0, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"QueryMaxTouchPoints1", nullptr, QueryMaxTouchPoints1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"QueryMaxTouchPoints2", nullptr, QueryMaxTouchPoints2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectTouchEventGlobal1", nullptr, InjectTouchEventGlobal1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectTouchEventGlobal2", nullptr, InjectTouchEventGlobal2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"InjectTouchEventGlobal3", nullptr, InjectTouchEventGlobal3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AxisEventGlobal1", nullptr, AxisEventGlobal1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AxisEventGlobal2", nullptr, AxisEventGlobal2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetKeyEventId1", nullptr, GetKeyEventId1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"AddKeyEventHook1", nullptr, AddKeyEventHook1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"RemoveKeyEventHook1", nullptr, RemoveKeyEventHook1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"DispatchToNextHandler1", nullptr, DispatchToNextHandler1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode1", nullptr, KeyCode1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode2", nullptr, KeyCode2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode3", nullptr, KeyCode3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode4", nullptr, KeyCode4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode5", nullptr, KeyCode5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode6", nullptr, KeyCode6, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode7", nullptr, KeyCode7, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode8", nullptr, KeyCode8, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode9", nullptr, KeyCode9, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode10", nullptr, KeyCode10, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode11", nullptr, KeyCode11, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode12", nullptr, KeyCode12, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode13", nullptr, KeyCode13, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode14", nullptr, KeyCode14, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode15", nullptr, KeyCode15, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode16", nullptr, KeyCode16, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode17", nullptr, KeyCode17, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode18", nullptr, KeyCode18, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode19", nullptr, KeyCode19, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode20", nullptr, KeyCode20, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode21", nullptr, KeyCode21, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode22", nullptr, KeyCode22, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode23", nullptr, KeyCode23, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode24", nullptr, KeyCode24, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode25", nullptr, KeyCode25, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"KeyCode26", nullptr, KeyCode26, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle1", nullptr, PointerStyle1, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle2", nullptr, PointerStyle2, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle3", nullptr, PointerStyle3, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle4", nullptr, PointerStyle4, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle5", nullptr, PointerStyle5, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle6", nullptr, PointerStyle6, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PointerStyle7", nullptr, PointerStyle7, nullptr, nullptr, nullptr, napi_default, nullptr},
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
    .nm_modname = "libtouchndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}