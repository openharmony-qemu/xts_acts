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

export default function handleFullscreenChangedParamTest():void {
  describe('HandleFullscreenChangedParamTest', () => {

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
      console.info("HandleFullscreenChangedParamTest beforeEach start");
    })

    /**
     * @tc.name   testHandleFullscreenChangedParamNull001
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_HANDLEFULLSCREENCHANGED_PARAM_0100
     * @tc.desc   handleFullscreenChanged null param test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleFullscreenChangedParamNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(15000);
        Utils.emitEvent('testHandleFullscreenChangedParamNull001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleFullscreenChangedParamNull001", "401", 202609031, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('HandleFullscreenChangedParamTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testHandleFullscreenChangedParamUndefined001
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_HANDLEFULLSCREENCHANGED_PARAM_0200
     * @tc.desc   handleFullscreenChanged undefined param test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleFullscreenChangedParamUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleFullscreenChangedParamUndefined001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testHandleFullscreenChangedParamUndefined001", "401", 202609032, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('HandleFullscreenChangedParamTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })




  })
}

