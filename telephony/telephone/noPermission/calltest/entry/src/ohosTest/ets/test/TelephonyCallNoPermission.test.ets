/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import call from '@ohos.telephony.call';
import { describe, it, expect, Level, TestType, Size } from '@ohos/hypium-dynamic';

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}
const ExpectFail = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
}

const CALL_NUMBER: string = '10086';

export default function TelephonyCallNoPermission() {
  describe('TelephonyCallNoPermission', () => {

    /**
     * @tc.number SUB_Telephony_CallManager_MakeDirectCall_NoPermission_0100
     * @tc.name   testTelephonyCallManagerMakeDirectCallNoPermission0100
     * @tc.desc   Application makes calls with one tap with a valid phone number
     *             by promise without ohos.permission.DIRECT_CALL granted,
     *             expect error code 201 (Permission denied). api26+
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testTelephonyCallManagerMakeDirectCallNoPermission0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testTelephonyCallManagerMakeDirectCallNoPermission0100';
      console.info(`${caseName} test start`);
      try {
        await call.makeDirectCall(CALL_NUMBER);
        console.info(`${caseName} makeDirectCall success unexpectedly without permission`);
        ExpectFail();
        done();
      } catch (err) {
        console.info(`${caseName} makeDirectCall fail, err: ${JSON.stringify(err)}`);
        ExpectTrue((err as BusinessError).code === 201);
        done();
      }
    });
  });
}
