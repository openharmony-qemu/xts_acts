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

export default function CApiGameDeviceTest() {
  describe('CApiGameDeviceTest', () => {
    /**
     * @tc.number OH_GameDevice_GetAllDeviceInfos_01
     * @tc.name OH_GameDevice_GetAllDeviceInfos_01
     * @tc.desc get AllDeviceInfos success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_GetAllDeviceInfos', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_GetAllDeviceInfos_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_RegisterDeviceMonitor_01
     * @tc.name OH_GameDevice_RegisterDeviceMonitor_01
     * @tc.desc registerDeviceMonitor success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_RegisterDeviceMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_RegisterDeviceMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_RegisterDeviceMonitor_02
     * @tc.name OH_GameDevice_RegisterDeviceMonitor_02
     * @tc.desc registerDeviceMonitor failed when deviceMonitorCallback is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_RegisterDeviceMonitor_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_RegisterDeviceMonitor_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_UnregisterDeviceMonitor_01
     * @tc.name OH_GameDevice_UnregisterDeviceMonitor_01
     * @tc.desc UnregisterDeviceMonitor success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_UnregisterDeviceMonitor_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_UnregisterDeviceMonitor_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DestroyAllDeviceInfos_01
     * @tc.name OH_GameDevice_DestroyAllDeviceInfos_01
     * @tc.desc destroy allDeviceInfos success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DestroyAllDeviceInfos_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DestroyAllDeviceInfos_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_DestroyAllDeviceInfos_02
     * @tc.name OH_GameDevice_DestroyAllDeviceInfos_02
     * @tc.desc destroy allDeviceInfos failed when allDeviceInfos is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_DestroyAllDeviceInfos_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_DestroyAllDeviceInfos_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_AllDeviceInfos_GetCount_01
     * @tc.name OH_GameDevice_AllDeviceInfos_GetCount_01
     * @tc.desc get count success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_AllDeviceInfos_GetCount_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_AllDeviceInfos_GetCount_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_AllDeviceInfos_GetCount_02
     * @tc.name OH_GameDevice_AllDeviceInfos_GetCount_02
     * @tc.desc get count failed when allDeviceInfos is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_AllDeviceInfos_GetCount_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_AllDeviceInfos_GetCount_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo_01
     * @tc.name OH_GameDevice_AllDeviceInfos_GetDeviceInfo_01
     * @tc.desc get deviceInfo success
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo_02
     * @tc.name OH_GameDevice_AllDeviceInfos_GetDeviceInfo_02
     * @tc.desc get deviceInfo failed, when allDeviceInfos is null
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo_03
     * @tc.name OH_GameDevice_AllDeviceInfos_GetDeviceInfo_03
     * @tc.desc get deviceInfo failed,  when index is more than count
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo_04
     * @tc.name OH_GameDevice_AllDeviceInfos_GetDeviceInfo_04
     * @tc.desc get deviceInfo failed, when index is less than 0
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo_04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_04();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo_05
     * @tc.name OH_GameDevice_AllDeviceInfos_GetDeviceInfo_05
     * @tc.desc get deviceInfo failed, when index is equal with count
     * @tc.level Level0
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo_05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ACTS_GameDevice_AllDeviceInfos_GetDeviceInfo_05();
      expect(ret).assertEqual(401);
    });
  })
}