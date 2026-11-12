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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "@ohos/hypium-static/src/main/indexStatic";
import call from '@ohos.telephony.call';
import sim from '@ohos.telephony.sim';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl, { Permissions, PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import Utils from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'CallNoCardTestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let g_context: common.UIAbilityContext;

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
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let cmd: string = "aa start -a EntryAbility -b com.example.actstelephonycallnocardtest.static";
  let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
  hilog.info(domain, tag, 'user:' + JSON.stringify(user));
  if (user !== undefined) {
    cmd += ' -u ' + user;
  }
  abilityDelegator.executeShellCommand(cmd)
  await Utils.msSleep(4000);
  g_context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
  hilog.info(domain, tag, 'get UIAbilityContext end');
  try {
    await Utils.msSleep(2000);
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let arr: Permissions[] = ['ohos.permission.DIRECT_CALL'];
    atManager.requestPermissionsFromUser(g_context, arr,
      (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
        hilog.info(domain, tag, 'requestPermissionsFromUser end');
        hilog.info(domain, tag, 'request success permissions' + JSON.stringify(data));
        hilog.info(domain, tag, 'getPermissionRequestResult err' + JSON.stringify(err));
      });
  } catch (err) {
    hilog.error(domain, tag, '%{public}s', 'get failed, err: ' + JSON.stringify(err));
  }
  await Utils.msSleep(2000);
  await Utils.clickRequestPermission('允许');
  hilog.info(domain, tag, '%{public}s', 'getPermission end');
}

export default function TelephonyCallNoCardTest() {
  describe('TelephonyCallNoCardTest', (): void => {
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'getPermission beforeAll');
      await getPermissions();
      done();
    });

    afterAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterAll start');
      await Utils.clickRequestPermission('取消');
      hilog.info(domain, tag, '%{public}s', 'afterAll end');
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
