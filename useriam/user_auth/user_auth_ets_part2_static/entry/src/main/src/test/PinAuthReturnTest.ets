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

export default function PinAuthReturnTest(): void {
  describe('PinAuthReturnTest', (): void => {
    let userId: int = 100;
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    // ==================== setPinValidityPeriod + getPinValidityPeriod ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0100
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0100
     * @tc.desc   Set PIN validity period to 1000 milliseconds for userId 100, then get the validity period and verify it returns 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0100 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0100 start');
      try {
        let validityPeriod: long = Double.toLong(1000);
        pinAuth.setPinValidityPeriod(userId, validityPeriod);
        let result = pinAuth.getPinValidityPeriod(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0100 result: ' + JSON.stringify(result));
        expect(result).assertEqual(Double.toLong(1000));
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0100 failed ' + err.code + ' ' + err.message);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0110
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0110
     * @tc.desc   Set PIN validity period to 0 for userId 100, then get the validity period and verify it returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0110 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0110 start');
      try {
        let validityPeriod: long = Double.toLong(0);
        pinAuth.setPinValidityPeriod(userId, validityPeriod);
        let result = pinAuth.getPinValidityPeriod(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0110 result: ' + JSON.stringify(result));
        expect(result).assertUndefined();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0110 failed ' + err.code + ' ' + err.message);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0120
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0120
     * @tc.desc   Set PIN validity period to Math.pow(2,50)-1 (maximum) for userId 100, then get and verify it returns the maximum value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0120 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0120 start');
      try {
        let validityPeriod: long = Double.toLong(Math.pow(2, 50) - 1);
        pinAuth.setPinValidityPeriod(userId, validityPeriod);
        let result = pinAuth.getPinValidityPeriod(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0120 result: ' + JSON.stringify(result));
        expect(result).assertEqual(Double.toLong(Math.pow(2, 50) - 1));
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_Return_Static_0120 failed ' + err.code + ' ' + err.message);
        expect(false).assertTrue();
      }
      done();
    });

    // ==================== setPinDeletionDisabledState + getPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0300
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0300
     * @tc.desc   Set PIN deletion disabled state to true for userId 100, then get and verify it returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0300 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0300 start');
      try {
        pinAuth.setPinDeletionDisabledState(userId, true);
        let result = pinAuth.getPinDeletionDisabledState(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0300 result: ' + JSON.stringify(result));
        expect(result).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0300 failed ' + err.code + ' ' + err.message);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0310
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0310
     * @tc.desc   Set PIN deletion disabled state to false for userId 100, then get and verify it returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0310 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0310 start');
      try {
        pinAuth.setPinDeletionDisabledState(userId, false);
        let result = pinAuth.getPinDeletionDisabledState(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0310 result: ' + JSON.stringify(result));
        expect(result).assertFalse();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_Return_Static_0310 failed ' + err.code + ' ' + err.message);
        expect(false).assertTrue();
      }
      done();
    });

    // ==================== setPinComplexityPolicy + getPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0500
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0500
     * @tc.desc   Set PIN complexity policy with complexityReg and policyDescription for userId 100, then get and verify the returned policy object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0500 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0500 start');
      try {
        let policy: pinAuth.PinComplexityPolicy = {
          complexityReg: '^[0-9]{6,}$',
          policyDescription: 'PIN must be at least 6 digits'
        };
        pinAuth.setPinComplexityPolicy(userId, policy);
        let result = pinAuth.getPinComplexityPolicy(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0500 result: ' + JSON.stringify(result));
        expect(result).not().assertNull();
        expect(result!.complexityReg).assertEqual('^[0-9]{6,}$');
        expect(result!.policyDescription).assertEqual('PIN must be at least 6 digits');
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0500 failed ' + err.code + ' ' + err.message);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0510
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0510
     * @tc.desc   Set PIN complexity policy with both empty complexityReg and empty policyDescription for userId 100, then get and verify it returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0510 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0510 start');
      try {
        let policy: pinAuth.PinComplexityPolicy = {
          complexityReg: '',
          policyDescription: ''
        };
        pinAuth.setPinComplexityPolicy(userId, policy);
        let result = pinAuth.getPinComplexityPolicy(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0510 result: ' + JSON.stringify(result));
        expect(result).assertUndefined();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_Return_Static_0510 failed ' + err.code + ' ' + err.message);
        expect(false).assertTrue();
      }
      done();
    });
  });
}
