/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import usbMgr from "@ohos.usbManager"
import { isFilteredDevice } from './FilterUtils';
import bundleManager from '@ohos.bundle.bundleManager'


export default function UsbSystemApiPermissionTest() {
  

  describe('UsbSystemApiPermissionTest', () => {

    const TAG: string = "[UsbSystemApiPermissionTest]";
    const SKIP_TAG: string = "[SKIP]";
    let rawDeviceList = usbMgr.getDevices();
    let deviceList: Array<usbMgr.USBDevice> = rawDeviceList ? rawDeviceList.filter(device => !isFilteredDevice(device.vendorId, device.productId)) : [];
    let isDeviceConnected: boolean = false;
    

    beforeAll(async () => {
      console.info(`${TAG} beforeAll start`);
      if (deviceList.length > 0) {
        isDeviceConnected = true;
      }
    })

    afterAll(() => {
      console.info(`${TAG} afterAll`);
    })
  

    /**
     * @tc.name   testSystemApiAddDeviceAccessRight
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0100
     * @tc.desc   addDeviceAccessRight as normal app should throw 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystemApiAddDeviceAccessRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSystemApiAddDeviceAccessRight, skip`);
        done();
        return;
      }
      try {
        let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        let bundleInfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        let tokenIdStr = bundleInfo.appInfo.accessTokenId.toString();
        usbMgr.addDeviceAccessRight(tokenIdStr, deviceList[0].name);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSystemApiAddDeviceAccessRight catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    });

    /**
     * @tc.name   testSystemApiGetFunctionsFromString
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0200
     * @tc.desc   getFunctionsFromString as normal app should throw 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystemApiGetFunctionsFromString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let strMaskCode = 'hdc';
      try {
        usbMgr.getFunctionsFromString(strMaskCode);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSystemApiGetFunctionsFromString catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    });

    /**
     * @tc.name   testSystemApiGetStringFromFunctions
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0300
     * @tc.desc   getStringFromFunctions as normal app should throw 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystemApiGetStringFromFunctions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let maskCode: number = 4; // 4 = USBFunctionType.HDC
      try {
        usbMgr.getStringFromFunctions(maskCode);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSystemApiGetStringFromFunctions catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    });

    /**
     * @tc.name   testSystemApiSetDeviceFunctions
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0400
     * @tc.desc   setDeviceFunctions as normal app should throw 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystemApiSetDeviceFunctions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let maskCode: number = 4; // 4 = USBFunctionType.HDC
      try {
        await usbMgr.setDeviceFunctions(maskCode);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSystemApiSetDeviceFunctions catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    });

    /**
     * @tc.name   testSystemApiGetDeviceFunctions
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0500
     * @tc.desc   getDeviceFunctions as normal app should throw 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystemApiGetDeviceFunctions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      try {
        usbMgr.getDeviceFunctions();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSystemApiGetDeviceFunctions catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    });

    /**
     * @tc.name   testSystemApiGetPortList
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0600
     * @tc.desc   getPortList as normal app should throw 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystemApiGetPortList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      try {
        usbMgr.getPortList();
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSystemApiGetPortList catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    });

    /**
     * @tc.name   testSystemApiGetPortSupportModes
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0700
     * @tc.desc   getPortSupportModes as normal app should throw 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystemApiGetPortSupportModes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let portId: number = 1;
      try {
        usbMgr.getPortSupportModes(portId);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSystemApiGetPortSupportModes catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    });

    /**
     * @tc.name   testSystemApiSetPortRoleTypes
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0800
     * @tc.desc   setPortRoleTypes as normal app should throw 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSystemApiSetPortRoleTypes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
      let portId: number = 1;
      let powerRole: number = 2; // 2 = PowerRoleType.SINK
      let dataRole: number = 2; // 2 = DataRoleType.DEVICE
      try {
        await usbMgr.setPortRoleTypes(portId, powerRole, dataRole);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${TAG} testSystemApiSetPortRoleTypes catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(202);
        done();
      }
    });

  })
}
