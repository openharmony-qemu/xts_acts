/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import GC from 'libentry.so';
import { SyscapChecker } from './SyscapChecker.test';

export default function CApiGamePadEventTest() {
  describe('CApiGamePadEventTest', () => {
    /**
     * @tc.number ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_01
     * @tc.name ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_01
     * @tc.desc GetDeviceId success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetDeviceId_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_01();
      expect(ret).assertEqual(0);
    });
    /**
     * @tc.number OH_GamePad_ButtonEvent_GetDeviceId_02
     * @tc.name OH_GamePad_ButtonEvent_GetDeviceId_02
     * @tc.desc GetDeviceId failed when buttonEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetDeviceId_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonEvent_GetDeviceId_03
     * @tc.name OH_GamePad_ButtonEvent_GetDeviceId_03
     * @tc.desc GetDeviceId failed when deviceId is nullptr
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetDeviceId_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetDeviceId_03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonEvent_GetButtonAction_01
     * @tc.name OH_GamePad_ButtonEvent_GetButtonAction_01
     * @tc.desc GetButtonAction success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetButtonAction_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonEvent_GetButtonAction_02
     * @tc.name OH_GamePad_ButtonEvent_GetButtonAction_02
     * @tc.desc GetButtonAction failed when buttonEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetButtonAction_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetButtonAction_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonEvent_GetButtonCode_01
     * @tc.name OH_GamePad_ButtonEvent_GetButtonCode_01
     * @tc.desc GetButtonCode success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetButtonCode_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_02
     * @tc.name ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_02
     * @tc.desc GetButtonCode failed when buttonEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetButtonCode_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetButtonCode_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonEvent_GetButtonCodeName_01
     * @tc.name OH_GamePad_ButtonEvent_GetButtonCodeName_01
     * @tc.desc GetButtonCodeName success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetButtonCodeName_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonEvent_GetButtonCodeName_02
     * @tc.name OH_GamePad_ButtonEvent_GetButtonCodeName_02
     * @tc.desc GetButtonCodeName failed when buttonEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetButtonCodeName_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonEvent_GetButtonCodeName_03
     * @tc.name OH_GamePad_ButtonEvent_GetButtonCodeName_03
     * @tc.desc GetButtonCodeName failed when codeName is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetButtonCodeName_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetButtonCodeName_03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_PressedButtons_GetCount_01
     * @tc.name OH_GamePad_PressedButtons_GetCount_01
     * @tc.desc PressedButtons_GetCount success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButtons_GetCount_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButtons_GetCount_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_PressedButtons_GetCount_02
     * @tc.name OH_GamePad_PressedButtons_GetCount_02
     * @tc.desc PressedButtons_GetCount failed when buttonEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButtons_GetCount_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButtons_GetCount_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_PressedButtons_GetButtonInfo_01
     * @tc.name OH_GamePad_PressedButtons_GetButtonInfo_01
     * @tc.desc GetButtonInfo success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButtons_GetButtonInfo_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_PressedButtons_GetButtonInfo_02
     * @tc.name OH_GamePad_PressedButtons_GetButtonInfo_02
     * @tc.desc GetButtonInfo failed when buttonEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButtons_GetButtonInfo_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_PressedButtons_GetButtonInfo_03
     * @tc.name OH_GamePad_PressedButtons_GetButtonInfo_03
     * @tc.desc GetButtonInfo failed when index is more than count
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButtons_GetButtonInfo_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_PressedButtons_GetButtonInfo_04
     * @tc.name OH_GamePad_PressedButtons_GetButtonInfo_04
     * @tc.desc GetButtonInfo failed when index is less than 0
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButtons_GetButtonInfo_04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButtons_GetButtonInfo_04();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_DestroyPressedButton_01
     * @tc.name OH_GamePad_DestroyPressedButton_01
     * @tc.desc DestroyPressedButton success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_DestroyPressedButton_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_DestroyPressedButton_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_DestroyPressedButton_02
     * @tc.name OH_GamePad_DestroyPressedButton_02
     * @tc.desc DestroyPressedButton failed when pressedButton is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_DestroyPressedButton_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_DestroyPressedButton_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_PressedButton_GetButtonCode_01
     * @tc.name OH_GamePad_PressedButton_GetButtonCode_01
     * @tc.desc PressedButton_GetButtonCode success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButton_GetButtonCode_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButton_GetButtonCode_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number ACTS_GameController_GamePad_PressedButton_GetButtonCode_02
     * @tc.name ACTS_GameController_GamePad_PressedButton_GetButtonCode_02
     * @tc.desc PressedButton_GetButtonCode failed when pressedButton is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButton_GetButtonCode_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButton_GetButtonCode_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_PressedButton_GetButtonCodeName_01
     * @tc.name OH_GamePad_PressedButton_GetButtonCodeName_01
     * @tc.desc PressedButton_GetButtonCodeName success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButton_GetButtonCodeName_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_PressedButton_GetButtonCodeName_02
     * @tc.name OH_GamePad_PressedButton_GetButtonCodeName_02
     * @tc.desc PressedButton_GetButtonCodeName failed when pressedButton is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButton_GetButtonCodeName_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_PressedButton_GetButtonCodeName_03
     * @tc.name OH_GamePad_PressedButton_GetButtonCodeName_03
     * @tc.desc PressedButton_GetButtonCodeName failed when codeName is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_PressedButton_GetButtonCodeName_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_PressedButton_GetButtonCodeName_03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number ACTS_GameController_GamePad_ButtonEvent_GetActionTime_01
     * @tc.name ACTS_GameController_GamePad_ButtonEvent_GetActionTime_01
     * @tc.desc ButtonEvent_GetActionTime success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetActionTime_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetActionTime_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonEvent_GetActionTime_02
     * @tc.name OH_GamePad_ButtonEvent_GetActionTime_02
     * @tc.desc ButtonEvent_GetActionTime failed when buttonEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonEvent_GetActionTime_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_ButtonEvent_GetActionTime_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetDeviceId_01
     * @tc.name OH_GamePad_AxisEvent_GetDeviceId_01
     * @tc.desc GetDeviceId success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetDeviceId_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetDeviceId_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetDeviceId_02
     * @tc.name OH_GamePad_AxisEvent_GetDeviceId_02
     * @tc.desc GetDeviceId failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetDeviceId_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetDeviceId_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetDeviceId_03
     * @tc.name OH_GamePad_AxisEvent_GetDeviceId_03
     * @tc.desc GetDeviceId failed when deviceId is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetDeviceId_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetDeviceId_03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetAxisSourceType_01
     * @tc.name OH_GamePad_AxisEvent_GetAxisSourceType_01
     * @tc.desc AxisEvent_GetAxisSourceType sucess
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetAxisSourceType_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetAxisSourceType_02
     * @tc.name OH_GamePad_AxisEvent_GetAxisSourceType_02
     * @tc.desc AxisEvent_GetAxisSourceType failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetAxisSourceType_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetAxisSourceType_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetXAxisValue_01
     * @tc.name OH_GamePad_AxisEvent_GetXAxisValue_01
     * @tc.desc AxisEvent_GetXAxisValue success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetXAxisValue_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetXAxisValue_02
     * @tc.name OH_GamePad_AxisEvent_GetXAxisValue_02
     * @tc.desc AxisEvent_GetXAxisValue failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetXAxisValue_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetXAxisValue_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetYAxisValue_01
     * @tc.name OH_GamePad_AxisEvent_GetYAxisValue_01
     * @tc.desc AxisEvent_GetYAxisValue success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetYAxisValue_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetYAxisValue_02
     * @tc.name OH_GamePad_AxisEvent_GetYAxisValue_02
     * @tc.desc AxisEvent_GetYAxisValue failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetYAxisValue_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetYAxisValue_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetZAxisValue_01
     * @tc.name OH_GamePad_AxisEvent_GetZAxisValue_01
     * @tc.desc AxisEvent_GetZAxisValue success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetZAxisValue_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetZAxisValue_02
     * @tc.name OH_GamePad_AxisEvent_GetZAxisValue_02
     * @tc.desc AxisEvent_GetZAxisValue failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetZAxisValue_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetZAxisValue_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetRZAxisValue_01
     * @tc.name OH_GamePad_AxisEvent_GetRZAxisValue_01
     * @tc.desc AxisEvent_GetRZAxisValue success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetRZAxisValue_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetRZAxisValue_02
     * @tc.name OH_GamePad_AxisEvent_GetRZAxisValue_02
     * @tc.desc AxisEvent_GetRZAxisValue failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetRZAxisValue_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetRZAxisValue_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetHatXAxisValue_01
     * @tc.name OH_GamePad_AxisEvent_GetHatXAxisValue_01
     * @tc.desc AxisEvent_GetHatXAxisValue success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetHatXAxisValue_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetHatXAxisValue_02
     * @tc.name OH_GamePad_AxisEvent_GetHatXAxisValue_02
     * @tc.desc AxisEvent_GetHatXAxisValue failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetHatXAxisValue_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetHatXAxisValue_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetHatYAxisValue_01
     * @tc.name OH_GamePad_AxisEvent_GetHatYAxisValue_01
     * @tc.desc AxisEvent_GetHatYAxisValue success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetHatYAxisValue_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetHatYAxisValue_02
     * @tc.name OH_GamePad_AxisEvent_GetHatYAxisValue_02
     * @tc.desc AxisEvent_GetHatYAxisValue failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetHatYAxisValue_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetHatYAxisValue_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetBrakeAxisValue_01
     * @tc.name OH_GamePad_AxisEvent_GetBrakeAxisValue_01
     * @tc.desc AxisEvent_GetBrakeAxisValue success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetBrakeAxisValue_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetBrakeAxisValue_02
     * @tc.name OH_GamePad_AxisEvent_GetBrakeAxisValue_02
     * @tc.desc AxisEvent_GetBrakeAxisValue failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetBrakeAxisValue_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetBrakeAxisValue_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetGasAxisValue_01
     * @tc.name OH_GamePad_AxisEvent_GetGasAxisValue_01
     * @tc.desc AxisEvent_GetGasAxisValue success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetGasAxisValue_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetGasAxisValue_02
     * @tc.name OH_GamePad_AxisEvent_GetGasAxisValue_02
     * @tc.desc AxisEvent_GetGasAxisValue failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetGasAxisValue_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetGasAxisValue_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetActionTime_01
     * @tc.name OH_GamePad_AxisEvent_GetActionTime_01
     * @tc.desc AxisEvent_GetActionTime success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetActionTime_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetActionTime_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_AxisEvent_GetActionTime_02
     * @tc.name OH_GamePad_AxisEvent_GetActionTime_02
     * @tc.desc AxisEvent_GetActionTime failed when axisEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_AxisEvent_GetActionTime_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameController_GamePad_AxisEvent_GetActionTime_02();
      expect(ret).assertEqual(401);
    });
  })
}