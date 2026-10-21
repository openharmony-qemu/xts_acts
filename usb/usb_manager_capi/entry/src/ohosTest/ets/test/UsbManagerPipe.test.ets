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
  getFirstUsbDevice,
  skipCase,
  ERR_CODE_SUCCESS,
  ERR_CODE_PERMISSION_DENIED,
  ERR_CODE_SERVICE_EXCEPTION,
  ERR_CODE_NO_DEVICE,
  ERR_CODE_IO_ERROR,
  ERR_CODE_INVALID_PARAMETER
} from './UsbCapiTestUtils';

const DOMAIN: number = 0xFF00;
const TAG: string = 'UsbManagerCapiTest';

export default function usbManagerPipeTest() {
  describe('UsbManagerPipeTest', () => {
    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_1800
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1800
     * @tc.desc          Verify OH_UsbManager_ConnectDevice rejects a null pipe pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.connectDeviceNullPipe();
          hilog.info(DOMAIN, TAG, 'connectDeviceNullPipe ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_1800 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_1900
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_1900
     * @tc.desc          Verify OH_UsbManager_ConnectDevice rejects device and pipe both being null.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.connectDeviceNullBoth();
          hilog.info(DOMAIN, TAG, 'connectDeviceNullBoth ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_1900 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_2000
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2000
     * @tc.desc          Verify OH_UsbManager_ConnectDevice rejects a device absent from the bus:
     *                   the permission precheck finds no right for an unknown device and the
     *                   result is OH_USBMANAGER_ERROR_PERMISSION_DENIED.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.connectDeviceFakeDevice();
          hilog.info(DOMAIN, TAG, 'connectDeviceFakeDevice ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_PERMISSION_DENIED);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_2000 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_2100
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2100
     * @tc.desc          Verify OH_UsbManager_ConnectDevice only consumes busNum/devAddress:
     *                   garbage in every other field must not change the result, which stays
     *                   identical to the fake-device baseline case.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.connectDeviceGarbageFields();
          hilog.info(DOMAIN, TAG, 'connectDeviceGarbageFields ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_PERMISSION_DENIED);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_2100 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_2200
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2200
     * @tc.desc          Verify OH_UsbManager_ConnectDevice with boundary busNum=0/devAddress=0
     *                   rejects the nonexistent device the same way as other absent devices.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.connectDeviceBoundaryZero();
          hilog.info(DOMAIN, TAG, 'connectDeviceBoundaryZero ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_PERMISSION_DENIED);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_2200 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_4100
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4100
     * @tc.desc          Verify OH_UsbManager_GetFileDescriptor rejects a null fd pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.getFileDescriptorNullFd();
          hilog.info(DOMAIN, TAG, 'getFileDescriptorNullFd ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_4100 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_4200
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4200
     * @tc.desc          Verify OH_UsbManager_GetFileDescriptor rejects a pipe that was not
     *                   obtained from OH_UsbManager_ConnectDevice: the unknown device fails the
     *                   permission precheck and maps to OH_USBMANAGER_ERROR_PERMISSION_DENIED.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.getFileDescriptorFakePipe();
          hilog.info(DOMAIN, TAG, 'getFileDescriptorFakePipe ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_PERMISSION_DENIED);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_4200 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_4800
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4800
     * @tc.desc          Verify OH_UsbManager_ClosePipe rejects a pipe that was not obtained from
     *                   OH_UsbManager_ConnectDevice: the unknown device fails the permission
     *                   precheck and maps to OH_USBMANAGER_ERROR_PERMISSION_DENIED.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.closePipeFakePipe();
          hilog.info(DOMAIN, TAG, 'closePipeFakePipe ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_PERMISSION_DENIED);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_4800 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_2300
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2300
     * @tc.desc          Verify OH_UsbManager_ConnectDevice on an attached device returns
     *                   OH_USBMANAGER_ERROR_PERMISSION_DENIED when access permission has not
     *                   been granted. Skips (precondition not met) when no peripheral is
     *                   attached or permission is already granted.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let device = getFirstUsbDevice();
        if (device === null) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_2300', 'no usb device attached', done);
          return;
        }
        try {
          let perm = testNapi.hasPermissionByName(device.name);
          if (perm.ret === ERR_CODE_SUCCESS && perm.result) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_2300', 'usb permission already granted', done);
            return;
          }
          let ret: number = testNapi.connectDeviceByAddr(device.busNum, device.devAddress);
          hilog.info(DOMAIN, TAG, 'connectDeviceByAddr 2300 ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_PERMISSION_DENIED);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_2300 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_4300
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4300
     * @tc.desc          Verify OH_UsbManager_GetFileDescriptor on a freshly opened pipe returns
     *                   SUCCESS and a valid fd, and that OH_UsbManager_ClosePipe releases it.
     *                   Skips (precondition not met) when no peripheral is attached, no
     *                   permission is granted, or the device detaches mid-run.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let attachedCount: number = getAttachedUsbCount();
        if (attachedCount <= 0) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4300', 'no usb device attached', done);
          return;
        }
        try {
          let res = testNapi.getFileDescriptorFlow();
          hilog.info(DOMAIN, TAG, 'getFileDescriptorFlow: ' + JSON.stringify(res));
          if (res.ret === ERR_CODE_PERMISSION_DENIED) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4300', 'no usb permission granted', done);
            return;
          }
          if (res.ret === ERR_CODE_NO_DEVICE || res.ret === ERR_CODE_IO_ERROR) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4300', 'device detached during connect', done);
            return;
          }
          if (res.ret === ERR_CODE_SUCCESS && res.deviceCount === 0) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4300', 'device list raced empty', done);
            return;
          }
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          if (res.ret === ERR_CODE_SUCCESS) {
            expect(res.fdRet).assertEqual(ERR_CODE_SUCCESS);
            expect(res.fd >= 0).assertEqual(true);
            expect(res.closeRet).assertEqual(ERR_CODE_SUCCESS);
          }
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_4300 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_4400
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4400
     * @tc.desc          Verify OH_UsbManager_GetFileDescriptor on a pipe that was already closed
     *                   fails with OH_USBMANAGER_ERROR_SERVICE_EXCEPTION while the device is
     *                   still present, enforcing state isolation after OH_UsbManager_ClosePipe.
     *                   NO_DEVICE is only expected when the device has detached. Skips
     *                   (precondition not met) when no peripheral is attached, no permission
     *                   is granted, or the device detaches mid-run.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let attachedCount: number = getAttachedUsbCount();
        if (attachedCount <= 0) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4400', 'no usb device attached', done);
          return;
        }
        try {
          let res = testNapi.getFileDescriptorAfterClose();
          hilog.info(DOMAIN, TAG, 'getFileDescriptorAfterClose: ' + JSON.stringify(res));
          if (res.ret === ERR_CODE_PERMISSION_DENIED) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4400', 'no usb permission granted', done);
            return;
          }
          if (res.ret === ERR_CODE_NO_DEVICE || res.ret === ERR_CODE_IO_ERROR) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4400', 'device detached during connect', done);
            return;
          }
          if (res.ret === ERR_CODE_SUCCESS && res.deviceCount === 0) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4400', 'device list raced empty', done);
            return;
          }
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(res.closeRet).assertEqual(ERR_CODE_SUCCESS);
          expect(res.fdRet).assertEqual(ERR_CODE_SERVICE_EXCEPTION);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_4400 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_4600
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_4600
     * @tc.desc          Verify OH_UsbManager_GetFileDescriptor on an attached device returns
     *                   OH_USBMANAGER_ERROR_PERMISSION_DENIED when access permission has not
     *                   been granted. Skips (precondition not met) when no peripheral is
     *                   attached or permission is already granted.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let device = getFirstUsbDevice();
        if (device === null) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4600', 'no usb device attached', done);
          return;
        }
        try {
          let perm = testNapi.hasPermissionByName(device.name);
          if (perm.ret === ERR_CODE_SUCCESS && perm.result) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_4600', 'usb permission already granted', done);
            return;
          }
          let ret: number = testNapi.getFileDescriptorByAddr(device.busNum, device.devAddress);
          hilog.info(DOMAIN, TAG, 'getFileDescriptorByAddr 4600 ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_PERMISSION_DENIED);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_4600 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_5100
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5100
     * @tc.desc          Verify OH_UsbManager_ClosePipe on an attached device returns
     *                   OH_USBMANAGER_ERROR_PERMISSION_DENIED when access permission has not
     *                   been granted. Skips (precondition not met) when no peripheral is
     *                   attached or permission is already granted.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let device = getFirstUsbDevice();
        if (device === null) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5100', 'no usb device attached', done);
          return;
        }
        try {
          let perm = testNapi.hasPermissionByName(device.name);
          if (perm.ret === ERR_CODE_SUCCESS && perm.result) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5100', 'usb permission already granted', done);
            return;
          }
          let ret: number = testNapi.closePipeByAddr(device.busNum, device.devAddress);
          hilog.info(DOMAIN, TAG, 'closePipeByAddr 5100 ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_PERMISSION_DENIED);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5100 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_5400
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_5400
     * @tc.desc          Verify OH_UsbManager_ConnectDevice fills OH_UsbManager_UsbPipe with the
     *                   same busNum/devAddress that were passed in, and that
     *                   OH_UsbManager_ClosePipe succeeds on the opened pipe. Skips (precondition
     *                   not met) when no peripheral is attached, no permission is granted, or
     *                   the device detaches mid-run.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let attachedCount: number = getAttachedUsbCount();
        if (attachedCount <= 0) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5400', 'no usb device attached', done);
          return;
        }
        try {
          let res = testNapi.connectDevicePipeEcho();
          hilog.info(DOMAIN, TAG, 'connectDevicePipeEcho: ' + JSON.stringify(res));
          if (res.ret === ERR_CODE_PERMISSION_DENIED) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5400', 'no usb permission granted', done);
            return;
          }
          if (res.ret === ERR_CODE_NO_DEVICE || res.ret === ERR_CODE_IO_ERROR) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5400', 'device detached during connect', done);
            return;
          }
          if (res.ret === ERR_CODE_SUCCESS && res.deviceCount === 0) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_5400', 'device list raced empty', done);
            return;
          }
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          if (res.ret === ERR_CODE_SUCCESS) {
            expect(res.pipeBus).assertEqual(res.inBus);
            expect(res.pipeAddr).assertEqual(res.inAddr);
            expect(res.closeRet).assertEqual(ERR_CODE_SUCCESS);
          }
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_5400 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })
  })
}
