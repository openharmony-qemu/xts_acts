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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import childProcessManager from '@ohos.app.ability.childProcessManager';
import { BusinessError } from '@ohos.base';
import systemParameterEnhance from '@ohos.systemParameterEnhance';
import { hilog } from '@kit.PerformanceAnalysisKit';
import childProcessNapi from 'libentry.so';

export default function IsChildProcessSupportedTest() {
  describe('IsChildProcessSupportedTest', () => {
    let mpEnable: string;
    beforeAll((done: Function) => {
      mpEnable = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_isChildProcessSupported_0400
     * @tc.number SUB_Ability_AbilityRuntime_isChildProcessSupported_0400
     * @tc.desc   test childProcessManager.isArkChildProcessSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_isChildProcessSupported_0400', Level.LEVEL1, async (done: Function) => {
      hilog.info(0x0000, 'testTag', `SUB_Ability_AbilityRuntime_isChildProcessSupported_0400 begin`);
      try {
        let result: boolean = childProcessManager.isArkChildProcessSupported();
        hilog.info(0x0000, 'testTag', `childProcessManager.isArkChildProcessSupported:${result}`);
        if( mpEnable === 'true') {
          expect(result).assertTrue();
        } else {
          expect(result).assertFalse();
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag', `childProcessManager.isArkChildProcessSupported error:${e.code}, ${e.message}.`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_isChildProcessSupported_0900
     * @tc.number SUB_Ability_AbilityRuntime_isChildProcessSupported_0900
     * @tc.desc   test childProcessManager.isNativeChildProcessSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_isChildProcessSupported_0900', Level.LEVEL1, async (done: Function) => {
      hilog.info(0x0000, 'testTag', `SUB_Ability_AbilityRuntime_isChildProcessSupported_0900 begin`);
      try {
        let result: boolean = childProcessManager.isNativeChildProcessSupported();
        hilog.info(0x0000, 'testTag', `childProcessManager.isNativeChildProcessSupported:${result}`);
        if( mpEnable === 'true') {
          expect(result).assertTrue();
        } else {
          expect(result).assertFalse();
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag', `childProcessManager.isNativeChildProcessSupported error:${e.code}, ${e.message}.`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_isChildProcessSupported_1400
     * @tc.number SUB_Ability_AbilityRuntime_isChildProcessSupported_1400
     * @tc.desc   test OH_Ability_IsNativeChildProcessSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_isChildProcessSupported_1400', Level.LEVEL1, async (done: Function) => {
      hilog.info(0x0000, 'testTag', `SUB_Ability_AbilityRuntime_isChildProcessSupported_1400 begin`);
      try {
        let result: boolean = childProcessNapi.isChildProcessSupported();
        hilog.info(0x0000, 'testTag', `OH_Ability_IsNativeChildProcessSupported:${result}`);
        if( mpEnable === 'true') {
          expect(result).assertTrue();
        } else {
          expect(result).assertFalse();
        }
        done();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        hilog.error(0x0000, 'testTag', `OH_Ability_IsNativeChildProcessSupported error:${e.code}, ${e.message}.`);
        expect().assertFail();
        done();
      }
    });
  });
}
