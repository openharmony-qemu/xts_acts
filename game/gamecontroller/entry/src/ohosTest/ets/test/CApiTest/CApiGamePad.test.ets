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

export default function CApiGamePadTest() {
  describe('CApiGamePadTest', () => {
    /**
     * @tc.number OH_GamePad_LeftShoulder_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_LeftShoulder_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftShoulder_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_LeftShoulder_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_LeftShoulder_RegisterButtonInputMonitor_02
     * @tc.desc register failed, callback null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftShoulder_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftShoulder_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftShoulder_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightShoulder_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_RightShoulder_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightShoulder_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightShoulder_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_RightShoulder_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightShoulder_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightShoulder_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_RightShoulder_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_RightShoulder_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightShoulder_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightShoulder_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_LeftTrigger_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_LeftTrigger_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftTrigger_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_LeftTrigger_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_LeftTrigger_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftTrigger_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftTrigger_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftTrigger_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_LeftTrigger_RegisterAxisInputMonitor_01
     * @tc.name OH_GamePad_LeftTrigger_RegisterAxisInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftTrigger_RegisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_LeftTrigger_RegisterAxisInputMonitor_02
     * @tc.name OH_GamePad_LeftTrigger_RegisterAxisInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftTrigger_RegisterAxisInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftTrigger_RegisterAxisInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor_01
     * @tc.name OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftTrigger_UnregisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightTrigger_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_RightTrigger_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightTrigger_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightTrigger_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_RightTrigger_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightTrigger_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightTrigger_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_RightTrigger_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_RightTrigger_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightTrigger_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightTrigger_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightTrigger_RegisterAxisInputMonitor_01
     * @tc.name OH_GamePad_RightTrigger_RegisterAxisInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightTrigger_RegisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightTrigger_RegisterAxisInputMonitor_02
     * @tc.name OH_GamePad_RightTrigger_RegisterAxisInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightTrigger_RegisterAxisInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightTrigger_RegisterAxisInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_RightTrigger_UnregisterAxisInputMonitor_01
     * @tc.name OH_GamePad_RightTrigger_UnregisterAxisInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightTrigger_UnregisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightTrigger_UnregisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonMenu_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonMenu_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonMenu_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonMenu_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_ButtonMenu_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonMenu_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonMenu_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonMenu_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonHome_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonHome_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonHome_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonHome_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_ButtonHome_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonHome_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonHome_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonHome_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonHome_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonHome_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonHome_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonA_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonA_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonA_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonA_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_ButtonA_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonA_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonA_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonA_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonA_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonA_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonA_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonB_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonB_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonB_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonB_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_ButtonB_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonB_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonB_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonB_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonB_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonB_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonB_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonX_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonX_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonX_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonX_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_ButtonX_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonX_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonX_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonX_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonX_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonX_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonX_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonY_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonY_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonY_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonY_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_ButtonY_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonY_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonY_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonY_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonY_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonY_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonY_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonC_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonC_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonC_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_ButtonC_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_ButtonC_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonC_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonC_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_ButtonC_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_ButtonC_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_ButtonC_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_ButtonC_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_RightButton_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_UpButton_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_DownButton_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_RegisterAxisInputMonitor_01
     * @tc.name OH_GamePad_Dpad_RegisterAxisInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_RegisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_RegisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_Dpad_RegisterAxisInputMonitor_02
     * @tc.name OH_GamePad_Dpad_RegisterAxisInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_RegisterAxisInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_RegisterAxisInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_Dpad_UnregisterAxisInputMonitor_01
     * @tc.name OH_GamePad_Dpad_UnregisterAxisInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_Dpad_UnregisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_Dpad_UnregisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftThumbstick_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftThumbstick_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor_01
     * @tc.name OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor_02
     * @tc.name OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftThumbstick_RegisterAxisInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor_01
     * @tc.name OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_LeftThumbstick_UnregisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightThumbstick_RegisterButtonInputMonitor_01
     * @tc.name OH_GamePad_RightThumbstick_RegisterButtonInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightThumbstick_RegisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightThumbstick_RegisterButtonInputMonitor_02
     * @tc.name OH_GamePad_RightThumbstick_RegisterButtonInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightThumbstick_RegisterButtonInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightThumbstick_RegisterButtonInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor_01
     * @tc.name OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightThumbstick_UnregisterButtonInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightThumbstick_RegisterAxisInputMonitor_01
     * @tc.name OH_GamePad_RightThumbstick_RegisterAxisInputMonitor_01
     * @tc.desc register success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightThumbstick_RegisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GamePad_RightThumbstick_RegisterAxisInputMonitor_02
     * @tc.name OH_GamePad_RightThumbstick_RegisterAxisInputMonitor_02
     * @tc.desc when callback is null, register failed
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightThumbstick_RegisterAxisInputMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightThumbstick_RegisterAxisInputMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor_01
     * @tc.name OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor_01
     * @tc.desc unregister success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GamePad_RightThumbstick_UnregisterAxisInputMonitor_01();
      expect(ret).assertEqual(0);
    });
  })
}
