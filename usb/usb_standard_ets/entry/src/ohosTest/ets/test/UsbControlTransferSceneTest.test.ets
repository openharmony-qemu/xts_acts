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

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-dynamic';
import usbMgr from '@ohos.usbManager';
import { isFilteredDevice } from './FilterUtils';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';

const TAG: string = "[UsbControlTransferSceneTest]";
const SKIP_TAG: string = "[SKIP]";

function setupUsbDevice(testDevice: usbMgr.USBDevice): usbMgr.USBDevicePipe {
  let pipe = usbMgr.connectDevice(testDevice!);
  if (!pipe) {
    throw new Error('connectDevice returned undefined');
  }
  let targetInterface = testDevice!.configs?.[0]?.interfaces?.[0];
  usbMgr.claimInterface(pipe, targetInterface, true);
  return pipe;
}

function teardownUsbDevice(pipe: usbMgr.USBDevicePipe | undefined): void {
  if (pipe) {
    try {
      usbMgr.closePipe(pipe);
    } catch (error) {
      console.error(`${TAG} teardownUsbDevice catch err: ${JSON.stringify(error)}`);
    }
  }
}

function deviceConnected(deviceList: Array<Readonly<usbMgr.USBDevice>>) {
  if (deviceList.length > 0) {
    console.info(`${TAG} Test USB devices connected`);
    return true;
  }
  console.info(`${TAG} Test No USB devices connected`);
  return false;
}

async function clickAllowButton(): Promise<void> {
  console.info(`${TAG} clickAllowButton`);
  try {
    let driver: Driver = Driver.create();
    await driver.delayMs(1000);
    let buttons = await driver.findComponents(ON.text('允许', MatchPattern.EQUALS));
    if (!buttons || buttons.length === 0) {
      buttons = await driver.findComponents(ON.text('Allow', MatchPattern.EQUALS));
    }
    if (buttons && buttons.length > 0) {
      for (let i = 0; i < buttons.length; i++) {
        await buttons[i].click();
      }
    }
  } catch (error) {
    console.error(`${TAG} clickAllowButton catch err: ${JSON.stringify(error)}`);
  }
}

async function ensurePermission(deviceName: string): Promise<void> {
  if (!usbMgr.hasRight(deviceName)) {
    console.info(`${TAG} permission missing, requesting...`);
    const rightPromise = usbMgr.requestRight(deviceName);
    await clickAllowButton();
    await rightPromise;
  }
}


export default function UsbControlTransferSceneTest() {

  describe('UsbControlTransferSceneTest', () => {

    let isDeviceConnected: boolean = false;
    let testDevice: usbMgr.USBDevice;


    beforeAll(async () => {
      console.info(`${TAG} beforeAll start`);
      let rawList = usbMgr.getDevices();
      if (!rawList) {
        console.error(`${TAG} getDevices returned undefined`);
        return;
      }
      let deviceList: Array<usbMgr.USBDevice> =
        rawList.filter(device => !isFilteredDevice(device.vendorId, device.productId));
      if (!deviceList || deviceList.length === 0) {
        console.info(`${TAG} No USB devices connected`);
        return;
      }
      isDeviceConnected = deviceConnected(deviceList);
      if (isDeviceConnected) {
        testDevice = deviceList[0];
        await ensurePermission(testDevice!.name);
      }
    })

    afterAll(() => {
      console.info(`${TAG} afterAll`);
    })

    /**
     * @tc.name   testSceneConnectDeviceNoPermission
     * @tc.number SUB_USB_Spec_Sec_SysApiAuthen_0900
     * @tc.desc   connectDevice without permission should throw 14400001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSceneConnectDeviceNoPermission', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testSceneConnectDeviceNoPermission, skip`);
          done();
          return;
        }
        try {
          usbMgr.removeRight(testDevice!.name);
          usbMgr.connectDevice(testDevice!);
          expect().assertFail();
        } catch (error) {
          console.error(`${TAG} testSceneConnectDeviceNoPermission catch err: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(14400001);
        } finally {
          try {
            await ensurePermission(testDevice!.name);
          } catch (error) {
            console.error(`${TAG} testSceneConnectDeviceNoPermission restore permission err: ${JSON.stringify(error)}`);
          }
          done();
        }
      })

    /**
     * @tc.name   testSceneControlTransferGetStatus
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0100
     * @tc.desc   GET_STATUS USB request should return 2 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSceneControlTransferGetStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testSceneControlTransferGetStatus, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe: usbMgr.USBDevicePipe | undefined;
        try {
          pipe = setupUsbDevice(testDevice!);
          let param: usbMgr.USBDeviceRequestParams = {
            bmRequestType: 0x80,
            bRequest: 0x00, // GET_STATUS
            wValue: 0x0000,
            wIndex: 0x0000,
            wLength: 0x0002,
            data: new Uint8Array(2)
          };
          let transferredLength = await usbMgr.usbControlTransfer(pipe, param);
          console.info(`${TAG} GET_STATUS transferredLength: ${transferredLength}`);
          console.info(`${TAG} GET_STATUS data: [${param.data[0]}, ${param.data[1]}]`);
          expect(transferredLength).assertEqual(2);
        } catch (error) {
          console.error(`${TAG} testSceneControlTransferGetStatus catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownUsbDevice(pipe);
          done();
        }
      })

    /**
     * @tc.name   testSceneControlTransferSetFeature
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0200
     * @tc.desc   SET_FEATURE USB request should return 0 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSceneControlTransferSetFeature', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testSceneControlTransferSetFeature, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe: usbMgr.USBDevicePipe | undefined;
        try {
          pipe = setupUsbDevice(testDevice!);
          let targetInterface = testDevice!.configs?.[0]?.interfaces?.[0];
          if (targetInterface.endpoints.length > 0) {
            let param: usbMgr.USBDeviceRequestParams = {
              bmRequestType: 0x02,
              bRequest: 0x03, // SET_FEATURE
              wValue: 0x0000,
              wIndex: targetInterface.endpoints[0].address,
              wLength: 0x0000,
              data: new Uint8Array(0)
            };
            let transferredLength = await usbMgr.usbControlTransfer(pipe, param);
            console.info(`${TAG} SET_FEATURE transferredLength: ${transferredLength}`);
            expect(transferredLength).assertEqual(0);
          }
        } catch (error) {
          console.error(`${TAG} testSceneControlTransferSetFeature catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownUsbDevice(pipe);
          done();
        }
      })

    /**
     * @tc.name   testSceneControlTransferSetAndClearFeature
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0201
     * @tc.desc   SET_FEATURE then CLEAR_FEATURE should both return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSceneControlTransferSetAndClearFeature', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testSceneControlTransferSetAndClearFeature, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe: usbMgr.USBDevicePipe | undefined;
        try {
          pipe = setupUsbDevice(testDevice!);
          let targetInterface = testDevice!.configs?.[0]?.interfaces?.[0];
          if (targetInterface.endpoints.length > 0) {
            let setParam: usbMgr.USBDeviceRequestParams = {
              bmRequestType: 0x02,
              bRequest: 0x03, // SET_FEATURE
              wValue: 0x0000,
              wIndex: targetInterface.endpoints[0].address,
              wLength: 0x0000,
              data: new Uint8Array(0)
            };
            let clearParam: usbMgr.USBDeviceRequestParams = {
              bmRequestType: 0x02,
              bRequest: 0x01, // CLEAR_FEATURE
              wValue: 0x0000,
              wIndex: targetInterface.endpoints[0].address,
              wLength: 0x0000,
              data: new Uint8Array(0)
            };
            let setLength = await usbMgr.usbControlTransfer(pipe, setParam);
            console.info(`${TAG} SET_FEATURE transferredLength: ${setLength}`);
            expect(setLength).assertEqual(0);
            let clearLength = await usbMgr.usbControlTransfer(pipe, clearParam);
            console.info(`${TAG} CLEAR_FEATURE transferredLength: ${clearLength}`);
            expect(clearLength).assertEqual(0);
          }
        } catch (error) {
          console.error(`${TAG} testSceneControlTransferSetAndClearFeature catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownUsbDevice(pipe);
          done();
        }
      })


    /**
     * @tc.name   testSceneControlTransferClearFeature
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0300
     * @tc.desc   CLEAR_FEATURE USB request should return 0 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSceneControlTransferClearFeature', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testSceneControlTransferClearFeature, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe: usbMgr.USBDevicePipe | undefined;
        try {
          pipe = setupUsbDevice(testDevice!);
          let param: usbMgr.USBDeviceRequestParams = {
            bmRequestType: 0x02,
            bRequest: 0x01, // CLEAR_FEATURE
            wValue: 0x0000,
            wIndex: 0x0000,
            wLength: 0x0000,
            data: new Uint8Array(0)
          };
          let transferredLength = await usbMgr.usbControlTransfer(pipe, param);
          console.info(`${TAG} CLEAR_FEATURE transferredLength: ${transferredLength}`);
          expect(transferredLength).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} testSceneControlTransferClearFeature catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownUsbDevice(pipe);
          done();
        }
      })


    /**
     * @tc.name   testSceneControlTransferGetDescriptor
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0400
     * @tc.desc   GET_DESCRIPTOR (device descriptor) USB request should return 18 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSceneControlTransferGetDescriptor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testSceneControlTransferGetDescriptor, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe: usbMgr.USBDevicePipe | undefined;
        try {
          pipe = setupUsbDevice(testDevice!);
          let param: usbMgr.USBDeviceRequestParams = {
            bmRequestType: 0x80,
            bRequest: 0x06, // GET_DESCRIPTOR
            wValue: 0x0100, // DEVICE_DESCRIPTOR (type=1, index=0)
            wIndex: 0x0000,
            wLength: 18,
            data: new Uint8Array(18)
          };
          let transferredLength = await usbMgr.usbControlTransfer(pipe, param);
          console.info(`${TAG} GET_DESCRIPTOR transferredLength: ${transferredLength}`);
          console.info(
            `${TAG} GET_DESCRIPTOR data: [${param.data[0]}, ${param.data[1]}, ${param.data[2]}, ${param.data[3]}, ...]`);
          expect(transferredLength).assertEqual(18);
        } catch (error) {
          console.error(`${TAG} testSceneControlTransferGetDescriptor catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownUsbDevice(pipe);
          done();
        }
      })

    /**
     * @tc.name   testSceneControlTransferGetConfiguration
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0500
     * @tc.desc   GET_CONFIGURATION USB request should return 1 byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSceneControlTransferGetConfiguration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testSceneControlTransferGetConfiguration, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe: usbMgr.USBDevicePipe | undefined;
        try {
          pipe = setupUsbDevice(testDevice!);
          let param: usbMgr.USBDeviceRequestParams = {
            bmRequestType: 0x80,
            bRequest: 0x08, // GET_CONFIGURATION
            wValue: 0x0000,
            wIndex: 0x0000,
            wLength: 0x0001,
            data: new Uint8Array(1)
          };
          let transferredLength = await usbMgr.usbControlTransfer(pipe, param);
          console.info(`${TAG} GET_CONFIGURATION transferredLength: ${transferredLength}`);
          console.info(`${TAG} GET_CONFIGURATION data: [${param.data[0]}]`);
          expect(transferredLength).assertEqual(1);
        } catch (error) {
          console.error(`${TAG} testSceneControlTransferGetConfiguration catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownUsbDevice(pipe);
          done();
        }
      })

    /**
     * @tc.name   testSceneControlTransferGetInterface
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0600
     * @tc.desc   GET_INTERFACE USB request should return 1 byte
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSceneControlTransferGetInterface', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testSceneControlTransferGetInterface, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe: usbMgr.USBDevicePipe | undefined;
        try {
          pipe = setupUsbDevice(testDevice!);
          let param: usbMgr.USBDeviceRequestParams = {
            bmRequestType: 0x81, // IN, Standard, Interface
            bRequest: 0x0A, // GET_INTERFACE
            wValue: 0x0000, // 备用设置选择器(0=当前)
            wIndex: 0x0000, // 接口编号(0)
            wLength: 0x0001,
            data: new Uint8Array(1)
          };
          let transferredLength = await usbMgr.usbControlTransfer(pipe, param);
          console.info(`${TAG} GET_INTERFACE transferredLength: ${transferredLength}`);
          console.info(`${TAG} GET_INTERFACE data: [${param.data[0]}]`);
          expect(transferredLength).assertEqual(1);
        } catch (error) {
          console.error(`${TAG} testSceneControlTransferGetInterface catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownUsbDevice(pipe);
          done();
        }
      })

    /**
     * @tc.name   testSceneControlTransferSetConfiguration
     * @tc.number SUB_USB_Spec_Sec_USBRequest_0700
     * @tc.desc   SET_CONFIGURATION USB request should return 0 bytes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSceneControlTransferSetConfiguration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testSceneControlTransferSetConfiguration, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe: usbMgr.USBDevicePipe | undefined;
        try {
          pipe = setupUsbDevice(testDevice!);
          let param: usbMgr.USBDeviceRequestParams = {
            bmRequestType: 0x00, // OUT, Standard, Device
            bRequest: 0x09, // SET_CONFIGURATION
            wValue: 0x0000, // 配置值 0(设置设备为 Addressed 状态)
            wIndex: 0x0000,
            wLength: 0x0000,
            data: new Uint8Array(0)
          };
          let transferredLength = await usbMgr.usbControlTransfer(pipe, param);
          console.info(`${TAG} SET_CONFIGURATION transferredLength: ${transferredLength}`);
          expect(transferredLength).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} testSceneControlTransferSetConfiguration catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownUsbDevice(pipe);
          done();
        }
      })
  })
}

