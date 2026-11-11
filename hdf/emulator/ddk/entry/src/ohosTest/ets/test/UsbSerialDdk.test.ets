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
import emulatorDdk from 'libemulatorddk.so'

export default function usbSerialDdkTest() {
  describe('usbSerialDdkTest', () => {
    const TAG: string = "[usbSerialDdkTest]";
    const EMULATOR_NOT_SUPPORT_CODE: number = 804;

    beforeAll(() => {
      console.info('usbSerialDdkTest beforeAll called');
    })

    afterAll(() => {
      console.info('usbSerialDdkTest afterAll called');
    })

    /**
     * @tc.name   testUsbSerialInit001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_0100
     * @tc.desc   verify OH_UsbSerial_Init returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialInit()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialRelease001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_0200
     * @tc.desc   verify OH_UsbSerial_Release returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialRelease()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialOpen001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_0300
     * @tc.desc   verify OH_UsbSerial_Open returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialOpen()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialClose001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_0400
     * @tc.desc   verify OH_UsbSerial_Close returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialClose()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialRead001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_0500
     * @tc.desc   verify OH_UsbSerial_Read returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialRead()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialWrite001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_0600
     * @tc.desc   verify OH_UsbSerial_Write returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialWrite()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialSetBaudRate001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_0700
     * @tc.desc   verify OH_UsbSerial_SetBaudRate returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialSetBaudRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialSetBaudRate()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialSetParams001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_0800
     * @tc.desc   verify OH_UsbSerial_SetParams returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialSetParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialSetParams()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialSetTimeout001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_0900
     * @tc.desc   verify OH_UsbSerial_SetTimeout returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialSetTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialSetTimeout()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialSetFlowControl001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_1000
     * @tc.desc   verify OH_UsbSerial_SetFlowControl returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialSetFlowControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialSetFlowControl()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialFlush001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_1100
     * @tc.desc   verify OH_UsbSerial_Flush returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialFlush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialFlush()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialFlushInput001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_1200
     * @tc.desc   verify OH_UsbSerial_FlushInput returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialFlushInput001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialFlushInput()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSerialFlushOutput001
     * @tc.number SUB_Driver_Ext_Emulator_UsbSerialDdk_1300
     * @tc.desc   verify OH_UsbSerial_FlushOutput returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSerialFlushOutput001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSerialFlushOutput()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });
  })
}