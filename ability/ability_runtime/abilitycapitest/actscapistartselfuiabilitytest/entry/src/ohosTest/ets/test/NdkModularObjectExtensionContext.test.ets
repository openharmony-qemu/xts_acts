/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

import testNapi from 'libentry.so';

const TAG = 'SUB_Ability_AbilityRuntime_ModularObjectExtensionContextTest';
const PARAM_INVALID_CODE = 401;

export default function ndkModularObjectExtensionContextTest() {
  describe('ActsCapiAbilityRuntimeModularObjectExtensionContextNDKTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionContext_GetBaseContext with null modObjExtensionContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtCtxGetBaseContext_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0200
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionContext_GetBaseContext with null baseContext
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtCtxGetBaseContext_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtCtxGetBaseContext_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbility with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtCtxStartSelfUIAbility_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0200
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbility with null want
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbility_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtCtxStartSelfUIAbility_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbilityWithStartOptions with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtCtxStartSelfUIAbilityWithOptions_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0200
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0200
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbilityWithStartOptions with null want
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0200', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0200';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtCtxStartSelfUIAbilityWithOptions_0200();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0300
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0300
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionContext_StartSelfUIAbilityWithStartOptions with null options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0300', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtCtxStartSelfUIAbilityWithOptions_0300';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtCtxStartSelfUIAbilityWithOptions_0300();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_ModObjExtCtxTerminateSelf_0100
     * @tc.number SUB_Ability_AbilityRuntime_ModObjExtCtxTerminateSelf_0100
     * @tc.desc   Test OH_AbilityRuntime_ModObjExtensionContext_TerminateSelf with null context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_ModObjExtCtxTerminateSelf_0100', Level.LEVEL3, (done: Function) => {
      const TEST_SUITE_NAME = 'SUB_Ability_AbilityRuntime_ModObjExtCtxTerminateSelf_0100';
      hilog.info(0x0000, TAG, '%{public}s', `begin of ${TEST_SUITE_NAME}`);
      let result = testNapi.ndkModObjExtCtxTerminateSelf_0100();
      expect(result).assertEqual(PARAM_INVALID_CODE);
      hilog.info(0x0000, TAG, '%{public}s', `end of ${TEST_SUITE_NAME}`);
      done();
    })

  })
}