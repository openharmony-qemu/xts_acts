'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;

export default function webSetSoftKeyboardBehaviorModeParamTest():void {
  describe('WebSetSoftKeyboardBehaviorModeParamTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      let cmd = "aa start -a EntryAbility -b com.pageInteractionFour.test.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async  () =>{
      await Utils.msSleep(2000);
      console.info("WebSetSoftKeyboardBehaviorModeParamTest beforeEach start");
    })

    // /**
    //  * @tc.name   testSetSoftKeyboardBehaviorModeParamNull001
    //  * @tc.number SUB_WEB_WEBVIEW_SETSOFTKEYBOARDBEHAVIORMODE_PARAM_0100
    //  * @tc.desc   setSoftKeyboardBehaviorMode null param test.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testSetSoftKeyboardBehaviorModeParamNull001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   await Utils.msSleep(2000)
    //   Utils.emitEvent("testSetSoftKeyboardBehaviorModeParamNull001", 10)
    //   await Utils.msSleep(1000)
    //   Utils.registerEvent("testSetSoftKeyboardBehaviorModeParamNull001", "401", 202609011, done);
    //   await Utils.msSleep(1000)
    //   inspector.sendEventByKey('SetSoftKeyboardBehaviorModeParamTestButton', 10, '');
    //   await Utils.msSleep(5000)
    //   done();
    // })

    // /**
    //  * @tc.name   testSetSoftKeyboardBehaviorModeParamUndefined001
    //  * @tc.number SUB_WEB_WEBVIEW_SETSOFTKEYBOARDBEHAVIORMODE_PARAM_0200
    //  * @tc.desc   setSoftKeyboardBehaviorMode undefined param test.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testSetSoftKeyboardBehaviorModeParamUndefined001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   await Utils.msSleep(2000)
    //   Utils.emitEvent("testSetSoftKeyboardBehaviorModeParamUndefined001", 10)
    //   await Utils.msSleep(1000)
    //   Utils.registerEvent("testSetSoftKeyboardBehaviorModeParamUndefined001", "401", 202609012, done);
    //   await Utils.msSleep(1000)
    //   inspector.sendEventByKey('SetSoftKeyboardBehaviorModeParamTestButton', 10, '');
    //   await Utils.msSleep(5000)
    //   done();
    // })

    /**
     * @tc.name   testSetSoftKeyboardBehaviorModeParamInvalidEnum001
     * @tc.number SUB_WEB_WEBVIEW_SETSOFTKEYBOARDBEHAVIORMODE_PARAM_0300
     * @tc.desc   setSoftKeyboardBehaviorMode invalid enum value 2 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSoftKeyboardBehaviorModeParamInvalidEnum001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testSetSoftKeyboardBehaviorModeParamInvalidEnum001", 10)
      await Utils.msSleep(1000)
      Utils.registerEvent("testSetSoftKeyboardBehaviorModeParamInvalidEnum001", "401", 202609013, done);
      await Utils.msSleep(1000)
      inspector.sendEventByKey('SetSoftKeyboardBehaviorModeParamTestButton', 10, '');
      await Utils.msSleep(5000)
      done();
    })

    /**
     * @tc.name   testSetSoftKeyboardBehaviorModeParamInvalidEnum002
     * @tc.number SUB_WEB_WEBVIEW_SETSOFTKEYBOARDBEHAVIORMODE_PARAM_0400
     * @tc.desc   setSoftKeyboardBehaviorMode invalid enum value -1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetSoftKeyboardBehaviorModeParamInvalidEnum002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testSetSoftKeyboardBehaviorModeParamInvalidEnum002", 10)
      await Utils.msSleep(1000)
      Utils.registerEvent("testSetSoftKeyboardBehaviorModeParamInvalidEnum002", "401", 202609014, done);
      await Utils.msSleep(1000)
      inspector.sendEventByKey('SetSoftKeyboardBehaviorModeParamTestButton', 10, '');
      await Utils.msSleep(5000)
      done();
    })
  })
}

