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

import { beforeAll, beforeEach, TestType,afterEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import { UIContext, Router } from '@ohos.arkui.UIContext'
import Utils from '../../src/test/Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let testAbilityContext: common.UIAbilityContext;

export default function WebInitTest() {

  describe('WebInitTest', () => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
    });


    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('webOnFirstContFour beforeEach start');
    })

    /*
        * @tc.number     : SUB_WEB_WEBCUSTOMIZESCHEMES_0100
        * @tc.name       : testWebcustomizeSchemesStatic0100
        * @tc.desc       : test WebcustomizeSchemes
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 3
        */
    it('customizeSchemesStatic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("customizeSchemes0100", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("customizeSchemes0100", 401, 300, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('customizeSchemes', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /*
    * @tc.number     : SUB_WEB_WEBCUSTOMIZESCHEMES_0200
    * @tc.name       : testWebcustomizeSchemesStatic0200
    * @tc.desc       : test WebcustomizeSchemes
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('customizeSchemesStatic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("customizeSchemes0200", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("customizeSchemes0200", 401, 302, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('customizeSchemes', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /*
    * @tc.number     : SUB_WEB_EMITONSWITCHNEXTPAGE_0100
    * @tc.name       : testemitonSwitchNextPage
    * @tc.desc       : test emitonSwitchNextPage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 3
    */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('customizeSchemes', 10, '');
        await Utils.msSleep(2000);
        done();
      })

  })
}
