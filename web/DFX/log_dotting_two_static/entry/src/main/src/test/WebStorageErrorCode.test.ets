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

export default function webTwoJsunit() {

  describe('componentLifeCycleTestOne', (): void => {
    beforeAll(async (): Promise<void> => {
        console.log(' App start')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })


    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CLEARMATCHES_0100
    * @tc.name       : testClearMatchesError001
    * @tc.desc       : test ClearMatches error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testClearMatchesError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitClearMatches', 10)

      Utils.registerEvent('testClearMatchesError001', 17100001, 1007, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /*
    * @tc.number     : SUB_WEB_ERRORCODE_CREATEWEBMESSAGEPORTS_0100
    * @tc.name       : testCreateWebMessagePortsError001
    * @tc.desc       : test CreateWebMessagePorts error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testCreateWebMessagePortsError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitCreateWebMessagePort', 10)
      Utils.registerEvent('testCreateWebMessagePortsError001', 17100001, 1021, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /*
    * @tc.number     : SUB_WEB_ERRORECODE_PREPAREFORPAGELOAD_0100
    * @tc.name       : testPrepareForPageLoadError001
    * @tc.desc       : test prepareForPageLoad error
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('testPrepareForPageLoadError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent('testPrepareForPageLoadError001', 10)
      Utils.registerEvent('testPrepareForPageLoadError001', 17100001, 50025, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /*
   * @tc.number     : SUB_WEB_ERRORCODE_CLOSE_0100
   * @tc.name       : testCloseErrorStatic001
   * @tc.desc       : test close error
   * @tc.size       : MEDIUM
   * @tc.type       : Function
   * @tc.level      : Level 3
   */
    it('testCloseErrorStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testCloseError001', 10)
        await Utils.msSleep(2000);
        Utils.registerEvent('testCloseError001', '17100010', 20360, done);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(4000);
        done()
      })
    /*
   * @tc.number     : SUB_WEB_ERRORCODE_POSTMESSAGE_0200
   * @tc.name       : testPostMessageError002
   * @tc.desc       : test PostMessage error
   * @tc.size       : MEDIUM
   * @tc.type       : Function
   * @tc.level      : Level 3
   */
    it('testWebMessagePortError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,  async (done: () => void): Promise<void> => {
      Utils.emitEvent("emitPostMessage", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testPostMessageError002", 17100001, 1022, done);
      inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
      await Utils.msSleep(4000);
      done()
    })
    /*
   * @tc.number     : SUB_WEB_ERRORCODE_POSTMESSAGE_0300
   * @tc.name       : SwitchNextPageStatic
   * @tc.desc       : test PAGE_REDIRECT
   * @tc.size       : MEDIUM
   * @tc.type       : Function
   * @tc.level      : Level 3
   */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('ErrorCodeTestSuiteButton', 10, '');
        await Utils.msSleep(6000);
        done();
      })
  })
}
