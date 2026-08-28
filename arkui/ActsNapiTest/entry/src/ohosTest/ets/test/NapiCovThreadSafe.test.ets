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
import testNapi from 'libnapiCovThreadSafe.so';

export default function napiCovThreadSafeTest() {
  describe('ActsNapiCovThreadSafeTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateThreadsafeFunctionAbnormal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0001
     * @tc.desc   Verify napi_create_threadsafe_function with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateThreadsafeFunctionAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateThreadsafeFunctionAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createThreadsafeFunctionAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateThreadsafeFunctionRetVal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0002
     * @tc.desc   Verify napi_create_threadsafe_function with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateThreadsafeFunctionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateThreadsafeFunctionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createThreadsafeFunctionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateThreadsafeFunctionStable
     * @tc.number SUB_NAPI_NOCOV_TSFN_0003
     * @tc.desc   Verify napi_create_threadsafe_function with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateThreadsafeFunctionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateThreadsafeFunctionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createThreadsafeFunctionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateThreadsafeFunctionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_TSFN_0004
     * @tc.desc   Verify napi_create_threadsafe_function with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateThreadsafeFunctionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateThreadsafeFunctionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createThreadsafeFunctionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateThreadsafeFunctionRuntime
     * @tc.number SUB_NAPI_NOCOV_TSFN_0005
     * @tc.desc   Verify napi_create_threadsafe_function with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateThreadsafeFunctionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateThreadsafeFunctionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createThreadsafeFunctionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateThreadsafeFunctionWorker
     * @tc.number SUB_NAPI_NOCOV_TSFN_0006
     * @tc.desc   Verify napi_create_threadsafe_function with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateThreadsafeFunctionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateThreadsafeFunctionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createThreadsafeFunctionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetThreadsafeFunctionContextAbnormal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0007
     * @tc.desc   Verify napi_get_threadsafe_function_context with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetThreadsafeFunctionContextAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetThreadsafeFunctionContextAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getThreadsafeFunctionContextAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetThreadsafeFunctionContextRetVal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0008
     * @tc.desc   Verify napi_get_threadsafe_function_context with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetThreadsafeFunctionContextRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetThreadsafeFunctionContextRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getThreadsafeFunctionContextRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetThreadsafeFunctionContextStable
     * @tc.number SUB_NAPI_NOCOV_TSFN_0009
     * @tc.desc   Verify napi_get_threadsafe_function_context with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetThreadsafeFunctionContextStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetThreadsafeFunctionContextStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getThreadsafeFunctionContextStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetThreadsafeFunctionContextMultiCtx
     * @tc.number SUB_NAPI_NOCOV_TSFN_0010
     * @tc.desc   Verify napi_get_threadsafe_function_context with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetThreadsafeFunctionContextMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetThreadsafeFunctionContextMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getThreadsafeFunctionContextMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetThreadsafeFunctionContextRuntime
     * @tc.number SUB_NAPI_NOCOV_TSFN_0011
     * @tc.desc   Verify napi_get_threadsafe_function_context with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetThreadsafeFunctionContextRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetThreadsafeFunctionContextRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getThreadsafeFunctionContextRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetThreadsafeFunctionContextWorker
     * @tc.number SUB_NAPI_NOCOV_TSFN_0012
     * @tc.desc   Verify napi_get_threadsafe_function_context with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetThreadsafeFunctionContextWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetThreadsafeFunctionContextWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getThreadsafeFunctionContextWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionAbnormal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0013
     * @tc.desc   Verify napi_call_threadsafe_function with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionRetVal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0014
     * @tc.desc   Verify napi_call_threadsafe_function with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionStable
     * @tc.number SUB_NAPI_NOCOV_TSFN_0015
     * @tc.desc   Verify napi_call_threadsafe_function with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_TSFN_0016
     * @tc.desc   Verify napi_call_threadsafe_function with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionRuntime
     * @tc.number SUB_NAPI_NOCOV_TSFN_0017
     * @tc.desc   Verify napi_call_threadsafe_function with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionWorker
     * @tc.number SUB_NAPI_NOCOV_TSFN_0018
     * @tc.desc   Verify napi_call_threadsafe_function with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAcquireThreadsafeFunctionAbnormal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0019
     * @tc.desc   Verify napi_acquire_threadsafe_function with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcquireThreadsafeFunctionAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAcquireThreadsafeFunctionAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.acquireThreadsafeFunctionAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAcquireThreadsafeFunctionRetVal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0020
     * @tc.desc   Verify napi_acquire_threadsafe_function with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcquireThreadsafeFunctionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAcquireThreadsafeFunctionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.acquireThreadsafeFunctionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAcquireThreadsafeFunctionStable
     * @tc.number SUB_NAPI_NOCOV_TSFN_0021
     * @tc.desc   Verify napi_acquire_threadsafe_function with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcquireThreadsafeFunctionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAcquireThreadsafeFunctionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.acquireThreadsafeFunctionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAcquireThreadsafeFunctionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_TSFN_0022
     * @tc.desc   Verify napi_acquire_threadsafe_function with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcquireThreadsafeFunctionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAcquireThreadsafeFunctionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.acquireThreadsafeFunctionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAcquireThreadsafeFunctionRuntime
     * @tc.number SUB_NAPI_NOCOV_TSFN_0023
     * @tc.desc   Verify napi_acquire_threadsafe_function with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcquireThreadsafeFunctionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAcquireThreadsafeFunctionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.acquireThreadsafeFunctionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAcquireThreadsafeFunctionWorker
     * @tc.number SUB_NAPI_NOCOV_TSFN_0024
     * @tc.desc   Verify napi_acquire_threadsafe_function with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAcquireThreadsafeFunctionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAcquireThreadsafeFunctionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.acquireThreadsafeFunctionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReleaseThreadsafeFunctionAbnormal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0025
     * @tc.desc   Verify napi_release_threadsafe_function with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReleaseThreadsafeFunctionAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReleaseThreadsafeFunctionAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.releaseThreadsafeFunctionAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReleaseThreadsafeFunctionRetVal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0026
     * @tc.desc   Verify napi_release_threadsafe_function with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReleaseThreadsafeFunctionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReleaseThreadsafeFunctionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.releaseThreadsafeFunctionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReleaseThreadsafeFunctionStable
     * @tc.number SUB_NAPI_NOCOV_TSFN_0027
     * @tc.desc   Verify napi_release_threadsafe_function with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReleaseThreadsafeFunctionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReleaseThreadsafeFunctionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.releaseThreadsafeFunctionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReleaseThreadsafeFunctionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_TSFN_0028
     * @tc.desc   Verify napi_release_threadsafe_function with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReleaseThreadsafeFunctionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReleaseThreadsafeFunctionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.releaseThreadsafeFunctionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReleaseThreadsafeFunctionRuntime
     * @tc.number SUB_NAPI_NOCOV_TSFN_0029
     * @tc.desc   Verify napi_release_threadsafe_function with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReleaseThreadsafeFunctionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReleaseThreadsafeFunctionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.releaseThreadsafeFunctionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReleaseThreadsafeFunctionWorker
     * @tc.number SUB_NAPI_NOCOV_TSFN_0030
     * @tc.desc   Verify napi_release_threadsafe_function with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReleaseThreadsafeFunctionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReleaseThreadsafeFunctionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.releaseThreadsafeFunctionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRefThreadsafeFunctionAbnormal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0031
     * @tc.desc   Verify napi_ref_threadsafe_function with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefThreadsafeFunctionAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRefThreadsafeFunctionAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.refThreadsafeFunctionAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRefThreadsafeFunctionRetVal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0032
     * @tc.desc   Verify napi_ref_threadsafe_function with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefThreadsafeFunctionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRefThreadsafeFunctionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.refThreadsafeFunctionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRefThreadsafeFunctionStable
     * @tc.number SUB_NAPI_NOCOV_TSFN_0033
     * @tc.desc   Verify napi_ref_threadsafe_function with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefThreadsafeFunctionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRefThreadsafeFunctionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.refThreadsafeFunctionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRefThreadsafeFunctionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_TSFN_0034
     * @tc.desc   Verify napi_ref_threadsafe_function with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefThreadsafeFunctionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRefThreadsafeFunctionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.refThreadsafeFunctionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRefThreadsafeFunctionRuntime
     * @tc.number SUB_NAPI_NOCOV_TSFN_0035
     * @tc.desc   Verify napi_ref_threadsafe_function with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefThreadsafeFunctionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRefThreadsafeFunctionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.refThreadsafeFunctionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRefThreadsafeFunctionWorker
     * @tc.number SUB_NAPI_NOCOV_TSFN_0036
     * @tc.desc   Verify napi_ref_threadsafe_function with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRefThreadsafeFunctionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRefThreadsafeFunctionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.refThreadsafeFunctionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnrefThreadsafeFunctionAbnormal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0037
     * @tc.desc   Verify napi_unref_threadsafe_function with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnrefThreadsafeFunctionAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnrefThreadsafeFunctionAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.unrefThreadsafeFunctionAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnrefThreadsafeFunctionRetVal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0038
     * @tc.desc   Verify napi_unref_threadsafe_function with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnrefThreadsafeFunctionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnrefThreadsafeFunctionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.unrefThreadsafeFunctionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnrefThreadsafeFunctionStable
     * @tc.number SUB_NAPI_NOCOV_TSFN_0039
     * @tc.desc   Verify napi_unref_threadsafe_function with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnrefThreadsafeFunctionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnrefThreadsafeFunctionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.unrefThreadsafeFunctionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnrefThreadsafeFunctionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_TSFN_0040
     * @tc.desc   Verify napi_unref_threadsafe_function with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnrefThreadsafeFunctionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnrefThreadsafeFunctionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.unrefThreadsafeFunctionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnrefThreadsafeFunctionRuntime
     * @tc.number SUB_NAPI_NOCOV_TSFN_0041
     * @tc.desc   Verify napi_unref_threadsafe_function with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnrefThreadsafeFunctionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnrefThreadsafeFunctionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.unrefThreadsafeFunctionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnrefThreadsafeFunctionWorker
     * @tc.number SUB_NAPI_NOCOV_TSFN_0042
     * @tc.desc   Verify napi_unref_threadsafe_function with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnrefThreadsafeFunctionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnrefThreadsafeFunctionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.unrefThreadsafeFunctionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkWithQosStable
     * @tc.number SUB_NAPI_NOCOV_TSFN_0043
     * @tc.desc   Verify napi_queue_async_work_with_qos with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkWithQosStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkWithQosStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkWithQosStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkWithQosMultiThread
     * @tc.number SUB_NAPI_NOCOV_TSFN_0044
     * @tc.desc   Verify napi_queue_async_work_with_qos with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkWithQosMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkWithQosMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkWithQosMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkWithQosMultiCtx
     * @tc.number SUB_NAPI_NOCOV_TSFN_0045
     * @tc.desc   Verify napi_queue_async_work_with_qos with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkWithQosMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkWithQosMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkWithQosMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkWithQosRuntime
     * @tc.number SUB_NAPI_NOCOV_TSFN_0046
     * @tc.desc   Verify napi_queue_async_work_with_qos with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkWithQosRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkWithQosRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkWithQosRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkWithQosWorker
     * @tc.number SUB_NAPI_NOCOV_TSFN_0047
     * @tc.desc   Verify napi_queue_async_work_with_qos with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkWithQosWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkWithQosWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkWithQosWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionWithPriorityAbnormal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0048
     * @tc.desc   Verify napi_call_threadsafe_function_with_priority with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionWithPriorityAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionWithPriorityAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionWithPriorityAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionWithPriorityRetVal
     * @tc.number SUB_NAPI_NOCOV_TSFN_0049
     * @tc.desc   Verify napi_call_threadsafe_function_with_priority with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionWithPriorityRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionWithPriorityRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionWithPriorityRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionWithPriorityStable
     * @tc.number SUB_NAPI_NOCOV_TSFN_0050
     * @tc.desc   Verify napi_call_threadsafe_function_with_priority with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionWithPriorityStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionWithPriorityStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionWithPriorityStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionWithPriorityMultiCtx
     * @tc.number SUB_NAPI_NOCOV_TSFN_0051
     * @tc.desc   Verify napi_call_threadsafe_function_with_priority with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionWithPriorityMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionWithPriorityMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionWithPriorityMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionWithPriorityRuntime
     * @tc.number SUB_NAPI_NOCOV_TSFN_0052
     * @tc.desc   Verify napi_call_threadsafe_function_with_priority with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionWithPriorityRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionWithPriorityRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionWithPriorityRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCallThreadsafeFunctionWithPriorityWorker
     * @tc.number SUB_NAPI_NOCOV_TSFN_0053
     * @tc.desc   Verify napi_call_threadsafe_function_with_priority with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCallThreadsafeFunctionWithPriorityWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCallThreadsafeFunctionWithPriorityWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.callThreadsafeFunctionWithPriorityWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}