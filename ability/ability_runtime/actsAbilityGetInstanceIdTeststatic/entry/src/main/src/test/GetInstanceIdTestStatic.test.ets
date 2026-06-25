'use static';
/*
 * Copyright (C) 2026-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { application,common } from '@kit.AbilityKit';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test'

const DOMAIN = 0x0000;
const domain: int = 0x0000;
const tag: string = 'GetUIAbilityByInstanceId';
class Calc {
  native add(arg1: int, arg2: int): int;

  native tick(): void;

  native getInstanceId(): string;

  native registerCallback(fun: Function): void;
}

export default function ActsGetInstanceIdStaticTest(): void {
  describe('ActsGetInstanceIdStaticTest', () => {
    let context: common.UIAbilityContext | undefined
    beforeAll(async() => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      let cmd = "aa start -a EntryAbility -b com.example.actsAbilityGetInstanceIdTest.static";
      let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
      if(user !== undefined){
          cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0300
     * @tc.desc   Testing GetUIAbilityByInstanceId empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, ` start.`);
      try {
        let appContext = context?.getApplicationContext();
        let ability = appContext?.getUIAbilityByInstanceId('');
        expect().assertFail();
        done();
      } catch (err){
        hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0200 getUIAbilityByInstanceId err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(16000003);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0400
     * @tc.desc   Testing GetUIAbilityByInstanceId The ID does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, ` start.`);
      try {
        let appContext = context?.getApplicationContext();
        let ability = appContext?.getUIAbilityByInstanceId('');
        expect().assertFail();
        done();
      } catch (err){
        hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0200 getUIAbilityByInstanceId err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(16000003);
        done();
      }
    })
  });
}