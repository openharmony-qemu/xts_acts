/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';
import appMemoryOptimizer from '@ohos.app.ability.appMemoryOptimizer';
import { BusinessError } from '@ohos.base';

const TEST_SUITE_NAME: string = 'ActsAppMemoryOptimizerTest';
let TEST_CASE_NAME: string = '';

const ERROR_CODE_FILE_TYPE: number = 16000163;
const ERROR_CODE_CONFIG_PARSE: number = 16000164;

export default function appMemoryOptimizerTest() {
  describe('ActsAppMemoryOptimizerTest', () => {
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0100
     * @tc.desc   Call evictFilePages with a valid .so file name, expect the promise is resolved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0100', Level.LEVEL1, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0100';
      try {
        await appMemoryOptimizer.evictFilePages(['libentry.so']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} failed: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0200
     * @tc.desc   Call evictFilePages with a valid .hap file name, expect the promise is resolved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0200', Level.LEVEL1, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0200';
      try {
        await appMemoryOptimizer.evictFilePages(['ActsAppMemoryOptimizerTest.hap']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} failed: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0300
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0300
     * @tc.desc   Call evictFilePages with a valid .hsp file name, expect the promise is resolved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0300', Level.LEVEL1, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0300';
      try {
        await appMemoryOptimizer.evictFilePages(['library.hsp']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} failed: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0400
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0400
     * @tc.desc   Call evictFilePages with an invalid file type (.txt), expect error code 16000163.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0400', Level.LEVEL1, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictFilePages_0400';
      try {
        await appMemoryOptimizer.evictFilePages(['invalid.txt']);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} caught: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ERROR_CODE_FILE_TYPE);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0100
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0100
     * @tc.desc   Call evictModuleFilePages with the entry module name, whose memory_optimizer.json
     *            contains a valid evictFilePages array, expect the promise is resolved.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0100', Level.LEVEL1, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0100';
      try {
        await appMemoryOptimizer.evictModuleFilePages(['entry']);
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} failed: ${JSON.stringify(e)}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0200
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0200
     * @tc.desc   Call evictModuleFilePages with the library module name, whose memory_optimizer.json
     *            contains a file name with an invalid type (.txt), expect error code 16000163.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0200', Level.LEVEL1, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0200';
      try {
        await appMemoryOptimizer.evictModuleFilePages(['library']);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} caught: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ERROR_CODE_FILE_TYPE);
      }
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0300
     * @tc.number SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0300
     * @tc.desc   Call evictModuleFilePages with the library2 module name, which has no
     *            memory_optimizer.json under rawfile, expect error code 16000164
     *            (failed to parse configuration file).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0300', Level.LEVEL1, async (done: Function) => {
      TEST_CASE_NAME = 'SUB_Ability_AbilityRuntime_AppMemoryOptimizer_EvictModuleFilePages_0300';
      try {
        await appMemoryOptimizer.evictModuleFilePages(['library2']);
        expect().assertFail();
      } catch (err) {
        let e: BusinessError = err as BusinessError;
        console.info(`${TEST_SUITE_NAME}#${TEST_CASE_NAME} caught: ${JSON.stringify(e)}`);
        expect(e.code).assertEqual(ERROR_CODE_CONFIG_PARSE);
      }
      done();
    })
  })
}
