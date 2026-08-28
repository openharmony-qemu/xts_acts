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

const TAG: string = "[UsbApiBulkTransferTest]";
const SKIP_TAG: string = "[SKIP]";

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

function deviceConnected(deviceList: Array<usbMgr.USBDevice>) {
  if (deviceList.length > 0) {
    console.info(`${TAG} Test USB device is connected`);
    return true;
  }
  console.info(`${TAG} Test USB device is not connected`);
  return false;
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

function buildTransferParams(pipe: usbMgr.USBDevicePipe, flags: number, endpoint: number, transferType: number,
  timeout: number) {
  let transferParams: usbMgr.UsbDataTransferParams = {
    devPipe: pipe,
    flags: flags,
    endpoint: endpoint,
    type: transferType,
    timeout: timeout,
    length: 10,
    callback: () => {
    },
    userData: new Uint8Array(10),
    buffer: new Uint8Array(10),
    isoPacketCount: 2,
  };
  return transferParams;
}

export default function UsbApiBulkTransferTest() {

  describe('UsbApiBulkTransferTest', () => {
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
     * @tc.name   testBulkSubmitTransferWriteSuccess
     * @tc.number SUB_USB_Host_usbSubmitTransfer_Func_0100
     * @tc.desc   bulk transfer write should return TRANSFER_COMPLETED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBulkSubmitTransferWriteSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG} testBulkSubmitTransferWriteSuccess start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testBulkSubmitTransferWriteSuccess, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe = setupDevicePipe(testDevice!);
        let targetInterface: usbMgr.USBInterface = testDevice!.configs[0].interfaces[0];
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK;
        let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(pipe, flags, 1, transferType, 2000);
        usbMgr.claimInterface(pipe, targetInterface, true);
        try {
          transferParams.callback = (err: Error, callbackData: usbMgr.SubmitTransferCallback) => {
            console.info(`${TAG} callbackData: ${JSON.stringify(callbackData)}`);
            expect(callbackData.status).assertEqual(usbMgr.UsbTransferStatus.TRANSFER_COMPLETED);
            expect(callbackData.actualLength).assertEqual(transferParams.buffer.length);
            teardownDevicePipe(pipe);
            done();
          }
          usbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          console.error(`${TAG} testBulkSubmitTransferWriteSuccess catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
          teardownDevicePipe(pipe);
          done();
        }
      });

    /**
     * @tc.name   testBulkSubmitTransferReadTimeout
     * @tc.number SUB_USB_Host_usbSubmitTransfer_Func_0200
     * @tc.desc   bulk transfer read should timeout with TRANSFER_TIMED_OUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBulkSubmitTransferReadTimeout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG} testBulkSubmitTransferReadTimeout start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testBulkSubmitTransferReadTimeout, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe = setupDevicePipe(testDevice!);
        let targetInterface: usbMgr.USBInterface = testDevice!.configs[0].interfaces[0];
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(pipe, flags, 129, transferType, 2000);
        usbMgr.claimInterface(pipe, targetInterface, true);
        try {
          transferParams.callback = (err: Error, callbackData: usbMgr.SubmitTransferCallback) => {
            console.info(`${TAG} callbackData: ${JSON.stringify(callbackData)}`);
            expect(callbackData.status).assertEqual(usbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT);
            expect(callbackData.actualLength).assertLargerOrEqual(0);
            teardownDevicePipe(pipe);
            done();
          }
          usbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          console.error(`${TAG} testBulkSubmitTransferReadTimeout catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
          teardownDevicePipe(pipe);
          done();
        }
      });

    /**
     * @tc.name   testBulkSubmitTransferInvalidEndpoint
     * @tc.number SUB_USB_Host_usbSubmitTransfer_ErrCode_0100
     * @tc.desc   bulk transfer with invalid endpoint should throw 14400012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkSubmitTransferInvalidEndpoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testBulkSubmitTransferInvalidEndpoint start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testBulkSubmitTransferInvalidEndpoint, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe = setupDevicePipe(testDevice!);
        let targetInterface: usbMgr.USBInterface = testDevice!.configs[0].interfaces[0];
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_FREE_TRANSFER;
        let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(pipe, flags, -1, transferType, 2000);
        usbMgr.claimInterface(pipe, targetInterface, true);
        try {
          usbMgr.usbSubmitTransfer(transferParams);
          expect().assertFail();
        } catch (error) {
          console.error(`${TAG} testBulkSubmitTransferInvalidEndpoint catch err: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(14400012);
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      });

    /**
     * @tc.name   testBulkSubmitTransferNoDevice
     * @tc.number SUB_USB_Host_usbSubmitTransfer_Func_0300
     * @tc.desc   bulk transfer with fake pipe should throw 14400001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkSubmitTransferNoDevice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.info(`${TAG} testBulkSubmitTransferNoDevice start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkSubmitTransferNoDevice, skip`);
        return;
      }
      let pipe: usbMgr.USBDevicePipe = {
        'busNum': 0,
        'devAddress': 0
      }
      let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
      let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
      let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(pipe, flags, 129, transferType, 2000);
      try {
        usbMgr.usbSubmitTransfer(transferParams);
        expect().assertFail();
      } catch (error) {
        console.error(`${TAG} testBulkSubmitTransferNoDevice catch err: ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(14400001);
      }
    });

    /**
     * @tc.name   testBulkCancelTransferSuccess
     * @tc.number SUB_USB_Host_UsbCancelTransfer_Func_0100
     * @tc.desc   bulk transfer cancel should succeed without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBulkCancelTransferSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG} testBulkCancelTransferSuccess start`);
      if (!isDeviceConnected) {
        console.info(`${TAG} ${SKIP_TAG} testBulkCancelTransferSuccess, skip`);
        done();
        return;
      }
      await ensurePermission(testDevice!.name);
      let pipe = setupDevicePipe(testDevice!);
      let targetInterface: usbMgr.USBInterface = testDevice!.configs[0].interfaces[0];
      let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
      let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
      let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(pipe, flags, 129, transferType, 0);
      usbMgr.claimInterface(pipe, targetInterface, true);
      let callbackReceived = false;
      try {
        transferParams.callback = (err: Error, callbackData: usbMgr.SubmitTransferCallback) => {
          callbackReceived = true;
          console.info(`${TAG} callbackData: ${JSON.stringify(callbackData)}`);
          expect(callbackData.status).assertEqual(usbMgr.UsbTransferStatus.TRANSFER_CANCELED);
          expect(callbackData.actualLength).assertLargerOrEqual(0);
        }
        usbMgr.usbSubmitTransfer(transferParams);
        usbMgr.usbCancelTransfer(transferParams);
      } catch (error) {
        console.error(`${TAG} testBulkCancelTransferSuccess catch err: ${JSON.stringify(error)}`);
        expect().assertFail();
      } finally {
        teardownDevicePipe(pipe);
        done();
      }
    });

    /**
     * @tc.name   testBulkCancelTransferWithoutSubmit
     * @tc.number SUB_USB_Host_UsbCancelTransfer_ErrCode_0100
     * @tc.desc   bulk transfer cancel without submit should throw 14400011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testBulkCancelTransferWithoutSubmit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testBulkCancelTransferWithoutSubmit start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testBulkCancelTransferWithoutSubmit, skip`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe = setupDevicePipe(testDevice!);
        let targetInterface: usbMgr.USBInterface = testDevice!.configs[0].interfaces[0];
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
        let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(pipe, flags, 1, transferType, 500);
        usbMgr.claimInterface(pipe, targetInterface, true);
        try {
          usbMgr.usbCancelTransfer(transferParams);
          expect().assertFail();
        } catch (error) {
          console.error(`${TAG} testBulkCancelTransferWithoutSubmit catch err: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(14400011);
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      });

  })
}
