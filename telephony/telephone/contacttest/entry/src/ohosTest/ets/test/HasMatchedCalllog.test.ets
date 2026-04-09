/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import contact from '@ohos.contact';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import account from '@ohos.account.osAccount';

function sleep (ms :number = 66): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
      }, ms)
  })
}

async function getPermissions() {
  console.info('getPermission start');
  type MyPermissions = "ohos.permission.WRITE_CONTACTS" | "ohos.permission.READ_CONTACTS";
  let list: MyPermissions[] = ['ohos.permission.WRITE_CONTACTS', 'ohos.permission.READ_CONTACTS'];
  try {
    let userId: number = await account.getAccountManager().getOsAccountLocalId();
    let applicationFlags: number = bundleManager.ApplicationFlag.GET_APPLICATION_INFO_DEFAULT;
    let applicationInfo: bundleManager.ApplicationInfo = await bundleManager.getApplicationInfoSync('com.example.contacttest', applicationFlags, userId);
    let tokenId: number = applicationInfo.accessTokenId;
    for (let index = 0; index < list.length; index++) {
      await abilityAccessCtrl.createAtManager().grantUserGrantedPermission(tokenId, list[index], 1);
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function HasMatchedCallLogTest() {
    describe('HasMatchedCallLogTest', async (done: Function) => {
    beforeAll(async (done: Function) => {
      console.info("HasMatchedCallLogTest beforeAll case");
      await getPermissions();
      done();
    });

    /**
     * @tc.name   testHasMatchedCallLog100
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_100
     * @tc.desc   Test hasMatchedCallLog with all parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog100';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;
        let withinTime = 400;
        let result = await contact.hasMatchedCallLog(context, phoneNumber, minDuration, withinTime);
        console.info(`${caseName} result: ${result}`);
        expect(typeof result === 'boolean').assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog200
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_200
     * @tc.desc   Test hasMatchedCallLog without optional withinTime parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog200';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, phoneNumber, minDuration, 86400);
        console.info(`${caseName} result: ${result}`);
        expect(typeof result === 'boolean').assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog300
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_300
     * @tc.desc   Test hasMatchedCallLog with empty phoneNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog300';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, null, minDuration);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog400
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_400
     * @tc.desc   Test hasMatchedCallLog with invalid minDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog400';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";

        let result = await contact.hasMatchedCallLog(context, phoneNumber, null);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testHasMatchedCallLog500
     * @tc.number SUB_Telephony_Contact_HasMatchedCallLog_500
     * @tc.desc   Test hasMatchedCallLog with invalid withinTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testHasMatchedCallLog500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testHasMatchedCallLog500';
      console.info(`${caseName} test start`);

      try {
        let context: Context = AppStorage.get('context') as Context;
        let phoneNumber = "13800000000";
        let minDuration = 10;

        let result = await contact.hasMatchedCallLog(context, phoneNumber, minDuration, null);
        console.info(`${caseName} should throw error but not`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName} catch error ${JSON.stringify(error)}`);
        expect(error.code === 16700002).assertTrue();
        done();
      }
    });

  })
}

