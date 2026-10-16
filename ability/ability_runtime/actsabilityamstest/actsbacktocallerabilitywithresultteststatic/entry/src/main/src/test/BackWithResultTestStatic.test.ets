'use static';
/**
 * Copyright (C) 2026 HiHope Open Source Organization
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
import {  describe, afterEach, it, expect, beforeEach, Level  } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';
import Want from '@ohos.app.ability.Want';
import { common } from '@kit.AbilityKit';
import { Driver } from '@kit.TestKit';

export default function BackWithResultTest(): void {
  describe('BackWithResultTest', () => {

    const TAG: string = 'BackToCallerAbilityWithResult';
    const TEST_SUITE_NAME: string = 'BackToCallerAbilityWithResultTest';
    const PARAMETER_ERROR_CODE2  = 16000074;
    beforeEach(async ()=>{
      let driver = Driver.create();
      await driver.delayMs(1000);
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_BackWithResult_Static_2800
     * @tc.number SUB_Ability_AbilityRuntime_BackWithResult_Static_2800
     * @tc.desc   Verify that the backToCallerAbleWithResult is invalid when requestCode is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_BackWithResult_Static_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_BackWithResult_Static_2800';
      hilog.info(0x0000, TAG, '%{public}s', `${TEST_SUITE_NAME}#${TEST_CASE_NAME} start`);
      let callerRequestCode: string = '23124asjdja';
      let want: Want = {};
      let resultCode = 100;
      let abilityResult: common.AbilityResult = {
        want,
        resultCode
      };
      let context: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('abilityContext') as common.UIAbilityContext;
      try {
        context.backToCallerAbilityWithResult(abilityResult, callerRequestCode).then(async () => {
          hilog.info(0x0000, TAG, 'backToCallerAbilityWithResult succeed');
          expect().assertFail();
        }).catch((err: Error) => {
          hilog.error(0x0000, TAG, `backToCallerAbilityWithResult1 failed, code is ${err?.code}, message is ${err.message}`);
          expect(err?.code).assertEqual(PARAMETER_ERROR_CODE2);
        });
      } catch (err) {
        hilog.error(0x0000, TAG, `backToCallerAbilityWithResult1 failed, code is ${err?.code}, message is ${err.message}`);
        expect(err?.code).assertEqual(PARAMETER_ERROR_CODE2);
      };
      done();
        })
  })
}
