'use static';
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
import { describe, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import hilog from '@ohos.hilog'
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import { BusinessError } from '@ohos.base';

export default function IsChildProcessSupportedStaticTest() {
  let mpEnable: string = '';
  describe('IsChildProcessSupportedStaticTest', (): void => {
    beforeAll((done: () => void) => {
      mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_isChildProcessSupported_static_0400
     * @tc.number SUB_Ability_AbilityRuntime_isChildProcessSupported_static_0400
     * @tc.desc   test childProcessManager.isArkChildProcessSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_isChildProcessSupported_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_isChildProcessSupported_static_0400';
      hilog.info(0x0000, 'testTag', `${caseName} Begin`);
      try {
        let result: boolean = childProcessManager.isArkChildProcessSupported();
        hilog.info(0x0000, 'testTag', `childProcessManager.isArkChildProcessSupported:${result}`);
        if( mpEnable === 'true') {
          expect(result).assertTrue();
        } else {
          expect(result).assertFalse();
        }
        done();
      } catch (e) {
        hilog.error(0x0000, 'testTag', `childProcessManager.isArkChildProcessSupported error:${e.code}, ${e.message}.`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_isChildProcessSupported_static_0900
     * @tc.number SUB_Ability_AbilityRuntime_isChildProcessSupported_static_0900
     * @tc.desc   test childProcessManager.isNativeChildProcessSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_isChildProcessSupported_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_isChildProcessSupported_static_0900';
      hilog.info(0x0000, 'testTag', `${caseName} Begin`);
      try {
        let result: boolean = childProcessManager.isNativeChildProcessSupported();
        hilog.info(0x0000, 'testTag', `childProcessManager.isNativeChildProcessSupported:${result}`);
        if( mpEnable === 'true') {
          expect(result).assertTrue();
        } else {
          expect(result).assertFalse();
        }
        done();
      } catch (e) {
        hilog.error(0x0000, 'testTag', `childProcessManager.isNativeChildProcessSupported error:${e.code}, ${e.message}.`);
        expect().assertFail();
        done();
      }
    });

  })
}
