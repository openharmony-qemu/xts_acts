/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium-dynamic';
import appManager from '@ohos.app.ability.appManager';
import { common, Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import commonEventManager from '@ohos.commonEventManager';

const ERR_PERMISSION = 201;
const ERR_OBSERVER_NOT_EXIST = 16300004;
const EVENT_BACK = 'ActsAbilityApi26NoPerm_BackToCaller';
const BUNDLE = 'com.test.actsabilityapi26nopermissionrely';

function getUiContext(): common.UIAbilityContext {
  return AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
}

export default function NoPermissionApi26Test() {
  describe('NoPermissionApi26Test', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NoPerm_OnFocusedApplicationChanged_0100
     * @tc.number SUB_Ability_AbilityRuntime_NoPerm_OnFocusedApplicationChanged_0100
     * @tc.desc   onFocusedApplicationChanged without RUNNING_STATE_OBSERVER; expect 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NoPerm_OnFocusedApplicationChanged_0100', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_NoPerm_OnFocusedApplicationChanged_0100';
        let observer: appManager.FocusedApplicationObserver = {
          onFocusedApplicationChanged(_info: appManager.FocusedApplicationInfo) {
          }
        };
        try {
          appManager.onFocusedApplicationChanged(observer);
          expect().assertFail();
        } catch (err) {
          let e = err as BusinessError;
          console.error(`${tag} err code=${e.code}`);
          expect(e.code).assertEqual(ERR_PERMISSION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NoPerm_OffFocusedApplicationChanged_0200
     * @tc.number SUB_Ability_AbilityRuntime_NoPerm_OffFocusedApplicationChanged_0200
     * @tc.desc   offFocusedApplicationChanged observerId=0 without prior register; expect 16300004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NoPerm_OffFocusedApplicationChanged_0200', Level.LEVEL0,
      (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_NoPerm_OffFocusedApplicationChanged_0200';
        try {
          appManager.offFocusedApplicationChanged(0);
          expect().assertFail();
        } catch (err) {
          let e = err as BusinessError;
          console.error(`${tag} err code=${e.code}`);
          expect(e.code).assertEqual(ERR_OBSERVER_NOT_EXIST);
        }
        done();
      });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_NoPerm_BackToCallerAppWithResult_0300
     * @tc.number SUB_Ability_AbilityRuntime_NoPerm_BackToCallerAppWithResult_0300
     * @tc.desc   startAbilityForResult EntryAbility then background backToCaller without
     *     START_ABILITIES_FROM_BACKGROUND; expect CommonEvent result 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_NoPerm_BackToCallerAppWithResult_0300', Level.LEVEL0,
      async (done: Function) => {
        let tag = 'SUB_Ability_AbilityRuntime_NoPerm_BackToCallerAppWithResult_0300';
        let context = getUiContext();
        let subscribeInfo: commonEventManager.CommonEventSubscribeInfo = {
          events: [EVENT_BACK]
        };
        let subscriber: commonEventManager.CommonEventSubscriber =
          await commonEventManager.createSubscriber(subscribeInfo);
        let finished = false;
        let timer = setTimeout(() => {
          if (!finished) {
            finished = true;
            console.error(`${tag} timeout waiting CommonEvent`);
            expect().assertFail();
            done();
          }
        }, 20000);
        commonEventManager.subscribe(subscriber, (err, data) => {
          if (finished) {
            return;
          }
          finished = true;
          clearTimeout(timer);
          let code = data?.parameters?.['result'] as number;
          console.info(`${tag} event result=${code} err=${JSON.stringify(err)}`);
          expect(code).assertEqual(ERR_PERMISSION);
          commonEventManager.unsubscribe(subscriber, () => {
            done();
          });
        });
        let want: Want = {
          bundleName: BUNDLE,
          abilityName: 'EntryAbility',
          parameters: {
            'caseName': 'backToCaller201'
          }
        };
        try {
          context.startAbilityForResult(want, (err, _result) => {
            console.info(`${tag} startAbilityForResult cb err=${JSON.stringify(err)}`);
          });
        } catch (startErr) {
          finished = true;
          clearTimeout(timer);
          console.error(`${tag} startAbilityForResult throw ${JSON.stringify(startErr)}`);
          expect().assertFail();
          done();
        }
      });
  });
}
