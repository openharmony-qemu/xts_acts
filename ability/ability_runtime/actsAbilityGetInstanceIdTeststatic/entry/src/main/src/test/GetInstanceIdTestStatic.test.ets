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
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import Utils from './Util.test'

const DOMAIN = 0x0000;
const domain: int = 0x0000;
const tag: string = 'GetUIAbilityByInstanceId';
const PARAM_FAIL = 'fail';
let mpEnable: string = PARAM_FAIL;
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
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        hilog.error(DOMAIN, 'testTag', 'Get system parameter error: %{public}s', JSON.stringify(err));
        mpEnable = PARAM_FAIL;
      }
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
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0100
     * @tc.desc   GetUIAbilityByInstanceId with instanceId from native interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_Static_0100';
      if (mpEnable === 'true') {
        hilog.info(DOMAIN, 'testTag', '%{public}s begin, mpEnable=true', caseName);
        try {
          let calc = new Calc();
          let instanceId = calc.getInstanceId();
          hilog.info(DOMAIN, 'testTag', '%{public}s instanceId=%{public}s', caseName, instanceId);
          if (!instanceId || instanceId.length === 0) {
            hilog.error(DOMAIN, 'testTag', '%{public}s ERROR: instanceId invalid', caseName);
            expect().assertFail();
            done();
            return;
          }
          let appContext = context?.getApplicationContext();
          let ability = appContext?.getUIAbilityByInstanceId(instanceId);
          hilog.info(DOMAIN, 'testTag', '%{public}s ability=%{public}s', caseName, ability ? 'valid' : 'null');
          
          if (ability) {
            let info = ability.context.abilityInfo;
            expect(info.name).assertEqual('EntryAbility');
            expect(info.bundleName).assertEqual('com.example.actsAbilityGetInstanceIdTest.static');
            hilog.info(DOMAIN, 'testTag', '%{public}s SUCCESS', caseName);
          } else {
            hilog.error(DOMAIN, 'testTag', '%{public}s ERROR: ability null', caseName);
            expect().assertFail();
          }
          done();
        } catch (e) {
          hilog.error(DOMAIN, 'testTag', '%{public}s EXCEPTION: %{public}s', caseName, JSON.stringify(e));
          expect().assertFail();
          done();
        }
      } else if (mpEnable === 'false') {
        hilog.info(DOMAIN, 'testTag', '%{public}s function not enable on this device, mpEnable=false', caseName);
        expect(mpEnable).assertEqual('false');
        done();
      } else {
        hilog.error(DOMAIN, 'testTag', '%{public}s wrong param, mpEnable=%{public}s', caseName, mpEnable);
        expect().assertFail();
        done();
      }
    })

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