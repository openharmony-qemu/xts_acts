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
import {
  getAttachedUsbCount,
  skipCase,
  ERR_CODE_SUCCESS,
  ERR_CODE_INVALID_PARAMETER
} from './UsbCapiTestUtils';

const DOMAIN: number = 0xFF00;
const TAG: string = 'UsbManagerCapiTest';
const DEVICE_FIELD_COUNT: number = 13;
const CONFIG_FIELD_COUNT: number = 8;
const INTERFACE_FIELD_COUNT: number = 8;
const ENDPOINT_FIELD_COUNT: number = 8;

export default function usbManagerDeviceTest() {
  describe('UsbManagerDeviceTest', () => {
    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_1000
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1000
     * @tc.desc          Verify OH_UsbManager_GetUsbDeviceList rejects a null devices pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.getUsbDeviceListNullDevices();
          hilog.info(DOMAIN, TAG, 'getUsbDeviceListNullDevices ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_1000 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_1100
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1100
     * @tc.desc          Verify OH_UsbManager_GetUsbDeviceList rejects a null deviceCount pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.getUsbDeviceListNullCount();
          hilog.info(DOMAIN, TAG, 'getUsbDeviceListNullCount ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_1100 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_1200
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1200
     * @tc.desc          Verify OH_UsbManager_GetUsbDeviceList rejects both output pointers being null.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.getUsbDeviceListNullBoth();
          hilog.info(DOMAIN, TAG, 'getUsbDeviceListNullBoth ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_1200 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_1300
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1300
     * @tc.desc          Verify OH_UsbManager_GetUsbDeviceList enumerates attached peripherals:
     *                   returns SUCCESS and a non-zero device count. Skips (precondition not
     *                   met) when no peripheral is attached.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let attachedCount: number = getAttachedUsbCount();
        if (attachedCount <= 0) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_1300', 'no usb device attached', done);
          return;
        }
        try {
          let res = testNapi.getDeviceListScalars();
          hilog.info(DOMAIN, TAG, 'getDeviceListScalars count: ' + res.count);
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(res.count > 0).assertEqual(true);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_1300 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_5300
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5300
     * @tc.desc          Verify every field of OH_UsbManager_UsbDevice/UsbConfig/UsbInterface/
     *                   UsbEndpoint is readable and satisfies fixed contracts: strings never
     *                   null, device name is "<busNum>-<devAddress>", count/pointer pairs are
     *                   consistent, endpoint direction stays in the enum domain, endpoint
     *                   interfaceId links to its parent interface, and each device exposes at
     *                   least one configuration. Skips (precondition not met) when no
     *                   peripheral is attached.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let attachedCount: number = getAttachedUsbCount();
        if (attachedCount <= 0) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5300', 'no usb device attached', done);
          return;
        }
        try {
          let res = testNapi.getDeviceListFullFieldCheck();
          hilog.info(DOMAIN, TAG, 'getDeviceListFullFieldCheck: ' + JSON.stringify(res));
          if (res.ret === ERR_CODE_SUCCESS && res.deviceCount === 0) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5300', 'device detached during enumeration', done);
            return;
          }
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(res.devCoverage).assertEqual(DEVICE_FIELD_COUNT * res.deviceCount);
          expect(res.configCountOk).assertEqual(true);
          expect(res.totalConfigs >= res.deviceCount).assertEqual(true);
          expect(res.cfgCoverage).assertEqual(CONFIG_FIELD_COUNT * res.totalConfigs);
          expect(res.totalInterfaces > 0).assertEqual(true);
          expect(res.ifCoverage).assertEqual(INTERFACE_FIELD_COUNT * res.totalInterfaces);
          expect(res.stringsNonNull).assertEqual(true);
          expect(res.nameFormatOk).assertEqual(true);
          expect(res.countPtrOk).assertEqual(true);
          if (res.totalEndpoints === 0) {
            hilog.info(DOMAIN, TAG,
              '[SKIP] SUB_USB_USBMANAGER_CAPI_TEST_5300, device exposes no endpoint, skip endpoint checks');
          } else {
            expect(res.epCoverage).assertEqual(ENDPOINT_FIELD_COUNT * res.totalEndpoints);
            expect(res.directionOk).assertEqual(true);
            expect(res.interfaceIdOk).assertEqual(true);
          }
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5300 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })
  })
}
