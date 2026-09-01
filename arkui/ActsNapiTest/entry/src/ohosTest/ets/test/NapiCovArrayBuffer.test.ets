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
import testNapi from 'libnapiCovArrayBuffer.so';

export default function napiCovArrayBufferTest() {
  describe('ActsNapiCovArrayBufferTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateArraybufferRetVal
     * @tc.number SUB_NAPI_NOCOV_ARB_0001
     * @tc.desc   Verify napi_create_arraybuffer with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArraybufferRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArraybufferRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArraybufferRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArraybufferMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARB_0002
     * @tc.desc   Verify napi_create_arraybuffer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArraybufferMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArraybufferMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArraybufferMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArraybufferMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARB_0003
     * @tc.desc   Verify napi_create_arraybuffer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArraybufferMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArraybufferMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArraybufferMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArraybufferRuntime
     * @tc.number SUB_NAPI_NOCOV_ARB_0004
     * @tc.desc   Verify napi_create_arraybuffer with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArraybufferRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArraybufferRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArraybufferRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArraybufferWorker
     * @tc.number SUB_NAPI_NOCOV_ARB_0005
     * @tc.desc   Verify napi_create_arraybuffer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArraybufferWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArraybufferWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArraybufferWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArraybufferInfoRetVal
     * @tc.number SUB_NAPI_NOCOV_ARB_0006
     * @tc.desc   Verify napi_get_arraybuffer_info with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArraybufferInfoRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArraybufferInfoRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArraybufferInfoRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArraybufferInfoStable
     * @tc.number SUB_NAPI_NOCOV_ARB_0007
     * @tc.desc   Verify napi_get_arraybuffer_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArraybufferInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArraybufferInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArraybufferInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArraybufferInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARB_0008
     * @tc.desc   Verify napi_get_arraybuffer_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArraybufferInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArraybufferInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArraybufferInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArraybufferInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARB_0009
     * @tc.desc   Verify napi_get_arraybuffer_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArraybufferInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArraybufferInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArraybufferInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArraybufferInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_ARB_0010
     * @tc.desc   Verify napi_get_arraybuffer_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArraybufferInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArraybufferInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArraybufferInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArraybufferInfoWorker
     * @tc.number SUB_NAPI_NOCOV_ARB_0011
     * @tc.desc   Verify napi_get_arraybuffer_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArraybufferInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArraybufferInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArraybufferInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArraybufferAbnormal
     * @tc.number SUB_NAPI_NOCOV_ARB_0012
     * @tc.desc   Verify napi_is_arraybuffer with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArraybufferAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArraybufferAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArraybufferAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArraybufferRetVal
     * @tc.number SUB_NAPI_NOCOV_ARB_0013
     * @tc.desc   Verify napi_is_arraybuffer with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArraybufferRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArraybufferRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArraybufferRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArraybufferStable
     * @tc.number SUB_NAPI_NOCOV_ARB_0014
     * @tc.desc   Verify napi_is_arraybuffer with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArraybufferStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArraybufferStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArraybufferStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArraybufferMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARB_0015
     * @tc.desc   Verify napi_is_arraybuffer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArraybufferMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArraybufferMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArraybufferMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArraybufferMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARB_0016
     * @tc.desc   Verify napi_is_arraybuffer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArraybufferMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArraybufferMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArraybufferMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArraybufferRuntime
     * @tc.number SUB_NAPI_NOCOV_ARB_0017
     * @tc.desc   Verify napi_is_arraybuffer with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArraybufferRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArraybufferRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArraybufferRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArraybufferWorker
     * @tc.number SUB_NAPI_NOCOV_ARB_0018
     * @tc.desc   Verify napi_is_arraybuffer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArraybufferWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArraybufferWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArraybufferWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDetachArraybufferStable
     * @tc.number SUB_NAPI_NOCOV_ARB_0019
     * @tc.desc   Verify napi_detach_arraybuffer with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDetachArraybufferStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDetachArraybufferStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.detachArraybufferStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDetachArraybufferMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARB_0020
     * @tc.desc   Verify napi_detach_arraybuffer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDetachArraybufferMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDetachArraybufferMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.detachArraybufferMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDetachArraybufferMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARB_0021
     * @tc.desc   Verify napi_detach_arraybuffer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDetachArraybufferMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDetachArraybufferMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.detachArraybufferMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDetachArraybufferRuntime
     * @tc.number SUB_NAPI_NOCOV_ARB_0022
     * @tc.desc   Verify napi_detach_arraybuffer with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDetachArraybufferRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDetachArraybufferRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.detachArraybufferRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDetachArraybufferWorker
     * @tc.number SUB_NAPI_NOCOV_ARB_0023
     * @tc.desc   Verify napi_detach_arraybuffer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDetachArraybufferWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDetachArraybufferWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.detachArraybufferWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDetachedArraybufferStable
     * @tc.number SUB_NAPI_NOCOV_ARB_0024
     * @tc.desc   Verify napi_is_detached_arraybuffer with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDetachedArraybufferStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDetachedArraybufferStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDetachedArraybufferStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDetachedArraybufferMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARB_0025
     * @tc.desc   Verify napi_is_detached_arraybuffer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDetachedArraybufferMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDetachedArraybufferMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDetachedArraybufferMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDetachedArraybufferMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARB_0026
     * @tc.desc   Verify napi_is_detached_arraybuffer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDetachedArraybufferMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDetachedArraybufferMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDetachedArraybufferMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDetachedArraybufferRuntime
     * @tc.number SUB_NAPI_NOCOV_ARB_0027
     * @tc.desc   Verify napi_is_detached_arraybuffer with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDetachedArraybufferRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDetachedArraybufferRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDetachedArraybufferRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDetachedArraybufferWorker
     * @tc.number SUB_NAPI_NOCOV_ARB_0028
     * @tc.desc   Verify napi_is_detached_arraybuffer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDetachedArraybufferWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDetachedArraybufferWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDetachedArraybufferWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}