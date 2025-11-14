/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import router from '@ohos.router';
import Utils from './Utils.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';


let testAbilityContext:common.UIAbilityContext;

export default function webResourceHandlerTest() {

  describe('webResourceHandlerTest', ():void => {

    beforeAll(async ():Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.logdottingtwotest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('beforeEach start');
    })

    /**
     * @generated.time 2025-11-09 20:57:57
     * @tc.name   testWebNavigationTypeStatic001
     * @tc.number SUB_WEB_WEBNAVIGATIONTYPE_0100
     * @tc.desc   test webNavigationType MAIN_FRAME_NEW_ENTRY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebNavigationTypeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testWebNavigationType001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebNavigationType001', true, 202503212, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webView', 10, '');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @generated.time 2025-11-09 20:57:57
     * @tc.name   testWebNavigationTypeStatic002
     * @tc.number SUB_WEB_WEBNAVIGATIONTYPE_0200
     * @tc.desc   test webNavigationType MAIN_FRAME_EXISTING_ENTRY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebNavigationTypeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testWebNavigationType002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebNavigationType002', true, 202503213, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webView', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @generated.time 2025-11-09 20:57:57
     * @tc.name   testWebNavigationTypeStatic003
     * @tc.number SUB_WEB_WEBNAVIGATIONTYPE_0300
     * @tc.desc   test webNavigationType NAVIGATION_TYPE_NEW_SUBFRAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebNavigationTypeStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testWebNavigationType003', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebNavigationType003', true, 202503214, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('webView', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
     * @generated.time 2025-11-09 20:57:57
     * @tc.name   SwitchNextPageStatic
     * @tc.number SwitchNextPageStatic
     * @tc.desc   SwitchNextPageStatic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webView', 10, '');
        await Utils.msSleep(6000);
        done();
      })



  })
}
