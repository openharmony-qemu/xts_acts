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

export default function scsiDdkTest() {
  describe('scsiDdkTest', () => {
    const TAG: string = "[scsiDdkTest]";
    const EMULATOR_NOT_SUPPORT_CODE: number = 804;

    beforeAll(() => {
      console.info('scsiDdkTest beforeAll called');
    })

    afterAll(() => {
      console.info('scsiDdkTest afterAll called');
    })

    /**
     * @tc.name   testScsiInit001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_0100
     * @tc.desc   verify OH_ScsiPeripheral_Init returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiInit()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiRelease001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_0200
     * @tc.desc   verify OH_ScsiPeripheral_Release returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiRelease()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiOpen001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_0300
     * @tc.desc   verify OH_ScsiPeripheral_Open returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiOpen()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiClose001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_0400
     * @tc.desc   verify OH_ScsiPeripheral_Close returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiClose()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiTestUnitReady001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_0500
     * @tc.desc   verify OH_ScsiPeripheral_TestUnitReady returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiTestUnitReady001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiTestUnitReady()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiInquiry001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_0600
     * @tc.desc   verify OH_ScsiPeripheral_Inquiry returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiInquiry001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiInquiry()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiReadCapacity10001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_0700
     * @tc.desc   verify OH_ScsiPeripheral_ReadCapacity10 returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiReadCapacity10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiReadCapacity10()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiRequestSense001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_0800
     * @tc.desc   verify OH_ScsiPeripheral_RequestSense returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiRequestSense001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiRequestSense()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiRead10001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_0900
     * @tc.desc   verify OH_ScsiPeripheral_Read10 returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiRead10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiRead10()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiWrite10001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_1000
     * @tc.desc   verify OH_ScsiPeripheral_Write10 returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiWrite10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiWrite10()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiVerify10001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_1100
     * @tc.desc   verify OH_ScsiPeripheral_Verify10 returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiVerify10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiVerify10()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiSendRequestByCdb001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_1200
     * @tc.desc   verify OH_ScsiPeripheral_SendRequestByCdb returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiSendRequestByCdb001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiSendRequestByCdb()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiCreateDeviceMemMap001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_1300
     * @tc.desc   verify OH_ScsiPeripheral_CreateDeviceMemMap returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiCreateDeviceMemMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiCreateDeviceMemMap()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiDestroyDeviceMemMap001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_1400
     * @tc.desc   verify OH_ScsiPeripheral_DestroyDeviceMemMap returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiDestroyDeviceMemMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiDestroyDeviceMemMap()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testScsiParseBasicSenseInfo001
     * @tc.number SUB_Driver_Ext_Emulator_ScsiDdk_1500
     * @tc.desc   verify OH_ScsiPeripheral_ParseBasicSenseInfo returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testScsiParseBasicSenseInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.scsiParseBasicSenseInfo()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });
  })
}