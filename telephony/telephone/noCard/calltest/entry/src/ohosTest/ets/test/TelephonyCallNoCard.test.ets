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
import sim from '@ohos.telephony.sim';
import { describe, it, expect, beforeAll, Level, TestType, Size} from '@ohos/hypium-dynamic';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl, { PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo", `test failed`);
  }
};

const CALL_NUMBER: string = '10086';

async function getPermissions() {
  console.info('getPermission start');
  let list: Array<Permissions> = ['ohos.permission.DIRECT_CALL'];
  try {
    let ability = await AbilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(ability.context, list).then((data: PermissionRequestResult) => {
      console.info(`getPermission result ${JSON.stringify(data)}`);
    }).catch((err: BusinessError) => {
      console.info(`getPermission err ${JSON.stringify(err)}`);
    });
    for (let index = 0; index < 3; index++) {
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      try {
        let allowButton = await driver.findComponent(ON.text('允许', MatchPattern.EQUALS));
        if (allowButton !== null) {
          await allowButton.click();
          await driver.delayMs(1000);
          console.info(`getPermission click allow button, round ${index}`);
          break;
        }
      } catch (err) {
        console.info(`getPermission find allow button round ${index} failed`);
      }
    }
  } catch (err) {
    console.info(`getPermission error ${JSON.stringify(err)}`);
  }
  console.info('getPermission end');
}

export default function TelephonyCallNoCard() {
  describe('TelephonyCallNoCard', () => {
    beforeAll(async (done: Function) => {
      console.info('getPermission beforeAll');
      await getPermissions();
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerMakeDirectCallNoCard0100
     * @tc.number SUB_Telephony_CallManager_MakeDirectCall_NoCard_0100
     * @tc.desc   No SIM card in the device, application makes calls with one tap
     *             with a valid phone number by promise with ohos.permission.DIRECT_CALL
     *             granted, network is not in service, expect error code 8300006. api26+
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testTelephonyCallManagerMakeDirectCallNoCard0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName: string = 'testTelephonyCallManagerMakeDirectCallNoCard0100';
      console.info(`${caseName} test start `);
      sim.hasSimCard(0, (err: BusinessError, data: boolean) => {
        if (data === false) {
          console.info(`${caseName}: success no card, data->${JSON.stringify(data)}`);
          ExpectTrue(data === false);
          call.makeDirectCall(CALL_NUMBER).then(() => {
            console.info(`${caseName}: makeDirectCall success unexpectedly without card`);
            ExpectFail();
            console.info(`${caseName} test end `);
            done();
          }).catch((err: BusinessError) => {
            if (err.code === 8300006) {
              console.info(`${caseName}: success network not in service, err->${JSON.stringify(err)}`);
              ExpectTrue(true);
            } else {
              console.info(`${caseName}: fail, err->${JSON.stringify(err)}`);
              ExpectFail();
            }
            console.info(`${caseName} test end `);
            done();
          });
        } else {
          console.info(`${caseName} failed, have card: err->${JSON.stringify(err)}`);
          ExpectFail();
          console.info(`${caseName} test end `);
          done();
        }
      });
    });
  });
}
