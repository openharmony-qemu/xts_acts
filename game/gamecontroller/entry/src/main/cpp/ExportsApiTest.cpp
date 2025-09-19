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
#include "acts/include/GameControllerTest.h"
#include "acts/include/GameControllerRealTest.h"

#define CAPI_TEST(func)                                                                                                             \
    static napi_value func(napi_env env, napi_callback_info /*info*/)                                                         \
    {                                                                                                                                  \
         napi_value retVal = nullptr;                                                                                              \
         int32_t ret = OHOS::GameController::func();                                                                             \
         napi_create_int32(env, ret, &retVal);                                                                                    \
         return retVal;                                                                                                              \
    }

// game_device_test begin
CAPI_TEST(ActsGameDeviceGetAllDeviceInfos01)

CAPI_TEST(ActsGameDeviceRegisterDeviceMonitor01)

CAPI_TEST(ActsGameDeviceRegisterDeviceMonitor02)

CAPI_TEST(ActsGameDeviceUnregisterDeviceMonitor01)

CAPI_TEST(ActsGameDeviceDestroyAllDeviceInfos01)

CAPI_TEST(ActsGameDeviceDestroyAllDeviceInfos02)

CAPI_TEST(ActsGameDeviceAllDeviceInfosGetCount01)

CAPI_TEST(ActsGameDeviceAllDeviceInfosGetCount02)

CAPI_TEST(ActsGameDeviceAllDeviceInfosGetDeviceInfo01)

CAPI_TEST(ActsGameDeviceAllDeviceInfosGetDeviceInfo02)

CAPI_TEST(ActsGameDeviceAllDeviceInfosGetDeviceInfo03)

CAPI_TEST(ActsGameDeviceAllDeviceInfosGetDeviceInfo04)

CAPI_TEST(ActsGameDeviceAllDeviceInfosGetDeviceInfo05)
// game_device_test end

// game_device_event_test begin
CAPI_TEST(ActsGameDeviceDeviceEventGetChangedType01)

CAPI_TEST(ActsGameDeviceDeviceEventGetChangedType02)

CAPI_TEST(ActsGameDeviceDeviceEventGetDeviceInfo01)

CAPI_TEST(ActsGameDeviceDeviceEventGetDeviceInfo02)

CAPI_TEST(ActsGameDeviceDestroyDeviceInfo01)

CAPI_TEST(ActsGameDeviceDestroyDeviceInfo02)

CAPI_TEST(ActsGameDeviceDeviceInfoGetDeviceId01)

CAPI_TEST(ActsGameDeviceDeviceInfoGetDeviceId02)

CAPI_TEST(ActsGameDeviceDeviceInfoGetDeviceId03)

CAPI_TEST(ActsGameDeviceDeviceInfoGetName01)

CAPI_TEST(ActsGameDeviceDeviceInfoGetName02)

CAPI_TEST(ActsGameDeviceDeviceInfoGetName03)

CAPI_TEST(ActsGameDeviceDeviceInfoGetProduct01)

CAPI_TEST(ActsGameDeviceDeviceInfoGetProduct02)

CAPI_TEST(ActsGameDeviceDeviceInfoGetVersion01)

CAPI_TEST(ActsGameDeviceDeviceInfoGetVersion02)

CAPI_TEST(ActsGameDeviceDeviceInfoGetPhys01)

CAPI_TEST(ActsGameDeviceDeviceInfoGetPhys02)

CAPI_TEST(ActsGameDeviceDeviceInfoGetPhys03)

CAPI_TEST(ActsGameDeviceDeviceInfoGetDeviceType01)

CAPI_TEST(ActsGameDeviceDeviceInfoGetDeviceType02)
// game_device_event_test end

// game_pad_test begin
CAPI_TEST(ActsGamePadLeftShoulderRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadLeftShoulderRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadLeftShoulderUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadRightShoulderRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadRightShoulderRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadRightShoulderUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadLeftTriggerRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadLeftTriggerRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadLeftTriggerUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadLeftTriggerRegisterAxisInputMonitor01)

CAPI_TEST(ActsGamePadLeftTriggerRegisterAxisInputMonitor02)

CAPI_TEST(ActsGamePadLeftTriggerUnregisterAxisInputMonitor01)

CAPI_TEST(ActsGamePadRightTriggerRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadRightTriggerRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadRightTriggerUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadRightTriggerRegisterAxisInputMonitor01)

CAPI_TEST(ActsGamePadRightTriggerRegisterAxisInputMonitor02)

CAPI_TEST(ActsGamePadRightTriggerUnregisterAxisInputMonitor01)

CAPI_TEST(ActsGamePadButtonMenuRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonMenuRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadButtonMenuUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonHomeRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonHomeRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadButtonHomeUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonARegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonARegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadButtonAUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonBRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonBRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadButtonBUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonXRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonXRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadButtonXUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonYRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonYRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadButtonYUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonCRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadButtonCRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadButtonCUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadDpadRightButtonRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadDpadRightButtonRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadDpadUpButtonRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadDpadUpButtonRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadDpadDownButtonRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadDpadDownButtonRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadDpadRegisterAxisInputMonitor01)

CAPI_TEST(ActsGamePadDpadRegisterAxisInputMonitor02)

CAPI_TEST(ActsGamePadDpadUnregisterAxisInputMonitor01)

CAPI_TEST(ActsGamePadLeftThumbstickRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadLeftThumbstickRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadLeftThumbstickRegisterAxisInputMonitor01)

CAPI_TEST(ActsGamePadLeftThumbstickRegisterAxisInputMonitor02)

CAPI_TEST(ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01)

CAPI_TEST(ActsGamePadRightThumbstickRegisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadRightThumbstickRegisterButtonInputMonitor02)

CAPI_TEST(ActsGamePadRightThumbstickUnregisterButtonInputMonitor01)

CAPI_TEST(ActsGamePadRightThumbstickRegisterAxisInputMonitor01)

CAPI_TEST(ActsGamePadRightThumbstickRegisterAxisInputMonitor02)

CAPI_TEST(ActsGamePadRightThumbstickUnregisterAxisInputMonitor01)

// game_pad_test end

// game_pad_event_test begin
CAPI_TEST(ActsGameControllerGamePadButtonEventGetDeviceId01)
CAPI_TEST(ActsGameControllerGamePadButtonEventGetDeviceId02)
CAPI_TEST(ActsGameControllerGamePadButtonEventGetDeviceId03)

CAPI_TEST(ActsGameControllerGamePadButtonEventGetButtonAction01)
CAPI_TEST(ActsGameControllerGamePadButtonEventGetButtonAction02)

CAPI_TEST(ActsGameControllerGamePadButtonEventGetButtonCode01)
CAPI_TEST(ActsGameControllerGamePadButtonEventGetButtonCode02)

CAPI_TEST(ActsGameControllerGamePadButtonEventGetButtonCodeName01)
CAPI_TEST(ActsGameControllerGamePadButtonEventGetButtonCodeName02)
CAPI_TEST(ActsGameControllerGamePadButtonEventGetButtonCodeName03)

CAPI_TEST(ActsGameControllerGamePadPressedButtonsGetCount01)
CAPI_TEST(ActsGameControllerGamePadPressedButtonsGetCount02)

CAPI_TEST(ActsGameControllerGamePadPressedButtonsGetButtonInfo01)
CAPI_TEST(ActsGameControllerGamePadPressedButtonsGetButtonInfo02)
CAPI_TEST(ActsGameControllerGamePadPressedButtonsGetButtonInfo03)
CAPI_TEST(ActsGameControllerGamePadPressedButtonsGetButtonInfo04)

CAPI_TEST(ActsGameControllerGamePadDestroyPressedButton01)
CAPI_TEST(ActsGameControllerGamePadDestroyPressedButton02)

CAPI_TEST(ActsGameControllerGamePadPressedButtonGetButtonCode01)
CAPI_TEST(ActsGameControllerGamePadPressedButtonGetButtonCode02)

CAPI_TEST(ActsGameControllerGamePadPressedButtonGetButtonCodeName01)
CAPI_TEST(ActsGameControllerGamePadPressedButtonGetButtonCodeName02)
CAPI_TEST(ActsGameControllerGamePadPressedButtonGetButtonCodeName03)

CAPI_TEST(ActsGameControllerGamePadButtonEventGetActionTime01)
CAPI_TEST(ActsGameControllerGamePadButtonEventGetActionTime02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetDeviceId01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetDeviceId02)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetDeviceId03)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetAxisSourceType01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetAxisSourceType02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetXAxisValue01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetXAxisValue02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetYAxisValue01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetYAxisValue02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetZAxisValue01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetZAxisValue02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetRZAxisValue01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetRZAxisValue02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetHatXAxisValue01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetHatXAxisValue02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetHatYAxisValue01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetHatYAxisValue02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetBrakeAxisValue01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetBrakeAxisValue02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetGasAxisValue01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetGasAxisValue02)

CAPI_TEST(ActsGameControllerGamePadAxisEventGetActionTime01)
CAPI_TEST(ActsGameControllerGamePadAxisEventGetActionTime02)

CAPI_TEST(ActsRealDeviceGetAllDevices)
CAPI_TEST(ActsRealDeviceHasRealDevice)
CAPI_TEST(ActsRealDeviceCheckDeviceEvent)
CAPI_TEST(ActsRealDeviceCheckGamePadEvent)
// game_pad_event_test end

napi_property_descriptor desc[] = {
    { "ActsGameDeviceGetAllDeviceInfos01", nullptr,
        ActsGameDeviceGetAllDeviceInfos01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceRegisterDeviceMonitor01", nullptr,
        ActsGameDeviceRegisterDeviceMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceRegisterDeviceMonitor02", nullptr,
        ActsGameDeviceRegisterDeviceMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceUnregisterDeviceMonitor01", nullptr,
        ActsGameDeviceUnregisterDeviceMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDestroyAllDeviceInfos01", nullptr,
        ActsGameDeviceDestroyAllDeviceInfos01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDestroyAllDeviceInfos02", nullptr,
        ActsGameDeviceDestroyAllDeviceInfos02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceAllDeviceInfosGetCount01", nullptr,
        ActsGameDeviceAllDeviceInfosGetCount01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceAllDeviceInfosGetCount02", nullptr,
        ActsGameDeviceAllDeviceInfosGetCount02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceAllDeviceInfosGetDeviceInfo01", nullptr,
        ActsGameDeviceAllDeviceInfosGetDeviceInfo01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceAllDeviceInfosGetDeviceInfo02", nullptr,
        ActsGameDeviceAllDeviceInfosGetDeviceInfo02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceAllDeviceInfosGetDeviceInfo03", nullptr,
        ActsGameDeviceAllDeviceInfosGetDeviceInfo03, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceAllDeviceInfosGetDeviceInfo04", nullptr,
        ActsGameDeviceAllDeviceInfosGetDeviceInfo04, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceAllDeviceInfosGetDeviceInfo05", nullptr,
        ActsGameDeviceAllDeviceInfosGetDeviceInfo05, nullptr, nullptr, nullptr, napi_default, nullptr },

    { "ActsGameDeviceDeviceEventGetChangedType01", nullptr,
        ActsGameDeviceDeviceEventGetChangedType01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceEventGetChangedType02", nullptr,
        ActsGameDeviceDeviceEventGetChangedType02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceEventGetDeviceInfo01", nullptr,
        ActsGameDeviceDeviceEventGetDeviceInfo01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceEventGetDeviceInfo02", nullptr,
        ActsGameDeviceDeviceEventGetDeviceInfo02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDestroyDeviceInfo01", nullptr,
        ActsGameDeviceDestroyDeviceInfo01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDestroyDeviceInfo02", nullptr,
        ActsGameDeviceDestroyDeviceInfo02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetDeviceId01", nullptr,
        ActsGameDeviceDeviceInfoGetDeviceId01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetDeviceId02", nullptr,
        ActsGameDeviceDeviceInfoGetDeviceId02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetDeviceId03", nullptr,
        ActsGameDeviceDeviceInfoGetDeviceId03, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetName01", nullptr,
        ActsGameDeviceDeviceInfoGetName01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetName02", nullptr,
        ActsGameDeviceDeviceInfoGetName02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetName03", nullptr,
        ActsGameDeviceDeviceInfoGetName02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetProduct01", nullptr,
        ActsGameDeviceDeviceInfoGetProduct01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetProduct02", nullptr,
        ActsGameDeviceDeviceInfoGetProduct02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetVersion01", nullptr,
        ActsGameDeviceDeviceInfoGetVersion01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetVersion02", nullptr,
        ActsGameDeviceDeviceInfoGetVersion02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetPhys01", nullptr,
        ActsGameDeviceDeviceInfoGetPhys01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetPhys02", nullptr,
        ActsGameDeviceDeviceInfoGetPhys02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetPhys03", nullptr,
        ActsGameDeviceDeviceInfoGetPhys03, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetDeviceType01", nullptr,
        ActsGameDeviceDeviceInfoGetDeviceType01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameDeviceDeviceInfoGetDeviceType02", nullptr,
        ActsGameDeviceDeviceInfoGetDeviceType02, nullptr, nullptr, nullptr, napi_default, nullptr },

    { "ActsGamePadLeftShoulderRegisterButtonInputMonitor01", nullptr,
        ActsGamePadLeftShoulderRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftShoulderRegisterButtonInputMonitor02", nullptr,
        ActsGamePadLeftShoulderRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftShoulderUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadLeftShoulderUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightShoulderRegisterButtonInputMonitor01", nullptr,
        ActsGamePadRightShoulderRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightShoulderRegisterButtonInputMonitor02", nullptr,
        ActsGamePadRightShoulderRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightShoulderUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadRightShoulderUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftTriggerRegisterButtonInputMonitor01", nullptr,
        ActsGamePadLeftTriggerRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftTriggerRegisterButtonInputMonitor02", nullptr,
        ActsGamePadLeftTriggerRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftTriggerUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadLeftTriggerUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftTriggerRegisterAxisInputMonitor01", nullptr,
        ActsGamePadLeftTriggerRegisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftTriggerRegisterAxisInputMonitor02", nullptr,
        ActsGamePadLeftTriggerRegisterAxisInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftTriggerUnregisterAxisInputMonitor01", nullptr,
        ActsGamePadLeftTriggerUnregisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightTriggerRegisterButtonInputMonitor01", nullptr,
        ActsGamePadRightTriggerRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightTriggerRegisterButtonInputMonitor02", nullptr,
        ActsGamePadRightTriggerRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightTriggerUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadRightTriggerUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightTriggerRegisterAxisInputMonitor01", nullptr,
        ActsGamePadRightTriggerRegisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightTriggerRegisterAxisInputMonitor02", nullptr,
        ActsGamePadRightTriggerRegisterAxisInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightTriggerUnregisterAxisInputMonitor01", nullptr,
        ActsGamePadRightTriggerUnregisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonMenuRegisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonMenuRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonMenuRegisterButtonInputMonitor02", nullptr,
        ActsGamePadButtonMenuRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonMenuUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonMenuUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonHomeRegisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonHomeRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonHomeRegisterButtonInputMonitor02", nullptr,
        ActsGamePadButtonHomeRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonHomeUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonHomeUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonARegisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonARegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonARegisterButtonInputMonitor02", nullptr,
        ActsGamePadButtonARegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonAUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonAUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonBRegisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonBRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonBRegisterButtonInputMonitor02", nullptr,
        ActsGamePadButtonBRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonBUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonBUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonXRegisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonXRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonXRegisterButtonInputMonitor02", nullptr,
        ActsGamePadButtonXRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonXUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonXUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonYRegisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonYRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonYRegisterButtonInputMonitor02", nullptr,
        ActsGamePadButtonYRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonYUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonYUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonCRegisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonCRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonCRegisterButtonInputMonitor02", nullptr,
        ActsGamePadButtonCRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadButtonCUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadButtonCUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01", nullptr,
        ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02", nullptr,
        ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadRightButtonRegisterButtonInputMonitor01", nullptr,
        ActsGamePadDpadRightButtonRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadRightButtonRegisterButtonInputMonitor02", nullptr,
        ActsGamePadDpadRightButtonRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadUpButtonRegisterButtonInputMonitor01", nullptr,
        ActsGamePadDpadUpButtonRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadUpButtonRegisterButtonInputMonitor02", nullptr,
        ActsGamePadDpadUpButtonRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadDownButtonRegisterButtonInputMonitor01", nullptr,
        ActsGamePadDpadDownButtonRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadDownButtonRegisterButtonInputMonitor02", nullptr,
        ActsGamePadDpadDownButtonRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadRegisterAxisInputMonitor01", nullptr,
        ActsGamePadDpadRegisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadRegisterAxisInputMonitor02", nullptr,
        ActsGamePadDpadRegisterAxisInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadDpadUnregisterAxisInputMonitor01", nullptr,
        ActsGamePadDpadUnregisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftThumbstickRegisterButtonInputMonitor01", nullptr,
        ActsGamePadLeftThumbstickRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftThumbstickRegisterButtonInputMonitor02", nullptr,
        ActsGamePadLeftThumbstickRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftThumbstickRegisterAxisInputMonitor01", nullptr,
        ActsGamePadLeftThumbstickRegisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftThumbstickRegisterAxisInputMonitor02", nullptr,
        ActsGamePadLeftThumbstickRegisterAxisInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01", nullptr,
        ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightThumbstickRegisterButtonInputMonitor01", nullptr,
        ActsGamePadRightThumbstickRegisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightThumbstickRegisterButtonInputMonitor02", nullptr,
        ActsGamePadRightThumbstickRegisterButtonInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightThumbstickUnregisterButtonInputMonitor01", nullptr,
        ActsGamePadRightThumbstickUnregisterButtonInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightThumbstickRegisterAxisInputMonitor01", nullptr,
        ActsGamePadRightThumbstickRegisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightThumbstickRegisterAxisInputMonitor02", nullptr,
        ActsGamePadRightThumbstickRegisterAxisInputMonitor02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGamePadRightThumbstickUnregisterAxisInputMonitor01", nullptr,
        ActsGamePadRightThumbstickUnregisterAxisInputMonitor01, nullptr, nullptr, nullptr, napi_default, nullptr },

    { "ActsGameControllerGamePadButtonEventGetDeviceId01", nullptr,
        ActsGameControllerGamePadButtonEventGetDeviceId01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetDeviceId02", nullptr,
        ActsGameControllerGamePadButtonEventGetDeviceId02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetDeviceId03", nullptr,
        ActsGameControllerGamePadButtonEventGetDeviceId03, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetButtonAction01", nullptr,
        ActsGameControllerGamePadButtonEventGetButtonAction01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetButtonAction02", nullptr,
        ActsGameControllerGamePadButtonEventGetButtonAction02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetButtonCode01", nullptr,
        ActsGameControllerGamePadButtonEventGetButtonCode01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetButtonCode02", nullptr,
        ActsGameControllerGamePadButtonEventGetButtonCode02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetButtonCodeName01", nullptr,
        ActsGameControllerGamePadButtonEventGetButtonCodeName01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetButtonCodeName02", nullptr,
        ActsGameControllerGamePadButtonEventGetButtonCodeName02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetButtonCodeName03", nullptr,
        ActsGameControllerGamePadButtonEventGetButtonCodeName03, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonsGetCount01", nullptr,
        ActsGameControllerGamePadPressedButtonsGetCount01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonsGetCount02", nullptr,
        ActsGameControllerGamePadPressedButtonsGetCount02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonsGetButtonInfo01", nullptr,
        ActsGameControllerGamePadPressedButtonsGetButtonInfo01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonsGetButtonInfo02", nullptr,
        ActsGameControllerGamePadPressedButtonsGetButtonInfo02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonsGetButtonInfo03", nullptr,
        ActsGameControllerGamePadPressedButtonsGetButtonInfo03, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonsGetButtonInfo04", nullptr,
        ActsGameControllerGamePadPressedButtonsGetButtonInfo04, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadDestroyPressedButton01", nullptr,
        ActsGameControllerGamePadDestroyPressedButton01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadDestroyPressedButton02", nullptr,
        ActsGameControllerGamePadDestroyPressedButton02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonGetButtonCode01", nullptr,
        ActsGameControllerGamePadPressedButtonGetButtonCode01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonGetButtonCode02", nullptr,
        ActsGameControllerGamePadPressedButtonGetButtonCode02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonGetButtonCodeName01", nullptr,
        ActsGameControllerGamePadPressedButtonGetButtonCodeName01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonGetButtonCodeName02", nullptr,
        ActsGameControllerGamePadPressedButtonGetButtonCodeName02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadPressedButtonGetButtonCodeName03", nullptr,
        ActsGameControllerGamePadPressedButtonGetButtonCodeName03, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetActionTime01", nullptr,
        ActsGameControllerGamePadButtonEventGetActionTime01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadButtonEventGetActionTime02", nullptr,
        ActsGameControllerGamePadButtonEventGetActionTime02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetDeviceId01", nullptr,
        ActsGameControllerGamePadAxisEventGetDeviceId01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetDeviceId02", nullptr,
        ActsGameControllerGamePadAxisEventGetDeviceId02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetDeviceId03", nullptr,
        ActsGameControllerGamePadAxisEventGetDeviceId03, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetAxisSourceType01", nullptr,
        ActsGameControllerGamePadAxisEventGetAxisSourceType01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetAxisSourceType02", nullptr,
        ActsGameControllerGamePadAxisEventGetAxisSourceType02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetXAxisValue01", nullptr,
        ActsGameControllerGamePadAxisEventGetXAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetXAxisValue02", nullptr,
        ActsGameControllerGamePadAxisEventGetXAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetYAxisValue01", nullptr,
        ActsGameControllerGamePadAxisEventGetYAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetYAxisValue02", nullptr,
        ActsGameControllerGamePadAxisEventGetYAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetZAxisValue01", nullptr,
        ActsGameControllerGamePadAxisEventGetZAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetZAxisValue02", nullptr,
        ActsGameControllerGamePadAxisEventGetZAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetRZAxisValue01", nullptr,
        ActsGameControllerGamePadAxisEventGetRZAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetRZAxisValue02", nullptr,
        ActsGameControllerGamePadAxisEventGetRZAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetHatXAxisValue01", nullptr,
        ActsGameControllerGamePadAxisEventGetHatXAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetHatXAxisValue02", nullptr,
        ActsGameControllerGamePadAxisEventGetHatXAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetHatYAxisValue01", nullptr,
        ActsGameControllerGamePadAxisEventGetHatYAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetHatYAxisValue02", nullptr,
        ActsGameControllerGamePadAxisEventGetHatYAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetBrakeAxisValue01", nullptr,
        ActsGameControllerGamePadAxisEventGetBrakeAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetBrakeAxisValue02", nullptr,
        ActsGameControllerGamePadAxisEventGetBrakeAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetGasAxisValue01", nullptr,
        ActsGameControllerGamePadAxisEventGetGasAxisValue01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetGasAxisValue02", nullptr,
        ActsGameControllerGamePadAxisEventGetGasAxisValue02, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetActionTime01", nullptr,
        ActsGameControllerGamePadAxisEventGetActionTime01, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsGameControllerGamePadAxisEventGetActionTime02", nullptr,
        ActsGameControllerGamePadAxisEventGetActionTime02, nullptr, nullptr, nullptr, napi_default, nullptr },

    { "ActsRealDeviceGetAllDevices", nullptr,
        ActsRealDeviceGetAllDevices, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsRealDeviceHasRealDevice", nullptr,
        ActsRealDeviceHasRealDevice, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsRealDeviceCheckDeviceEvent", nullptr,
        ActsRealDeviceCheckDeviceEvent, nullptr, nullptr, nullptr, napi_default, nullptr },
    { "ActsRealDeviceCheckGamePadEvent", nullptr,
        ActsRealDeviceCheckGamePadEvent, nullptr, nullptr, nullptr, napi_default, nullptr },
};

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
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
