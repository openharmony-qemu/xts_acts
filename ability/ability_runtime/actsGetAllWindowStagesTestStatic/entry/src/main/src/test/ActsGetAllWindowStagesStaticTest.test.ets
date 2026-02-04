/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, beforeEach } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import application from '@ohos.app.ability.application';
import window from '@ohos.window';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
let targetVersion:number;
let tag = 'testTag'
let testAbilityContext: common.UIAbilityContext;

export default function ActsGetAllWindowStagesStaticTest() {
  describe('ActsGetAllWindowStagesStaticTest', () => {
    beforeAll(async() => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start1');
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start2');
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.example.GetAllWindowStages.static')
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start3');
      await Utils.msSleep(2000)
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext;
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_getAllWindowStages_static_2600
     * @tc.number SUB_Ability_AbilityRuntime_getAllWindowStages_static_2600
     * @tc.desc   Using the on method set color mode and check the result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_getAllWindowStages_static_2600', Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, 'applicationContextTag', '%{public}s',
        'SUB_Ability_AbilityRuntime_getAllWindowStages_static_2600 begin');
      let applicationContext: common.ApplicationContext = testAbilityContext.getApplicationContext();
      try {
        applicationContext.getAllWindowStages()
          .then((data: Array<window.WindowStage>) => {
            hilog.info(0x0000, 'testTag', `getAllWindowStages success data is ${JSON.stringify(data)} `);
            hilog.info(0x0000, 'testTag', `Data: ` + (data[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name);
            expect(data.length).assertEqual(1);
            expect((data[0].getMainWindowSync().getUIContext().getHostContext() as common.UIAbilityContext).abilityInfo.name).assertEqual('EntryAbility');
            done();
          })
          .catch((e: Error) => {
            let err = e as BusinessError;
            hilog.error(0x0000, 'testTag', `getAllWindowStages error, code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          });
        done();
      } catch (error:Error) {
        hilog.info(0x0000, 'testTag', '%{public}s',
          'SUB_Ability_AbilityRuntime_getAllWindowStages_static_2600 failed ' +  error.message);
        expect().assertFail();
        done();
      }
    });


  })
}