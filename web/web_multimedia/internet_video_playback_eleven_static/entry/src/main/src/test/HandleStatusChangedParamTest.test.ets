'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function handleStatusChangedParamTest():void {
  describe('HandleStatusChangedParamTest', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(10000)
      let cmd = "aa start -a EntryAbility -b com.open.harmony.videohostingtwotest.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(10000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(5000);
      console.info("HandleStatusChangedParamTest beforeEach start");
    })

    // /**
    //  * @tc.name   testHandleStatusChangedParamNull001
    //  * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_HANDLESTATUSCHANGED_PARAM_0100
    //  * @tc.desc   handleStatusChanged null param test.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testHandleStatusChangedParamNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     await Utils.msSleep(15000);
    //     Utils.emitEvent('testHandleStatusChangedParamNull001', 10)
    //     await Utils.msSleep(2000);
    //     Utils.registerEvent("testHandleStatusChangedParamNull001", "401", 202609021, done);
    //     await Utils.msSleep(2000);
    //     inspector.sendEventByKey('HandleStatusChangedParamTestButton', 10, '');
    //     await Utils.msSleep(5000);
    //     done();
    //   })

    // /**
    //  * @tc.name   testHandleStatusChangedParamUndefined001
    //  * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_HANDLESTATUSCHANGED_PARAM_0200
    //  * @tc.desc   handleStatusChanged undefined param test.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testHandleStatusChangedParamUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
    //   async (done: () => void): Promise<void> => {
    //     await Utils.msSleep(2000);
    //     Utils.emitEvent('testHandleStatusChangedParamUndefined001', 10)
    //     await Utils.msSleep(2000);
    //     Utils.registerEvent("testHandleStatusChangedParamUndefined001", "401", 202609022, done);
    //     await Utils.msSleep(2000);
    //     inspector.sendEventByKey('HandleStatusChangedParamTestButton', 10, '');
    //     await Utils.msSleep(5000);
    //     done();
    //   })

    /**
     * @tc.name   testOnSwitchNextPageChangeParamTest
     * @tc.number SUB_WEB_NEXT_PAGE_0200
     * @tc.desc   PAGE_REDIRECT.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testOnSwitchNextPageChangeParamTest',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitOnSwitchNextPageChangeParamTest', 10)
      await Utils.msSleep(2000);
      inspector.sendEventByKey('HandleFullscreenChangedParamTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })


  })
}


