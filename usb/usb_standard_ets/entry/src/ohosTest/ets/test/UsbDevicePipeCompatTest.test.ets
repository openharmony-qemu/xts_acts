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

import usbMgr from '@ohos.usbManager';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { isFilteredDevice } from './FilterUtils';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

let deviceList: Array<usbMgr.USBDevice>;
let testDevice: usbMgr.USBDevice | null = null;
let isDeviceConnected: boolean = false;
const TAG: string = "[UsbDevicePipeCompatTest]";
const SKIP_TAG: string = "[SKIP]";

interface TransferTestParam {
  config: usbMgr.USBConfiguration;
  device: usbMgr.USBDevice;
  pipe: usbMgr.USBDevicePipe;
  inEndpoint: usbMgr.USBEndpoint;
  targetInterface: usbMgr.USBInterface;
  outEndpoint: usbMgr.USBEndpoint;
  sendData: string;
  isClaimed: number;
  maxInSize: number;
  maxOutSize: number;
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

function ab2str(buf: Uint8Array): string {
  let result: string = '';
  let arr: Uint8Array = new Uint8Array(buf);
  for (let i = 0; i < arr.length; i++) {
    result += String.fromCharCode(arr[i]);
  }
  return result;
}

function str2ab(str: string): Uint8Array {
  let arr: number[] = [];
  for (let i = 0; i < str.length; i++) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

function deviceConnected(list: Array<usbMgr.USBDevice>): boolean {
  if (list.length > 0) {
    console.info(`${TAG} Test USB device is connected`);
    return true;
  }
  console.info(`${TAG} Test USB device is not connected`);
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

async function requestUsbRight(deviceName: string): Promise<void> {
  console.info(`${TAG} requestUsbRight start`);
  const rightPromise = usbMgr.requestRight(deviceName);
  await clickAllowButton();
  try {
    let hasRight = await rightPromise;
    console.info(`${TAG} requestRight success, hasRight: ${hasRight}`);
  } catch (error) {
    console.error(`${TAG} requestRight fail: ${JSON.stringify(error)}`);
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

function findBulkEndpoints(param: TransferTestParam): void {
  for (let i = 0; i < param.config.interfaces.length; i++) {
    let iface = param.config.interfaces[i];
    if (iface.endpoints.length === 0) {
      continue;
    }
    if (iface.clazz !== 10 || iface.subClass !== 0 || iface.protocol !== 2) {
      continue;
    }

    for (let j = 0; j < iface.endpoints.length; j++) {
      let endpoint = iface.endpoints[j];
      if (endpoint.type !== usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK) {
        continue;
      }
      if (endpoint.direction === usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) {
        param.maxOutSize = endpoint.maxPacketSize;
        param.outEndpoint = endpoint;
      } else if (endpoint.direction === usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) {
        param.maxInSize = endpoint.maxPacketSize;
        param.inEndpoint = endpoint;
      }
    }
    if (param.inEndpoint || param.outEndpoint) {
      param.targetInterface = iface;
      break;
    }
  }
}

function getTransferTestParam(localPipe: usbMgr.USBDevicePipe): TransferTestParam {
  let param: TransferTestParam = {
    config: deviceList[0].configs[0],
    device: deviceList[0],
    pipe: localPipe,
    inEndpoint: deviceList[0].configs[0].interfaces[0].endpoints[0],
    targetInterface: deviceList[0].configs[0].interfaces[0],
    outEndpoint: deviceList[0].configs[0].interfaces[0].endpoints[0],
    sendData: '',
    isClaimed: 0,
    maxInSize: 1024,
    maxOutSize: 1024,
  };
  findBulkEndpoints(param);
  return param;
}

/* usb device pipe compatibility test */
export default function UsbDevicePipeCompatTest() {
  describe('UsbDevicePipeCompatTest', () => {

    beforeAll(async () => {
      console.info(`${TAG} beforeAll start`);
      let rawList = usbMgr.getDevices();
      if (!rawList) {
        console.error(`${TAG} getDevices returned undefined`);
        return;
      }
      deviceList = rawList.filter(device => !isFilteredDevice(device.vendorId, device.productId));
      isDeviceConnected = deviceConnected(deviceList);
      if (isDeviceConnected) {
        testDevice = deviceList[0];
        await ensurePermission(testDevice!.name);
      }
    })

    beforeEach(() => {
      console.info(`${TAG} beforeEach`);
    })

    afterEach(() => {
      console.info(`${TAG} afterEach`);
    })

    afterAll(() => {
      console.info(`${TAG} afterAll`);
    })

    /**
     * @tc.name   testBulkTransfer006
     * @tc.number SUB_USB_HostManager_TranCompatibility_0700
     * @tc.desc   bulk transfer with invalid outEndpoint.address=123 should return -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testBulkTransfer006 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer006, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      let testParam = getTransferTestParam(localPipe);
      if (!testParam.targetInterface || !testParam.outEndpoint) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer006, bulk endpoint not found, skip`);
        done();
        return;
      }
      testParam.isClaimed = usbMgr.claimInterface(localPipe, testParam.targetInterface, true);
      console.info(`${TAG} claimInterface result: ${testParam.isClaimed}`);
      expect(testParam.isClaimed).assertEqual(0);
      testParam.sendData = 'send time 13213213 wzy 03';
      let tmpUint8Array = str2ab(testParam.sendData);
      let fakeEndpoint: usbMgr.USBEndpoint = JSON.parse(JSON.stringify(testParam.outEndpoint));
      fakeEndpoint.address = 123;
      try {
        let data = await usbMgr.bulkTransfer(localPipe, fakeEndpoint, tmpUint8Array, 5000);
        console.info(`${TAG} bulkTransfer result: ${data}`);
        console.info(`${TAG} send data: ${ab2str(tmpUint8Array)}`);
        expect(data).assertEqual(-1);
      } catch (error) {
        console.error(`${TAG} testBulkTransfer006 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        usbMgr.releaseInterface(localPipe, testParam.targetInterface);
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testBulkTransfer007
     * @tc.number SUB_USB_HostManager_TranCompatibility_0800
     * @tc.desc   bulk transfer with invalid outEndpoint.number=123 should return data > 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testBulkTransfer007 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer007, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      let testParam = getTransferTestParam(localPipe);
      if (!testParam.targetInterface || !testParam.outEndpoint) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer007, bulk endpoint not found, skip`);
        done();
        return;
      }
      testParam.isClaimed = usbMgr.claimInterface(localPipe, testParam.targetInterface, true);
      console.info(`${TAG} claimInterface result: ${testParam.isClaimed}`);
      expect(testParam.isClaimed).assertEqual(0);
      testParam.sendData = 'send time 13213213 wzy 04';
      let tmpUint8Array = str2ab(testParam.sendData);
      let fakeEndpoint: usbMgr.USBEndpoint = JSON.parse(JSON.stringify(testParam.outEndpoint));
      fakeEndpoint.number = 123;
      try {
        let data = await usbMgr.bulkTransfer(localPipe, fakeEndpoint, tmpUint8Array, 5000);
        console.info(`${TAG} bulkTransfer result: ${data}`);
        console.info(`${TAG} send data: ${ab2str(tmpUint8Array)}`);
        expect(data).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testBulkTransfer007 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        usbMgr.releaseInterface(localPipe, testParam.targetInterface);
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testBulkTransfer008
     * @tc.number SUB_USB_HostManager_TranCompatibility_0900
     * @tc.desc   bulk transfer with invalid outEndpoint.type=123 should return -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testBulkTransfer008 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer008, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      let testParam = getTransferTestParam(localPipe);
      if (!testParam.targetInterface || !testParam.outEndpoint) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer008, bulk endpoint not found, skip`);
        done();
        return;
      }
      testParam.isClaimed = usbMgr.claimInterface(localPipe, testParam.targetInterface, true);
      console.info(`${TAG} claimInterface result: ${testParam.isClaimed}`);
      expect(testParam.isClaimed).assertEqual(0);
      testParam.sendData = 'send time 13213213 wzy 05';
      let tmpUint8Array = str2ab(testParam.sendData);
      let fakeEndpoint: usbMgr.USBEndpoint = JSON.parse(JSON.stringify(testParam.outEndpoint));
      fakeEndpoint.type = 123;
      try {
        let data = await usbMgr.bulkTransfer(localPipe, fakeEndpoint, tmpUint8Array, 5000);
        console.info(`${TAG} bulkTransfer result: ${data}`);
        console.info(`${TAG} send data: ${ab2str(tmpUint8Array)}`);
        expect(data).assertLargerOrEqual(0);
      } catch (error) {
        console.error(`${TAG} testBulkTransfer008 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        usbMgr.releaseInterface(localPipe, testParam.targetInterface);
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testClaimInterface006
     * @tc.number SUB_USB_HostManager_Compatibility_2400
     * @tc.desc   claimInterface with invalid interface.id=123 should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClaimInterface006 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClaimInterface006, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(deviceList[0].configs[j].interfaces[k]));
            fakeInterface.id = 123;
            let isClaim = usbMgr.claimInterface(localPipe, fakeInterface, true);
            console.info(`${TAG} claimInterface result: ${isClaim}`);
            expect(isClaim).assertEqual(-1);
          }
        }
      } catch (error) {
        console.error(`${TAG} testClaimInterface006 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testClaimInterface007
     * @tc.number SUB_USB_HostManager_Compatibility_2500
     * @tc.desc   claimInterface with invalid interface.protocol=120 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClaimInterface007 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClaimInterface007, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(deviceList[0].configs[j].interfaces[k]));
            fakeInterface.protocol = 120;
            let isClaim = usbMgr.claimInterface(localPipe, fakeInterface, true);
            console.info(`${TAG} claimInterface result: ${isClaim}`);
            expect(isClaim).assertEqual(0);
            usbMgr.releaseInterface(localPipe, fakeInterface);
          }
        }
      } catch (error) {
        console.error(`${TAG} testClaimInterface007 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testClaimInterface008
     * @tc.number SUB_USB_HostManager_Compatibility_2600
     * @tc.desc   claimInterface with invalid interface.clazz=784 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClaimInterface008 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClaimInterface008, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(deviceList[0].configs[j].interfaces[k]));
            fakeInterface.clazz = 784;
            let isClaim = usbMgr.claimInterface(localPipe, fakeInterface, true);
            console.info(`${TAG} claimInterface result: ${isClaim}`);
            expect(isClaim).assertEqual(0);
            usbMgr.releaseInterface(localPipe, fakeInterface);
          }
        }
      } catch (error) {
        console.error(`${TAG} testClaimInterface008 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testClaimInterface009
     * @tc.number SUB_USB_HostManager_Compatibility_2700
     * @tc.desc   claimInterface with invalid interface.name='123sdf' should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClaimInterface009 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClaimInterface009, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(deviceList[0].configs[j].interfaces[k]));
            fakeInterface.name = '123sdf';
            let isClaim = usbMgr.claimInterface(localPipe, fakeInterface, true);
            console.info(`${TAG} claimInterface result: ${isClaim}`);
            expect(isClaim).assertEqual(0);
            usbMgr.releaseInterface(localPipe, fakeInterface);
          }
        }
      } catch (error) {
        console.error(`${TAG} testClaimInterface009 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testClaimInterface010
     * @tc.number SUB_USB_HostManager_Compatibility_2800
     * @tc.desc   claimInterface with invalid interface.subClass=1210 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClaimInterface010 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClaimInterface010, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(deviceList[0].configs[j].interfaces[k]));
            fakeInterface.subClass = 1210;
            let isClaim = usbMgr.claimInterface(localPipe, fakeInterface, true);
            console.info(`${TAG} claimInterface result: ${isClaim}`);
            expect(isClaim).assertEqual(0);
            usbMgr.releaseInterface(localPipe, fakeInterface);
          }
        }
      } catch (error) {
        console.error(`${TAG} testClaimInterface010 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterface001
     * @tc.number SUB_USB_HostManager_Compatibility_1600
     * @tc.desc   releaseInterface with invalid id=134 should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testReleaseInterface001testReleaseInterface001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testReleaseInterface001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let targetInterface = deviceList[0].configs[j].interfaces[k];
            let isClaimed = usbMgr.claimInterface(localPipe, targetInterface, true);
            expect(isClaimed).assertEqual(0);
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(targetInterface));
            fakeInterface.id = 134;
            let isRelease = usbMgr.releaseInterface(localPipe, fakeInterface);
            console.info(`${TAG} releaseInterface result: ${isRelease}`);
            expect(isRelease).assertEqual(-1);
            usbMgr.releaseInterface(localPipe, targetInterface);
          }
        }
      } catch (error) {
        console.error(`${TAG} testReleaseInterface001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterface002
     * @tc.number SUB_USB_HostManager_Compatibility_1700
     * @tc.desc   releaseInterface with invalid name='134wer' should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testReleaseInterface002 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testReleaseInterface002, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let targetInterface = deviceList[0].configs[j].interfaces[k];
            let isClaimed = usbMgr.claimInterface(localPipe, targetInterface, true);
            expect(isClaimed).assertEqual(0);
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(targetInterface));
            fakeInterface.name = '134wer';
            let isRelease = usbMgr.releaseInterface(localPipe, fakeInterface);
            console.info(`${TAG} releaseInterface result: ${isRelease}`);
            expect(isRelease).assertEqual(0);
          }
        }
      } catch (error) {
        console.error(`${TAG} testReleaseInterface002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterface003
     * @tc.number SUB_USB_HostManager_Compatibility_1800
     * @tc.desc   releaseInterface with invalid clazz=78 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testReleaseInterface003 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testReleaseInterface003, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let targetInterface = deviceList[0].configs[j].interfaces[k];
            let isClaimed = usbMgr.claimInterface(localPipe, targetInterface, true);
            expect(isClaimed).assertEqual(0);
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(targetInterface));
            fakeInterface.clazz = 78;
            let isRelease = usbMgr.releaseInterface(localPipe, fakeInterface);
            console.info(`${TAG} releaseInterface result: ${isRelease}`);
            expect(isRelease).assertEqual(0);
          }
        }
      } catch (error) {
        console.error(`${TAG} testReleaseInterface003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterface004
     * @tc.number SUB_USB_HostManager_Compatibility_1900
     * @tc.desc   releaseInterface with invalid protocol=124 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testReleaseInterface004 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testReleaseInterface004, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let targetInterface = deviceList[0].configs[j].interfaces[k];
            let isClaimed = usbMgr.claimInterface(localPipe, targetInterface, true);
            expect(isClaimed).assertEqual(0);
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(targetInterface));
            fakeInterface.protocol = 124;
            let isRelease = usbMgr.releaseInterface(localPipe, fakeInterface);
            console.info(`${TAG} releaseInterface result: ${isRelease}`);
            expect(isRelease).assertEqual(0);
          }
        }
      } catch (error) {
        console.error(`${TAG} testReleaseInterface004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testReleaseInterface005
     * @tc.number SUB_USB_HostManager_Compatibility_2000
     * @tc.desc   releaseInterface with invalid subClass=784 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReleaseInterface005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testReleaseInterface005 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testReleaseInterface005, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let targetInterface = deviceList[0].configs[j].interfaces[k];
            let isClaimed = usbMgr.claimInterface(localPipe, targetInterface, true);
            expect(isClaimed).assertEqual(0);
            let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(targetInterface));
            fakeInterface.subClass = 784;
            let isRelease = usbMgr.releaseInterface(localPipe, fakeInterface);
            console.info(`${TAG} releaseInterface result: ${isRelease}`);
            expect(isRelease).assertEqual(0);
          }
        }
      } catch (error) {
        console.error(`${TAG} testReleaseInterface005 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetInterface003
     * @tc.number SUB_USB_HostManager_Compatibility_4200
     * @tc.desc   setInterface with invalid protocol=482 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetInterface003 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetInterface003, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let targetInterface = deviceList[0].configs[j].interfaces[0];
          let isClaimed = usbMgr.claimInterface(localPipe, targetInterface, true);
          expect(isClaimed).assertEqual(0);
          let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(targetInterface));
          fakeInterface.protocol = 482;
          let ret = usbMgr.setInterface(localPipe, fakeInterface);
          console.info(`${TAG} setInterface result: ${ret}`);
          expect(ret).assertEqual(0);
          usbMgr.releaseInterface(localPipe, targetInterface);
        }
      } catch (error) {
        console.error(`${TAG} testSetInterface003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetInterface004
     * @tc.number SUB_USB_HostManager_Compatibility_4300
     * @tc.desc   setInterface with invalid clazz=482 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetInterface004 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetInterface004, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let targetInterface = deviceList[0].configs[j].interfaces[0];
          let isClaimed = usbMgr.claimInterface(localPipe, targetInterface, true);
          expect(isClaimed).assertEqual(0);
          let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(targetInterface));
          fakeInterface.clazz = 482;
          let ret = usbMgr.setInterface(localPipe, fakeInterface);
          console.info(`${TAG} setInterface result: ${ret}`);
          expect(ret).assertEqual(0);
          usbMgr.releaseInterface(localPipe, targetInterface);
        }
      } catch (error) {
        console.error(`${TAG} testSetInterface004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetInterface005
     * @tc.number SUB_USB_HostManager_Compatibility_4400
     * @tc.desc   setInterface with invalid subClass=482 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetInterface005 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetInterface005, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let targetInterface = deviceList[0].configs[j].interfaces[0];
          let isClaimed = usbMgr.claimInterface(localPipe, targetInterface, true);
          expect(isClaimed).assertEqual(0);
          let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(targetInterface));
          fakeInterface.subClass = 482;
          let ret = usbMgr.setInterface(localPipe, fakeInterface);
          console.info(`${TAG} setInterface result: ${ret}`);
          expect(ret).assertEqual(0);
          usbMgr.releaseInterface(localPipe, targetInterface);
        }
      } catch (error) {
        console.error(`${TAG} testSetInterface005 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetInterface006
     * @tc.number SUB_USB_HostManager_Compatibility_4500
     * @tc.desc   setInterface with invalid name='wer32' should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetInterface006 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetInterface006, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let targetInterface = deviceList[0].configs[j].interfaces[0];
          let isClaimed = usbMgr.claimInterface(localPipe, targetInterface, true);
          expect(isClaimed).assertEqual(0);
          let fakeInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(targetInterface));
          fakeInterface.name = 'wer32';
          let ret = usbMgr.setInterface(localPipe, fakeInterface);
          console.info(`${TAG} setInterface result: ${ret}`);
          expect(ret).assertEqual(0);
          usbMgr.releaseInterface(localPipe, targetInterface);
        }
      } catch (error) {
        console.error(`${TAG} testSetInterface006 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetConfiguration003
     * @tc.number SUB_USB_HostManager_Compatibility_3700
     * @tc.desc   setConfiguration with invalid name='asdfsd' should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetConfiguration003 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetConfiguration003, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      let originalConfig: usbMgr.USBConfiguration | null = null;
      try {
        originalConfig = JSON.parse(JSON.stringify(deviceList[0].configs[0]));
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let config: usbMgr.USBConfiguration = JSON.parse(JSON.stringify(deviceList[0].configs[j]));
          config.name = 'asdfsd';
          let ret = usbMgr.setConfiguration(localPipe, config);
          console.info(`${TAG} setConfiguration result: ${ret}`);
          expect(ret).assertEqual(0);
        }
      } catch (error) {
        console.error(`${TAG} testSetConfiguration003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe && originalConfig) {
          try {
            usbMgr.setConfiguration(localPipe, originalConfig);
          } catch (e) {
            console.error(`${TAG} testSetConfiguration003 restore config err: ${JSON.stringify(e)}`);
          }
        }
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetConfiguration004
     * @tc.number SUB_USB_HostManager_Compatibility_3800
     * @tc.desc   setConfiguration with invalid id=154 should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetConfiguration004 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetConfiguration004, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let config: usbMgr.USBConfiguration = JSON.parse(JSON.stringify(deviceList[0].configs[j]));
          config.name = 'asdfsd';
          config.id = 154;
          let ret = usbMgr.setConfiguration(localPipe, config);
          console.info(`${TAG} setConfiguration result: ${ret}`);
          expect(ret).assertLess(0);
        }
      } catch (error) {
        console.error(`${TAG} testSetConfiguration004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetConfiguration005
     * @tc.number SUB_USB_HostManager_Compatibility_3900
     * @tc.desc   setConfiguration with invalid attributes=154 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetConfiguration005 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetConfiguration005, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      let originalConfig: usbMgr.USBConfiguration | null = null;
      try {
        originalConfig = JSON.parse(JSON.stringify(deviceList[0].configs[0]));
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let config: usbMgr.USBConfiguration = JSON.parse(JSON.stringify(deviceList[0].configs[j]));
          config.attributes = 154;
          let ret = usbMgr.setConfiguration(localPipe, config);
          console.info(`${TAG} setConfiguration result: ${ret}`);
          expect(ret).assertEqual(0);
        }
      } catch (error) {
        console.error(`${TAG} testSetConfiguration005 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe && originalConfig) {
          try {
            usbMgr.setConfiguration(localPipe, originalConfig);
          } catch (e) {
            console.error(`${TAG} testSetConfiguration005 restore config err: ${JSON.stringify(e)}`);
          }
        }
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetConfiguration006
     * @tc.number SUB_USB_HostManager_Compatibility_4000
     * @tc.desc   setConfiguration with invalid interval=0 should return 0 (tolerance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetConfiguration006 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetConfiguration006, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      let originalConfig: usbMgr.USBConfiguration | null = null;
      try {
        originalConfig = JSON.parse(JSON.stringify(deviceList[0].configs[0]));
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let config: usbMgr.USBConfiguration = JSON.parse(JSON.stringify(deviceList[0].configs[j]));
          config.name = 'asdfsd';
          config.interfaces[0].endpoints[0].interval = 0;
          let ret = usbMgr.setConfiguration(localPipe, config);
          console.info(`${TAG} setConfiguration result: ${ret}`);
          expect(ret).assertEqual(0);
        }
      } catch (error) {
        console.error(`${TAG} testSetConfiguration006 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe && originalConfig) {
          try {
            usbMgr.setConfiguration(localPipe, originalConfig);
          } catch (e) {
            console.error(`${TAG} testSetConfiguration006 restore config err: ${JSON.stringify(e)}`);
          }
        }
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })
  })
}
