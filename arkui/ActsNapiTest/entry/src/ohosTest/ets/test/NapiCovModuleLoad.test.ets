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

import { beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import testNapi from 'libnapiCovModuleLoad.so';

export default function napiCovModuleLoadTest() {
  describe('ActsNapiCovModuleLoadTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testLoadModuleRetVal
     * @tc.number SUB_NAPI_NOCOV_MOD_0001
     * @tc.desc   Verify napi_load_module with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleStable
     * @tc.number SUB_NAPI_NOCOV_MOD_0002
     * @tc.desc   Verify napi_load_module with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleMultiThread
     * @tc.number SUB_NAPI_NOCOV_MOD_0003
     * @tc.desc   Verify napi_load_module with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleRuntime
     * @tc.number SUB_NAPI_NOCOV_MOD_0004
     * @tc.desc   Verify napi_load_module with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleWorker
     * @tc.number SUB_NAPI_NOCOV_MOD_0005
     * @tc.desc   Verify napi_load_module with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleWithInfoAbnormal
     * @tc.number SUB_NAPI_NOCOV_MOD_0006
     * @tc.desc   Verify napi_load_module_with_info with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleWithInfoAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleWithInfoAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleWithInfoAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleWithInfoRetVal
     * @tc.number SUB_NAPI_NOCOV_MOD_0007
     * @tc.desc   Verify napi_load_module_with_info with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleWithInfoRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleWithInfoRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleWithInfoRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleWithInfoStable
     * @tc.number SUB_NAPI_NOCOV_MOD_0008
     * @tc.desc   Verify napi_load_module_with_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleWithInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleWithInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleWithInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleWithInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_MOD_0009
     * @tc.desc   Verify napi_load_module_with_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleWithInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleWithInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleWithInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleWithInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_MOD_0010
     * @tc.desc   Verify napi_load_module_with_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleWithInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleWithInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleWithInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleWithInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_MOD_0011
     * @tc.desc   Verify napi_load_module_with_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleWithInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleWithInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleWithInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testLoadModuleWithInfoWorker
     * @tc.number SUB_NAPI_NOCOV_MOD_0012
     * @tc.desc   Verify napi_load_module_with_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadModuleWithInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testLoadModuleWithInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.loadModuleWithInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunScriptPathAbnormal
     * @tc.number SUB_NAPI_NOCOV_MOD_0013
     * @tc.desc   Verify napi_run_script_path with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunScriptPathAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunScriptPathAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.runScriptPathAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunScriptPathRetVal
     * @tc.number SUB_NAPI_NOCOV_MOD_0014
     * @tc.desc   Verify napi_run_script_path with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunScriptPathRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunScriptPathRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.runScriptPathRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunScriptPathStable
     * @tc.number SUB_NAPI_NOCOV_MOD_0015
     * @tc.desc   Verify napi_run_script_path with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunScriptPathStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunScriptPathStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.runScriptPathStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunScriptPathMultiThread
     * @tc.number SUB_NAPI_NOCOV_MOD_0016
     * @tc.desc   Verify napi_run_script_path with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunScriptPathMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunScriptPathMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.runScriptPathMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunScriptPathMultiCtx
     * @tc.number SUB_NAPI_NOCOV_MOD_0017
     * @tc.desc   Verify napi_run_script_path with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunScriptPathMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunScriptPathMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.runScriptPathMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunScriptPathRuntime
     * @tc.number SUB_NAPI_NOCOV_MOD_0018
     * @tc.desc   Verify napi_run_script_path with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunScriptPathRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunScriptPathRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.runScriptPathRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunScriptPathWorker
     * @tc.number SUB_NAPI_NOCOV_MOD_0019
     * @tc.desc   Verify napi_run_script_path with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunScriptPathWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunScriptPathWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.runScriptPathWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}