/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import osAccount from '@ohos.account.osAccount'
import distributedAccount from '@ohos.account.distributedAccount'
import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'

let tag: string = 'testTag';

let accountManager: osAccount.AccountManager = osAccount.getAccountManager();

export default function ActsOsAccountThirdPartyTest_third_3_Static() {
  describe('ActsOsAccountThirdPartyTest_third_3_Static', () => {

    /**
     * @tc.name   ActsOsAccountIsOsAccountUnlocked_0100
     * @tc.number ActsOsAccountIsOsAccountUnlocked_0100
     * @tc.desc   Verify isOsAccountUnlocked that the initial state query is unlocked to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountIsOsAccountUnlocked_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(0x0000, tag, "====>ActsOsAccountIsOsAccountUnlocked_0100 start====");
          let isUnlocked: boolean = await accountManager.isOsAccountUnlocked();
          hilog.info(0x0000, tag, "====>IsOsAccountUnlocked data: " + isUnlocked);
          expect(isUnlocked).assertEqual(true);
          hilog.info(0x0000, tag, "====>ActsOsAccountIsOsAccountUnlocked_0100 end====");
          done();
        } catch (err: BusinessError<void>) {
          hilog.info(0x0000, tag, "====>catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  })
}
