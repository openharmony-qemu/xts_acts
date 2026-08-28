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
import testNapi from 'libnapiCovPrimitive.so';

export default function napiCovPrimitiveTest() {
  describe('ActsNapiCovPrimitiveTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testGetBooleanAbnormal
     * @tc.number SUB_NAPI_NOCOV_PRM_0001
     * @tc.desc   Verify napi_get_boolean with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBooleanAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBooleanAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBooleanAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBooleanStable
     * @tc.number SUB_NAPI_NOCOV_PRM_0002
     * @tc.desc   Verify napi_get_boolean with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBooleanStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBooleanStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBooleanStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBooleanMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRM_0003
     * @tc.desc   Verify napi_get_boolean with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBooleanMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBooleanMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBooleanMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBooleanMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRM_0004
     * @tc.desc   Verify napi_get_boolean with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBooleanMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBooleanMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBooleanMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBooleanRuntime
     * @tc.number SUB_NAPI_NOCOV_PRM_0005
     * @tc.desc   Verify napi_get_boolean with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBooleanRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBooleanRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBooleanRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBooleanWorker
     * @tc.number SUB_NAPI_NOCOV_PRM_0006
     * @tc.desc   Verify napi_get_boolean with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBooleanWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBooleanWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBooleanWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetGlobalStable
     * @tc.number SUB_NAPI_NOCOV_PRM_0007
     * @tc.desc   Verify napi_get_global with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetGlobalStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getGlobalStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetGlobalMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRM_0008
     * @tc.desc   Verify napi_get_global with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetGlobalMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getGlobalMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetGlobalMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRM_0009
     * @tc.desc   Verify napi_get_global with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetGlobalMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getGlobalMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetGlobalRuntime
     * @tc.number SUB_NAPI_NOCOV_PRM_0010
     * @tc.desc   Verify napi_get_global with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetGlobalRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getGlobalRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetGlobalWorker
     * @tc.number SUB_NAPI_NOCOV_PRM_0011
     * @tc.desc   Verify napi_get_global with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetGlobalWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetGlobalWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getGlobalWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNullRetVal
     * @tc.number SUB_NAPI_NOCOV_PRM_0012
     * @tc.desc   Verify napi_get_null with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNullRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNullRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNullRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNullStable
     * @tc.number SUB_NAPI_NOCOV_PRM_0013
     * @tc.desc   Verify napi_get_null with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNullStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNullStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNullStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNullMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRM_0014
     * @tc.desc   Verify napi_get_null with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNullMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNullMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNullMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNullMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRM_0015
     * @tc.desc   Verify napi_get_null with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNullMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNullMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNullMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNullRuntime
     * @tc.number SUB_NAPI_NOCOV_PRM_0016
     * @tc.desc   Verify napi_get_null with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNullRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNullRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNullRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNullWorker
     * @tc.number SUB_NAPI_NOCOV_PRM_0017
     * @tc.desc   Verify napi_get_null with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNullWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNullWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNullWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetUndefinedStable
     * @tc.number SUB_NAPI_NOCOV_PRM_0018
     * @tc.desc   Verify napi_get_undefined with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUndefinedStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetUndefinedStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getUndefinedStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetUndefinedMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRM_0019
     * @tc.desc   Verify napi_get_undefined with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUndefinedMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetUndefinedMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getUndefinedMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetUndefinedMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRM_0020
     * @tc.desc   Verify napi_get_undefined with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUndefinedMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetUndefinedMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getUndefinedMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetUndefinedRuntime
     * @tc.number SUB_NAPI_NOCOV_PRM_0021
     * @tc.desc   Verify napi_get_undefined with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUndefinedRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetUndefinedRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getUndefinedRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetUndefinedWorker
     * @tc.number SUB_NAPI_NOCOV_PRM_0022
     * @tc.desc   Verify napi_get_undefined with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUndefinedWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetUndefinedWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getUndefinedWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToBoolStable
     * @tc.number SUB_NAPI_NOCOV_PRM_0023
     * @tc.desc   Verify napi_coerce_to_bool with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToBoolStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToBoolStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToBoolStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToBoolMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRM_0024
     * @tc.desc   Verify napi_coerce_to_bool with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToBoolMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToBoolMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToBoolMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToBoolMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRM_0025
     * @tc.desc   Verify napi_coerce_to_bool with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToBoolMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToBoolMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToBoolMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToBoolRuntime
     * @tc.number SUB_NAPI_NOCOV_PRM_0026
     * @tc.desc   Verify napi_coerce_to_bool with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToBoolRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToBoolRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToBoolRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToBoolWorker
     * @tc.number SUB_NAPI_NOCOV_PRM_0027
     * @tc.desc   Verify napi_coerce_to_bool with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToBoolWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToBoolWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToBoolWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNumberStable
     * @tc.number SUB_NAPI_NOCOV_PRM_0028
     * @tc.desc   Verify napi_coerce_to_number with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNumberStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNumberStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNumberStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNumberMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRM_0029
     * @tc.desc   Verify napi_coerce_to_number with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNumberMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNumberMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNumberMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNumberMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRM_0030
     * @tc.desc   Verify napi_coerce_to_number with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNumberMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNumberMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNumberMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNumberRuntime
     * @tc.number SUB_NAPI_NOCOV_PRM_0031
     * @tc.desc   Verify napi_coerce_to_number with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNumberRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNumberRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNumberRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNumberWorker
     * @tc.number SUB_NAPI_NOCOV_PRM_0032
     * @tc.desc   Verify napi_coerce_to_number with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNumberWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNumberWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNumberWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToObjectStable
     * @tc.number SUB_NAPI_NOCOV_PRM_0033
     * @tc.desc   Verify napi_coerce_to_object with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToObjectStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToObjectStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToObjectStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToObjectMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRM_0034
     * @tc.desc   Verify napi_coerce_to_object with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToObjectMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToObjectMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToObjectMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToObjectMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRM_0035
     * @tc.desc   Verify napi_coerce_to_object with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToObjectMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToObjectMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToObjectMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToObjectRuntime
     * @tc.number SUB_NAPI_NOCOV_PRM_0036
     * @tc.desc   Verify napi_coerce_to_object with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToObjectRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToObjectRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToObjectRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToObjectWorker
     * @tc.number SUB_NAPI_NOCOV_PRM_0037
     * @tc.desc   Verify napi_coerce_to_object with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToObjectWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToObjectWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToObjectWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToStringAbnormal
     * @tc.number SUB_NAPI_NOCOV_PRM_0038
     * @tc.desc   Verify napi_coerce_to_string with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToStringAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToStringAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToStringAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToStringRetVal
     * @tc.number SUB_NAPI_NOCOV_PRM_0039
     * @tc.desc   Verify napi_coerce_to_string with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToStringRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToStringRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToStringRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToStringStable
     * @tc.number SUB_NAPI_NOCOV_PRM_0040
     * @tc.desc   Verify napi_coerce_to_string with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToStringStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToStringStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToStringStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToStringMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRM_0041
     * @tc.desc   Verify napi_coerce_to_string with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToStringMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToStringMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToStringMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToStringMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRM_0042
     * @tc.desc   Verify napi_coerce_to_string with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToStringMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToStringMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToStringMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToStringRuntime
     * @tc.number SUB_NAPI_NOCOV_PRM_0043
     * @tc.desc   Verify napi_coerce_to_string with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToStringRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToStringRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToStringRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToStringWorker
     * @tc.number SUB_NAPI_NOCOV_PRM_0044
     * @tc.desc   Verify napi_coerce_to_string with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToStringWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToStringWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToStringWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}