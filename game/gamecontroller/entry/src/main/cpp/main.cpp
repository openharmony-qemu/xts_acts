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
#include "acts/include/game_controller_test.h"
#include "acts/include/game_controller_real_test.h"

#define CAPI_TEST(func)                                                                                                \
    static napi_value func(napi_env env, napi_callback_info /*info*/) {                                                \
        napi_value retVal = nullptr;                                                                                   \
        int32_t ret = OHOS::GameController::func();                                                                    \
        napi_create_int32(env, ret, &retVal);                                                                          \
        return retVal;                                                                                                 \
    }
// game_device_test begin
CAPI_TEST(ACTS_GameDevice_GetAllDeviceInfos_01)

CAPI_TEST(ACTS_GameDevice_RegisterDeviceMonitor_01)

CAPI_TEST(ACTS_GameDevice_RegisterDeviceMonitor_02)

CAPI_TEST(ACTS_GameDevice_UnregisterDeviceMonitor_01)

CAPI_TEST(ACTS_GameDevice_DestroyAllDeviceInfos_01)

CAPI_TEST(ACTS_GameDevice_DestroyAllDeviceInfos_02)

CAPI_TEST(ACTS_GameDevice_AllDeviceInfos_GetCount_01)

CAPI_TEST(ACTS_GameDevice_AllDeviceInfos_GetCount_02)

CAPI_TEST(ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_01)

CAPI_TEST(ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_02)

CAPI_TEST(ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_03)

CAPI_TEST(ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_04)

CAPI_TEST(ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_05)
// game_device_test end

// game_device_event_test begin
CAPI_TEST(ACTS_GameDevice_DeviceEvent_GetChangedType_01)

CAPI_TEST(ACTS_GameDevice_DeviceEvent_GetChangedType_02)

CAPI_TEST(ACTS_GameDevice_DeviceEvent_GetDeviceInfo_01)

CAPI_TEST(ACTS_GameDevice_DeviceEvent_GetDeviceInfo_02)

CAPI_TEST(ACTS_GameDevice_DestroyDeviceInfo_01)

CAPI_TEST(ACTS_GameDevice_DestroyDeviceInfo_02)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetDeviceId_01)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetDeviceId_02)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetDeviceId_03)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetName_01)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetName_02)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetName_03)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetProduct_01)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetProduct_02)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetVersion_01)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetVersion_02)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetPhys_01)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetPhys_02)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetPhys_03)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetDeviceType_01)

CAPI_TEST(ACTS_GameDevice_DeviceInfo_GetDeviceType_02)
// game_device_event_test end

// game_pad_test begin
CAPI_TEST(ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_LeftShoulder_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_RightShoulder_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_LeftTrigger_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_01)

CAPI_TEST(ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_02)

CAPI_TEST(ACTS_GamePad_LeftTrigger_UnregisterAxisInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_RightTrigger_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_02)

CAPI_TEST(ACTS_GamePad_RightTrigger_UnregisterAxisInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_ButtonMenu_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_ButtonHome_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_ButtonA_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_ButtonB_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_ButtonX_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_ButtonY_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_ButtonC_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_RegisterAxisInputMonitor_01)

CAPI_TEST(ACTS_GamePad_Dpad_RegisterAxisInputMonitor_02)

CAPI_TEST(ACTS_GamePad_Dpad_UnregisterAxisInputMonitor_01)

CAPI_TEST(ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_LeftThumbstick_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_01)

CAPI_TEST(ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_02)

CAPI_TEST(ACTS_GamePad_LeftThumbstick_UnregisterAxisInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_02)

CAPI_TEST(ACTS_GamePad_RightThumbstick_UnregisterButtonInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_01)

CAPI_TEST(ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_02)

CAPI_TEST(ACTS_GamePad_RightThumbstick_UnregisterAxisInputMonitor_01)

// game_pad_test end

// game_pad_event_test begin
CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_01)
CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_02)
CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_03)

CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_01)
CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_02)

CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_01)
CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_02)

CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_01)
CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_02)
CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_03)

CAPI_TEST(ACTS_GameController_GamePad_PressedButtons_GetCount_01)
CAPI_TEST(ACTS_GameController_GamePad_PressedButtons_GetCount_02)

CAPI_TEST(ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_01)
CAPI_TEST(ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_02)
CAPI_TEST(ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_03)
CAPI_TEST(ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_04)

CAPI_TEST(ACTS_GameController_GamePad_DestroyPressedButton_01)
CAPI_TEST(ACTS_GameController_GamePad_DestroyPressedButton_02)

CAPI_TEST(ACTS_GameController_GamePad_PressedButton_GetButtonCode_01)
CAPI_TEST(ACTS_GameController_GamePad_PressedButton_GetButtonCode_02)

CAPI_TEST(ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_01)
CAPI_TEST(ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_02)
CAPI_TEST(ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_03)

CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetActionTime_01)
CAPI_TEST(ACTS_GameController_GamePad_ButtonEvent_GetActionTime_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetDeviceId_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetDeviceId_02)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetDeviceId_03)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_02)

CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetActionTime_01)
CAPI_TEST(ACTS_GameController_GamePad_AxisEvent_GetActionTime_02)

CAPI_TEST(ACTS_RealDevice_GetAllDevices)
CAPI_TEST(ACTS_RealDevice_HasRealDevice)
CAPI_TEST(ACTS_RealDevice_CheckDeviceEvent)
CAPI_TEST(ACTS_RealDevice_CheckGamePadEvent)
// game_pad_event_test end


EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "ACTS_GameDevice_GetAllDeviceInfos_01", nullptr, ACTS_GameDevice_GetAllDeviceInfos_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_RegisterDeviceMonitor_01", nullptr, ACTS_GameDevice_RegisterDeviceMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_RegisterDeviceMonitor_02", nullptr, ACTS_GameDevice_RegisterDeviceMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_UnregisterDeviceMonitor_01", nullptr, ACTS_GameDevice_UnregisterDeviceMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DestroyAllDeviceInfos_01", nullptr, ACTS_GameDevice_DestroyAllDeviceInfos_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DestroyAllDeviceInfos_02", nullptr, ACTS_GameDevice_DestroyAllDeviceInfos_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_AllDeviceInfos_GetCount_01", nullptr, ACTS_GameDevice_AllDeviceInfos_GetCount_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_AllDeviceInfos_GetCount_02", nullptr, ACTS_GameDevice_AllDeviceInfos_GetCount_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_01", nullptr, ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_02", nullptr, ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_03", nullptr, ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_03, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_04", nullptr, ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_04, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_05", nullptr, ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_05, nullptr, nullptr, nullptr, napi_default, nullptr },
        
        { "ACTS_GameDevice_DeviceEvent_GetChangedType_01", nullptr, ACTS_GameDevice_DeviceEvent_GetChangedType_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceEvent_GetChangedType_02", nullptr, ACTS_GameDevice_DeviceEvent_GetChangedType_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceEvent_GetDeviceInfo_01", nullptr, ACTS_GameDevice_DeviceEvent_GetDeviceInfo_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceEvent_GetDeviceInfo_02", nullptr, ACTS_GameDevice_DeviceEvent_GetDeviceInfo_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DestroyDeviceInfo_01", nullptr, ACTS_GameDevice_DestroyDeviceInfo_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DestroyDeviceInfo_02", nullptr, ACTS_GameDevice_DestroyDeviceInfo_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetDeviceId_01", nullptr, ACTS_GameDevice_DeviceInfo_GetDeviceId_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetDeviceId_02", nullptr, ACTS_GameDevice_DeviceInfo_GetDeviceId_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetDeviceId_03", nullptr, ACTS_GameDevice_DeviceInfo_GetDeviceId_03, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetName_01", nullptr, ACTS_GameDevice_DeviceInfo_GetName_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetName_02", nullptr, ACTS_GameDevice_DeviceInfo_GetName_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetName_03", nullptr, ACTS_GameDevice_DeviceInfo_GetName_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetProduct_01", nullptr, ACTS_GameDevice_DeviceInfo_GetProduct_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetProduct_02", nullptr, ACTS_GameDevice_DeviceInfo_GetProduct_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetVersion_01", nullptr, ACTS_GameDevice_DeviceInfo_GetVersion_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetVersion_02", nullptr, ACTS_GameDevice_DeviceInfo_GetVersion_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetPhys_01", nullptr, ACTS_GameDevice_DeviceInfo_GetPhys_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetPhys_02", nullptr, ACTS_GameDevice_DeviceInfo_GetPhys_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetPhys_03", nullptr, ACTS_GameDevice_DeviceInfo_GetPhys_03, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetDeviceType_01", nullptr, ACTS_GameDevice_DeviceInfo_GetDeviceType_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameDevice_DeviceInfo_GetDeviceType_02", nullptr, ACTS_GameDevice_DeviceInfo_GetDeviceType_02, nullptr, nullptr, nullptr, napi_default, nullptr },
       
        { "ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftShoulder_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_LeftShoulder_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightShoulder_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_RightShoulder_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftTrigger_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_LeftTrigger_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_01", nullptr, ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_02", nullptr, ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftTrigger_UnregisterAxisInputMonitor_01", nullptr, ACTS_GamePad_LeftTrigger_UnregisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightTrigger_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_RightTrigger_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_01", nullptr, ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_02", nullptr, ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightTrigger_UnregisterAxisInputMonitor_01", nullptr, ACTS_GamePad_RightTrigger_UnregisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonMenu_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonMenu_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonHome_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonHome_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonA_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonA_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonB_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonB_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonX_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonX_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonY_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonY_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_ButtonC_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_ButtonC_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_RegisterAxisInputMonitor_01", nullptr, ACTS_GamePad_Dpad_RegisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_RegisterAxisInputMonitor_02", nullptr, ACTS_GamePad_Dpad_RegisterAxisInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_Dpad_UnregisterAxisInputMonitor_01", nullptr, ACTS_GamePad_Dpad_UnregisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftThumbstick_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_LeftThumbstick_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_01", nullptr, ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_02", nullptr, ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_LeftThumbstick_UnregisterAxisInputMonitor_01", nullptr, ACTS_GamePad_LeftThumbstick_UnregisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_01", nullptr, ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_02", nullptr, ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightThumbstick_UnregisterButtonInputMonitor_01", nullptr, ACTS_GamePad_RightThumbstick_UnregisterButtonInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_01", nullptr, ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_02", nullptr, ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GamePad_RightThumbstick_UnregisterAxisInputMonitor_01", nullptr, ACTS_GamePad_RightThumbstick_UnregisterAxisInputMonitor_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        
        { "ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_01", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_02", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_03", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_03, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_01", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_02", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_01", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_02", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_01", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_02", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_03", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_03, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButtons_GetCount_01", nullptr, ACTS_GameController_GamePad_PressedButtons_GetCount_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButtons_GetCount_02", nullptr, ACTS_GameController_GamePad_PressedButtons_GetCount_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_01", nullptr, ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_02", nullptr, ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_03", nullptr, ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_03, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_04", nullptr, ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_04, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_DestroyPressedButton_01", nullptr, ACTS_GameController_GamePad_DestroyPressedButton_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_DestroyPressedButton_02", nullptr, ACTS_GameController_GamePad_DestroyPressedButton_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButton_GetButtonCode_01", nullptr, ACTS_GameController_GamePad_PressedButton_GetButtonCode_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButton_GetButtonCode_02", nullptr, ACTS_GameController_GamePad_PressedButton_GetButtonCode_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_01", nullptr, ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_02", nullptr, ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_03", nullptr, ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_03, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetActionTime_01", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetActionTime_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_ButtonEvent_GetActionTime_02", nullptr, ACTS_GameController_GamePad_ButtonEvent_GetActionTime_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetDeviceId_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetDeviceId_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetDeviceId_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetDeviceId_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetDeviceId_03", nullptr, ACTS_GameController_GamePad_AxisEvent_GetDeviceId_03, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetActionTime_01", nullptr, ACTS_GameController_GamePad_AxisEvent_GetActionTime_01, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_GameController_GamePad_AxisEvent_GetActionTime_02", nullptr, ACTS_GameController_GamePad_AxisEvent_GetActionTime_02, nullptr, nullptr, nullptr, napi_default, nullptr },
        
        { "ACTS_RealDevice_GetAllDevices", nullptr, ACTS_RealDevice_GetAllDevices, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_RealDevice_HasRealDevice", nullptr, ACTS_RealDevice_HasRealDevice, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_RealDevice_CheckDeviceEvent", nullptr, ACTS_RealDevice_CheckDeviceEvent, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "ACTS_RealDevice_CheckGamePadEvent", nullptr, ACTS_RealDevice_CheckGamePadEvent, nullptr, nullptr, nullptr, napi_default, nullptr },
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version =1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
