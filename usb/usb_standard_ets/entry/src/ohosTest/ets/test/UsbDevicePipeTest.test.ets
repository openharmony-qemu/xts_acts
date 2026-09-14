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
import parameter from '@ohos.systemparameter';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

let deviceList: Array<usbMgr.USBDevice>;
let testDevice: usbMgr.USBDevice | null = null;
let isDeviceConnected: boolean = false;
const TAG: string = "[UsbDevicePipeTest]";
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

function buildControlParams(request: number, target: usbMgr.USBRequestTargetType, reqType: usbMgr.USBControlRequestType,
  value: number, index: number): usbMgr.USBControlParams {
  return {
    request: request,
    target: target,
    reqType: reqType,
    value: value,
    index: index,
    data: new Uint8Array(512)
  };
}

/* usb device pipe test */
export default function UsbDevicePipeTest() {
  describe('UsbDevicePipeTest', () => {

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
     * @tc.name   testBulkTransfer001
     * @tc.number SUB_USB_HostManager_TranFunc_1000
     * @tc.desc   bulk transfer receive data should return data >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testBulkTransfer001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      let testParam: TransferTestParam | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        testParam = getTransferTestParam(localPipe);
        if (!testParam.targetInterface || !testParam.inEndpoint) {
          console.info(`${TAG} ${SKIP_TAG} testBulkTransfer001, bulk endpoint not found, skip`);
          return;
        }
        testParam.isClaimed = usbMgr.claimInterface(localPipe, testParam.targetInterface, true);
        console.info(`${TAG} claimInterface result: ${testParam.isClaimed}`);
        expect(testParam.isClaimed).assertEqual(0);
        let tmpUint8Array = new Uint8Array(testParam.maxInSize);
        let data = await usbMgr.bulkTransfer(localPipe, testParam.inEndpoint, tmpUint8Array, 5000);
        console.info(`${TAG} readData buffer: ${ab2str(tmpUint8Array)}`);
        console.info(`${TAG} bulkTransfer result: ${data}`);
        expect(data).assertLargerOrEqual(0);
      } catch (error) {
        console.error(`${TAG} testBulkTransfer001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe && testParam?.targetInterface) {
          usbMgr.releaseInterface(localPipe, testParam.targetInterface);
        }
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testBulkTransfer002
     * @tc.number SUB_USB_HostManager_TranFunc_1100
     * @tc.desc   bulk transfer send data should return data > 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testBulkTransfer002 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer002, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      let testParam: TransferTestParam | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        testParam = getTransferTestParam(localPipe);
        if (!testParam.targetInterface || !testParam.outEndpoint) {
          console.info(`${TAG} ${SKIP_TAG} testBulkTransfer002, bulk endpoint not found, skip`);
          return;
        }
        testParam.isClaimed = usbMgr.claimInterface(localPipe, testParam.targetInterface, true);
        expect(testParam.isClaimed).assertEqual(0);
        testParam.sendData = 'send default';
        try {
          testParam.sendData = parameter.getSync('test_usb', 'default');
        } catch (e) {
          console.info(`${TAG} parameter getSync error: ${JSON.stringify(e)}`);
        }
        let tmpUint8Array = str2ab(testParam.sendData);
        let data = await usbMgr.bulkTransfer(localPipe, testParam.outEndpoint, tmpUint8Array, 5000);
        console.info(`${TAG} bulkTransfer result: ${data}`);
        console.info(`${TAG} send data: ${testParam.sendData}`);
        expect(data).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testBulkTransfer002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe && testParam?.targetInterface) {
          usbMgr.releaseInterface(localPipe, testParam.targetInterface);
        }
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testBulkTransfer003
     * @tc.number SUB_USB_HostManager_TranCompatibility_0400
     * @tc.desc   bulk transfer with timeout=undefined should return data > 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testBulkTransfer003 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer003, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      let testParam: TransferTestParam | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        testParam = getTransferTestParam(localPipe);
        if (!testParam.targetInterface || !testParam.outEndpoint) {
          console.info(`${TAG} ${SKIP_TAG} testBulkTransfer003, bulk endpoint not found, skip`);
          return;
        }
        testParam.isClaimed = usbMgr.claimInterface(localPipe, testParam.targetInterface, true);
        expect(testParam.isClaimed).assertEqual(0);
        testParam.sendData = 'send default';
        try {
          testParam.sendData = parameter.getSync('test_usb', 'default');
        } catch (e) {
          console.info(`${TAG} parameter getSync error: ${JSON.stringify(e)}`);
        }
        let tmpUint8Array = str2ab(testParam.sendData);
        let data = await usbMgr.bulkTransfer(localPipe, testParam.outEndpoint, tmpUint8Array, undefined);
        console.info(`${TAG} bulkTransfer result: ${data}`);
        console.info(`${TAG} send data: ${testParam.sendData}`);
        expect(data).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testBulkTransfer003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe && testParam?.targetInterface) {
          usbMgr.releaseInterface(localPipe, testParam.targetInterface);
        }
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testBulkTransfer004
     * @tc.number SUB_USB_HostManager_TranCompatibility_0500
     * @tc.desc   bulk transfer with timeout=null should return data > 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testBulkTransfer004 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer004, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      let testParam: TransferTestParam | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        testParam = getTransferTestParam(localPipe);
        if (!testParam.targetInterface || !testParam.outEndpoint) {
          console.info(`${TAG} ${SKIP_TAG} testBulkTransfer004, bulk endpoint not found, skip`);
          return;
        }
        testParam.isClaimed = usbMgr.claimInterface(localPipe, testParam.targetInterface, true);
        expect(testParam.isClaimed).assertEqual(0);
        testParam.sendData = 'send default';
        try {
          testParam.sendData = parameter.getSync('test_usb', 'default');
        } catch (e) {
          console.info(`${TAG} parameter getSync error: ${JSON.stringify(e)}`);
        }
        let tmpUint8Array = str2ab(testParam.sendData);
        let data = await usbMgr.bulkTransfer(localPipe, testParam.outEndpoint, tmpUint8Array, null);
        console.info(`${TAG} bulkTransfer result: ${data}`);
        console.info(`${TAG} send data: ${testParam.sendData}`);
        expect(data).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testBulkTransfer004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe && testParam?.targetInterface) {
          usbMgr.releaseInterface(localPipe, testParam.targetInterface);
        }
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testBulkTransfer005
     * @tc.number SUB_USB_HostManager_TranCompatibility_0600
     * @tc.desc   bulk transfer without timeout argument should return data > 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkTransfer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testBulkTransfer005 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkTransfer005, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      let testParam: TransferTestParam | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        testParam = getTransferTestParam(localPipe);
        if (!testParam.targetInterface || !testParam.outEndpoint) {
          console.info(`${TAG} ${SKIP_TAG} testBulkTransfer005, bulk endpoint not found, skip`);
          return;
        }
        testParam.isClaimed = usbMgr.claimInterface(localPipe, testParam.targetInterface, true);
        expect(testParam.isClaimed).assertEqual(0);
        testParam.sendData = 'send default';
        try {
          testParam.sendData = parameter.getSync('test_usb', 'default');
        } catch (e) {
          console.info(`${TAG} parameter getSync error: ${JSON.stringify(e)}`);
        }
        let tmpUint8Array = str2ab(testParam.sendData);
        let data = await usbMgr.bulkTransfer(localPipe, testParam.outEndpoint, tmpUint8Array);
        console.info(`${TAG} bulkTransfer result: ${data}`);
        console.info(`${TAG} send data: ${testParam.sendData}`);
        expect(data).assertLarger(0);
      } catch (error) {
        console.error(`${TAG} testBulkTransfer005 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe && testParam?.targetInterface) {
          usbMgr.releaseInterface(localPipe, testParam.targetInterface);
        }
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testClaimInterface001
     * @tc.number SUB_USB_HostManager_Func_0400
     * @tc.desc   claimInterface with force=true should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClaimInterface001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClaimInterface001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let targetInterface = deviceList[0].configs[j].interfaces[k];
            let isClaim = usbMgr.claimInterface(localPipe, targetInterface, true);
            console.info(`${TAG} claimInterface result: ${isClaim}`);
            expect(isClaim).assertEqual(0);
            usbMgr.releaseInterface(localPipe, targetInterface);
          }
        }
      } catch (error) {
        console.error(`${TAG} testClaimInterface001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testClaimInterface003
     * @tc.number SUB_USB_HostManager_Compatibility_2100
     * @tc.desc   claimInterface with force=undefined should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClaimInterface003 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClaimInterface003, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let targetInterface = deviceList[0].configs[j].interfaces[k];
            let isClaim = usbMgr.claimInterface(localPipe, targetInterface, undefined);
            console.info(`${TAG} claimInterface result: ${isClaim}`);
            expect(isClaim).assertEqual(0);
            usbMgr.releaseInterface(localPipe, targetInterface);
          }
        }
      } catch (error) {
        console.error(`${TAG} testClaimInterface003 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testClaimInterface004
     * @tc.number SUB_USB_HostManager_Compatibility_2200
     * @tc.desc   claimInterface with force=null should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClaimInterface004 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClaimInterface004, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let targetInterface = deviceList[0].configs[j].interfaces[k];
            let isClaim = usbMgr.claimInterface(localPipe, targetInterface, null);
            console.info(`${TAG} claimInterface result: ${isClaim}`);
            expect(isClaim).assertEqual(0);
            usbMgr.releaseInterface(localPipe, targetInterface);
          }
        }
      } catch (error) {
        console.error(`${TAG} testClaimInterface004 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testClaimInterface005
     * @tc.number SUB_USB_HostManager_Compatibility_2300
     * @tc.desc   claimInterface without force argument should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testClaimInterface005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testClaimInterface005 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testClaimInterface005, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          for (let k = 0; k < deviceList[0].configs[j].interfaces.length; k++) {
            let targetInterface = deviceList[0].configs[j].interfaces[k];
            let isClaim = usbMgr.claimInterface(localPipe, targetInterface);
            console.info(`${TAG} claimInterface result: ${isClaim}`);
            expect(isClaim).assertEqual(0);
            usbMgr.releaseInterface(localPipe, targetInterface);
          }
        }
      } catch (error) {
        console.error(`${TAG} testClaimInterface005 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetConfiguration001
     * @tc.number SUB_USB_HostManager_Func_1300
     * @tc.desc   setConfiguration should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetConfiguration001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetConfiguration001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      let originalConfig: usbMgr.USBConfiguration | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        originalConfig = JSON.parse(JSON.stringify(deviceList[0].configs[0]));
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let config = deviceList[0].configs[j];
          config.id = 1;
          config.name = '';
          config.maxPower = 1;
          config.isRemoteWakeup = true;
          config.isSelfPowered = true;
          let ret = usbMgr.setConfiguration(localPipe, deviceList[0].configs[j]);
          console.info(`${TAG} setConfiguration result: ${ret}`);
          expect(ret).assertEqual(0);
        }
      } catch (error) {
        console.error(`${TAG} testSetConfiguration001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe && originalConfig) {
          try {
            usbMgr.setConfiguration(localPipe, originalConfig);
          } catch (e) {
            console.error(`${TAG} testSetConfiguration001 restore config err: ${JSON.stringify(e)}`);
          }
        }
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetConfiguration002
     * @tc.number SUB_USB_HostManager_Compatibility_3600
     * @tc.desc   setConfiguration with invalid id=255 should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetConfiguration002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetConfiguration002 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetConfiguration002, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let config: usbMgr.USBConfiguration = JSON.parse(JSON.stringify(deviceList[0].configs[j]));
          config.id = 255;
          let ret = usbMgr.setConfiguration(localPipe, config);
          console.info(`${TAG} setConfiguration result: ${ret}`);
          expect(ret).assertLess(0);
        }
      } catch (error) {
        console.error(`${TAG} testSetConfiguration002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetInterface001
     * @tc.number SUB_USB_HostManager_Func_1100
     * @tc.desc   setInterface should return 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetInterface001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetInterface001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let targetInterface = deviceList[0].configs[j].interfaces[0];
          let isClaim = usbMgr.claimInterface(localPipe, targetInterface, true);
          expect(isClaim).assertEqual(0);
          let ret = usbMgr.setInterface(localPipe, targetInterface);
          console.info(`${TAG} setInterface result: ${ret}`);
          expect(ret).assertEqual(0);
          usbMgr.releaseInterface(localPipe, targetInterface);
        }
      } catch (error) {
        console.error(`${TAG} testSetInterface001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testSetInterface002
     * @tc.number SUB_USB_HostManager_Compatibility_4100
     * @tc.desc   setInterface with invalid id=234 should return non-zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testSetInterface002 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testSetInterface002, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe: usbMgr.USBDevicePipe | null = null;
      try {
        localPipe = usbMgr.connectDevice(testDevice!);
        expect(localPipe === undefined).assertFalse();
        for (let j = 0; j < deviceList[0].configs.length; j++) {
          let isClaim = usbMgr.claimInterface(localPipe, deviceList[0].configs[j].interfaces[0], true);
          expect(isClaim).assertEqual(0);
          let tmpInterface: usbMgr.USBInterface = JSON.parse(JSON.stringify(deviceList[0].configs[j].interfaces[0]));
          tmpInterface.id = 234;
          let ret = usbMgr.setInterface(localPipe, tmpInterface);
          console.info(`${TAG} setInterface result: ${ret}`);
          expect(ret !== 0).assertTrue();
          usbMgr.releaseInterface(localPipe, deviceList[0].configs[j].interfaces[0]);
        }
      } catch (error) {
        console.error(`${TAG} testSetInterface002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer001
     * @tc.number SUB_USB_HostManager_TranFunc_0100
     * @tc.desc   controlTransfer GetDescriptor should return data >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(6, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), (2 << 8), 0);
        let data = await usbMgr.controlTransfer(localPipe, controlParam, 5000);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data).assertLargerOrEqual(0);
      } catch (error) {
        console.error(`${TAG} testControlTransfer001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer002
     * @tc.number SUB_USB_HostManager_TranFunc_0200
     * @tc.desc   controlTransfer GetStatus should return data >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer002 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer002, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(0, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
        let data = await usbMgr.controlTransfer(localPipe, controlParam, 5000);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data).assertLargerOrEqual(0);
      } catch (error) {
        console.error(`${TAG} testControlTransfer002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer005
     * @tc.number SUB_USB_HostManager_TranCompatibility_0300
     * @tc.desc   controlTransfer GetStatus without timeout should return data >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer005 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer005, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(0, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
        let data = await usbMgr.controlTransfer(localPipe, controlParam);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data).assertLargerOrEqual(0);
      } catch (error) {
        console.error(`${TAG} testControlTransfer005 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer006
     * @tc.number SUB_USB_HostManager_TranFunc_0300
     * @tc.desc   controlTransfer GetConfiguration should return data >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer006 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer006, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(8, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
        let data = await usbMgr.controlTransfer(localPipe, controlParam, 5000);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data).assertLargerOrEqual(0);
      } catch (error) {
        console.error(`${TAG} testControlTransfer006 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer007
     * @tc.number SUB_USB_HostManager_TranFunc_0400
     * @tc.desc   controlTransfer GetInterface should return data >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer007 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer007, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(10, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE & 0x1f), 0, 1);
        let data = await usbMgr.controlTransfer(localPipe, controlParam, 5000);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data).assertLargerOrEqual(0);
      } catch (error) {
        console.error(`${TAG} testControlTransfer007 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer008
     * @tc.number SUB_USB_HostManager_TranFunc_0500
     * @tc.desc   controlTransfer ClearFeature target=DEVICE should return data >= 0 or -1 (STALL)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer008 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer008, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(1, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_DEVICE & 0x1f), 0, 0);
        let data = await usbMgr.controlTransfer(localPipe, controlParam, 5000);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data === -1 || data >= 0).assertTrue();
      } catch (error) {
        console.error(`${TAG} testControlTransfer008 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer009
     * @tc.number SUB_USB_HostManager_TranFunc_0600
     * @tc.desc   controlTransfer ClearFeature reqType=STANDARD should return data >= 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer009 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer009, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(255, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_FROM_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_INTERFACE & 0x1f), (2 << 8), 0);
        let data = await usbMgr.controlTransfer(localPipe, controlParam, 5000);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data).assertLargerOrEqual(0);
      } catch (error) {
        console.error(`${TAG} testControlTransfer009 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer010
     * @tc.number SUB_USB_HostManager_TranFunc_0700
     * @tc.desc   controlTransfer ClearFeature reqType=CLASS should return data >= 0 or -1 (STALL)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer010 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer010, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(255, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_ENDPOINT,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_CLASS << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_ENDPOINT & 0x1f), (2 << 8), 0);
        let data = await usbMgr.controlTransfer(localPipe, controlParam, 5000);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data === -1 || data >= 0).assertTrue();
      } catch (error) {
        console.error(`${TAG} testControlTransfer010 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer011
     * @tc.number SUB_USB_HostManager_TranFunc_0800
     * @tc.desc   controlTransfer ClearFeature reqType=VENDOR should return data >= 0 or -1 (STALL)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer011 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer011, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(255, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_VENDOR << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER & 0x1f), (2 << 8), 0);
        let data = await usbMgr.controlTransfer(localPipe, controlParam, 5000);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data === -1 || data >= 0).assertTrue();
      } catch (error) {
        console.error(`${TAG} testControlTransfer011 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })

    /**
     * @tc.name   testControlTransfer012
     * @tc.number SUB_USB_HostManager_TranFunc_0900
     * @tc.desc   controlTransfer ClearFeature reqType=CLASS value=0 should return data >= 0 or -1 (STALL)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testControlTransfer012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testControlTransfer012 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testControlTransfer012, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let localPipe = usbMgr.connectDevice(testDevice!);
      try {
        let controlParam = buildControlParams(255, usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER,
          (usbMgr.USBRequestDirection.USB_REQUEST_DIR_TO_DEVICE) |
            (usbMgr.USBControlRequestType.USB_REQUEST_TYPE_CLASS << 5)
            | (usbMgr.USBRequestTargetType.USB_REQUEST_TARGET_OTHER & 0x1f), 0, 0);
        let data = await usbMgr.controlTransfer(localPipe, controlParam, 5000);
        console.info(`${TAG} controlTransfer result: ${data}`);
        expect(data === -1 || data >= 0).assertTrue();
      } catch (error) {
        console.error(`${TAG} testControlTransfer012 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        if (localPipe) {
          usbMgr.closePipe(localPipe);
        }
        done();
      }
    })
  })
}
