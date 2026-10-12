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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { BusinessError } from '@kit.BasicServicesKit';
import usbManager from '@ohos.usbManager';
import {
  skipCase,
  ERR_CODE_SUCCESS,
  ERR_CODE_PERMISSION_DENIED,
  ERR_CODE_NO_DEVICE,
  ERR_CODE_IO_ERROR
} from './UsbCapiTestUtils';

const DOMAIN: number = 0xFF00;
const TAG: string = 'UsbManagerCapiTest';

export default function usbManagerCompareTest() {
  describe('UsbManagerCompareTest', () => {
    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_5500
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5500
     * @tc.desc          Diff OH_UsbManager_GetUsbDeviceList against the native ArkTS
     *                   usbManager.getDevices(): same device count, and for every device the
     *                   same busNum/devAddress/name/manufacturerName/productName/version/
     *                   vendorId/productId/clazz/subClass/protocol (ArkTS serial is not
     *                   compared). Skips (precondition not met) when no peripheral is attached.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let arktsDevices: usbManager.USBDevice[] = [];
        try {
          arktsDevices = usbManager.getDevices();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5500 getDevices failed: ' + errMsg);
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5500', 'cannot enumerate via arkts', done);
          return;
        }
        if (arktsDevices.length === 0) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5500', 'no usb device attached', done);
          return;
        }
        try {
          let res = testNapi.getDeviceListScalars();
          hilog.info(DOMAIN, TAG, 'getDeviceListScalars: ' + JSON.stringify(res));
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(res.count).assertEqual(arktsDevices.length);
          for (let i = 0; i < res.list.length; i++) {
            let capiDev = res.list[i];
            let matched = arktsDevices.filter((item: usbManager.USBDevice) =>
              item.busNum === capiDev.busNum && item.devAddress === capiDev.devAddress);
            expect(matched.length).assertEqual(1);
            if (matched.length !== 1) {
              continue;
            }
            let arktsDev = matched[0];
            expect(capiDev.name).assertEqual(arktsDev.name);
            expect(capiDev.manufacturerName).assertEqual(arktsDev.manufacturerName);
            expect(capiDev.productName).assertEqual(arktsDev.productName);
            expect(capiDev.version).assertEqual(arktsDev.version);
            expect(capiDev.vendorId).assertEqual(arktsDev.vendorId);
            expect(capiDev.productId).assertEqual(arktsDev.productId);
            expect(capiDev.clazz).assertEqual(arktsDev.clazz);
            expect(capiDev.subClass).assertEqual(arktsDev.subClass);
            expect(capiDev.protocol).assertEqual(arktsDev.protocol);
          }
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5500 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_5600
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5600
     * @tc.desc          Diff OH_UsbManager_HasPermission against the native ArkTS
     *                   usbManager.hasRight() for the same device name: both sides must agree
     *                   on the boolean result regardless of the current grant state. Skips
     *                   (precondition not met) when no peripheral is attached.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let arktsDevices: usbManager.USBDevice[] = [];
        try {
          arktsDevices = usbManager.getDevices();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5600 getDevices failed: ' + errMsg);
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5600', 'cannot enumerate via arkts', done);
          return;
        }
        if (arktsDevices.length === 0) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5600', 'no usb device attached', done);
          return;
        }
        try {
          let deviceName: string = arktsDevices[0].name;
          let arktsRight: boolean = usbManager.hasRight(deviceName);
          let res = testNapi.hasPermissionByName(deviceName);
          hilog.info(DOMAIN, TAG,
            'SUB_USB_USBMANAGER_CAPI_TEST_5600 capi: ' + JSON.stringify(res) + ' arkts: ' + arktsRight);
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(res.result).assertEqual(arktsRight);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5600 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_5700
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5700
     * @tc.desc          Diff OH_UsbManager_ConnectDevice against the native ArkTS
     *                   usbManager.connectDevice() for the same device: both sides must agree
     *                   on the outcome category (success, or permission-denied which is
     *                   numerically 14400001 on both sides per the documented mapping), and on
     *                   success the pipe busNum/devAddress must match. Skips (precondition not
     *                   met) when no peripheral is attached or the device detaches mid-run.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let arktsDevices: usbManager.USBDevice[] = [];
        try {
          arktsDevices = usbManager.getDevices();
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5700 getDevices failed: ' + errMsg);
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5700', 'cannot enumerate via arkts', done);
          return;
        }
        if (arktsDevices.length === 0) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5700', 'no usb device attached', done);
          return;
        }
        let target = arktsDevices[0];
        let capiRet: number = -1;
        let capiPipeBus: number = -1;
        let capiPipeAddr: number = -1;
        let capiCloseRet: number = -1;
        let arktsOk: boolean = false;
        let arktsCode: number = 0;
        let arktsBus: number = -1;
        let arktsAddr: number = -1;
        let arktsCloseRet: number = -1;
        try {
          let res = testNapi.connectDevicePipeEchoByAddr(target.busNum, target.devAddress);
          hilog.info(DOMAIN, TAG, 'connectDevicePipeEchoByAddr 5700: ' + JSON.stringify(res));
          capiRet = res.ret;
          capiPipeBus = res.pipeBus;
          capiPipeAddr = res.pipeAddr;
          capiCloseRet = res.closeRet;
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5700 capi failed: ' + errMsg);
          expect().assertFail();
          done();
          return;
        }
        if (capiRet === ERR_CODE_NO_DEVICE || capiRet === ERR_CODE_IO_ERROR) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5700', 'device detached during connect', done);
          return;
        }
        try {
          let pipe = usbManager.connectDevice(target);
          arktsOk = true;
          arktsBus = pipe.busNum;
          arktsAddr = pipe.devAddress;
          arktsCloseRet = usbManager.closePipe(pipe);
        } catch (err) {
          arktsCode = (err as BusinessError).code;
          hilog.info(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5700 arkts code: ' + arktsCode);
        }
        try {
          expect(arktsOk).assertEqual(capiRet === ERR_CODE_SUCCESS);
          if (capiRet === ERR_CODE_PERMISSION_DENIED) {
            expect(arktsCode).assertEqual(ERR_CODE_PERMISSION_DENIED);
          }
          if (capiRet === ERR_CODE_SUCCESS && arktsOk) {
            expect(capiPipeBus).assertEqual(arktsBus);
            expect(capiPipeAddr).assertEqual(arktsAddr);
            expect(capiCloseRet).assertEqual(ERR_CODE_SUCCESS);
            expect(arktsCloseRet).assertEqual(0);
          }
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5700 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })
  })
}
