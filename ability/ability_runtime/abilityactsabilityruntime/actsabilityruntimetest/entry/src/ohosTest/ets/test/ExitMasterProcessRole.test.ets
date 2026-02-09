/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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


import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { application } from '@kit.AbilityKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';

let context:common.UIAbilityContext;
let mpEnable: string;
export default function AbilityRuntimeExitMasterProcessRole() {
  describe('AbilityRuntimeExitMasterProcessRole', () => {
    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>("abilityContext") as common.UIAbilityContext
      try {
        mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      } catch (err) {
        hilog.info(0x0000, "[%{public}s] Get system parameter error: ${public}s", JSON.stringify(err));
        mpEnable = 'fail';
      }
    })
    beforeEach(async () => {})
    afterEach(() => {})
    afterAll(async () => {})
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ExitMasterProcessRole_0100
     * @tc.number SUB_Ability_AbilityRuntime_ExitMasterProcessRole_0100
     * @tc.desc   Verify that calling the ExitMasterProcessRole interface on unsupported devices returns error code 801
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_ExitMasterProcessRole_0100', Level.LEVEL0, async (done:Function) => {
      let testNum = 'SUB_Ability_AbilityRuntime_ExitMasterProcessRole_0100'
      if (mpEnable == 'true') {
        hilog.info(0x0000, 'testTag', `restart failed: The current device does not support`);
        done();
      }else if (mpEnable == 'false') {
        try {
          await application.exitMasterProcessRole()
          expect().assertFail()
          done();
        } catch (err) {
          hilog.error(0x0000, 'testTag', `requestPermissionsFromUser  restart failed: ${err.code}, ${err.message},${testNum}`);
          expect(err?.code).assertEqual(801)
          done();
        }
      } else {
        hilog.info(0x0000, 'testTag', `restart failed: The current device does not support`,mpEnable);
        expect().assertFail();
        done();
      }
    })
  })
}
