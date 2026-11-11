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

export default function PinAuthErrorCodeTest() {
  describe('PinAuthErrorCodeTest', () => {
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
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0110
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0110
     * @tc.desc   Set PIN validity period with validityPeriod Math.pow(2,50) (exceeds maximum boundary), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0110 start');
        try {
          pinAuth.setPinValidityPeriod(userId, Math.pow(2, 50));
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0110 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0110 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0110 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0120
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0120
     * @tc.desc   Set PIN validity period with validityPeriod -1 (below minimum boundary), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0120 start');
        try {
          pinAuth.setPinValidityPeriod(userId, -1);
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0120 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0120 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0120 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0130
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0130
     * @tc.desc   Set PIN validity period with null userId (top-level parameter null), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0130 start');
        try {
          pinAuth.setPinValidityPeriod(null, 1000);
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0130 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0130 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0130 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0140
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0140
     * @tc.desc   Set PIN validity period with null validityPeriod (top-level parameter null), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0140 start');
        try {
          pinAuth.setPinValidityPeriod(userId, null);
          console.error('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0140 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0140 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_0140 skip on dev board/watch device');
      }
      done();
    });

    // ==================== getPinValidityPeriod ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinValidityPeriod_ErrorCode_0200
     * @tc.number SUB_Security_PinAuth_GetPinValidityPeriod_ErrorCode_0200
     * @tc.desc   Get PIN validity period with null userId (top-level parameter null), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinValidityPeriod_ErrorCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinValidityPeriod_ErrorCode_0200 start');
        try {
          pinAuth.getPinValidityPeriod(null);
          console.error('SUB_Security_PinAuth_GetPinValidityPeriod_ErrorCode_0200 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinValidityPeriod_ErrorCode_0200 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinValidityPeriod_ErrorCode_0200 skip on dev board/watch device');
      }
      done();
    });

    // ==================== setPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0300
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0300
     * @tc.desc   Set PIN deletion disabled state with null userId (top-level parameter null), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0300 start');
        try {
          pinAuth.setPinDeletionDisabledState(null, true);
          console.error('SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0300 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0300 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0300 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0310
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0310
     * @tc.desc   Set PIN deletion disabled state with null isDisabled (top-level parameter null), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0310 start');
        try {
          pinAuth.setPinDeletionDisabledState(userId, null);
          console.error('SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0310 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0310 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinDeletionDisabledState_ErrorCode_0310 skip on dev board/watch device');
      }
      done();
    });

    // ==================== getPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinDeletionDisabledState_ErrorCode_0400
     * @tc.number SUB_Security_PinAuth_GetPinDeletionDisabledState_ErrorCode_0400
     * @tc.desc   Get PIN deletion disabled state with null userId (top-level parameter null), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinDeletionDisabledState_ErrorCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinDeletionDisabledState_ErrorCode_0400 start');
        try {
          pinAuth.getPinDeletionDisabledState(null);
          console.error('SUB_Security_PinAuth_GetPinDeletionDisabledState_ErrorCode_0400 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinDeletionDisabledState_ErrorCode_0400 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinDeletionDisabledState_ErrorCode_0400 skip on dev board/watch device');
      }
      done();
    });

    // ==================== setPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0500
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0500
     * @tc.desc   Set PIN complexity policy with null policy (top-level parameter null), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0500 start');
        try {
          pinAuth.setPinComplexityPolicy(userId, null);
          console.error('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0500 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0500 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0500 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0550
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0550
     * @tc.desc   Set PIN complexity policy with empty complexityReg string and non-empty policyDescription, expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0550 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '',
            policyDescription: 'PIN complexity description'
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          console.error('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0550 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0550 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0550 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0560
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0560
     * @tc.desc   Set PIN complexity policy with non-empty complexityReg and empty policyDescription string, expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0560 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '^[0-9]{6,}$',
            policyDescription: ''
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          console.error('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0560 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0560 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_0560 skip on dev board/watch device');
      }
      done();
    });

    // ==================== getPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinComplexityPolicy_ErrorCode_0600
     * @tc.number SUB_Security_PinAuth_GetPinComplexityPolicy_ErrorCode_0600
     * @tc.desc   Get PIN complexity policy with null userId (top-level parameter null), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinComplexityPolicy_ErrorCode_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        console.info('SUB_Security_PinAuth_GetPinComplexityPolicy_ErrorCode_0600 start');
        try {
          pinAuth.getPinComplexityPolicy(null);
          console.error('SUB_Security_PinAuth_GetPinComplexityPolicy_ErrorCode_0600 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          console.error(`SUB_Security_PinAuth_GetPinComplexityPolicy_ErrorCode_0600 failed. code:${err.code}, message:${err.message}`);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        console.info('SUB_Security_PinAuth_GetPinComplexityPolicy_ErrorCode_0600 skip on dev board/watch device');
      }
      done();
    });
  })
}
