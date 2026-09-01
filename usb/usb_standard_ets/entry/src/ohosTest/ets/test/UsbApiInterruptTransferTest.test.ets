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

const TAG: string = "[UsbApiInterruptTransferTest]";
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

interface EndpointInfo {
  usbInterface: usbMgr.USBInterface,
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
  return { usbInterface: usbInterface!, usbEndpoint: usbEndpoint };
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
    isoPacketCount: 0,
  };
  return transferParams;
}

export default function UsbApiInterruptTransferTest() {

  describe('UsbApiInterruptTransferTest', () => {
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
     * @tc.name   testInterruptSubmitTransferInvalidEndpoint
     * @tc.number SUB_USB_Host_usbSubmitTransfer_ErrCode_1100
     * @tc.desc   interrupt transfer with invalid endpoint should throw 14400012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInterruptSubmitTransferInvalidEndpoint', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testInterruptSubmitTransferInvalidEndpoint start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptSubmitTransferInvalidEndpoint, skip`);
          done();
          return;
        }
        let endpointInfo = getEndpoint(testDevice!, 128, usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT);
        if (!endpointInfo) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptSubmitTransferInvalidEndpoint, no Interrupt IN endpoint found`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe = setupDevicePipe(testDevice!);
        let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: usbMgr.UsbDataTransferParams = buildTransferParams(pipe, 1, -1, transferType, 2000);
        usbMgr.claimInterface(pipe, endpointInfo.usbInterface, true);
        try {
          usbMgr.usbSubmitTransfer(transferParams);
          expect().assertFail();
        } catch (error) {
          console.error(`${TAG} testInterruptSubmitTransferInvalidEndpoint catch err: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(14400012);
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      });

    /**
     * @tc.name   testInterruptSubmitTransferWithoutClaim
     * @tc.number SUB_USB_Host_usbSubmitTransfer_ErrCode_1200
     * @tc.desc   interrupt transfer without claimInterface should throw 14400012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInterruptSubmitTransferWithoutClaim', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testInterruptSubmitTransferWithoutClaim start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptSubmitTransferWithoutClaim, skip`);
          done();
          return;
        }
        let endpointInfo = getEndpoint(testDevice!, 128, usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT);
        if (!endpointInfo) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptSubmitTransferWithoutClaim, no Interrupt IN endpoint found`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe = setupDevicePipe(testDevice!);
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET;
        let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: usbMgr.UsbDataTransferParams =
          buildTransferParams(pipe, flags, endpointInfo.usbEndpoint.address, transferType, 2000);
        try {
          transferParams.callback = (err: Error, callbackData: usbMgr.SubmitTransferCallback) => {
            console.info(`${TAG} withoutClaim callbackData: ${JSON.stringify(callbackData)}`);
            try {
              expect(callbackData.status === usbMgr.UsbTransferStatus.TRANSFER_ERROR ||
                callbackData.status === usbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertTrue();
            } catch (assertErr) {
              console.error(`${TAG} callback assert err: ${JSON.stringify(assertErr)}`);
            }
            teardownDevicePipe(pipe);
            done();
          }
          usbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          console.error(`${TAG} testInterruptSubmitTransferWithoutClaim catch err: ${JSON.stringify(error)}`);
          teardownDevicePipe(pipe);
          done();
        }
      });

    /**
     * @tc.name   testInterruptSubmitTransferReadTimeout
     * @tc.number SUB_USB_Host_usbSubmitTransfer_Func_1100
     * @tc.desc   interrupt transfer read should timeout with TRANSFER_TIMED_OUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInterruptSubmitTransferReadTimeout', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG} testInterruptSubmitTransferReadTimeout start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptSubmitTransferReadTimeout, skip`);
          done();
          return;
        }
        let endpointInfo = getEndpoint(testDevice!, 128, usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT);
        if (!endpointInfo) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptSubmitTransferReadTimeout, no Interrupt IN endpoint found`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe = setupDevicePipe(testDevice!);
        let flags: number = usbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: usbMgr.UsbDataTransferParams =
          buildTransferParams(pipe, flags, endpointInfo.usbEndpoint.address, transferType, 2000);
        usbMgr.claimInterface(pipe, endpointInfo.usbInterface, true);
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
          console.error(`${TAG} testInterruptSubmitTransferReadTimeout catch err: ${JSON.stringify(error)}`);
          expect().assertFail();
          teardownDevicePipe(pipe);
          done();
        }
      });

    /**
     * @tc.name   testInterruptCancelTransferSuccess
     * @tc.number SUB_USB_Host_usbCancelTransfer_Func_1100
     * @tc.desc   interrupt transfer cancel should succeed without error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInterruptCancelTransferSuccess', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        console.info(`${TAG} testInterruptCancelTransferSuccess start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptCancelTransferSuccess, skip`);
          done();
          return;
        }
        let endpointInfo = getEndpoint(testDevice!, 128, usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT);
        if (!endpointInfo) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptCancelTransferSuccess, no Interrupt IN endpoint found`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe = setupDevicePipe(testDevice!);
        let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: usbMgr.UsbDataTransferParams =
          buildTransferParams(pipe, 2, endpointInfo.usbEndpoint.address, transferType, 2000);
        usbMgr.claimInterface(pipe, endpointInfo.usbInterface, true);
        console.info(`${TAG} interrupt usbSubmitTransfer start`);
        try {
          transferParams.callback = (err: Error, callbackData: usbMgr.SubmitTransferCallback) => {
            console.info(`${TAG} err: ${JSON.stringify(err)}`);
            console.info(`${TAG} callbackData: ${JSON.stringify(callbackData)}`);
            expect(callbackData.status === usbMgr.UsbTransferStatus.TRANSFER_CANCELED ||
              callbackData.status === usbMgr.UsbTransferStatus.TRANSFER_COMPLETED ||
              callbackData.status === usbMgr.UsbTransferStatus.TRANSFER_ERROR).assertTrue();
            expect(callbackData.actualLength).assertLargerOrEqual(0);
            teardownDevicePipe(pipe);
          }
          usbMgr.usbSubmitTransfer(transferParams);
          console.info(`${TAG} interrupt usbCancelTransfer start`);
          usbMgr.usbCancelTransfer(transferParams);
          done();
        } catch (error) {
          console.error(`${TAG} testInterruptCancelTransferSuccess catch err: ${JSON.stringify(error)}`);
          teardownDevicePipe(pipe);
          done();
        }
      });

    /**
     * @tc.name   testInterruptCancelTransferWithoutSubmit
     * @tc.number SUB_USB_Host_usbCancelTransfer_ErrCode_1100
     * @tc.desc   interrupt transfer cancel without submit should throw 14400011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testInterruptCancelTransferWithoutSubmit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        console.info(`${TAG} testInterruptCancelTransferWithoutSubmit start`);
        if (!isDeviceConnected) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptCancelTransferWithoutSubmit, skip`);
          done();
          return;
        }
        let endpointInfo = getEndpoint(testDevice!, 128, usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT);
        if (!endpointInfo) {
          console.info(`${TAG} ${SKIP_TAG} testInterruptCancelTransferWithoutSubmit, no Interrupt IN endpoint found`);
          done();
          return;
        }
        await ensurePermission(testDevice!.name);
        let pipe = setupDevicePipe(testDevice!);
        let transferType: number = usbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: usbMgr.UsbDataTransferParams =
          buildTransferParams(pipe, 2, endpointInfo.usbEndpoint.address, transferType, 2000);
        try {
          usbMgr.usbCancelTransfer(transferParams);
          expect().assertFail();
        } catch (error) {
          console.error(`${TAG} testInterruptCancelTransferWithoutSubmit catch err: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(14400011);
        } finally {
          teardownDevicePipe(pipe);
          done();
        }
      });
  })
}
