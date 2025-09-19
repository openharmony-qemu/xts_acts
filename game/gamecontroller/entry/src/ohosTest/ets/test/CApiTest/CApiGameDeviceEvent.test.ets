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

export default function CApiGameDeviceEventTest() {
  describe('CApiGameDeviceEventTest', () => {
    /**
     * @tc.number OH_GameDevice_DeviceEvent_GetChangedType_01
     * @tc.name OH_GameDevice_DeviceEvent_GetChangedType_01
     * @tc.desc get changed type success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceEvent_GetChangedType_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceEvent_GetChangedType_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DeviceEvent_GetChangedType_02
     * @tc.name OH_GameDevice_DeviceEvent_GetChangedType_02
     * @tc.desc get changed type failed, when deviceEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceEvent_GetChangedType_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceEvent_GetChangedType_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceEvent_GetDeviceInfo_01
     * @tc.name OH_GameDevice_DeviceEvent_GetDeviceInfo_01
     * @tc.desc get deviceInfo success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceEvent_GetDeviceInfo_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceEvent_GetDeviceInfo_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DeviceEvent_GetDeviceInfo_02
     * @tc.name OH_GameDevice_DeviceEvent_GetDeviceInfo_02
     * @tc.desc get deviceInfo failed, when deviceEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceEvent_GetDeviceInfo_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceEvent_GetDeviceInfo_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DestroyDeviceInfo_01
     * @tc.name OH_GameDevice_DestroyDeviceInfo_01
     * @tc.desc destroy device info success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DestroyDeviceInfo_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DestroyDeviceInfo_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DestroyDeviceInfo_02
     * @tc.name OH_GameDevice_DestroyDeviceInfo_02
     * @tc.desc destroy device info failed, when deviceInfo is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DestroyDeviceInfo_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DestroyDeviceInfo_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceId_01
     * @tc.name OH_GameDevice_DeviceInfo_GetDeviceId_01
     * @tc.desc get deviceId success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceId_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetDeviceId_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceId_02
     * @tc.name OH_GameDevice_DeviceInfo_GetDeviceId_02
     * @tc.desc get deviceId failed, when deviceEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceId_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetDeviceId_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceId_03
     * @tc.name OH_GameDevice_DeviceInfo_GetDeviceId_03
     * @tc.desc get deviceId failed, when deviceId is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceId_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetDeviceId_03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetName_01
     * @tc.name OH_GameDevice_DeviceInfo_GetName_01
     * @tc.desc get name success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetName_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetName_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetName_02
     * @tc.name OH_GameDevice_DeviceInfo_GetName_02
     * @tc.desc get name failed, when deviceEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetName_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetName_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetName_03
     * @tc.name OH_GameDevice_DeviceInfo_GetName_03
     * @tc.desc get name failed, when name is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetName_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetName_03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetProduct_01
     * @tc.name OH_GameDevice_DeviceInfo_GetProduct_01
     * @tc.desc GetProduct success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetProduct_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetProduct_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetProduct_02
     * @tc.name OH_GameDevice_DeviceInfo_GetProduct_02
     * @tc.desc GetProduct failed, device event null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetProduct_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetProduct_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetVersion_01
     * @tc.name OH_GameDevice_DeviceInfo_GetVersion_01
     * @tc.desc GetVersion success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetVersion_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetVersion_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetVersion_02
     * @tc.name OH_GameDevice_DeviceInfo_GetVersion_02
     * @tc.desc GetVersion failed, when deviceEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetVersion_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetVersion_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetPhys_01
     * @tc.name OH_GameDevice_DeviceInfo_GetPhys_01
     * @tc.desc GetPhys success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetPhys_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetPhys_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetPhys_02
     * @tc.name OH_GameDevice_DeviceInfo_GetPhys_02
     * @tc.desc GetPhys failed, when deviceEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetPhys_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetPhys_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetPhys_03
     * @tc.name OH_GameDevice_DeviceInfo_GetPhys_03
     * @tc.desc GetPhys failed, when deviceEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetPhys_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetPhys_03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceType_01
     * @tc.name OH_GameDevice_DeviceInfo_GetDeviceType_01
     * @tc.desc GetDeviceType success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceType_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetDeviceType_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceType_02
     * @tc.name OH_GameDevice_DeviceInfo_GetDeviceType_02
     * @tc.desc GetDeviceType failed, when deviceEvent is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceType_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DeviceInfo_GetDeviceType_02();
      expect(ret).assertEqual(401);
    });

  })
}