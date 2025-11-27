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

import { beforeAll, beforeEach, describe, it, Level, Size, TestType, afterEach } from '../../../hypium/index';
import Utils from './Utils.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';

let testAbilityContext: common.UIAbilityContext;
let emitKey = '';

export default function SetWebDebugAccess() {

  describe('ActsWebSetWebDebugAccessTest', () => {

    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.webpagedebugtest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });


    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0001
    * @tc.name       : testSetWebDebugAccessEnableDebugPortAllowedStatic
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 8888
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessEnableDebugPortAllowedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent('emitSetWebDebugAccessEnableDebugPortAllowed', 10)
      await Utils.msSleep(5000)
      Utils.registerEvent('testSetWebDebugAccessEnableDebugPortAllowed', true, 2025060901, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done()
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0002
    * @tc.name       : testSetWebDebugAccessEnableDebugPortAllowedTwoStatic
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 99999999
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessEnableDebugPortAllowedTwoStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetWebDebugAccessEnableDebugPortAllowedTwo', 10)
      await Utils.msSleep(2000)
      Utils.registerEvent('testSetWebDebugAccessEnableDebugPortAllowedTwo', '17100023', 2025060902, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done()
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0003
    * @tc.name       : testSetWebDebugAccessEnableDebugPortAllowedThreeStatic
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 65535
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessEnableDebugPortAllowedThreeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetWebDebugAccessEnableDebugPortAllowedThree', 10)
      await Utils.msSleep(2000)
      Utils.registerEvent('testSetWebDebugAccessEnableDebugPortAllowedThree', true, 2025060903, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done()
    })


    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0004
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNotAllowedOneStatic
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 0 not allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessEnableDebugPortNotAllowedOneStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetWebDebugAccessEnableDebugPortNotAllowedOne', 10)
      await Utils.msSleep(2000)
      Utils.registerEvent('testSetWebDebugAccessEnableDebugPortNotAllowedOne', '17100023', 2025060904, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done()
    })


    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0005
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNotAllowedTwoStatic
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 1024 not allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessEnableDebugPortNotAllowedTwoStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetWebDebugAccessEnableDebugPortNotAllowedTwo', 10)
      await Utils.msSleep(2000)
      Utils.registerEvent('testSetWebDebugAccessEnableDebugPortNotAllowedTwo', '17100023', 2025060905, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done()
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0006
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNotAllowedThreeStatic
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 888 not allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessEnableDebugPortNotAllowedThreeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetWebDebugAccessEnableDebugPortNotAllowedThree', 10)
      await Utils.msSleep(2000)
      Utils.registerEvent('testSetWebDebugAccessEnableDebugPortNotAllowedThree', '17100023', 2025060906, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done()
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0007
    * @tc.name       : testSetWebDebugAccessEnableDebugPortNegativeNumberStatic
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to negative number
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessEnableDebugPortNegativeNumberStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetWebDebugAccessEnableDebugPortNegativeNumber', 10)
      await Utils.msSleep(2000)
      Utils.registerEvent('testSetWebDebugAccessEnableDebugPortNegativeNumber', '17100023', 2025060907, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done()
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0008
    * @tc.name       : testSetWebDebugAccessEnableDebugPortEmptyStatic
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to empty
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessEnableDebugPortEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetWebDebugAccessEnableDebugPortEmpty', 10)
      await Utils.msSleep(2000)
      Utils.registerEvent('testSetWebDebugAccessEnableDebugPortEmpty', true, 2025060908, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done()
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0012
    * @tc.name       : testSetWebDebugAccessNotEnableDebugPortAllowedStatic
    * @tc.desc       : test SetWebDebugAccess not enables debugging . set the port   8888 to allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessNotEnableDebugPortAllowedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetWebDebugAccessNotEnableDebugPortAllowed', 10)
      await Utils.msSleep(2000)
      Utils.registerEvent('testSetWebDebugAccessNotEnableDebugPortAllowed', true, 2025060912, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done()
    })

    /*
    * @tc.number     : SUB_ACE_WEB_SETWEBDEBUGACCESS_API_0013
    * @tc.name       : testSetWebDebugAccessNotEnableDebugPortNotAllowedStatic
    * @tc.desc       : test SetWebDebugAccess enables debugging . set the port number to 1024 not allowed
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testSetWebDebugAccessNotEnableDebugPortNotAllowedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetWebDebugAccessNotEnableDebugPortNotAllowed', 10)
      await Utils.msSleep(2000)
      Utils.registerEvent('testSetWebDebugAccessNotEnableDebugPortNotAllowed', '17100023', 2025060913, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('setWebDebuggingAccess', 10, '');
      await Utils.msSleep(6000)
      done();
    })


  })
}
