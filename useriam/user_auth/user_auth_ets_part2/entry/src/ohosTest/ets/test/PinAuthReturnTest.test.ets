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

export default function PinAuthReturnTest() {
  describe('PinAuthReturnTest', () => {
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

    // ==================== setPinValidityPeriod + getPinValidityPeriod ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Return_0100
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Return_0100
     * @tc.desc   Set PIN validity period to 1000 milliseconds for userId 100, then get the validity period and verify it returns 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0100 skip on dev board/watch device');
        return;
      }
      console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0100 start');
      try {
        pinAuth.setPinValidityPeriod(userId, 1000);
        let result = pinAuth.getPinValidityPeriod(userId);
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0100 result: ' + JSON.stringify(result));
        expect(result).assertEqual(1000);
      } catch (err) {
        console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Return_0100 failed. code:${err.code}, message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Return_0110
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Return_0110
     * @tc.desc   Set PIN validity period to 0 for userId 100, then get the validity period and verify it returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0110 skip on dev board/watch device');
        return;
      }
      console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0110 start');
      try {
        pinAuth.setPinValidityPeriod(userId, 0);
        let result = pinAuth.getPinValidityPeriod(userId);
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0110 result: ' + JSON.stringify(result));
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Return_0110 failed. code:${err.code}, message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Return_0120
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Return_0120
     * @tc.desc   Set PIN validity period to Math.pow(2,50)-1 (maximum) for userId 100, then get and verify it returns the maximum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0120 skip on dev board/watch device');
        return;
      }
      console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0120 start');
      try {
        pinAuth.setPinValidityPeriod(userId, Math.pow(2, 50) - 1);
        let result = pinAuth.getPinValidityPeriod(userId);
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_Return_0120 result: ' + JSON.stringify(result));
        expect(result).assertEqual(Math.pow(2, 50) - 1);
      } catch (err) {
        console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_Return_0120 failed. code:${err.code}, message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    // ==================== setPinDeletionDisabledState + getPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0300
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0300
     * @tc.desc   Set PIN deletion disabled state to true for userId 100, then get and verify it returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0300 skip on dev board/watch device');
        return;
      }
      console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0300 start');
      try {
        pinAuth.setPinDeletionDisabledState(userId, true);
        let result = pinAuth.getPinDeletionDisabledState(userId);
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0300 result: ' + JSON.stringify(result));
        expect(result).assertTrue();
      } catch (err) {
        console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0300 failed. code:${err.code}, message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0310
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0310
     * @tc.desc   Set PIN deletion disabled state to false for userId 100, then get and verify it returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0310 skip on dev board/watch device');
        return;
      }
      console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0310 start');
      try {
        pinAuth.setPinDeletionDisabledState(userId, false);
        let result = pinAuth.getPinDeletionDisabledState(userId);
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0310 result: ' + JSON.stringify(result));
        expect(result).assertFalse();
      } catch (err) {
        console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_0310 failed. code:${err.code}, message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    // ==================== setPinComplexityPolicy + getPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0500
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0500
     * @tc.desc   Set PIN complexity policy with complexityReg and policyDescription for userId 100, then get and verify the returned policy object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0500 skip on dev board/watch device');
        return;
      }
      console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0500 start');
      try {
        let policy: pinAuth.PinComplexityPolicy = {
          complexityReg: '^[0-9]{6,}$',
          policyDescription: 'PIN must be at least 6 digits'
        };
        pinAuth.setPinComplexityPolicy(userId, policy);
        let result = pinAuth.getPinComplexityPolicy(userId);
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0500 result: ' + JSON.stringify(result));
        expect(result).not().assertNull();
        expect(result!.complexityReg).assertEqual('^[0-9]{6,}$');
        expect(result!.policyDescription).assertEqual('PIN must be at least 6 digits');
      } catch (err) {
        console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0500 failed. code:${err.code}, message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0510
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0510
     * @tc.desc   Set PIN complexity policy with both empty complexityReg and empty policyDescription for userId 100, then get and verify it returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0510 skip on dev board/watch device');
        return;
      }
      console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0510 start');
      try {
        let policy: pinAuth.PinComplexityPolicy = {
          complexityReg: '',
          policyDescription: ''
        };
        pinAuth.setPinComplexityPolicy(userId, policy);
        let result = pinAuth.getPinComplexityPolicy(userId);
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0510 result: ' + JSON.stringify(result));
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_Return_0510 failed. code:${err.code}, message:${err.message}`);
        expect(false).assertTrue();
      }
      done();
    });
  })
}
