/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstdint>
#include <stdint.h>
#include <GameControllerKit/game_pad_event.h>
#include "../include/game_controller_test.h"
#include "../include/game_controller_model.h"

namespace OHOS {
namespace GameController {

static GamePad_ButtonEvent *CreateButtonEvent() {
    GamePadButtonEvent *gamePadButtonEvent = new GamePadButtonEvent();
    gamePadButtonEvent->id = 1;
    gamePadButtonEvent->uniq = "uniq";
    gamePadButtonEvent->keyCode = 2301;
    gamePadButtonEvent->keyCodeName = "ButtonA";
    gamePadButtonEvent->actionTime = 1111;
    gamePadButtonEvent->keyAction = 1;
    KeyInfo keyInfo;
    keyInfo.keyCode = 2302;
    keyInfo.keyCodeName = "ButtonB";
    gamePadButtonEvent->keys.push_back(keyInfo);
    return (GamePad_ButtonEvent *)gamePadButtonEvent;
}

static GamePad_AxisEvent *CreateAxisEvent() {
    GamePadAxisEvent *gamePadAxisEvent = new GamePadAxisEvent();
    gamePadAxisEvent->uniq = "uniq";
    gamePadAxisEvent->axisSourceType = Dpad;
    gamePadAxisEvent->xValue = 8.0;
    gamePadAxisEvent->yValue = 1.0;
    gamePadAxisEvent->zValue = 2.0;
    gamePadAxisEvent->rzValue = 3.0;
    gamePadAxisEvent->brakeValue = 4.0;
    gamePadAxisEvent->gasValue = 5.0;
    gamePadAxisEvent->hatxValue = 6.0;
    gamePadAxisEvent->hatyValue = 7.0;
    gamePadAxisEvent->actionTime = 2222;

    return (GamePad_AxisEvent *)gamePadAxisEvent;
}

static void DestroyButtonEvent(GamePad_ButtonEvent *buttonEvent) {
    delete buttonEvent;
    buttonEvent = nullptr;
}

static void DestroyAxisEvent(GamePad_AxisEvent *axisEvent) {
    delete axisEvent;
    axisEvent = nullptr;
}

static bool IsNotSame(double val1, double val2) {
    const double epsilon = 1e-10; // 自定义的精度范围
    return fabs(val1 - val2) >= epsilon;
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    char *deviceId;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetDeviceId(buttonEvent, &deviceId);
    if (strcmp(deviceId, "uniq") != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_02() {
    GamePad_ButtonEvent *buttonEvent = nullptr;
    char *deviceId;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetDeviceId(buttonEvent, &deviceId);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_03() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetDeviceId(buttonEvent, nullptr);
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    GamePad_Button_ActionType actionType;
    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonAction(buttonEvent, &actionType);
    if (actionType != GamePad_Button_ActionType::UP) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_02() {
    GamePad_ButtonEvent *buttonEvent = nullptr;
    GamePad_Button_ActionType actionType;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonAction(buttonEvent, &actionType);

    return static_cast<int32_t>(code);
}


int32_t ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    int32_t buttonCode;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCode(buttonEvent, &buttonCode);
    if (buttonCode != 2301) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_02() {
    GamePad_ButtonEvent *buttonEvent = nullptr;
    int32_t buttonCode;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCode(buttonEvent, &buttonCode);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    char *buttonCodeName = nullptr;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCodeName(buttonEvent, &buttonCodeName);
    if (strcmp(buttonCodeName, "ButtonA") != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_02() {
    GamePad_ButtonEvent *buttonEvent = nullptr;
    char *buttonCodeName;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCodeName(buttonEvent, &buttonCodeName);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_03() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetButtonCodeName(buttonEvent, nullptr);
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButtons_GetCount_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    int32_t count = 0;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetCount(buttonEvent, &count);
    if (count != 1) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButtons_GetCount_02() {
    GamePad_ButtonEvent *buttonEvent = nullptr;
    int32_t count;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetCount(buttonEvent, &count);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    GamePad_PressedButton *pressedButton;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);
    DestroyButtonEvent(buttonEvent);
    OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_02() {
    GamePad_ButtonEvent *buttonEvent = nullptr;
    GamePad_PressedButton *pressedButton;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_03() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    GamePad_PressedButton *pressedButton;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 1, &pressedButton);
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_04() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    GamePad_PressedButton *pressedButton;

    GameController_ErrorCode code = OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, -1, &pressedButton);
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_DestroyPressedButton_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    GamePad_PressedButton *pressedButton;

    OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);
    DestroyButtonEvent(buttonEvent);
    GameController_ErrorCode code = OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_DestroyPressedButton_02() {
    GameController_ErrorCode code = OH_GamePad_DestroyPressedButton(nullptr);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButton_GetButtonCode_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    GamePad_PressedButton *pressedButton;
    int32_t buttonCode;
    OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);

    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCode(pressedButton, &buttonCode);
    if (buttonCode != 2302) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButton_GetButtonCode_02() {
    GamePad_PressedButton *pressedButton = nullptr;
    int32_t buttonCode;

    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCode(pressedButton, &buttonCode);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    GamePad_PressedButton *pressedButton;
    OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);

    char *buttonCodeName = nullptr;
    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCodeName(pressedButton, &buttonCodeName);
    if (strcmp(buttonCodeName, "ButtonB") != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_02() {
    GamePad_PressedButton *pressedButton = nullptr;
    char *buttonCodeName;

    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCodeName(pressedButton, &buttonCodeName);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_03() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    GamePad_PressedButton *pressedButton;
    OH_GamePad_PressedButtons_GetButtonInfo(buttonEvent, 0, &pressedButton);

    GameController_ErrorCode code = OH_GamePad_PressedButton_GetButtonCodeName(pressedButton, nullptr);
    DestroyButtonEvent(buttonEvent);
    OH_GamePad_DestroyPressedButton(&pressedButton);
    return static_cast<int32_t>(code);
}


int32_t ACTS_GameController_GamePad_ButtonEvent_GetActionTime_01() {
    GamePad_ButtonEvent *buttonEvent = CreateButtonEvent();
    int64_t actionTime = 0;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetActionTime(buttonEvent, &actionTime);
    if (actionTime != 1111) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyButtonEvent(buttonEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_ButtonEvent_GetActionTime_02() {
    GamePad_ButtonEvent *buttonEvent = nullptr;
    int64_t actionTime;

    GameController_ErrorCode code = OH_GamePad_ButtonEvent_GetActionTime(buttonEvent, &actionTime);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetDeviceId_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    char *deviceId;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetDeviceId(axisEvent, &deviceId);
    if (strcmp(deviceId, "uniq") != 0) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetDeviceId_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    char *deviceId;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetDeviceId(axisEvent, &deviceId);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetDeviceId_03() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetDeviceId(axisEvent, nullptr);
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    GamePad_AxisSourceType axisSourceType;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetAxisSourceType(axisEvent, &axisSourceType);
    if (axisSourceType != DPAD) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    GamePad_AxisSourceType axisSourceType;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetAxisSourceType(axisEvent, &axisSourceType);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetXAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, 8.0)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetXAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetYAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, 1.0)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetYAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetZAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, 2.0)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetZAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetRZAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, 3.0)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetRZAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetHatXAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, 6.0)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetHatXAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetHatYAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, 7.0)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetHatYAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetBrakeAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, 4.0)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetBrakeAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    double axisValue = 0;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetGasAxisValue(axisEvent, &axisValue);
    if (IsNotSame(axisValue, 5.0)) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    double axisValue;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetGasAxisValue(axisEvent, &axisValue);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetActionTime_01() {
    GamePad_AxisEvent *axisEvent = CreateAxisEvent();
    int64_t actionTime;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetActionTime(axisEvent, &actionTime);
    if (actionTime != 2222) {
        code = GameController_ErrorCode::GAME_CONTROLLER_PARAM_ERROR;
    }
    DestroyAxisEvent(axisEvent);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GameController_GamePad_AxisEvent_GetActionTime_02() {
    GamePad_AxisEvent *axisEvent = nullptr;
    int64_t actionTime;

    GameController_ErrorCode code = OH_GamePad_AxisEvent_GetActionTime(axisEvent, &actionTime);

    return static_cast<int32_t>(code);
}
} // namespace GameController
} // namespace OHOS