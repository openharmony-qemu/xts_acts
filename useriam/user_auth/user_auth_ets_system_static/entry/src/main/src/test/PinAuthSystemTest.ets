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

let domain: int = 0x0000;
let tag: string = 'testTag';
let format: string = '%{public}s';


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
    hilog.info(domain, tag, format, 'checkDeviceIsWatch fail ' + error.message);
    return false;
  }
}

export default function PinAuthSystemTest(): void {
  describe('PinAuthSystemTest', (): void => {
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
     * @tc.name   SUB_Security_PinAuth_SetPinValidityPeriod_System_Static_0100
     * @tc.number SUB_Security_PinAuth_SetPinValidityPeriod_System_Static_0100
     * @tc.desc   Set PIN validity period called by non-system application, expected to return error code 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinValidityPeriod_System_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_System_Static_0100 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_System_Static_0100 start');
      try {
        let validityPeriod: long = Double.toLong(1000);
        pinAuth.setPinValidityPeriod(userId, validityPeriod);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_System_Static_0100 unexpected success, expected to throw 202');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinValidityPeriod_System_Static_0100 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(202);
      }
      done();
    });

    // ==================== getPinValidityPeriod ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinValidityPeriod_System_Static_0200
     * @tc.number SUB_Security_PinAuth_GetPinValidityPeriod_System_Static_0200
     * @tc.desc   Get PIN validity period called by non-system application, expected to return error code 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinValidityPeriod_System_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinValidityPeriod_System_Static_0200 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinValidityPeriod_System_Static_0200 start');
      try {
        pinAuth.getPinValidityPeriod(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinValidityPeriod_System_Static_0200 unexpected success, expected to throw 202');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinValidityPeriod_System_Static_0200 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(202);
      }
      done();
    });

    // ==================== setPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinDeletionDisabledState_System_Static_0300
     * @tc.number SUB_Security_PinAuth_SetPinDeletionDisabledState_System_Static_0300
     * @tc.desc   Set PIN deletion disabled state called by non-system application, expected to return error code 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinDeletionDisabledState_System_Static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_System_Static_0300 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_System_Static_0300 start');
      try {
        pinAuth.setPinDeletionDisabledState(userId, true);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_System_Static_0300 unexpected success, expected to throw 202');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinDeletionDisabledState_System_Static_0300 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(202);
      }
      done();
    });

    // ==================== getPinDeletionDisabledState ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinDeletionDisabledState_System_Static_0400
     * @tc.number SUB_Security_PinAuth_GetPinDeletionDisabledState_System_Static_0400
     * @tc.desc   Get PIN deletion disabled state called by non-system application, expected to return error code 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinDeletionDisabledState_System_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinDeletionDisabledState_System_Static_0400 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinDeletionDisabledState_System_Static_0400 start');
      try {
        pinAuth.getPinDeletionDisabledState(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinDeletionDisabledState_System_Static_0400 unexpected success, expected to throw 202');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinDeletionDisabledState_System_Static_0400 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(202);
      }
      done();
    });

    // ==================== setPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_SetPinComplexityPolicy_System_Static_0500
     * @tc.number SUB_Security_PinAuth_SetPinComplexityPolicy_System_Static_0500
     * @tc.desc   Set PIN complexity policy called by non-system application, expected to return error code 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_SetPinComplexityPolicy_System_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_System_Static_0500 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_System_Static_0500 start');
      try {
        let policy: pinAuth.PinComplexityPolicy = {
          complexityReg: '^[0-9]{6,}$',
          policyDescription: 'PIN must be at least 6 digits'
        };
        pinAuth.setPinComplexityPolicy(userId, policy);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_System_Static_0500 unexpected success, expected to throw 202');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_SetPinComplexityPolicy_System_Static_0500 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(202);
      }
      done();
    });

    // ==================== getPinComplexityPolicy ====================

    /**
     * @tc.name   SUB_Security_PinAuth_GetPinComplexityPolicy_System_Static_0600
     * @tc.number SUB_Security_PinAuth_GetPinComplexityPolicy_System_Static_0600
     * @tc.desc   Get PIN complexity policy called by non-system application, expected to return error code 202
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Security_PinAuth_GetPinComplexityPolicy_System_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      if (checkDeviceIsDevBoard() || checkDeviceIsWatch()) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinComplexityPolicy_System_Static_0600 skip on dev board/watch device');
        return;
      }
      hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinComplexityPolicy_System_Static_0600 start');
      try {
        pinAuth.getPinComplexityPolicy(userId);
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinComplexityPolicy_System_Static_0600 unexpected success, expected to throw 202');
        expect(false).assertTrue();
      } catch (err) {
        hilog.info(domain, tag, format, 'SUB_Security_PinAuth_GetPinComplexityPolicy_System_Static_0600 failed ' + err.code + ' ' + err.message);
        expect(err.code).assertEqual(202);
      }
      done();
    });
  });
}
