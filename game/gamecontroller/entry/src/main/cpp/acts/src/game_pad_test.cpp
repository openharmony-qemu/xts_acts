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
#include <GameControllerKit/game_pad.h>
#include "../include/game_controller_test.h"

namespace OHOS {
namespace GameController {

static void ButtonInputMonitorCallbackTest01(const struct GamePad_ButtonEvent* buttonEvent){}
static void AxisInputMonitorCallbackTest01(const struct GamePad_AxisEvent* axisEvent){}

int32_t ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_LeftShoulder_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_LeftShoulder_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftShoulder_UnregisterButtonInputMonitor_01() {
    OH_GamePad_LeftShoulder_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);
    
    GameController_ErrorCode code = OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor();
    
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_RightShoulder_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_RightShoulder_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_RightShoulder_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightShoulder_UnregisterButtonInputMonitor_01() {
    OH_GamePad_RightShoulder_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_RightShoulder_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftTrigger_UnregisterButtonInputMonitor_01() {
    OH_GamePad_LeftTrigger_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_LeftTrigger_RegisterAxisInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftTrigger_UnregisterAxisInputMonitor_01() {
    OH_GamePad_LeftTrigger_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_RightTrigger_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_RightTrigger_RegisterButtonInputMonitor(nullptr);
    OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}


int32_t ACTS_GamePad_RightTrigger_UnregisterButtonInputMonitor_01() {
     OH_GamePad_RightTrigger_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

     GameController_ErrorCode code = OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_RightTrigger_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_RightTrigger_RegisterAxisInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightTrigger_UnregisterAxisInputMonitor_01() {
    OH_GamePad_RightTrigger_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);
    GameController_ErrorCode code = OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_ButtonMenu_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_ButtonMenu_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonMenu_UnregisterButtonInputMonitor_01() {
    OH_GamePad_ButtonMenu_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_RightTrigger_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_ButtonHome_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonHome_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_ButtonHome_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonHome_UnregisterButtonInputMonitor_01() {
    OH_GamePad_ButtonHome_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonHome_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_ButtonA_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonA_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_ButtonA_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonA_UnregisterButtonInputMonitor_01() {
    OH_GamePad_ButtonA_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonA_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_ButtonB_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonB_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_ButtonB_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonB_UnregisterButtonInputMonitor_01() {
     OH_GamePad_ButtonB_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonB_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_ButtonX_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonX_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_ButtonX_RegisterButtonInputMonitor(nullptr);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonX_UnregisterButtonInputMonitor_01() {
    OH_GamePad_ButtonX_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonX_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_ButtonY_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonY_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_ButtonY_RegisterButtonInputMonitor(nullptr);

    OH_GamePad_ButtonY_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonY_UnregisterButtonInputMonitor_01() {
    OH_GamePad_ButtonY_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonY_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_ButtonC_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_ButtonC_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_ButtonC_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_ButtonC_UnregisterButtonInputMonitor_01() {
    OH_GamePad_ButtonC_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_ButtonC_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}


int32_t ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor_01() {
    OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor_01() {
    OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor_01() {
    OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor_01() {
    OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_RegisterAxisInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_Dpad_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_Dpad_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_RegisterAxisInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_Dpad_RegisterAxisInputMonitor(nullptr);

    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_Dpad_UnregisterAxisInputMonitor_01() {
    OH_GamePad_Dpad_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    GameController_ErrorCode code = OH_GamePad_Dpad_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor(nullptr);

    OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftThumbstick_UnregisterButtonInputMonitor_01() {
    OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code =  OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor(nullptr);

    OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_LeftThumbstick_UnregisterAxisInputMonitor_01() {
    OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);
    GameController_ErrorCode code = OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_RightThumbstick_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_RightThumbstick_RegisterButtonInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightThumbstick_UnregisterButtonInputMonitor_01() {
    OH_GamePad_RightThumbstick_RegisterButtonInputMonitor(ButtonInputMonitorCallbackTest01);

    GameController_ErrorCode code =OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_01() {
    GameController_ErrorCode code = OH_GamePad_RightThumbstick_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);

    OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_02() {
    GameController_ErrorCode code = OH_GamePad_RightThumbstick_RegisterAxisInputMonitor(nullptr);
    return static_cast<int32_t>(code);
}

int32_t ACTS_GamePad_RightThumbstick_UnregisterAxisInputMonitor_01() {
    OH_GamePad_RightThumbstick_RegisterAxisInputMonitor(AxisInputMonitorCallbackTest01);
    
    GameController_ErrorCode code = OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor();
    return static_cast<int32_t>(code);
}

} // namespace GameController
} // namespace OHOS