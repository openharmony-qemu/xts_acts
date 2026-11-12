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

export default function hidDdkTest() {
  describe('hidDdkTest', () => {
    const TAG: string = "[hidDdkTest]";
    const EMULATOR_NOT_SUPPORT_CODE: number = 804;

    beforeAll(() => {
      console.info('hidDdkTest beforeAll called');
    })

    afterAll(() => {
      console.info('hidDdkTest afterAll called');
    })

    /**
     * @tc.name   testHidCreateDevice001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_0100
     * @tc.desc   verify OH_Hid_CreateDevice returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidCreateDevice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidCreateDevice()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidEmitEvent001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_0200
     * @tc.desc   verify OH_Hid_EmitEvent returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidEmitEvent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidEmitEvent()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidDestroyDevice001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_0300
     * @tc.desc   verify OH_Hid_DestroyDevice returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidDestroyDevice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidDestroyDevice()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidInit001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_0400
     * @tc.desc   verify OH_Hid_Init returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidInit()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidRelease001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_0500
     * @tc.desc   verify OH_Hid_Release returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidRelease()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidOpen001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_0600
     * @tc.desc   verify OH_Hid_Open returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidOpen()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidClose001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_0700
     * @tc.desc   verify OH_Hid_Close returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidClose()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidWrite001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_0800
     * @tc.desc   verify OH_Hid_Write returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidWrite()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidReadTimeout001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_0900
     * @tc.desc   verify OH_Hid_ReadTimeout returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidReadTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidReadTimeout()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidRead001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_1000
     * @tc.desc   verify OH_Hid_Read returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidRead()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidSetNonBlocking001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_1100
     * @tc.desc   verify OH_Hid_SetNonBlocking returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidSetNonBlocking001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidSetNonBlocking()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidGetRawInfo001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_1200
     * @tc.desc   verify OH_Hid_GetRawInfo returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidGetRawInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidGetRawInfo()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidGetRawName001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_1300
     * @tc.desc   verify OH_Hid_GetRawName returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidGetRawName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidGetRawName()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidGetPhysicalAddress001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_1400
     * @tc.desc   verify OH_Hid_GetPhysicalAddress returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidGetPhysicalAddress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidGetPhysicalAddress()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidGetRawUniqueId001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_1500
     * @tc.desc   verify OH_Hid_GetRawUniqueId returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidGetRawUniqueId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidGetRawUniqueId()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidSendReport001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_1600
     * @tc.desc   verify OH_Hid_SendReport returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidSendReport001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidSendReport()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidGetReport001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_1700
     * @tc.desc   verify OH_Hid_GetReport returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidGetReport001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidGetReport()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });

    /**
     * @tc.name   testHidGetReportDescriptor001
     * @tc.number SUB_Driver_Ext_Emulator_HidDdk_1800
     * @tc.desc   verify OH_Hid_GetReportDescriptor returns 804 on emulator
     * @tc.type   FUNCTION
     */
    it('testHidGetReportDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      expect(emulatorDdk.hidGetReportDescriptor()).assertEqual(EMULATOR_NOT_SUPPORT_CODE);
      done();
    });
  })
}