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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';
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

    /**
     * @tc.name   testHandleStatusChangedPlaying001
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_HANDLESTATUSCHANGED_PLAYING_0100
     * @tc.desc   handleStatusChanged PLAYING enum test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleStatusChangedPlaying001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(15000);
        Utils.emitEvent('testHandleStatusChangedPlaying001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testHandleStatusChangedPlaying001', true, 202609021, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('HandleStatusChangedParamTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testHandleStatusChangedPaused001
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_HANDLESTATUSCHANGED_PAUSED_0200
     * @tc.desc   handleStatusChanged PAUSED enum test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleStatusChangedPaused001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleStatusChangedPaused001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testHandleStatusChangedPaused001', true, 202609022, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('HandleStatusChangedParamTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testHandleStatusChangedInvalidEnum001
     * @tc.number SUB_WEB_NATIVEMEDIAPLAYERHANDLER_HANDLESTATUSCHANGED_INVALID_0300
     * @tc.desc   handleStatusChanged out-of-range enum test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHandleStatusChangedInvalidEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testHandleStatusChangedInvalidEnum001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testHandleStatusChangedInvalidEnum001', '401', 202609023, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('HandleStatusChangedParamTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })

    /**
     * @tc.name   testOnSwitchNextPageChangeParamTest
     * @tc.number SUB_WEB_NEXT_PAGE_0400
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


