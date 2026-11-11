/// <reference path="./DeviceManagerSystemApi.d.ts" />
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, afterAll, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import { BusinessError } from '@ohos.base';
import deviceManager from '@ohos.driver.deviceManager'
import { queryDeviceInfo, queryDriverInfo } from '@ohos.driver.deviceManager'

export default function emulatorDeviceManagerTest() {
  describe('emulatorDeviceManagerTest', () => {
    const TAG: string = "[emulatorDeviceManagerTest]";
    const EMULATOR_NOT_SUPPORT_CODE: number = 804;
    const EMULATOR_NOT_SUPPORT_MESSAGE: string = "The capability is not supported on the emulator at this time.";
    const TEST_DEVICE_ID: number = 12345;

    beforeAll(() => {
      console.info('emulatorDeviceManagerTest beforeAll called');
    })

    afterAll(() => {
      console.info('emulatorDeviceManagerTest afterAll called');
    })

    /**
     * @tc.name   testQueryDevices001
     * @tc.number SUB_Driver_Ext_Emulator_DeviceManager_0100
     * @tc.desc   verify queryDevices throws 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testQueryDevices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(TAG, '----------------------testQueryDevices001---------------------------');
      try {
        deviceManager.queryDevices(deviceManager.BusType.USB);
        expect(false).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
        expect(error.message).assertEqual(EMULATOR_NOT_SUPPORT_MESSAGE);
      }
      done();
    });

    /**
     * @tc.name   testBindDevice001
     * @tc.number SUB_Driver_Ext_Emulator_DeviceManager_0200
     * @tc.desc   verify bindDevice throws 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testBindDevice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(TAG, '----------------------testBindDevice001---------------------------');
      try {
        deviceManager.bindDevice(TEST_DEVICE_ID, () => {});
        expect(false).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
        expect(error.message).assertEqual(EMULATOR_NOT_SUPPORT_MESSAGE);
      }
      done();
    });

    /**
     * @tc.name   testBindDeviceDriver001
     * @tc.number SUB_Driver_Ext_Emulator_DeviceManager_0300
     * @tc.desc   verify bindDeviceDriver throws 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testBindDeviceDriver001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(TAG, '----------------------testBindDeviceDriver001---------------------------');
      try {
        deviceManager.bindDeviceDriver(TEST_DEVICE_ID, () => {});
        expect(false).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
        expect(error.message).assertEqual(EMULATOR_NOT_SUPPORT_MESSAGE);
      }
      done();
    });

    /**
     * @tc.name   testUnbindDevice001
     * @tc.number SUB_Driver_Ext_Emulator_DeviceManager_0400
     * @tc.desc   verify unbindDevice throws 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUnbindDevice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(TAG, '----------------------testUnbindDevice001---------------------------');
      try {
        deviceManager.unbindDevice(TEST_DEVICE_ID);
        expect(false).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
        expect(error.message).assertEqual(EMULATOR_NOT_SUPPORT_MESSAGE);
      }
      done();
    });

    /**
     * @tc.name   testBindDriverWithDeviceId001
     * @tc.number SUB_Driver_Ext_Emulator_DeviceManager_0500
     * @tc.desc   verify bindDriverWithDeviceId throws 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testBindDriverWithDeviceId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(TAG, '----------------------testBindDriverWithDeviceId001---------------------------');
      try {
        deviceManager.bindDriverWithDeviceId(TEST_DEVICE_ID, () => {});
        expect(false).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
        expect(error.message).assertEqual(EMULATOR_NOT_SUPPORT_MESSAGE);
      }
      done();
    });

    /**
     * @tc.name   testUnbindDriverWithDeviceId001
     * @tc.number SUB_Driver_Ext_Emulator_DeviceManager_0600
     * @tc.desc   verify unbindDriverWithDeviceId throws 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUnbindDriverWithDeviceId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(TAG, '----------------------testUnbindDriverWithDeviceId001---------------------------');
      try {
        deviceManager.unbindDriverWithDeviceId(TEST_DEVICE_ID);
        expect(false).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
        expect(error.message).assertEqual(EMULATOR_NOT_SUPPORT_MESSAGE);
      }
      done();
    });

    /**
     * @tc.name   testQueryDeviceInfo001
     * @tc.number SUB_Driver_Ext_Emulator_DeviceManager_0700
     * @tc.desc   verify queryDeviceInfo throws 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testQueryDeviceInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(TAG, '----------------------testQueryDeviceInfo001---------------------------');
      try {
        queryDeviceInfo();
        expect(false).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
        expect(error.message).assertEqual(EMULATOR_NOT_SUPPORT_MESSAGE);
      }
      done();
    });

    /**
     * @tc.name   testQueryDriverInfo001
     * @tc.number SUB_Driver_Ext_Emulator_DeviceManager_0800
     * @tc.desc   verify queryDriverInfo throws 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testQueryDriverInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(TAG, '----------------------testQueryDriverInfo001---------------------------');
      try {
        queryDriverInfo();
        expect(false).assertTrue();
      } catch (err) {
        const error = err as BusinessError;
        expect(error.code).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
        expect(error.message).assertEqual(EMULATOR_NOT_SUPPORT_MESSAGE);
      }
      done();
    });
  })
}