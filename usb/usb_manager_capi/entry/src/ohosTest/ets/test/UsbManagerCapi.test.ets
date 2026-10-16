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

const DOMAIN: number = 0xFF00;
const TAG: string = 'UsbManagerCapiTest';
const SKIP_TAG: string = '[SKIP]';
const ERR_CODE_SUCCESS: number = 0;
const ERR_CODE_INVALID_PARAMETER: number = 14400014;
const ERROR_CODE_ENUM: number[] = [0, 14400001, 14400004, 14400008, 14400009, 14400012, 14400014];
const REQUEST_DIRECTION_ENUM: number[] = [0, 128];

export default function usbManagerCapiTest() {
  describe('UsbManagerCapiTest', () => {
    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_0100
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_0100
     * @tc.desc          Verify OH_UsbManager_GetUsbDeviceList returns an empty list without a peripheral.
     *                   Skips (precondition not met) when a peripheral is attached.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level0
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let attachedCount: number = -1;
        try {
          attachedCount = usbManager.getDevices().length;
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'getDevices failed: ' + errMsg);
          hilog.info(DOMAIN, TAG, SKIP_TAG + ' SUB_USB_USBMANAGER_CAPI_TEST_0100, cannot detect peripheral, skip');
          done();
          return;
        }
        if (attachedCount > 0) {
          hilog.info(DOMAIN, TAG, SKIP_TAG + ' SUB_USB_USBMANAGER_CAPI_TEST_0100, peripheral attached, skip');
          done();
          return;
        }
        try {
          let deviceCount: number = testNapi.getUsbDeviceListNoDevice();
          hilog.info(DOMAIN, TAG, 'getUsbDeviceListNoDevice deviceCount: ' + deviceCount);
          expect(deviceCount).assertEqual(ERR_CODE_SUCCESS);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_0100 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_0200
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_0200
     * @tc.desc          Verify OH_UsbManager_FreeUsbDeviceList is a safe no-op for a null array,
     *                   including boundary deviceCount values 255 and 256.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level0
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let ret: number = testNapi.freeUsbDeviceListSafeNoop();
          hilog.info(DOMAIN, TAG, 'freeUsbDeviceListSafeNoop ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_SUCCESS);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_0200 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_0300
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_0300
     * @tc.desc          Verify OH_UsbManager_ConnectDevice rejects a null device pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level0
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let ret: number = testNapi.connectDeviceNullDevice();
          hilog.info(DOMAIN, TAG, 'connectDeviceNullDevice ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_0300 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_0400
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_0400
     * @tc.desc          Verify OH_UsbManager_HasPermission rejects a null device name pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level0
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let ret: number = testNapi.hasPermissionNullDeviceName();
          hilog.info(DOMAIN, TAG, 'hasPermissionNullDeviceName ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_0400 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_0500
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_0500
     * @tc.desc          Verify OH_UsbManager_RequestPermission rejects a null callback pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level0
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let ret: number = testNapi.requestPermissionNullCallback();
          hilog.info(DOMAIN, TAG, 'requestPermissionNullCallback ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_0500 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_0600
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_0600
     * @tc.desc          Verify OH_UsbManager_GetFileDescriptor rejects a null pipe pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level0
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let ret: number = testNapi.getFileDescriptorNullPipe();
          hilog.info(DOMAIN, TAG, 'getFileDescriptorNullPipe ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_0600 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_0700
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_0700
     * @tc.desc          Verify OH_UsbManager_ClosePipe rejects a null pipe pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level0
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let ret: number = testNapi.closePipeNullPipe();
          hilog.info(DOMAIN, TAG, 'closePipeNullPipe ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_0700 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_0800
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_0800
     * @tc.desc          Verify the numeric values of OH_UsbManager_ErrorCode.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level0
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let codes: number[] = testNapi.errorCodeEnumValues();
          hilog.info(DOMAIN, TAG, 'errorCodeEnumValues: ' + JSON.stringify(codes));
          expect(codes.length).assertEqual(ERROR_CODE_ENUM.length);
          for (let i = 0; i < ERROR_CODE_ENUM.length; i++) {
            expect(codes[i]).assertEqual(ERROR_CODE_ENUM[i]);
          }
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_0800 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_0900
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_0900
     * @tc.desc          Verify the numeric values of OH_UsbManager_RequestDirection.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level0
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let directions: number[] = testNapi.requestDirectionEnumValues();
          hilog.info(DOMAIN, TAG, 'requestDirectionEnumValues: ' + JSON.stringify(directions));
          expect(directions.length).assertEqual(REQUEST_DIRECTION_ENUM.length);
          for (let i = 0; i < REQUEST_DIRECTION_ENUM.length; i++) {
            expect(directions[i]).assertEqual(REQUEST_DIRECTION_ENUM[i]);
          }
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_0900 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })
  })
}
