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
import testNapi from 'libnapiCovFunction.so';

export default function napiCovFunctionTest() {
  describe('ActsNapiCovFunctionTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateFunctionAbnormal
     * @tc.number SUB_NAPI_NOCOV_FUNC_0001
     * @tc.desc   Verify napi_create_function with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateFunctionAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateFunctionAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createFunctionAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateFunctionRetVal
     * @tc.number SUB_NAPI_NOCOV_FUNC_0002
     * @tc.desc   Verify napi_create_function with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateFunctionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateFunctionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createFunctionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateFunctionStable
     * @tc.number SUB_NAPI_NOCOV_FUNC_0003
     * @tc.desc   Verify napi_create_function with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateFunctionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateFunctionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createFunctionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateFunctionMultiThread
     * @tc.number SUB_NAPI_NOCOV_FUNC_0004
     * @tc.desc   Verify napi_create_function with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateFunctionMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateFunctionMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createFunctionMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateFunctionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FUNC_0005
     * @tc.desc   Verify napi_create_function with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateFunctionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateFunctionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createFunctionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateFunctionRuntime
     * @tc.number SUB_NAPI_NOCOV_FUNC_0006
     * @tc.desc   Verify napi_create_function with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateFunctionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateFunctionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createFunctionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateFunctionWorker
     * @tc.number SUB_NAPI_NOCOV_FUNC_0007
     * @tc.desc   Verify napi_create_function with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateFunctionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateFunctionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createFunctionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallFunctionRetVal
     * @tc.number SUB_NAPI_NOCOV_FUNC_0008
     * @tc.desc   Verify napi_call_function with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallFunctionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallFunctionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.callFunctionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallFunctionStable
     * @tc.number SUB_NAPI_NOCOV_FUNC_0009
     * @tc.desc   Verify napi_call_function with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallFunctionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallFunctionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.callFunctionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallFunctionMultiThread
     * @tc.number SUB_NAPI_NOCOV_FUNC_0010
     * @tc.desc   Verify napi_call_function with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallFunctionMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallFunctionMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.callFunctionMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallFunctionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FUNC_0011
     * @tc.desc   Verify napi_call_function with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallFunctionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallFunctionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.callFunctionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallFunctionWorker
     * @tc.number SUB_NAPI_NOCOV_FUNC_0012
     * @tc.desc   Verify napi_call_function with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallFunctionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallFunctionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.callFunctionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetCbInfoStable
     * @tc.number SUB_NAPI_NOCOV_FUNC_0013
     * @tc.desc   Verify napi_get_cb_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCbInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetCbInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getCbInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetCbInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_FUNC_0014
     * @tc.desc   Verify napi_get_cb_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCbInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetCbInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getCbInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetCbInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FUNC_0015
     * @tc.desc   Verify napi_get_cb_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCbInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetCbInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getCbInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetCbInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_FUNC_0016
     * @tc.desc   Verify napi_get_cb_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCbInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetCbInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getCbInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetCbInfoWorker
     * @tc.number SUB_NAPI_NOCOV_FUNC_0017
     * @tc.desc   Verify napi_get_cb_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetCbInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetCbInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getCbInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetUvEventLoopStable
     * @tc.number SUB_NAPI_NOCOV_FUNC_0018
     * @tc.desc   Verify napi_get_uv_event_loop with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUvEventLoopStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetUvEventLoopStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getUvEventLoopStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetUvEventLoopMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FUNC_0019
     * @tc.desc   Verify napi_get_uv_event_loop with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUvEventLoopMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetUvEventLoopMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getUvEventLoopMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetUvEventLoopWorker
     * @tc.number SUB_NAPI_NOCOV_FUNC_0020
     * @tc.desc   Verify napi_get_uv_event_loop with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUvEventLoopWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetUvEventLoopWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getUvEventLoopWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetVersionAbnormal
     * @tc.number SUB_NAPI_NOCOV_FUNC_0021
     * @tc.desc   Verify napi_get_version with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVersionAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetVersionAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getVersionAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetVersionStable
     * @tc.number SUB_NAPI_NOCOV_FUNC_0022
     * @tc.desc   Verify napi_get_version with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVersionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetVersionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getVersionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetVersionMultiThread
     * @tc.number SUB_NAPI_NOCOV_FUNC_0023
     * @tc.desc   Verify napi_get_version with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVersionMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetVersionMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getVersionMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetVersionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FUNC_0024
     * @tc.desc   Verify napi_get_version with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVersionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetVersionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getVersionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetVersionRuntime
     * @tc.number SUB_NAPI_NOCOV_FUNC_0025
     * @tc.desc   Verify napi_get_version with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVersionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetVersionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getVersionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetVersionWorker
     * @tc.number SUB_NAPI_NOCOV_FUNC_0026
     * @tc.desc   Verify napi_get_version with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetVersionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetVersionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getVersionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNodeApiGetModuleFileNameStable
     * @tc.number SUB_NAPI_NOCOV_FUNC_0027
     * @tc.desc   Verify node_api_get_module_file_name with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeApiGetModuleFileNameStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNodeApiGetModuleFileNameStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.nodeApiGetModuleFileNameStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNodeApiGetModuleFileNameMultiThread
     * @tc.number SUB_NAPI_NOCOV_FUNC_0028
     * @tc.desc   Verify node_api_get_module_file_name with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeApiGetModuleFileNameMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNodeApiGetModuleFileNameMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.nodeApiGetModuleFileNameMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNodeApiGetModuleFileNameMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FUNC_0029
     * @tc.desc   Verify node_api_get_module_file_name with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeApiGetModuleFileNameMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNodeApiGetModuleFileNameMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.nodeApiGetModuleFileNameMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNodeApiGetModuleFileNameRuntime
     * @tc.number SUB_NAPI_NOCOV_FUNC_0030
     * @tc.desc   Verify node_api_get_module_file_name with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeApiGetModuleFileNameRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNodeApiGetModuleFileNameRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.nodeApiGetModuleFileNameRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNodeApiGetModuleFileNameWorker
     * @tc.number SUB_NAPI_NOCOV_FUNC_0031
     * @tc.desc   Verify node_api_get_module_file_name with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeApiGetModuleFileNameWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNodeApiGetModuleFileNameWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.nodeApiGetModuleFileNameWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStrictEqualsStable
     * @tc.number SUB_NAPI_NOCOV_FUNC_0032
     * @tc.desc   Verify napi_strict_equals with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrictEqualsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStrictEqualsStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.strictEqualsStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStrictEqualsMultiThread
     * @tc.number SUB_NAPI_NOCOV_FUNC_0033
     * @tc.desc   Verify napi_strict_equals with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrictEqualsMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStrictEqualsMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.strictEqualsMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStrictEqualsMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FUNC_0034
     * @tc.desc   Verify napi_strict_equals with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrictEqualsMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStrictEqualsMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.strictEqualsMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStrictEqualsRuntime
     * @tc.number SUB_NAPI_NOCOV_FUNC_0035
     * @tc.desc   Verify napi_strict_equals with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrictEqualsRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStrictEqualsRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.strictEqualsRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStrictEqualsWorker
     * @tc.number SUB_NAPI_NOCOV_FUNC_0036
     * @tc.desc   Verify napi_strict_equals with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStrictEqualsWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStrictEqualsWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.strictEqualsWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}