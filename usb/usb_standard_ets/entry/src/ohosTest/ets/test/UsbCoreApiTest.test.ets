/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
let pipe: usbMgr.USBDevicePipe | null = null;
let testDevice: usbMgr.USBDevice | null = null;
let isDeviceConnected: boolean = false;
const TAG: string = "[UsbCoreApiTest]";
const SKIP_TAG: string = "[SKIP]";

function deviceConnected(list: Array<usbMgr.USBDevice>): boolean {
  if (list.length > 0) {
    console.info(`${TAG} Test USB device is connected`);
    return true;
  }
  console.info(`${TAG} Test USB device is not connected`);
  return false;
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
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

function setupDevicePipe(device: usbMgr.USBDevice): usbMgr.USBDevicePipe {
  let pipe = usbMgr.connectDevice(device);
  if (!pipe) {
    throw new Error('connectDevice returned undefined');
  }
  return pipe;
}

function teardownDevicePipe(pipe: usbMgr.USBDevicePipe | null): void {
  if (pipe) {
    try {
      usbMgr.closePipe(pipe);
    } catch (error) {
      console.error(`${TAG} teardownDevicePipe catch err: ${JSON.stringify(error)}`);
    }
  }
}

/* usb core functions test */
export default function UsbCoreApiTest() {
  describe('UsbCoreApiTest', () => {

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
      pipe = null;
    })

    afterAll(() => {
      console.info(`${TAG} afterAll`);
    })

    /**
     * @tc.name   testGetDevices001
     * @tc.number SUB_USB_HostManager_Func_0500
     * @tc.desc   getDevices should return non-empty list when device connected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDevices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testGetDevices001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testGetDevices001, skip`);
        return;
      }
      let list = usbMgr.getDevices().filter(device => !isFilteredDevice(device.vendorId, device.productId));
      console.info(`${TAG} getDevices length: ${list.length}`);
      expect(list.length).assertLarger(0);
    })

    /**
     * @tc.name   testGetDevices002
     * @tc.number SUB_USB_HostManager_RetValue_0100
     * @tc.desc   getDevices should return empty list when no device connected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDevices002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testGetDevices002 start`);
      if (isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testGetDevices002, device connected, skip`);
        return;
      }
      let res = usbMgr.getDevices();
      console.info(`${TAG} getDevices length: ${res.length}`);
      expect(res.length).assertEqual(0);
    })

    /**
     * @tc.name   testHasRight001
     * @tc.number SUB_USB_HostManager_Func_0900
     * @tc.desc   hasRight should return true after permission granted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testHasRight001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testHasRight001, skip`);
        return;
      }
      let hasRight = usbMgr.hasRight(testDevice!.name);
      console.info(`${TAG} hasRight: ${hasRight}`);
      expect(hasRight).assertTrue();
    })

    /**
     * @tc.name   testRequestRight001
     * @tc.number SUB_USB_HostManager_Func_0800
     * @tc.desc   requestRight should return true after clicking allow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testRequestRight001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testRequestRight001, skip`);
        done();
        return;
      }
      try {
        const rightPromise = usbMgr.requestRight(testDevice!.name);
        await clickAllowButton();
        let hasRight = await rightPromise;
        console.info(`${TAG} requestRight result: ${hasRight}`);
        expect(hasRight).assertTrue();
        done();
      } catch (error) {
        console.error(`${TAG} testRequestRight001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRemoveRight001
     * @tc.number SUB_USB_HostManager_Func_1200
     * @tc.desc   removeRight should return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRemoveRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testRemoveRight001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testRemoveRight001, skip`);
        done();
        return;
      }
      try {
        let remRight = usbMgr.removeRight(testDevice!.name);
        console.info(`${TAG} removeRight result: ${remRight}`);
        expect(remRight).assertTrue();
      } catch (error) {
        console.error(`${TAG} testRemoveRight001 catch err: ${JSON.stringify(error)}`);
      } finally {
        await ensurePermission(testDevice!.name);
        done();
      }
    })

    /**
     * @tc.name   testConnectDevice001
     * @tc.number SUB_USB_HostManager_Func_0100
     * @tc.desc   connectDevice should return pipe with valid busNum and devAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDevice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testConnectDevice001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testConnectDevice001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
        expect(pipe.busNum).assertLarger(0);
        expect(pipe.devAddress).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testConnectDevice001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testClosePipe001
     * @tc.number SUB_USB_HostManager_Func_0300
     * @tc.desc   closePipe should return 0 after connectDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClosePipe001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClosePipe001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        let ret = usbMgr.closePipe(pipe);
        console.info(`${TAG} closePipe result: ${ret}`);
        expect(ret).assertEqual(0);
        pipe = null;
      } catch (error) {
        console.error(`${TAG} testClosePipe001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testClosePipe002
     * @tc.number SUB_USB_HostManager_Compatibility_1300
     * @tc.desc   closePipe with invalid busNum should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClosePipe002 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClosePipe002, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        let tmpPipe: usbMgr.USBDevicePipe = JSON.parse(JSON.stringify(pipe));
        tmpPipe.busNum = -23;
        console.info(`${TAG} tmpPipe: ${JSON.stringify(tmpPipe)}`);
        let ret = usbMgr.closePipe(tmpPipe);
        console.info(`${TAG} closePipe result: ${ret}`);
        expect(ret).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testClosePipe002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testClosePipe003
     * @tc.number SUB_USB_HostManager_Compatibility_1400
     * @tc.desc   closePipe with invalid devAddress should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClosePipe003 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClosePipe003, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        let tmpPipe: usbMgr.USBDevicePipe = JSON.parse(JSON.stringify(pipe));
        tmpPipe.devAddress = -23;
        console.info(`${TAG} tmpPipe: ${JSON.stringify(tmpPipe)}`);
        let ret = usbMgr.closePipe(tmpPipe);
        console.info(`${TAG} closePipe result: ${ret}`);
        expect(ret).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testClosePipe003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testClosePipe004
     * @tc.number SUB_USB_HostManager_Compatibility_1500
     * @tc.desc   closePipe with invalid busNum and devAddress should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClosePipe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClosePipe004 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClosePipe004, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        let tmpPipe: usbMgr.USBDevicePipe = JSON.parse(JSON.stringify(pipe));
        tmpPipe.busNum = -23;
        tmpPipe.devAddress = -23;
        console.info(`${TAG} tmpPipe: ${JSON.stringify(tmpPipe)}`);
        let ret = usbMgr.closePipe(tmpPipe);
        console.info(`${TAG} closePipe result: ${ret}`);
        expect(ret).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testClosePipe004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testGetRawDescriptor001
     * @tc.number SUB_USB_HostManager_Func_0700
     * @tc.desc   getRawDescriptor should return non-empty descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetRawDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testGetRawDescriptor001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testGetRawDescriptor001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        let descriptor = usbMgr.getRawDescriptor(pipe);
        console.info(`${TAG} descriptor: ${JSON.stringify(descriptor)}`);
        expect(descriptor === undefined).assertFalse();
        expect(descriptor.length).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testGetRawDescriptor001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testGetFileDescriptor001
     * @tc.number SUB_USB_HostManager_Func_0600
     * @tc.desc   getFileDescriptor should return fd >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testGetFileDescriptor001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testGetFileDescriptor001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        let fileDescriptor = usbMgr.getFileDescriptor(pipe);
        console.info(`${TAG} fileDescriptor: ${fileDescriptor}`);
        expect(fileDescriptor).assertLargerOrEqual(0);
      } catch (error) {
        console.error(`${TAG} testGetFileDescriptor001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testGetFileDescriptor002
     * @tc.number SUB_USB_HostManager_Func_1000
     * @tc.desc   getFileDescriptor with invalid busNum and devAddress should return -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testGetFileDescriptor002 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testGetFileDescriptor002, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        let tempPipe: usbMgr.USBDevicePipe = { busNum: 255, devAddress: 255 };
        let fileDescriptor = usbMgr.getFileDescriptor(tempPipe);
        console.info(`${TAG} fileDescriptor: ${fileDescriptor}`);
        expect(fileDescriptor).assertEqual(-1);
      } catch (error) {
        console.error(`${TAG} testGetFileDescriptor002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testGetFileDescriptor003
     * @tc.number SUB_USB_HostManager_Compatibility_3000
     * @tc.desc   getFileDescriptor with invalid busNum should return -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testGetFileDescriptor003 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testGetFileDescriptor003, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        let tempPipe: usbMgr.USBDevicePipe = { busNum: 255, devAddress: pipe.devAddress };
        let fileDescriptor = usbMgr.getFileDescriptor(tempPipe);
        console.info(`${TAG} fileDescriptor: ${fileDescriptor}`);
        expect(fileDescriptor).assertEqual(-1);
      } catch (error) {
        console.error(`${TAG} testGetFileDescriptor003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testGetFileDescriptor004
     * @tc.number SUB_USB_HostManager_Compatibility_3100
     * @tc.desc   getFileDescriptor with invalid devAddress should return -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testGetFileDescriptor004 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testGetFileDescriptor004, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = setupDevicePipe(testDevice!);
        let tempPipe: usbMgr.USBDevicePipe = { busNum: pipe.busNum, devAddress: 255 };
        let fileDescriptor = usbMgr.getFileDescriptor(tempPipe);
        console.info(`${TAG} fileDescriptor: ${fileDescriptor}`);
        expect(fileDescriptor).assertEqual(-1);
      } catch (error) {
        console.error(`${TAG} testGetFileDescriptor004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testGetFileDescriptor005
     * @tc.number SUB_USB_HostManager_ErrCode_0700
     * @tc.desc   getFileDescriptor with undefined should throw 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testGetFileDescriptor005 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testGetFileDescriptor005, skip`);
        return;
      }
      try {
        usbMgr.getFileDescriptor(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testGetFileDescriptor005 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testGetFileDescriptor006
     * @tc.number SUB_USB_HostManager_ErrCode_1600
     * @tc.desc   getFileDescriptor with null should throw 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetFileDescriptor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testGetFileDescriptor006 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testGetFileDescriptor006, skip`);
        return;
      }
      try {
        usbMgr.getFileDescriptor(null);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testGetFileDescriptor006 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      }
    })

    /**
     * @tc.name   testTransferCompletedEnumValue
     * @tc.number SUB_USB_HostManager_Enum_0100
     * @tc.desc   TRANSFER_COMPLETED enum value should be 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransferCompletedEnumValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(usbMgr.UsbTransferStatus.TRANSFER_COMPLETED).assertEqual(0); // SDK doc: TRANSFER_COMPLETED = 0
    })

    /**
     * @tc.name   testTransferErrorEnumValue
     * @tc.number SUB_USB_HostManager_Enum_0200
     * @tc.desc   TRANSFER_ERROR enum value should be 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransferErrorEnumValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(usbMgr.UsbTransferStatus.TRANSFER_ERROR).assertEqual(1); // SDK doc: TRANSFER_ERROR = 1
    })

    /**
     * @tc.name   testTransferTimedOutEnumValue
     * @tc.number SUB_USB_HostManager_Enum_0300
     * @tc.desc   TRANSFER_TIMED_OUT enum value should be 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransferTimedOutEnumValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(usbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(2); // SDK doc: TRANSFER_TIMED_OUT = 2
    })

    /**
     * @tc.name   testTransferCanceledEnumValue
     * @tc.number SUB_USB_HostManager_Enum_0400
     * @tc.desc   TRANSFER_CANCELED enum value should be 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransferCanceledEnumValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(usbMgr.UsbTransferStatus.TRANSFER_CANCELED).assertEqual(3); // SDK doc: TRANSFER_CANCELED = 3
    })

    /**
     * @tc.name   testTransferStallEnumValue
     * @tc.number SUB_USB_HostManager_Enum_0500
     * @tc.desc   TRANSFER_STALL enum value should be 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransferStallEnumValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(usbMgr.UsbTransferStatus.TRANSFER_STALL).assertEqual(4); // SDK doc: TRANSFER_STALL = 4
    })

    /**
     * @tc.name   testTransferNoDeviceEnumValue
     * @tc.number SUB_USB_HostManager_Enum_0600
     * @tc.desc   TRANSFER_NO_DEVICE enum value should be 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransferNoDeviceEnumValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(usbMgr.UsbTransferStatus.TRANSFER_NO_DEVICE).assertEqual(5); // SDK doc: TRANSFER_NO_DEVICE = 5
    })

    /**
     * @tc.name   testTransferOverflowEnumValue
     * @tc.number SUB_USB_HostManager_Enum_0700
     * @tc.desc   TRANSFER_OVERFLOW enum value should be 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTransferOverflowEnumValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(usbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertEqual(6); // SDK doc: TRANSFER_OVERFLOW = 6
    })
  })
}
