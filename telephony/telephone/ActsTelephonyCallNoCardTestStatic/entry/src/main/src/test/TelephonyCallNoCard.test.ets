'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "@ohos/hypium-static/src/main/indexStatic";
import call from '@ohos.telephony.call';
import sim from '@ohos.telephony.sim';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl, { Permissions, PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Driver, ON, MatchPattern, Component } from '@ohos.UiTest';
import hilog from '@ohos.hilog';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'CallNoCardTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

const ExpectFail: () => void = () => {
  try {
    expect().assertFail();
  } catch (err) {
    hilog.info(domain, tag, `exportFail failed err: ${JSON.stringify(err)}`);
  }
};

const ExpectTrue: (n: boolean) => void = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    hilog.info(domain, tag, `exportTrue failed err: ${JSON.stringify(err)}`);
  }
};

const CALL_NUMBER: string = '10086';

async function getPermissions(): Promise<void> {
  hilog.info(domain, tag, '%{public}s', 'getPermission start');
  let list: Array<Permissions> = ['ohos.permission.DIRECT_CALL'];
  try {
    let ability: UIAbility = await AbilityDelegatorRegistry.getAbilityDelegator().getCurrentTopAbility();
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionsFromUser(ability.context, list).then((data: PermissionRequestResult) => {
      hilog.info(domain, tag, `getPermission result ${JSON.stringify(data)}`);
    }).catch((error: Error) => {
      hilog.info(domain, tag, `getPermission err ->error.code: ${JSON.stringify((error as BusinessError).code)}, error?.message: ${JSON.stringify((error as BusinessError).message)}`);
    });
    for (let index = 0; index < 3; index++) {
      let driver: Driver = Driver.create();
      await driver.delayMs(1000);
      try {
        let allowButton: Component | null = await driver.findComponent(ON.text('允许', MatchPattern.EQUALS));
        if (allowButton !== null) {
          await allowButton.click();
          await driver.delayMs(1000);
          hilog.info(domain, tag, `getPermission click allow button, round ${index}`);
          break;
        }
      } catch (error) {
        hilog.info(domain, tag, `getPermission find allow button round ${index} failed, error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
      }
    }
  } catch (error) {
    hilog.info(domain, tag, `getPermission error ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
  }
  hilog.info(domain, tag, '%{public}s', 'getPermission end');
}

export default function TelephonyCallNoCardTest() {
  describe('TelephonyCallNoCardTest', (): void => {
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'getPermission beforeAll');
      await getPermissions();
      done();
    });

    /**
     * @tc.name   testTelephonyCallManagerMakeDirectCallNoCard_static_0100
     * @tc.number SUB_Telephony_CallManager_MakeDirectCall_NoCard_0100
     * @tc.desc   No SIM card in the device, application makes calls with one tap with a valid phone number by promise with ohos.permission.DIRECT_CALL granted, network is not in service, expect error code 8300006.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTelephonyCallManagerMakeDirectCallNoCard_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName: string = 'testTelephonyCallManagerMakeDirectCallNoCard_static_0100';
      hilog.info(domain, tag, '%{public}s', caseName + ' start');
      if (sim.hasSimCardSync(0)) {
        hilog.info(domain, tag, '%{public}s', caseName + ' failed, have card');
        ExpectFail();
        hilog.info(domain, tag, '%{public}s', caseName + '---test end');
        done();
      } else {
        try {
          await call.makeDirectCall(CALL_NUMBER);
          hilog.info(domain, tag, '%{public}s', caseName + ' makeDirectCall success unexpectedly without card');
          ExpectFail();
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        } catch (error) {
          hilog.info(domain, tag, `${caseName} catch err ->error.code: ${JSON.stringify(error.code)}, error?.message: ${JSON.stringify(error?.message)}`);
          ExpectTrue(error.code === 8300006);
          hilog.info(domain, tag, '%{public}s', caseName + '---test end');
          done();
        }
      }
    });

  })
}
