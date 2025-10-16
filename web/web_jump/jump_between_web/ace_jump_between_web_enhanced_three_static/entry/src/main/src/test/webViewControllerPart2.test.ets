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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import hilog from '@ohos.hilog';
import { Driver, ON } from '@ohos.UiTest';
import { WebNetErrorList } from '@ohos.web.netErrorList'

let emitKey = ''
let testAbilityContext: common.UIAbilityContext;

export default function webViewControllerPart2() {

  describe('WebViewControllerPart2TestSuite', () => {

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
      }, (err: BusinessError | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.actsacejumpbetweenwebenhancedtestthreetest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("webViewControllerPart2 beforeEach start");
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0200
    * @tc.name       : testBackOrForward002
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testBackOrForward_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testBackOrForward002", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testBackOrForward002", "index", 37006, done);
        await Utils.msSleep(2000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebViewControllerPart2Button'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();

      })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0300
    * @tc.name       : testBackOrForward003
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackOrForward_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testBackOrForward003", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testBackOrForward003", "index", 37007, done);
        await Utils.msSleep(2000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebViewControllerPart2Button'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_BACKORFORWARD_0400
    * @tc.name       : testBackOrForward004
    * @tc.desc       : test backOrForward
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testBackOrForward_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("testBackOrForward004", 10)
        await Utils.msSleep(5000);
        Utils.registerEvent("testBackOrForward004", "index", 37008, done);
        await Utils.msSleep(5000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebViewControllerPart2Button'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      })
  })
}
