/*
* Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import commonEvent from '@ohos.commonEvent';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import commonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

const START_ABILITY_TIMEOUT = 5000;
let getAppContext1: commonEventManager.CommonEventSubscribeInfo = {
  events: ['ACTS_GetAppContext']
};

export default function appTest() {
  describe('ACTS_GetAppContext_TEST', () => {
    /**
     * @tc.name   ACTS_GetAppContext_0100
     * @tc.number ACTS_GetAppContext_0100
     * @tc.desc   Get the context of the application, Ability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ACTS_GetAppContext_0100', Level.LEVEL0, async (done: Function) => {
      let subscriber: commonEventManager.CommonEventSubscriber;
      let flag = true;
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

      commonEvent.createSubscriber(getAppContext1).then(async (data) => {
        console.debug('ACTS_GetAppContext_0100====>Create Subscriber====');
        subscriber = data;
        commonEvent.subscribe(subscriber, (err, data) => {
          if (err) {
            console.info(`callback err: ${JSON.stringify(err)}`);
            expect().assertFail();
            return;
          }
          expect(data.event == 'ACTS_GetAppContext').assertTrue();
          console.debug('====>0100 Subscribe CallBack data:' + JSON.stringify(data));
          let context = abilityDelegator.getAppContext();
          console.debug('====>ACTS_GetAppContext_0100 context:' + context);
          expect(context.applicationInfo.name).assertEqual('com.example.actsgetappcontexttest');
          commonEvent.unsubscribe(subscriber, () => {
            console.debug('====>UnSubscribeCallback====');
            flag = false
            done();
          });
        });
        console.debug('====>start startAbility====');

        AppStorage.get<common.UIAbilityContext>('abilityContext')!.startAbility(
          {
            bundleName: 'com.example.actsgetappcontexttest',
            abilityName: 'MainAbility1'
          }).then(() => {
          console.debug('====>startAbility end====');
        }).catch((err: BusinessError) => {
          console.debug('====>startAbility err:' + JSON.stringify(err));
          expect().assertFail();
          done();
        })
      }).catch((err: BusinessError) => {
        console.debug('====>createSubscriber err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      })

      setTimeout(() => {
        if (flag == true) {
          console.debug('ACTS_GetAppContext_0100 - timeout');
          done();
        }
      }, START_ABILITY_TIMEOUT);
    })
  })
}
