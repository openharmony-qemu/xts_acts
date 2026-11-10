'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-static/src/main/indexStatic';
import hilog from '@ohos.hilog';
import { pinAuth } from '@kit.UserAuthenticationKit';
import deviceInfo from '@ohos.deviceInfo';
import display from '@ohos.display';

let domain: int = 0x0000;
let tag: string = 'testTag';
let format: string = '%{public}s';

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
    hilog.info(domain, tag, format, 'checkDeviceIsWatch fail ' + error.message);
    return false;
  }
}

export default function PinAuthParamTest(): void {
  describe('PinAuthParamTest', (): void => {
    let userId: int = 100;
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    // ==================== setPinValidityPeriod ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0100
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0100
     * @tc.desc   Set PIN validity period with userId 100 and validityPeriod 0 (minimum boundary value within range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0100 start');
        try {
          let validityPeriod: long = Double.toLong(0);
          pinAuth.setPinValidityPeriod(userId, validityPeriod);
          let result = pinAuth.getPinValidityPeriod(userId);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0100 result: ' + JSON.stringify(result));
          expect(result).assertUndefined();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0100 failed ' + err.code + ' ' + err.message);
          expect(false).assertTrue();
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0100 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0110
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0110
     * @tc.desc   Set PIN validity period with userId 100 and validityPeriod Math.pow(2,50)-1 (maximum boundary value within range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0110 start');
        try {
          let validityPeriod: long = Double.toLong(Math.pow(2, 50) - 1);
          pinAuth.setPinValidityPeriod(userId, validityPeriod);
          let result = pinAuth.getPinValidityPeriod(userId);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0110 result: ' + JSON.stringify(result));
          expect(result).assertEqual(Double.toLong(Math.pow(2, 50) - 1));
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0110 failed ' + err.code + ' ' + err.message);
          expect(false).assertTrue();
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0110 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0120
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0120
     * @tc.desc   Set PIN validity period with validityPeriod Math.pow(2,50) (exceeds maximum boundary, out of range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0120 start');
        try {
          let validityPeriod: long = Double.toLong(Math.pow(2, 50));
          pinAuth.setPinValidityPeriod(userId, validityPeriod);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0120 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0120 failed ' + err.code + ' ' + err.message);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0120 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0130
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0130
     * @tc.desc   Set PIN validity period with validityPeriod -1 (below minimum boundary, out of range)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0130 start');
        try {
          let validityPeriod: long = Double.toLong(-1);
          pinAuth.setPinValidityPeriod(userId, validityPeriod);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0130 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0130 failed ' + err.code + ' ' + err.message);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Param_Static_0130 skip on dev board/watch device');
      }
      done();
    });

    // ==================== getPinValidityPeriod ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinValidityPeriod_Param_Static_0200
     * @tc.number SUB_Security_PinAuth_GetPinValidityPeriod_Param_Static_0200
     * @tc.desc   Get PIN validity period with userId 100 (normal parameter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinValidityPeriod_Param_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinValidityPeriod_Param_Static_0200 start');
        try {
          let result = pinAuth.getPinValidityPeriod(userId);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinValidityPeriod_Param_Static_0200 result: ' + JSON.stringify(result));
          expect(result !== null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinValidityPeriod_Param_Static_0200 failed ' + err.code + ' ' + err.message);
          expect(false).assertTrue();
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinValidityPeriod_Param_Static_0200 skip on dev board/watch device');
      }
      done();
    });

    // ==================== setPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0300
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0300
     * @tc.desc   Set PIN deletion disabled state with userId 100 and isDisabled true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0300 start');
        try {
          pinAuth.setPinDeletionDisabledState(userId, true);
          let result = pinAuth.getPinDeletionDisabledState(userId);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0300 result: ' + JSON.stringify(result));
          expect(result).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0300 failed ' + err.code + ' ' + err.message);
          expect(false).assertTrue();
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0300 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0310
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0310
     * @tc.desc   Set PIN deletion disabled state with userId 100 and isDisabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0310 start');
        try {
          pinAuth.setPinDeletionDisabledState(userId, false);
          let result = pinAuth.getPinDeletionDisabledState(userId);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0310 result: ' + JSON.stringify(result));
          expect(result).assertFalse();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0310 failed ' + err.code + ' ' + err.message);
          expect(false).assertTrue();
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Param_Static_0310 skip on dev board/watch device');
      }
      done();
    });

    // ==================== getPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_Static_0400
     * @tc.number SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_Static_0400
     * @tc.desc   Get PIN deletion disabled state with userId 100 (normal parameter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_Static_0400 start');
        try {
          let result = pinAuth.getPinDeletionDisabledState(userId);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_Static_0400 result: ' + JSON.stringify(result));
          expect(result !== null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_Static_0400 failed ' + err.code + ' ' + err.message);
          expect(false).assertTrue();
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinDeletionDisabledState_Param_Static_0400 skip on dev board/watch device');
      }
      done();
    });

    // ==================== setPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0500
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0500
     * @tc.desc   Set PIN complexity policy with userId 100 and valid policy object containing complexityReg and policyDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0500 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '^[0-9]{6,}$',
            policyDescription: 'PIN must be at least 6 digits'
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          let result = pinAuth.getPinComplexityPolicy(userId);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0500 result: ' + JSON.stringify(result));
          expect(result).not().assertNull();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0500 failed ' + err.code + ' ' + err.message);
          expect(false).assertTrue();
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0500 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0550
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0550
     * @tc.desc   Set PIN complexity policy with empty complexityReg string and non-empty policyDescription, expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0550 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '',
            policyDescription: 'PIN complexity description'
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0550 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0550 failed ' + err.code + ' ' + err.message);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0550 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0560
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0560
     * @tc.desc   Set PIN complexity policy with non-empty complexityReg and empty policyDescription string, expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0560 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '^[0-9]{6,}$',
            policyDescription: ''
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0560 unexpected success, expected to throw 12500008');
          expect(false).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0560 failed ' + err.code + ' ' + err.message);
          expect(err.code).assertEqual(12500008);
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0560 skip on dev board/watch device');
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0570
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0570
     * @tc.desc   Set PIN complexity policy with both empty complexityReg and empty policyDescription strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0570 start');
        try {
          let policy: pinAuth.PinComplexityPolicy = {
            complexityReg: '',
            policyDescription: ''
          };
          pinAuth.setPinComplexityPolicy(userId, policy);
          let result = pinAuth.getPinComplexityPolicy(userId);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0570 result: ' + JSON.stringify(result));
          expect(result).assertUndefined();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0570 failed ' + err.code + ' ' + err.message);
          expect(false).assertTrue();
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Param_Static_0570 skip on dev board/watch device');
      }
      done();
    });

    // ==================== getPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinComplexityPolicy_Param_Static_0600
     * @tc.number SUB_Security_PinAuth_GetPinComplexityPolicy_Param_Static_0600
     * @tc.desc   Get PIN complexity policy with userId 100 (normal parameter)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinComplexityPolicy_Param_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (!checkDeviceIsDevBoard() && !checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinComplexityPolicy_Param_Static_0600 start');
        try {
          let result = pinAuth.getPinComplexityPolicy(userId);
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinComplexityPolicy_Param_Static_0600 result: ' + JSON.stringify(result));
          expect(result !== null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinComplexityPolicy_Param_Static_0600 failed ' + err.code + ' ' + err.message);
          expect(false).assertTrue();
        }
      } else {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinComplexityPolicy_Param_Static_0600 skip on dev board/watch device');
      }
      done();
    });
  });
}
