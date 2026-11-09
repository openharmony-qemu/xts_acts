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

export default function PinAuthErrorCodeTest(): void {
  describe('PinAuthErrorCodeTest', (): void => {
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
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0110
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0110
     * @tc.desc   Set PIN validity period with validityPeriod Math.pow(2,50) (exceeds maximum boundary), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0110 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0110 start');
      try {
        let validityPeriod: long = Double.toLong(Math.pow(2, 50));
        pinAuth.setPinValidityPeriod(userId, validityPeriod);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0110 unexpected success, expected to throw 12500008');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0110 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(12500008);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0120
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0120
     * @tc.desc   Set PIN validity period with validityPeriod -1 (below minimum boundary), expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0120 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0120 start');
      try {
        let validityPeriod: long = Double.toLong(-1);
        pinAuth.setPinValidityPeriod(userId, validityPeriod);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0120 unexpected success, expected to throw 12500008');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_ErrorCode_Static_0120 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(12500008);
      }
      done();
    });

    // ==================== setPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0550
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0550
     * @tc.desc   Set PIN complexity policy with empty complexityReg string and non-empty policyDescription, expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0550 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0550 start');
      try {
        let policy: pinAuth.PinComplexityPolicy = {
          complexityReg: '',
          policyDescription: 'PIN complexity description'
        };
        pinAuth.setPinComplexityPolicy(userId, policy);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0550 unexpected success, expected to throw 12500008');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0550 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(12500008);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0560
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0560
     * @tc.desc   Set PIN complexity policy with non-empty complexityReg and empty policyDescription string, expected to return error code 12500008
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0560 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0560 start');
      try {
        let policy: pinAuth.PinComplexityPolicy = {
          complexityReg: '^[0-9]{6,}$',
          policyDescription: ''
        };
        pinAuth.setPinComplexityPolicy(userId, policy);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0560 unexpected success, expected to throw 12500008');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_ErrorCode_Static_0560 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(12500008);
      }
      done();
    });
  });
}
