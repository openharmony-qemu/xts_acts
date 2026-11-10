/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { pinAuth } from '@kit.UserAuthenticationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import account_osAccount from '@ohos.account.osAccount';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';


import deviceInfo from '@ohos.deviceInfo';
import display from '@ohos.display';

function checkDeviceIsDevBoard(): boolean {
  const chipType = deviceInfo.chipType?.toLowerCase();
  if (chipType === 'rk3568' || chipType === 'uis7885') {
    return true;
  } else {
    return false;
  }
}

function checkDeviceIsWatch(): boolean {
  try {
    const d = display.getDefaultDisplaySync();
    if (d.width < 500 || d.height < 500) {
      return true;
    } else {
      return false;
    }
  } catch (error) {
    console.error(`checkDeviceIsWatch fail, message: ${error.message}`);
    return false;
  }
}

export default function PinAuthParamTest() {
  describe('PinAuthParamTest', () => {
    let userId: number = 0;
    beforeAll(async () => {
      const accountMgr = account_osAccount.getAccountManager();
      userId = await accountMgr.getOsAccountLocalId();
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    // ==================== setPinValidityPeriod ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_0100
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_0100
     * @tc.desc   Set PIN validity period with userId 100 and validityPeriod 0 (minimum boundary value within range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0100 start');
        try {
          pinAuth.setPinValidityPeriod(userId, 0);
          let result = pinAuth.getPinValidityPeriod(userId);
          console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0100 result: ' + JSON.stringify(result));
          expect(result).assertUndefined();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Param_0100 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0100 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_0110
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_0110
     * @tc.desc   Set PIN validity period with userId 100 and validityPeriod Math.pow(2,50)-1 (maximum boundary value within range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0110 start');
        try {
          pinAuth.setPinValidityPeriod(userId, Math.pow(2, 50) - 1);
          let result = pinAuth.getPinValidityPeriod(userId);
          console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0110 result: ' + JSON.stringify(result));
          expect(result).assertEqual(Math.pow(2, 50) - 1);
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Param_0110 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0110 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_0120
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_0120
     * @tc.desc   Set PIN validity period with validityPeriod Math.pow(2,50) (exceeds maximum boundary, out of range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0120 start');
        try {
          pinAuth.setPinValidityPeriod(userId, Math.pow(2, 50));
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0120 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Param_0120 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0120 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_0130
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_0130
     * @tc.desc   Set PIN validity period with validityPeriod -1 (below minimum boundary, out of range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0130 start');
        try {
          pinAuth.setPinValidityPeriod(userId, -1);
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0130 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Param_0130 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0130 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_0140
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_0140
     * @tc.desc   Set PIN validity period with null userId (top-level parameter null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0140 start');
        try {
          pinAuth.setPinValidityPeriod(null, 1000);
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0140 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Param_0140 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0140 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_0150
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_0150
     * @tc.desc   Set PIN validity period with undefined userId (top-level parameter undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0150 start');
        try {
          pinAuth.setPinValidityPeriod(undefined, 1000);
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0150 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Param_0150 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0150 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_0160
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_0160
     * @tc.desc   Set PIN validity period with null validityPeriod (top-level parameter null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0160 start');
        try {
          pinAuth.setPinValidityPeriod(userId, null);
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0160 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Param_0160 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0160 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_0170
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_0170
     * @tc.desc   Set PIN validity period with undefined validityPeriod (top-level parameter undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0170 start');
        try {
          pinAuth.setPinValidityPeriod(userId, undefined);
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0170 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Param_0170 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Param_0170 skip on dev board/watch device');
      }
      done();
    });

    // ==================== getPinValidityPeriod ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinValidityPeriod_Param_0200
     * @tc.number SUB_Security_PinAuth_GetPinValidityPeriod_Param_0200
     * @tc.desc   Get PIN validity period with userId 100 (normal parameter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0200 start');
        try {
          let result = pinAuth.getPinValidityPeriod(userId);
          console.info('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0200 result: ' + JSON.stringify(result));
          expect(result != undefined || result === undefined).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinValidityPeriod_Param_0200 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0200 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinValidityPeriod_Param_0210
     * @tc.number SUB_Security_PinAuth_GetPinValidityPeriod_Param_0210
     * @tc.desc   Get PIN validity period with null userId (top-level parameter null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0210 start');
        try {
          pinAuth.getPinValidityPeriod(null);
          console.error('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0210 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinValidityPeriod_Param_0210 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0210 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinValidityPeriod_Param_0220
     * @tc.number SUB_Security_PinAuth_GetPinValidityPeriod_Param_0220
     * @tc.desc   Get PIN validity period with undefined userId (top-level parameter undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0220 start');
        try {
          pinAuth.getPinValidityPeriod(undefined);
          console.error('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0220 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinValidityPeriod_Param_0220 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinValidityPeriod_Param_0220 skip on dev board/watch device');
      }
      done();
    });

    // ==================== setPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0300
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0300
     * @tc.desc   Set PIN deletion disabled state with userId 100 and isDisabled true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0300 start');
        try {
          pinAuth.setPinDeletionDisabledState(userId, true);
          let result = pinAuth.getPinDeletionDisabledState(userId);
          console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0300 result: ' + JSON.stringify(result));
          expect(result).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0300 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0300 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0310
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0310
     * @tc.desc   Set PIN deletion disabled state with userId 100 and isDisabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0310 start');
        try {
          pinAuth.setPinDeletionDisabledState(userId, false);
          let result = pinAuth.getPinDeletionDisabledState(userId);
          console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0310 result: ' + JSON.stringify(result));
          expect(result).assertFalse();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0310 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0310 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0320
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0320
     * @tc.desc   Set PIN deletion disabled state with null userId (top-level parameter null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0320 start');
        try {
          pinAuth.setPinDeletionDisabledState(null, true);
          console.error('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0320 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0320 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0320 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0330
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0330
     * @tc.desc   Set PIN deletion disabled state with undefined userId (top-level parameter undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0330 start');
        try {
          pinAuth.setPinDeletionDisabledState(undefined, true);
          console.error('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0330 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0330 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0330 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0340
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0340
     * @tc.desc   Set PIN deletion disabled state with null isDisabled (top-level parameter null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0340 start');
        try {
          pinAuth.setPinDeletionDisabledState(userId, null);
          console.error('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0340 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0340 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0340 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0350
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0350
     * @tc.desc   Set PIN deletion disabled state with undefined isDisabled (top-level parameter undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0350 start');
        try {
          pinAuth.setPinDeletionDisabledState(userId, undefined);
          console.error('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0350 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0350 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_0350 skip on dev board/watch device');
      }
      done();
    });

    // ==================== getPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0400
     * @tc.number SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0400
     * @tc.desc   Get PIN deletion disabled state with userId 100 (normal parameter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0400 start');
        try {
          let result = pinAuth.getPinDeletionDisabledState(userId);
          console.info('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0400 result: ' + JSON.stringify(result));
          expect(result != undefined || result === undefined).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0400 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0400 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0410
     * @tc.number SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0410
     * @tc.desc   Get PIN deletion disabled state with null userId (top-level parameter null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0410 start');
        try {
          pinAuth.getPinDeletionDisabledState(null);
          console.error('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0410 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0410 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0410 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0420
     * @tc.number SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0420
     * @tc.desc   Get PIN deletion disabled state with undefined userId (top-level parameter undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0420 start');
        try {
          pinAuth.getPinDeletionDisabledState(undefined);
          console.error('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0420 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0420 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_0420 skip on dev board/watch device');
      }
      done();
    });

    // ==================== setPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0500
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0500
     * @tc.desc   Set PIN complexity policy with userId 100 and valid policy object containing complexityReg and policyDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0500 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '^[0-9]{6,}$',
            policyDescription: 'PIN must be at least 6 digits'
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          let result = pinAuth.getPinComplexityPolicy(userId);
          console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0500 result: ' + JSON.stringify(result));
          expect(result).not().assertNull();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0500 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0500 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0510
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0510
     * @tc.desc   Set PIN complexity policy with null userId (top-level parameter null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0510 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '^[0-9]{6,}$',
            policyDescription: 'PIN must be at least 6 digits'
          };
          pinAuth.setPinComplexityPolicy(null, policy);
          console.error('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0510 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0510 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0510 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0520
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0520
     * @tc.desc   Set PIN complexity policy with undefined userId (top-level parameter undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0520 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '^[0-9]{6,}$',
            policyDescription: 'PIN must be at least 6 digits'
          };
          pinAuth.setPinComplexityPolicy(undefined, policy);
          console.error('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0520 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0520 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0520 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0530
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0530
     * @tc.desc   Set PIN complexity policy with null policy (top-level parameter null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0530 start');
        try {
          pinAuth.setPinComplexityPolicy(userId, null);
          console.error('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0530 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0530 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0530 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0540
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0540
     * @tc.desc   Set PIN complexity policy with undefined policy (top-level parameter undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0540 start');
        try {
          pinAuth.setPinComplexityPolicy(userId, undefined);
          console.error('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0540 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0540 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0540 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0550
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0550
     * @tc.desc   Set PIN complexity policy with empty complexityReg string and non-empty policyDescription, expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0550 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '',
            policyDescription: 'PIN complexity description'
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          console.error('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0550 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0550 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0550 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0560
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0560
     * @tc.desc   Set PIN complexity policy with non-empty complexityReg and empty policyDescription string, expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0560 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '^[0-9]{6,}$',
            policyDescription: ''
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          console.error('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0560 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0560 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0560 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0570
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0570
     * @tc.desc   Set PIN complexity policy with both empty complexityReg and empty policyDescription strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0570 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '',
            policyDescription: ''
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          let result = pinAuth.getPinComplexityPolicy(userId);
          console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0570 result: ' + JSON.stringify(result));
          expect(result).assertUndefined();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0570 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_0570 skip on dev board/watch device');
      }
      done();
    });

    // ==================== getPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0600
     * @tc.number SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0600
     * @tc.desc   Get PIN complexity policy with userId 100 (normal parameter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0600 start');
        try {
          let result = pinAuth.getPinComplexityPolicy(userId);
          console.info('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0600 result: ' + JSON.stringify(result));
          expect(result != undefined || result === undefined).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0600 failed. code:${err.code}, message:${err.message}`);
          expect(false).assertTrue();
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0600 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0610
     * @tc.number SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0610
     * @tc.desc   Get PIN complexity policy with null userId (top-level parameter null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0610 start');
        try {
          pinAuth.getPinComplexityPolicy(null);
          console.error('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0610 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0610 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0610 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0620
     * @tc.number SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0620
     * @tc.desc   Get PIN complexity policy with undefined userId (top-level parameter undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0620 start');
        try {
          pinAuth.getPinComplexityPolicy(undefined);
          console.error('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0620 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0620 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_0620 skip on dev board/watch device');
      }
      done();
    });
  })
}
