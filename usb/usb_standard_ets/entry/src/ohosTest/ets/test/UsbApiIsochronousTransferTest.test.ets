/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import usbMgr from '@ohos.usbManager';
import { isFilteredDevice } from './FilterUtils';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';

const TAG: string = "[UsbApiIsochronousTransferTest]";
const SKIP_TAG: string = "[SKIP]";

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

function deviceConnected(deviceList: Array<usbMgr.USBDevice>): boolean {
  if (deviceList.length > 0) {
    console.info(`${TAG} Test USB device is connected`);
    return true;
  }
  console.info(`${TAG} Test USB device is not connected`);
  return false;
}

function buildTransferParams(pipe: usbMgr.USBDevicePipe, flags: number, endpoint: number, transferType: number,
  timeout: number): usbMgr.UsbDataTransferParams {
  let transferParams: usbMgr.UsbDataTransferParams = {
    devPipe: pipe,
    flags: flags,
    endpoint: endpoint,
    type: transferType,
    timeout: timeout,
    length: 16,
    callback: () => {
    },
    userData: new Uint8Array(10),
    buffer: new Uint8Array(16),
    isoPacketCount: 1,
  };
  return transferParams;
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

interface EndpointInfo {
  usbInterface: usbMgr.USBInterface | undefined,
  usbEndpoint: usbMgr.USBEndpoint
}

function getEndpoint(device: usbMgr.USBDevice, direction: number, type: number): EndpointInfo | undefined {
  let usbConfigs: usbMgr.USBConfiguration[] = device.configs;
  let usbInterface: usbMgr.USBInterface | undefined = undefined;
  let usbEndpoint: usbMgr.USBEndpoint | undefined = undefined;
  for (let i = 0; i < usbConfigs.length; i++) {
    let usbInterfaces: usbMgr.USBInterface[] = usbConfigs[i].interfaces;
    for (let j = 0; j < usbInterfaces.length; j++) {
      let usbEndpoints: usbMgr.USBEndpoint[] = usbInterfaces[j].endpoints;
      usbEndpoint = usbEndpoints.find((value) => {
        return value.direction === direction && value.type === type;
      });
      if (usbEndpoint !== undefined) {
        usbInterface = usbInterfaces[j];
        break;
      }
    }
    if (usbEndpoint !== undefined) {
      break;
    }
  }
  if (usbEndpoint === undefined) {
    console.error(`${TAG} get usbEndpoint error`);
    return undefined;
  }
  let result: EndpointInfo = {
    usbInterface: usbInterface,
    usbEndpoint: usbEndpoint
  };
  return result;
}

export default function UsbApiIsochronousTransferTest() {

  describe('UsbApiIsochronousTransferTest', () => {
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
      console.info(`${TAG} getDevices: ${JSON.stringify(deviceList)}`);
      isDeviceConnected = deviceConnected(deviceList);
      console.info(`${TAG} isDeviceConnected: ${isDeviceConnected}`);
      if (isDeviceConnected) {
        testDevice = deviceList[0];
        await ensurePermission(testDevice!.name);
      }
    })

    afterAll(() => {
      console.info(`${TAG} afterAll`);
    })

    beforeEach(() => {
      console.info(`${TAG} beforeEach`);
    })

    /**
     * @tc.name   testUsbSubmitTransfer001
     * @tc.number SUB_USB_Host_usbSubmitTransfer_Func_2100
     * @tc.desc   isochronous transfer read should callback with COMPLETED or OVERFLOW status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSubmitTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testUsbSubmitTransfer001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testUsbSubmitTransfer001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = usbMgr.connectDevice(testDevice!);
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let endpointInfo = getEndpoint(testDevice!, 128, type);
        if (!endpointInfo || !endpointInfo.usbInterface || !endpointInfo.usbEndpoint) {
          console.info(`${TAG} ${SKIP_TAG} testUsbSubmitTransfer001, iso endpoint not found, skip`);
          teardownDevicePipe(pipe);
          done();
          return;
        }
        let usbInterface = endpointInfo.usbInterface;
        let usbEndpoint = endpointInfo.usbEndpoint;
        console.info(`${TAG} usbEndpoint.address: ${JSON.stringify(usbEndpoint.address)}`);

        let transferParams: usbMgr.UsbDataTransferParams =
          buildTransferParams(pipe, 0, usbEndpoint.address, type, 2000);
        usbMgr.claimInterface(pipe, usbInterface, true);
        usbMgr.setInterface(pipe, usbInterface);

        transferParams.callback = (err: Error, data: usbMgr.SubmitTransferCallback) => {
          console.info(`${TAG} callbackData: ${JSON.stringify(data)}`);
          // 整体传输状态
          expect(data.status === usbMgr.UsbTransferStatus.TRANSFER_COMPLETED ||
            data.status === usbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertTrue();
          // 整体实际传输长度
          expect(data.actualLength).assertLargerOrEqual(0);
          // 单包状态(ISO 特有)
          let desc = data.isoPacketDescs[0];
          console.info(`${TAG} isoPacketDescs[0]: ${JSON.stringify(desc)}`);
          expect(desc.status === usbMgr.UsbTransferStatus.TRANSFER_COMPLETED ||
            desc.status === usbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertTrue();
          expect(desc.length).assertEqual(transferParams.buffer.length);
          expect(desc.actualLength).assertLargerOrEqual(0);
          teardownDevicePipe(pipe);
          pipe = null;
          done();
        }
        usbMgr.usbSubmitTransfer(transferParams);
      } catch (error) {
        console.error(`${TAG} testUsbSubmitTransfer001 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        teardownDevicePipe(pipe);
        done();
      }
    });

    /**
     * @tc.name   testUsbSubmitTransfer002
     * @tc.number SUB_USB_Host_usbSubmitTransfer_Func_2200
     * @tc.desc   isochronous transfer write should callback with COMPLETED or OVERFLOW status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSubmitTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testUsbSubmitTransfer002 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testUsbSubmitTransfer002, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = usbMgr.connectDevice(testDevice!);
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let endpointInfo = getEndpoint(testDevice!, 0, type);
        if (!endpointInfo || !endpointInfo.usbInterface || !endpointInfo.usbEndpoint) {
          console.info(`${TAG} ${SKIP_TAG} testUsbSubmitTransfer002, iso endpoint not found, skip`);
          teardownDevicePipe(pipe);
          done();
          return;
        }
        let usbInterface = endpointInfo.usbInterface;
        let usbEndpoint = endpointInfo.usbEndpoint;
        let transferParams: usbMgr.UsbDataTransferParams =
          buildTransferParams(pipe, 0, usbEndpoint.address, type, 2000);
        usbMgr.claimInterface(pipe, usbInterface, true);
        usbMgr.setInterface(pipe, usbInterface);

        transferParams.callback = (err: Error, data: usbMgr.SubmitTransferCallback) => {
          console.info(`${TAG} callbackData: ${JSON.stringify(data)}`);
          expect(data.status === usbMgr.UsbTransferStatus.TRANSFER_COMPLETED ||
            data.status === usbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertTrue();
          expect(data.actualLength).assertLargerOrEqual(0);
          let desc = data.isoPacketDescs[0];
          console.info(`${TAG} isoPacketDescs[0]: ${JSON.stringify(desc)}`);
          expect(desc.status === usbMgr.UsbTransferStatus.TRANSFER_COMPLETED ||
            desc.status === usbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertTrue();
          expect(desc.length).assertEqual(transferParams.buffer.length);
          expect(desc.actualLength).assertLargerOrEqual(0);
          teardownDevicePipe(pipe);
          pipe = null;
          done();
        }
        usbMgr.usbSubmitTransfer(transferParams);
      } catch (error) {
        console.error(`${TAG} testUsbSubmitTransfer002 catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
        teardownDevicePipe(pipe);
        done();
      }
    });

    /**
     * @tc.name   testUsbSubmitTransfer003
     * @tc.number SUB_USB_Host_usbSubmitTransfer_ErrCode_2100
     * @tc.desc   isochronous transfer with invalid endpoint should throw 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbSubmitTransfer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testUsbSubmitTransfer003 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testUsbSubmitTransfer003, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = usbMgr.connectDevice(testDevice!);
        let tmpInterface: usbMgr.USBInterface = testDevice!.configs[0].interfaces[0];
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(pipe, 0, -1, type, 2000);
        usbMgr.claimInterface(pipe, tmpInterface, true);
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testUsbSubmitTransfer003 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(401);
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    });

    /**
     * @tc.name   testUsbSubmitTransfer004
     * @tc.number SUB_USB_Host_usbSubmitTransfer_ErrCode_2200
     * @tc.desc   isochronous transfer without claimInterface should throw 14400012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbSubmitTransfer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testUsbSubmitTransfer004 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testUsbSubmitTransfer004, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = usbMgr.connectDevice(testDevice!);
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
        let endpointInfo = getEndpoint(testDevice!, 0, type);
        if (!endpointInfo || !endpointInfo.usbInterface || !endpointInfo.usbEndpoint) {
          console.info(`${TAG} ${SKIP_TAG} testUsbSubmitTransfer004, iso endpoint not found, skip`);
          teardownDevicePipe(pipe);
          done();
          return;
        }
        let usbEndpoint = endpointInfo.usbEndpoint;
        let transferParams: usbMgr.UsbDataTransferParams =
          buildTransferParams(pipe, flags, usbEndpoint.address, type, 2000);
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testUsbSubmitTransfer004 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(14400012);
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    });

    /**
     * @tc.name   testUsbSubmitTransfer005
     * @tc.number SUB_USB_Host_usbSubmitTransfer_ErrCode_2300
     * @tc.desc   isochronous transfer with fake pipe should throw 14400001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbSubmitTransfer005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testUsbSubmitTransfer005 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testUsbSubmitTransfer005, skip`);
        return;
      }
      let fakePipe: usbMgr.USBDevicePipe = { busNum: 0, devAddress: 0 };
      let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(fakePipe, 0, 0, 0, 0);
      try {
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testUsbSubmitTransfer005 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(14400001);
      }
    });

    /**
     * @tc.name   testUsbCancelTransfer001
     * @tc.number SUB_USB_Host_usbCancelTransfer_ErrCode_2100
     * @tc.desc   isochronous transfer cancel without submit should throw 14400011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbCancelTransfer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(`${TAG} testUsbCancelTransfer001 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testUsbCancelTransfer001, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe: usbMgr.USBDevicePipe | null = null;
      try {
        pipe = usbMgr.connectDevice(testDevice!);
        let type: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_ISOCHRONOUS;
        let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(pipe, 0, 1, type, 0);
        usbMgr.usbCancelTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testUsbCancelTransfer001 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(14400011);
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    });

    /**
     * @tc.name   testUsbCancelTransfer002
     * @tc.number SUB_USB_Host_usbCancelTransfer_ErrCode_2200
     * @tc.desc   isochronous transfer cancel with fake pipe should throw 14400001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbCancelTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testUsbCancelTransfer002 start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testUsbCancelTransfer002, skip`);
        return;
      }
      let fakePipe: usbMgr.USBDevicePipe = { busNum: 0, devAddress: 0 };
      let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(fakePipe, 0, 0, 0, 0);
      try {
        usbMgr.usbCancelTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testUsbCancelTransfer002 catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(14400001);
      }
    });

  })

}