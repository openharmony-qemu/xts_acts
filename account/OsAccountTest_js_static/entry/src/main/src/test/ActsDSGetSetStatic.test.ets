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

import deviceInfo from '@ohos.deviceInfo';
import account from '@ohos.account.distributedAccount'
import { BusinessError } from '@ohos.base';
import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'

let tag: string = 'testTag';


let deviceType = deviceInfo.deviceType;
hilog.info(0x0000, tag, "====>the value of the deviceinfo deviceType is: " + deviceType);

export default function ActsDAGetSetTestStatic() {
  describe('ActsDAGetSetTestStatic', () => {

    /**
     * @tc.name   getDistributedAccountAbilityStatic_test
     * @tc.number getDistributedAccountAbility_test
     * @tc.desc   Test distributedAccount.getDistributedAccountAbility API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDistributedAccountAbilityStatic_test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>start getDistributedAccountAbility_test====");
        let ret: boolean = false;
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        hilog.info(0x0000, tag, "====>getDistributedAccountAbility_test result: " + JSON.stringify(accountAbility));
        if (accountAbility !== null) {
          ret = true;
        }
        expect(ret).assertTrue();
        done();
      });

    /**
     * @tc.name   getOsAccountDistributedInfoStatic_test0100
     * @tc.number getOsAccountDistributedInfo_test001
     * @tc.desc   Test distributedAccount.getOsAccountDistributedInfo API functionality.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOsAccountDistributedInfoStatic_test0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>start getOsAccountDistributedInfoStatic_test0100====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          hilog.info(0x0000, tag, "====>start getOsAccountDistributedInfo promise");
          let data: account.DistributedInfo = await accountAbility.getOsAccountDistributedInfo();
          hilog.info(0x0000, tag, '====>test0100 data:' + JSON.stringify(data));
          expect(data.name).assertEqual('ohosAnonymousName');
          expect(data.id).assertEqual('ohosAnonymousUid');
          expect(data.event).assertEqual('');
          expect(data.nickname).assertEqual('');
          expect(data.avatar).assertEqual('');
          expect(data.scalableData != null).assertTrue();
          expect(data.status).assertEqual(account.DistributedAccountStatus.NOT_LOGGED_IN);
          expect(1).assertEqual(account.DistributedAccountStatus.LOGGED_IN);
        } catch (err: BusinessError<void>) {
          hilog.info(0x0000, tag, '====>test0100 err:' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   getOsAccountDistributedInfoStatic_test0200
     * @tc.number getOsAccountDistributedInfo_test002
     * @tc.desc   Test distributedAccount.getOsAccountDistributedInfo API functionality by callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getOsAccountDistributedInfoStatic_test0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>start getOsAccountDistributedInfoStatic_test0200====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          hilog.info(0x0000, tag, "====>start getOsAccountDistributedInfo callback");
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null, data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, '====>test0200 err:' + JSON.stringify(err));
            hilog.info(0x0000, tag, '====>test0200 data:' + JSON.stringify(data));
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  expect(data?.name).assertEqual('ohosAnonymousName');
                  expect(data?.id).assertEqual('ohosAnonymousUid');
                  expect(data?.event).assertEqual('');
                  expect(data?.status).assertEqual(account.DistributedAccountStatus.NOT_LOGGED_IN);
                  hilog.info(0x0000, tag, "====>test0200 success");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err: BusinessError<void>) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            done();
          });
        } catch (err: BusinessError<void>) {
          hilog.info(0x0000, tag, '====>test002 err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  });
}
