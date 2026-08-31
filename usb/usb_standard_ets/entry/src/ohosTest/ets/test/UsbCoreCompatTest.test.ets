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
let pipe: usbMgr.USBDevicePipe | null = null;
let testDevice: usbMgr.USBDevice | null = null;
let isDeviceConnected: boolean = false;
const TAG: string = "[UsbCoreCompatTest]";
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

/* usb core compatibility test */
export default function UsbCoreCompatTest() {
  describe('UsbCoreCompatTest', () => {

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
     * @tc.name   testConnectDeviceInvalidDevAddress
     * @tc.number SUB_USB_HostManager_Compatibility_0100
     * @tc.desc   connectDevice with invalid devAddress should return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidDevAddress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testConnectDeviceInvalidDevAddress start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidDevAddress, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        device.devAddress = 2 + 10000;
        try {
          let pipe = usbMgr.connectDevice(device);
          console.info(`${TAG} connectDevice result: ${JSON.stringify(pipe)}`);
          expect(pipe).assertUndefined();
          done();
        } catch (error) {
          console.error(`${TAG} testConnectDeviceInvalidDevAddress catch err: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(14400001);
          done();
        }
      })

    /**
     * @tc.name   testConnectDeviceInvalidBusNum
     * @tc.number SUB_USB_HostManager_Compatibility_0200
     * @tc.desc   connectDevice with invalid busNum should return undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidBusNum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testConnectDeviceInvalidBusNum start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidBusNum, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
      device.busNum = 2 + 1000;
      try {
        let pipe = usbMgr.connectDevice(device);
        console.info(`${TAG} connectDevice result: ${JSON.stringify(pipe)}`);
        expect(pipe).assertUndefined();
        done();
      } catch (error) {
        console.error(`${TAG} testConnectDeviceInvalidBusNum catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(14400001);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceInvalidSerial
     * @tc.number SUB_USB_HostManager_Compatibility_0300
     * @tc.desc   connectDevice with invalid serial should still succeed (only busNum/devAddress matter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidSerial', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testConnectDeviceInvalidSerial start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidSerial, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
      device.serial = 'asdfsd';
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = usbMgr.connectDevice(device);
        console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
        expect(pipe === undefined).assertFalse();
        expect(pipe.busNum).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testConnectDeviceInvalidSerial catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceInvalidProductName
     * @tc.number SUB_USB_HostManager_Compatibility_0400
     * @tc.desc   connectDevice with invalid productName should still succeed (only busNum/devAddress matter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidProductName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testConnectDeviceInvalidProductName start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidProductName, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        device.productName = 'sdfsdfe';
        let pipe: usbMgr.USBDevicePipe | null = null;
        try {
          pipe = usbMgr.connectDevice(device);
          console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
          expect(pipe === undefined).assertFalse();
          expect(pipe.busNum).assertLarger(0);
        } catch (error) {
          console.error(`${TAG} testConnectDeviceInvalidProductName catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      })

    /**
     * @tc.name   testConnectDeviceInvalidVersion
     * @tc.number SUB_USB_HostManager_Compatibility_0500
     * @tc.desc   connectDevice with invalid version should still succeed (only busNum/devAddress matter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidVersion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testConnectDeviceInvalidVersion start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidVersion, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        device.version = 'gwefsdf';
        let pipe: usbMgr.USBDevicePipe | null = null;
        try {
          pipe = usbMgr.connectDevice(device);
          console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
          expect(pipe === undefined).assertFalse();
          expect(pipe.busNum).assertLarger(0);
        } catch (error) {
          console.error(`${TAG} testConnectDeviceInvalidVersion catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      })

    /**
     * @tc.name   testConnectDeviceInvalidVendorId
     * @tc.number SUB_USB_HostManager_Compatibility_0600
     * @tc.desc   connectDevice with invalid vendorId should still succeed (only busNum/devAddress matter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidVendorId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testConnectDeviceInvalidVendorId start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidVendorId, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        device.vendorId = 2 + 10000;
        let pipe: usbMgr.USBDevicePipe | null = null;
        try {
          pipe = usbMgr.connectDevice(device);
          console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
          expect(pipe === undefined).assertFalse();
          expect(pipe.busNum).assertLarger(0);
        } catch (error) {
          console.error(`${TAG} testConnectDeviceInvalidVendorId catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      })

    /**
     * @tc.name   testConnectDeviceInvalidProductId
     * @tc.number SUB_USB_HostManager_Compatibility_0700
     * @tc.desc   connectDevice with invalid productId should still succeed (only busNum/devAddress matter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidProductId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testConnectDeviceInvalidProductId start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidProductId, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        device.productId = 2 + 10000;
        let pipe: usbMgr.USBDevicePipe | null = null;
        try {
          pipe = usbMgr.connectDevice(device);
          console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
          expect(pipe === undefined).assertFalse();
          expect(pipe.busNum).assertLarger(0);
        } catch (error) {
          console.error(`${TAG} testConnectDeviceInvalidProductId catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      })

    /**
     * @tc.name   testConnectDeviceInvalidClazz
     * @tc.number SUB_USB_HostManager_Compatibility_0800
     * @tc.desc   connectDevice with invalid clazz should still succeed (only busNum/devAddress matter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidClazz', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testConnectDeviceInvalidClazz start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidClazz, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
      device.clazz = 2 + 10000;
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = usbMgr.connectDevice(device);
        console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
        expect(pipe === undefined).assertFalse();
        expect(pipe.busNum).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testConnectDeviceInvalidClazz catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testConnectDeviceInvalidSubClass
     * @tc.number SUB_USB_HostManager_Compatibility_0900
     * @tc.desc   connectDevice with invalid subClass should still succeed (only busNum/devAddress matter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidSubClass', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testConnectDeviceInvalidSubClass start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidSubClass, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        device.subClass = 2 + 10000;
        let pipe: usbMgr.USBDevicePipe | null = null;
        try {
          pipe = usbMgr.connectDevice(device);
          console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
          expect(pipe === undefined).assertFalse();
          expect(pipe.busNum).assertLarger(0);
        } catch (error) {
          console.error(`${TAG} testConnectDeviceInvalidSubClass catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      })

    /**
     * @tc.name   testConnectDeviceInvalidProtocol
     * @tc.number SUB_USB_HostManager_Compatibility_1000
     * @tc.desc   connectDevice with invalid protocol should still succeed (only busNum/devAddress matter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testConnectDeviceInvalidProtocol', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testConnectDeviceInvalidProtocol start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testConnectDeviceInvalidProtocol, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        device.protocol = 2 + 10000;
        let pipe: usbMgr.USBDevicePipe | null = null;
        try {
          pipe = usbMgr.connectDevice(device);
          console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
          expect(pipe === undefined).assertFalse();
          expect(pipe.busNum).assertLarger(0);
        } catch (error) {
          console.error(`${TAG} testConnectDeviceInvalidProtocol catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      })

    /**
     * @tc.name   testHasRightInvalidName
     * @tc.number SUB_USB_HostManager_Compatibility_1100
     * @tc.desc   hasRight with invalid deviceName (special chars) should return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightInvalidName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testHasRightInvalidName start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testHasRightInvalidName, skip`);
        return;
      }
      let deviceName = testDevice!.name + '$#';
      let hasRight = usbMgr.hasRight(deviceName);
      console.info(`${TAG} hasRight: ${hasRight}`);
      expect(hasRight).assertFalse();
    })

    /**
     * @tc.name   testHasRightInvalidNameDigits
     * @tc.number SUB_USB_HostManager_Compatibility_1200
     * @tc.desc   hasRight with invalid deviceName (digits) should return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasRightInvalidNameDigits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testHasRightInvalidNameDigits start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testHasRightInvalidNameDigits, skip`);
        return;
      }
      let deviceName = testDevice!.name + 'abcdg';
      let hasRight = usbMgr.hasRight(deviceName);
      console.info(`${TAG} hasRight: ${hasRight}`);
      expect(hasRight).assertFalse();
    })

    /**
     * @tc.name   testRequestRightInvalidName
     * @tc.number SUB_USB_HostManager_Compatibility_4600
     * @tc.desc   requestRight with invalid deviceName (special chars) should return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightInvalidName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testRequestRightInvalidName start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testRequestRightInvalidName, skip`);
        done();
        return;
      }
      let deviceName = testDevice!.name + '@#';
      try {
        let hasRight = await usbMgr.requestRight(deviceName);
        console.info(`${TAG} requestRight result: ${hasRight}`);
        expect(hasRight).assertFalse();
        done();
      } catch (error) {
        console.error(`${TAG} testRequestRightInvalidName catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   testRequestRightInvalidNameDigits
     * @tc.number SUB_USB_HostManager_Compatibility_4700
     * @tc.desc   requestRight with invalid deviceName (digits) should return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestRightInvalidNameDigits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testRequestRightInvalidNameDigits start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testRequestRightInvalidNameDigits, skip`);
          done();
          return;
        }
        let deviceName = testDevice!.name + '123';
        try {
          let hasRight = await usbMgr.requestRight(deviceName);
          console.info(`${TAG} requestRight result: ${hasRight}`);
          expect(hasRight).assertFalse();
          done();
        } catch (error) {
          console.error(`${TAG} testRequestRightInvalidNameDigits catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   testResetUsbDeviceSuccess
     * @tc.number SUB_USB_HostManager_Reset_0100
     * @tc.desc   resetUsbDevice should return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDeviceSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testResetUsbDeviceSuccess start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testResetUsbDeviceSuccess, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        pipe = usbMgr.connectDevice(device);
        console.info(`${TAG} pipe: ${JSON.stringify(pipe)}`);
        let result = usbMgr.resetUsbDevice(pipe);
        console.info(`${TAG} resetUsbDevice result: ${result}`);
        expect(result).assertTrue();
      } catch (error) {
        console.error(`${TAG} testResetUsbDeviceSuccess catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testResetUsbDeviceInvalidPipe
     * @tc.number SUB_USB_HostManager_Reset_0200
     * @tc.desc   resetUsbDevice with busNum=0 devAddress=0 should throw 14400008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDeviceInvalidPipe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testResetUsbDeviceInvalidPipe start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testResetUsbDeviceInvalidPipe, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        pipe = usbMgr.connectDevice(device);
        let fakePipe: usbMgr.USBDevicePipe = { busNum: 0, devAddress: 0 };
        usbMgr.resetUsbDevice(fakePipe);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testResetUsbDeviceInvalidPipe catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(14400008);
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    })

    /**
     * @tc.name   testResetUsbDeviceNotConnected
     * @tc.number SUB_USB_HostManager_Reset_0300
     * @tc.desc   resetUsbDevice with device info pipe should throw 14400013
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDeviceNotConnected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testResetUsbDeviceNotConnected start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testResetUsbDeviceNotConnected, skip`);
        return;
      }
      try {
        let fakePipe: usbMgr.USBDevicePipe = { busNum: testDevice!.busNum, devAddress: testDevice!.devAddress };
        usbMgr.resetUsbDevice(fakePipe);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testResetUsbDeviceNotConnected catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(14400013);
      }
    })

    /**
     * @tc.name   testResetUsbDeviceNoPermission
     * @tc.number SUB_USB_HostManager_Reset_0400
     * @tc.desc   resetUsbDevice without permission should throw 14400001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testResetUsbDeviceNoPermission', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testResetUsbDeviceNoPermission start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testResetUsbDeviceNoPermission, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        let device: usbMgr.USBDevice = JSON.parse(JSON.stringify(testDevice!));
        pipe = usbMgr.connectDevice(device);
        usbMgr.removeRight(testDevice!.name);
        usbMgr.resetUsbDevice(pipe);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testResetUsbDeviceNoPermission catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(14400001);
      } finally {
        await ensurePermission(testDevice!.name);
        teardownDevicePipe(pipe);
        done();
      }
    })
  })
}
