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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll,TestType, Size, Level , it, expect } from '@ohos/hypium';
import testNapi from 'libentry.so';
import { application,common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';

const DOMAIN = 0x0000;

export default function ActsGetInstanceIdTest() {
  describe('ActsGetInstanceIdTest', () => {
    let abilityContext: common.UIAbilityContext;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      abilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext;
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0300
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0300
     * @tc.desc   Testing GetUIAbilityByInstanceId empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      try {
        let appContext = application.getApplicationContext();
        let ability = appContext.getUIAbilityByInstanceId('');
        expect().assertFail();
        done();
      } catch (err){
        hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0300 getUIAbilityByInstanceId err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(16000003);
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0400
     * @tc.number SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0400
     * @tc.desc   Testing GetUIAbilityByInstanceId The ID does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      try {
        let appContext = application.getApplicationContext();
        let ability = appContext.getUIAbilityByInstanceId('sdhwuiwoija');
        expect().assertFail();
        done();
      } catch (err){
        hilog.info(DOMAIN, 'testTag', 'SUB_Ability_AbilityRuntime_GetUIAbilityByInstanceId_0400 getUIAbilityByInstanceId err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(16000003);
        done();
      }
    })
  })
}