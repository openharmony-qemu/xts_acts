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
import testNapi from 'libnapiCovError.so';

export default function napiCovErrorTest() {
  describe('ActsNapiCovErrorTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testThrowRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0001
     * @tc.desc   Verify napi_throw with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0002
     * @tc.desc   Verify napi_throw with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0003
     * @tc.desc   Verify napi_throw with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0004
     * @tc.desc   Verify napi_throw with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0005
     * @tc.desc   Verify napi_throw with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0006
     * @tc.desc   Verify napi_throw with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowErrorRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0007
     * @tc.desc   Verify napi_throw_error with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowErrorRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowErrorRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwErrorRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowErrorStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0008
     * @tc.desc   Verify napi_throw_error with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowErrorStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowErrorStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwErrorStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowErrorMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0009
     * @tc.desc   Verify napi_throw_error with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowErrorMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowErrorMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwErrorMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowErrorMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0010
     * @tc.desc   Verify napi_throw_error with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowErrorMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowErrorMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwErrorMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowErrorRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0011
     * @tc.desc   Verify napi_throw_error with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowErrorRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowErrorRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwErrorRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowErrorWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0012
     * @tc.desc   Verify napi_throw_error with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowErrorWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowErrorWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwErrorWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowTypeErrorRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0013
     * @tc.desc   Verify napi_throw_type_error with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowTypeErrorRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowTypeErrorRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwTypeErrorRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowTypeErrorStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0014
     * @tc.desc   Verify napi_throw_type_error with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowTypeErrorStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowTypeErrorStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwTypeErrorStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowTypeErrorMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0015
     * @tc.desc   Verify napi_throw_type_error with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowTypeErrorMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowTypeErrorMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwTypeErrorMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowTypeErrorMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0016
     * @tc.desc   Verify napi_throw_type_error with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowTypeErrorMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowTypeErrorMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwTypeErrorMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowTypeErrorRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0017
     * @tc.desc   Verify napi_throw_type_error with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowTypeErrorRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowTypeErrorRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwTypeErrorRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowTypeErrorWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0018
     * @tc.desc   Verify napi_throw_type_error with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowTypeErrorWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowTypeErrorWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwTypeErrorWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowRangeErrorRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0019
     * @tc.desc   Verify napi_throw_range_error with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowRangeErrorRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowRangeErrorRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwRangeErrorRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowRangeErrorStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0020
     * @tc.desc   Verify napi_throw_range_error with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowRangeErrorStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowRangeErrorStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwRangeErrorStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowRangeErrorMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0021
     * @tc.desc   Verify napi_throw_range_error with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowRangeErrorMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowRangeErrorMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwRangeErrorMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowRangeErrorMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0022
     * @tc.desc   Verify napi_throw_range_error with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowRangeErrorMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowRangeErrorMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwRangeErrorMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowRangeErrorRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0023
     * @tc.desc   Verify napi_throw_range_error with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowRangeErrorRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowRangeErrorRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwRangeErrorRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowRangeErrorWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0024
     * @tc.desc   Verify napi_throw_range_error with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowRangeErrorWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowRangeErrorWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwRangeErrorWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsErrorRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0025
     * @tc.desc   Verify napi_is_error with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsErrorRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsErrorRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.isErrorRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsErrorStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0026
     * @tc.desc   Verify napi_is_error with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsErrorStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsErrorStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isErrorStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsErrorMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0027
     * @tc.desc   Verify napi_is_error with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsErrorMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsErrorMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isErrorMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsErrorMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0028
     * @tc.desc   Verify napi_is_error with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsErrorMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsErrorMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isErrorMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsErrorRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0029
     * @tc.desc   Verify napi_is_error with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsErrorRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsErrorRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.isErrorRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsErrorWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0030
     * @tc.desc   Verify napi_is_error with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsErrorWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsErrorWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isErrorWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateErrorRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0031
     * @tc.desc   Verify napi_create_error with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateErrorRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateErrorRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createErrorRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateErrorStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0032
     * @tc.desc   Verify napi_create_error with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateErrorStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateErrorStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createErrorStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateErrorMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0033
     * @tc.desc   Verify napi_create_error with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateErrorMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateErrorMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createErrorMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateErrorMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0034
     * @tc.desc   Verify napi_create_error with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateErrorMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateErrorMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createErrorMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateErrorRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0035
     * @tc.desc   Verify napi_create_error with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateErrorRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateErrorRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createErrorRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateErrorWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0036
     * @tc.desc   Verify napi_create_error with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateErrorWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateErrorWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createErrorWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypeErrorRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0037
     * @tc.desc   Verify napi_create_type_error with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypeErrorRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypeErrorRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypeErrorRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypeErrorStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0038
     * @tc.desc   Verify napi_create_type_error with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypeErrorStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypeErrorStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypeErrorStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypeErrorMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0039
     * @tc.desc   Verify napi_create_type_error with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypeErrorMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypeErrorMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypeErrorMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypeErrorMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0040
     * @tc.desc   Verify napi_create_type_error with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypeErrorMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypeErrorMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypeErrorMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypeErrorRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0041
     * @tc.desc   Verify napi_create_type_error with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypeErrorRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypeErrorRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypeErrorRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypeErrorWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0042
     * @tc.desc   Verify napi_create_type_error with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypeErrorWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypeErrorWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypeErrorWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateRangeErrorRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0043
     * @tc.desc   Verify napi_create_range_error with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateRangeErrorRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateRangeErrorRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createRangeErrorRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateRangeErrorStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0044
     * @tc.desc   Verify napi_create_range_error with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateRangeErrorStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateRangeErrorStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createRangeErrorStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateRangeErrorMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0045
     * @tc.desc   Verify napi_create_range_error with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateRangeErrorMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateRangeErrorMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createRangeErrorMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateRangeErrorMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0046
     * @tc.desc   Verify napi_create_range_error with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateRangeErrorMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateRangeErrorMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createRangeErrorMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateRangeErrorRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0047
     * @tc.desc   Verify napi_create_range_error with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateRangeErrorRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateRangeErrorRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createRangeErrorRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateRangeErrorWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0048
     * @tc.desc   Verify napi_create_range_error with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateRangeErrorWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateRangeErrorWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createRangeErrorWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAndClearLastExceptionAbnormal
     * @tc.number SUB_NAPI_NOCOV_ERR_0049
     * @tc.desc   Verify napi_get_and_clear_last_exception with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAndClearLastExceptionAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAndClearLastExceptionAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAndClearLastExceptionAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAndClearLastExceptionRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0050
     * @tc.desc   Verify napi_get_and_clear_last_exception with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAndClearLastExceptionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAndClearLastExceptionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAndClearLastExceptionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAndClearLastExceptionStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0051
     * @tc.desc   Verify napi_get_and_clear_last_exception with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAndClearLastExceptionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAndClearLastExceptionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAndClearLastExceptionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAndClearLastExceptionMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0052
     * @tc.desc   Verify napi_get_and_clear_last_exception with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAndClearLastExceptionMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAndClearLastExceptionMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAndClearLastExceptionMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAndClearLastExceptionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0053
     * @tc.desc   Verify napi_get_and_clear_last_exception with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAndClearLastExceptionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAndClearLastExceptionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAndClearLastExceptionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAndClearLastExceptionRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0054
     * @tc.desc   Verify napi_get_and_clear_last_exception with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAndClearLastExceptionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAndClearLastExceptionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAndClearLastExceptionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAndClearLastExceptionWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0055
     * @tc.desc   Verify napi_get_and_clear_last_exception with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAndClearLastExceptionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAndClearLastExceptionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAndClearLastExceptionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsExceptionPendingRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0056
     * @tc.desc   Verify napi_is_exception_pending with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsExceptionPendingRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsExceptionPendingRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.isExceptionPendingRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsExceptionPendingStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0057
     * @tc.desc   Verify napi_is_exception_pending with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsExceptionPendingStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsExceptionPendingStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isExceptionPendingStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsExceptionPendingMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0058
     * @tc.desc   Verify napi_is_exception_pending with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsExceptionPendingMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsExceptionPendingMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isExceptionPendingMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsExceptionPendingMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0059
     * @tc.desc   Verify napi_is_exception_pending with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsExceptionPendingMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsExceptionPendingMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isExceptionPendingMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsExceptionPendingRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0060
     * @tc.desc   Verify napi_is_exception_pending with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsExceptionPendingRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsExceptionPendingRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.isExceptionPendingRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsExceptionPendingWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0061
     * @tc.desc   Verify napi_is_exception_pending with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsExceptionPendingWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsExceptionPendingWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isExceptionPendingWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalErrorNormal
     * @tc.number SUB_NAPI_NOCOV_ERR_0062
     * @tc.desc   Verify napi_fatal_error with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalErrorNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalErrorNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalErrorNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalErrorRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0063
     * @tc.desc   Verify napi_fatal_error with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalErrorRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalErrorRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalErrorRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalErrorStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0064
     * @tc.desc   Verify napi_fatal_error with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalErrorStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalErrorStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalErrorStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalErrorMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0065
     * @tc.desc   Verify napi_fatal_error with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalErrorMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalErrorMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalErrorMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalErrorMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0066
     * @tc.desc   Verify napi_fatal_error with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalErrorMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalErrorMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalErrorMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalErrorRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0067
     * @tc.desc   Verify napi_fatal_error with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalErrorRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalErrorRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalErrorRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalErrorWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0068
     * @tc.desc   Verify napi_fatal_error with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalErrorWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalErrorWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalErrorWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetLastErrorInfoRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0069
     * @tc.desc   Verify napi_get_last_error_info with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorInfoRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetLastErrorInfoRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getLastErrorInfoRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetLastErrorInfoStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0070
     * @tc.desc   Verify napi_get_last_error_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetLastErrorInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getLastErrorInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetLastErrorInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0071
     * @tc.desc   Verify napi_get_last_error_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetLastErrorInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getLastErrorInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetLastErrorInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0072
     * @tc.desc   Verify napi_get_last_error_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetLastErrorInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getLastErrorInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetLastErrorInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0073
     * @tc.desc   Verify napi_get_last_error_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetLastErrorInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getLastErrorInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetLastErrorInfoWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0074
     * @tc.desc   Verify napi_get_last_error_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLastErrorInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetLastErrorInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getLastErrorInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalExceptionRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0075
     * @tc.desc   Verify napi_fatal_exception with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalExceptionRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalExceptionRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalExceptionRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalExceptionStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0076
     * @tc.desc   Verify napi_fatal_exception with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalExceptionStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalExceptionStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalExceptionStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalExceptionMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0077
     * @tc.desc   Verify napi_fatal_exception with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalExceptionMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalExceptionMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalExceptionMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalExceptionMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0078
     * @tc.desc   Verify napi_fatal_exception with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalExceptionMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalExceptionMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalExceptionMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalExceptionRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0079
     * @tc.desc   Verify napi_fatal_exception with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalExceptionRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalExceptionRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalExceptionRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testFatalExceptionWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0080
     * @tc.desc   Verify napi_fatal_exception with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFatalExceptionWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testFatalExceptionWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.fatalExceptionWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowBusinessErrorNormal
     * @tc.number SUB_NAPI_NOCOV_ERR_0081
     * @tc.desc   Verify napi_throw_business_error with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowBusinessErrorNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowBusinessErrorNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwBusinessErrorNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowBusinessErrorRetVal
     * @tc.number SUB_NAPI_NOCOV_ERR_0082
     * @tc.desc   Verify napi_throw_business_error with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowBusinessErrorRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowBusinessErrorRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwBusinessErrorRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowBusinessErrorStable
     * @tc.number SUB_NAPI_NOCOV_ERR_0083
     * @tc.desc   Verify napi_throw_business_error with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowBusinessErrorStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowBusinessErrorStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwBusinessErrorStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowBusinessErrorMultiThread
     * @tc.number SUB_NAPI_NOCOV_ERR_0084
     * @tc.desc   Verify napi_throw_business_error with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowBusinessErrorMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowBusinessErrorMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwBusinessErrorMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowBusinessErrorMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ERR_0085
     * @tc.desc   Verify napi_throw_business_error with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowBusinessErrorMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowBusinessErrorMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwBusinessErrorMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowBusinessErrorRuntime
     * @tc.number SUB_NAPI_NOCOV_ERR_0086
     * @tc.desc   Verify napi_throw_business_error with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowBusinessErrorRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowBusinessErrorRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwBusinessErrorRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testThrowBusinessErrorWorker
     * @tc.number SUB_NAPI_NOCOV_ERR_0087
     * @tc.desc   Verify napi_throw_business_error with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testThrowBusinessErrorWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testThrowBusinessErrorWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.throwBusinessErrorWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}