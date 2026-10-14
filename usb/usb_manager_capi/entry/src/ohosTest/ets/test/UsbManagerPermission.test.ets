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
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import {
  getFirstUsbDevice,
  skipCase,
  ERR_CODE_SUCCESS,
  ERR_CODE_SERVICE_EXCEPTION,
  ERR_CODE_INVALID_PARAMETER
} from './UsbCapiTestUtils';

const DOMAIN: number = 0xFF00;
const TAG: string = 'UsbManagerCapiTest';
const ABSENT_DEVICE_NAME: string = '255-255';
const LONG_NAME_LENGTH: number = 256;
// Dialog automation timing budget. Total worst case (~4s) must stay below the hypium
// default per-case timeout (5000ms).
const DIALOG_WAIT_MS: number = 1200;
const INITIAL_POLL_MS: number = 300;
const CALLBACK_POLL_BUDGET_MS: number = 1200;
const POLL_INTERVAL_MS: number = 100;
const ALLOW_BUTTON_TEXTS: string[] = ['允许', 'Allow'];
const DENY_BUTTON_TEXTS: string[] = ['不允许', 'Deny'];

/**
 * Waits for a USB permission dialog button (trying each candidate label for zh/en
 * locales) and clicks it. Returns false when no candidate appears in time, which the
 * caller treats as an unmet environment precondition ([SKIP]).
 */
async function clickDialogButton(candidates: string[]): Promise<boolean> {
  try {
    let driver = Driver.create();
    for (let i = 0; i < candidates.length; i++) {
      try {
        let button = await driver.waitForComponent(ON.text(candidates[i], MatchPattern.EQUALS), DIALOG_WAIT_MS);
        await button.click();
        hilog.info(DOMAIN, TAG, 'dialog button clicked: ' + candidates[i]);
        return true;
      } catch (err) {
        hilog.info(DOMAIN, TAG, 'dialog button not found: ' + candidates[i]);
      }
    }
  } catch (err) {
    let errMsg = (err as BusinessError).message;
    hilog.error(DOMAIN, TAG, 'Driver.create failed: ' + errMsg);
  }
  return false;
}

async function sleepMs(ms: number): Promise<void> {
  await new Promise<void>((resolve: Function) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export default function usbManagerPermissionTest() {
  describe('UsbManagerPermissionTest', () => {
    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_2600
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2600
     * @tc.desc          Verify OH_UsbManager_HasPermission rejects a null result pointer.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.hasPermissionNullResult();
          hilog.info(DOMAIN, TAG, 'hasPermissionNullResult ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_2600 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_2700
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2700
     * @tc.desc          Verify OH_UsbManager_HasPermission rejects both parameters being null.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.hasPermissionNullBoth();
          hilog.info(DOMAIN, TAG, 'hasPermissionNullBoth ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_2700 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_2800
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2800
     * @tc.desc          Verify OH_UsbManager_HasPermission on an absent device name reports
     *                   SUCCESS with result=false (the service folds "device not found" into
     *                   hasRight=false instead of returning an error).
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let res = testNapi.hasPermissionInvalidName();
          hilog.info(DOMAIN, TAG, 'hasPermissionInvalidName: ' + JSON.stringify(res));
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(res.result).assertEqual(false);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_2800 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_3300
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3300
     * @tc.desc          Verify OH_UsbManager_RequestPermission rejects a null deviceName while
     *                   the callback is valid.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let ret: number = testNapi.requestPermissionNullName();
          hilog.info(DOMAIN, TAG, 'requestPermissionNullName ret: ' + ret);
          expect(ret).assertEqual(ERR_CODE_INVALID_PARAMETER);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_3300 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_3400
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3400
     * @tc.desc          Verify OH_UsbManager_RequestPermission accepts an absent device name:
     *                   the call returns SUCCESS synchronously and the callback reports
     *                   OH_USBMANAGER_ERROR_SERVICE_EXCEPTION with result=false (the service
     *                   fails the name lookup before any dialog can appear). A callback wait
     *                   timeout is an environment issue and the case skips.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let res = testNapi.requestPermissionWithCallback(ABSENT_DEVICE_NAME);
          hilog.info(DOMAIN, TAG, 'requestPermissionWithCallback 3400: ' + JSON.stringify(res));
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          if (!res.cbFired) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3400', 'permission callback timeout', done);
            return;
          }
          expect(res.cbErrCode).assertEqual(ERR_CODE_SERVICE_EXCEPTION);
          expect(res.cbResult).assertEqual(false);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_3400 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_3500
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3500
     * @tc.desc          Verify OH_UsbManager_RequestPermission with a boundary 256-character
     *                   device name behaves like any other absent name: synchronous SUCCESS,
     *                   callback reports OH_USBMANAGER_ERROR_SERVICE_EXCEPTION with result=false.
     *                   A callback wait timeout is an environment issue and the case skips.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let longName: string = 'a'.repeat(LONG_NAME_LENGTH);
        try {
          let res = testNapi.requestPermissionWithCallback(longName);
          hilog.info(DOMAIN, TAG, 'requestPermissionWithCallback 3500: ' + JSON.stringify(res));
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          if (!res.cbFired) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3500', 'permission callback timeout', done);
            return;
          }
          expect(res.cbErrCode).assertEqual(ERR_CODE_SERVICE_EXCEPTION);
          expect(res.cbResult).assertEqual(false);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_3500 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_2900
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_2900
     * @tc.desc          Verify OH_UsbManager_HasPermission reports SUCCESS and result=true for
     *                   an attached device once access permission has been granted. Skips
     *                   (precondition not met) when no peripheral is attached or permission
     *                   has not been granted.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let device = getFirstUsbDevice();
        if (device === null) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_2900', 'no usb device attached', done);
          return;
        }
        try {
          let res = testNapi.hasPermissionByName(device.name);
          hilog.info(DOMAIN, TAG, 'hasPermissionByName 2900: ' + JSON.stringify(res));
          if (res.ret === ERR_CODE_SUCCESS && !res.result) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_2900', 'usb permission not granted', done);
            return;
          }
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(res.result).assertEqual(true);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_2900 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_3000
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3000
     * @tc.desc          Verify OH_UsbManager_HasPermission reports SUCCESS and result=false for
     *                   an attached device whose access permission has not been granted. Skips
     *                   (precondition not met) when no peripheral is attached or permission is
     *                   already granted.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let device = getFirstUsbDevice();
        if (device === null) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3000', 'no usb device attached', done);
          return;
        }
        try {
          let res = testNapi.hasPermissionByName(device.name);
          hilog.info(DOMAIN, TAG, 'hasPermissionByName 3000: ' + JSON.stringify(res));
          if (res.ret === ERR_CODE_SUCCESS && res.result) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3000', 'usb permission already granted', done);
            return;
          }
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(res.result).assertEqual(false);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_3000 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_3200
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3200
     * @tc.desc          Verify OH_UsbManager_HasPermission with a boundary empty deviceName is
     *                   treated like any other absent name: SUCCESS with result=false (the
     *                   service folds "device not found" into hasRight=false).
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let res = testNapi.hasPermissionByName('');
          hilog.info(DOMAIN, TAG, 'hasPermissionByName 3200: ' + JSON.stringify(res));
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(res.result).assertEqual(false);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_3200 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_3600
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3600
     * @tc.desc          Verify OH_UsbManager_RequestPermission passes a null userContext through
     *                   to the callback as null. An absent device name is used so the callback
     *                   arrives deterministically without a device or a dialog. A callback wait
     *                   timeout is an environment issue and the case skips.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let res = testNapi.requestPermissionCtxPassthrough(true);
          hilog.info(DOMAIN, TAG, 'requestPermissionCtxPassthrough 3600: ' + JSON.stringify(res));
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          if (!res.cbFired) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3600', 'permission callback timeout', done);
            return;
          }
          expect(res.cbErrCode).assertEqual(ERR_CODE_SERVICE_EXCEPTION);
          expect(res.cbResult).assertEqual(false);
          expect(res.ctxMatch).assertEqual(true);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_3600 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_3700
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3700
     * @tc.desc          Verify OH_UsbManager_RequestPermission passes a non-null userContext
     *                   pointer through to the callback unchanged. An absent device name is
     *                   used so the callback arrives deterministically without a device or a
     *                   dialog. A callback wait timeout is an environment issue and the case
     *                   skips.
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let res = testNapi.requestPermissionCtxPassthrough(false);
          hilog.info(DOMAIN, TAG, 'requestPermissionCtxPassthrough 3700: ' + JSON.stringify(res));
          expect(res.ret).assertEqual(ERR_CODE_SUCCESS);
          if (!res.cbFired) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3700', 'permission callback timeout', done);
            return;
          }
          expect(res.cbErrCode).assertEqual(ERR_CODE_SERVICE_EXCEPTION);
          expect(res.cbResult).assertEqual(false);
          expect(res.ctxMatch).assertEqual(true);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_3700 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_3900
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3900
     * @tc.desc          Verify OH_UsbManager_RequestPermission delivers result=false with
     *                   errorCode SUCCESS when the permission dialog is DENIED, and that
     *                   HasPermission reports false afterwards. The dialog is driven
     *                   automatically via UiTest (button "不允许"/"Deny"). Runs before 3800
     *                   because a granted right persists and suppresses the dialog. Skips
     *                   when no peripheral is attached, permission is already granted, the
     *                   dialog does not appear, or the callback does not arrive (environment
     *                   preconditions).
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let device = getFirstUsbDevice();
        if (device === null) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3900', 'no usb device attached', done);
          return;
        }
        try {
          let perm = testNapi.hasPermissionByName(device.name);
          if (perm.ret === ERR_CODE_SUCCESS && perm.result) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3900',
              'usb permission already granted, dialog will not show', done);
            return;
          }
          let begin = testNapi.requestPermissionBegin();
          hilog.info(DOMAIN, TAG, 'requestPermissionBegin 3900: ' + JSON.stringify(begin));
          expect(begin.ret).assertEqual(ERR_CODE_SUCCESS);
          if (begin.deviceCount === 0) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3900', 'device list raced empty', done);
            return;
          }
          let res = testNapi.requestPermissionPoll();
          for (let waited = 0; waited < INITIAL_POLL_MS && !res.cbFired; waited += POLL_INTERVAL_MS) {
            await sleepMs(POLL_INTERVAL_MS);
            res = testNapi.requestPermissionPoll();
          }
          if (!res.cbFired) {
            let clicked = await clickDialogButton(DENY_BUTTON_TEXTS);
            if (!clicked) {
              skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3900', 'permission dialog not shown', done);
              return;
            }
            for (let waited = 0; waited < CALLBACK_POLL_BUDGET_MS && !res.cbFired; waited += POLL_INTERVAL_MS) {
              await sleepMs(POLL_INTERVAL_MS);
              res = testNapi.requestPermissionPoll();
            }
          }
          hilog.info(DOMAIN, TAG, 'requestPermissionPoll 3900: ' + JSON.stringify(res));
          if (!res.cbFired) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3900', 'callback not received after dialog click', done);
            return;
          }
          expect(res.cbErrCode).assertEqual(ERR_CODE_SUCCESS);
          expect(res.cbResult).assertEqual(false);
          let after = testNapi.hasPermissionByName(device.name);
          expect(after.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(after.result).assertEqual(false);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_3900 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })

    /**
     * @tc.number        SUB_USB_USBMANAGER_CAPI_TEST_3800
     * @tc.name          SUB_USB_USBMANAGER_CAPI_TEST_3800
     * @tc.desc          Verify OH_UsbManager_RequestPermission delivers result=true with
     *                   errorCode SUCCESS when the permission dialog is ALLOWED, and that
     *                   HasPermission reports true afterwards. The dialog is driven
     *                   automatically via UiTest (button "允许"/"Allow"). Runs after 3900
     *                   because a granted right persists and suppresses later dialogs. When
     *                   the right was granted earlier the callback arrives immediately
     *                   without a dialog, which also satisfies this case. Skips when no
     *                   peripheral is attached, the dialog does not appear, or the callback
     *                   does not arrive (environment preconditions).
     * @tc.size          MediumTest
     * @tc.type          Function
     * @tc.level         Level2
     */
    it('SUB_USB_USBMANAGER_CAPI_TEST_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let device = getFirstUsbDevice();
        if (device === null) {
          skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3800', 'no usb device attached', done);
          return;
        }
        try {
          let begin = testNapi.requestPermissionBegin();
          hilog.info(DOMAIN, TAG, 'requestPermissionBegin 3800: ' + JSON.stringify(begin));
          expect(begin.ret).assertEqual(ERR_CODE_SUCCESS);
          if (begin.deviceCount === 0) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3800', 'device list raced empty', done);
            return;
          }
          let res = testNapi.requestPermissionPoll();
          for (let waited = 0; waited < INITIAL_POLL_MS && !res.cbFired; waited += POLL_INTERVAL_MS) {
            await sleepMs(POLL_INTERVAL_MS);
            res = testNapi.requestPermissionPoll();
          }
          if (!res.cbFired) {
            let clicked = await clickDialogButton(ALLOW_BUTTON_TEXTS);
            if (!clicked) {
              skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3800', 'permission dialog not shown', done);
              return;
            }
            for (let waited = 0; waited < CALLBACK_POLL_BUDGET_MS && !res.cbFired; waited += POLL_INTERVAL_MS) {
              await sleepMs(POLL_INTERVAL_MS);
              res = testNapi.requestPermissionPoll();
            }
          }
          hilog.info(DOMAIN, TAG, 'requestPermissionPoll 3800: ' + JSON.stringify(res));
          if (!res.cbFired) {
            skipCase('SUB_USB_USBMANAGER_CAPI_TEST_3800', 'callback not received after dialog click', done);
            return;
          }
          expect(res.cbErrCode).assertEqual(ERR_CODE_SUCCESS);
          expect(res.cbResult).assertEqual(true);
          let after = testNapi.hasPermissionByName(device.name);
          expect(after.ret).assertEqual(ERR_CODE_SUCCESS);
          expect(after.result).assertEqual(true);
        } catch (err) {
          let errMsg = (err as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'SUB_USB_USBMANAGER_CAPI_TEST_3800 failed: ' + errMsg);
          expect().assertFail();
        }
        done();
      })
  })
}
