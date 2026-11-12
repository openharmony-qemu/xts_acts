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

export default function usbDdkTest() {
  describe('usbDdkTest', () => {
    const TAG: string = "[usbDdkTest]";
    const EMULATOR_NOT_SUPPORT_CODE: number = 804;

    beforeAll(() => {
      console.info('usbDdkTest beforeAll called');
    })

    afterAll(() => {
      console.info('usbDdkTest afterAll called');
    })

    /**
     * @tc.name   testUsbInit001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_0100
     * @tc.desc   verify OH_Usb_Init returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbInit()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbRelease001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_0200
     * @tc.desc   verify OH_Usb_Release does not crash on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      emulatorDdk.usbRelease();
      done();
    });

    /**
     * @tc.name   testUsbReleaseResource001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_0300
     * @tc.desc   verify OH_Usb_ReleaseResource returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbReleaseResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbReleaseResource()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbGetDeviceDescriptor001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_0400
     * @tc.desc   verify OH_Usb_GetDeviceDescriptor returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbGetDeviceDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbGetDeviceDescriptor()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbGetConfigDescriptor001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_0500
     * @tc.desc   verify OH_Usb_GetConfigDescriptor returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbGetConfigDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbGetConfigDescriptor()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbFreeConfigDescriptor001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_0600
     * @tc.desc   verify OH_Usb_FreeConfigDescriptor does not crash on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbFreeConfigDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      emulatorDdk.usbFreeConfigDescriptor();
      done();
    });

    /**
     * @tc.name   testUsbClaimInterface001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_0700
     * @tc.desc   verify OH_Usb_ClaimInterface returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbClaimInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbClaimInterface()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbReleaseInterface001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_0800
     * @tc.desc   verify OH_Usb_ReleaseInterface returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbReleaseInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbReleaseInterface()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSelectInterfaceSetting001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_0900
     * @tc.desc   verify OH_Usb_SelectInterfaceSetting returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSelectInterfaceSetting001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSelectInterfaceSetting()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbGetCurrentInterfaceSetting001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1000
     * @tc.desc   verify OH_Usb_GetCurrentInterfaceSetting returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbGetCurrentInterfaceSetting001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbGetCurrentInterfaceSetting()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSendControlReadRequest001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1100
     * @tc.desc   verify OH_Usb_SendControlReadRequest returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSendControlReadRequest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSendControlReadRequest()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSendControlWriteRequest001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1200
     * @tc.desc   verify OH_Usb_SendControlWriteRequest returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSendControlWriteRequest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSendControlWriteRequest()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSendPipeRequest001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1300
     * @tc.desc   verify OH_Usb_SendPipeRequest returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSendPipeRequest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSendPipeRequest()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbSendPipeRequestWithAshmem001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1400
     * @tc.desc   verify OH_Usb_SendPipeRequestWithAshmem returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbSendPipeRequestWithAshmem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbSendPipeRequestWithAshmem()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbCreateDeviceMemMap001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1500
     * @tc.desc   verify OH_Usb_CreateDeviceMemMap returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbCreateDeviceMemMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbCreateDeviceMemMap()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbDestroyDeviceMemMap001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1600
     * @tc.desc   verify OH_Usb_DestroyDeviceMemMap does not crash on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbDestroyDeviceMemMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      emulatorDdk.usbDestroyDeviceMemMap();
      done();
    });

    /**
     * @tc.name   testUsbGetDevices001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1700
     * @tc.desc   verify OH_Usb_GetDevices returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbGetDevices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbGetDevices()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbControlTransfer001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1800
     * @tc.desc   verify OH_Usb_ControlTransfer returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbControlTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbControlTransfer()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testUsbGetNonRootHubs001
     * @tc.number SUB_Driver_Ext_Emulator_UsbDdk_1900
     * @tc.desc   verify OH_Usb_GetNonRootHubs returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testUsbGetNonRootHubs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.usbGetNonRootHubs()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });
  })
}