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
import testNapi from 'libnapiCovDateBigInt.so';

export default function napiCovDateBigIntTest() {
  describe('ActsNapiCovDateBigIntTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateDateStable
     * @tc.number SUB_NAPI_NOCOV_DBG_0001
     * @tc.desc   Verify napi_create_date with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDateStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDateStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDateStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDateMultiThread
     * @tc.number SUB_NAPI_NOCOV_DBG_0002
     * @tc.desc   Verify napi_create_date with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDateMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDateMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDateMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDateMultiCtx
     * @tc.number SUB_NAPI_NOCOV_DBG_0003
     * @tc.desc   Verify napi_create_date with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDateMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDateMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDateMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDateRuntime
     * @tc.number SUB_NAPI_NOCOV_DBG_0004
     * @tc.desc   Verify napi_create_date with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDateRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDateRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDateRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDateWorker
     * @tc.number SUB_NAPI_NOCOV_DBG_0005
     * @tc.desc   Verify napi_create_date with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDateWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDateWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDateWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDateValueStable
     * @tc.number SUB_NAPI_NOCOV_DBG_0006
     * @tc.desc   Verify napi_get_date_value with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDateValueStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDateValueStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDateValueStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDateValueMultiThread
     * @tc.number SUB_NAPI_NOCOV_DBG_0007
     * @tc.desc   Verify napi_get_date_value with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDateValueMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDateValueMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDateValueMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDateValueMultiCtx
     * @tc.number SUB_NAPI_NOCOV_DBG_0008
     * @tc.desc   Verify napi_get_date_value with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDateValueMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDateValueMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDateValueMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDateValueRuntime
     * @tc.number SUB_NAPI_NOCOV_DBG_0009
     * @tc.desc   Verify napi_get_date_value with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDateValueRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDateValueRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDateValueRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDateValueWorker
     * @tc.number SUB_NAPI_NOCOV_DBG_0010
     * @tc.desc   Verify napi_get_date_value with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDateValueWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDateValueWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDateValueWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDateStable
     * @tc.number SUB_NAPI_NOCOV_DBG_0011
     * @tc.desc   Verify napi_is_date with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDateStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDateStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDateStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDateMultiThread
     * @tc.number SUB_NAPI_NOCOV_DBG_0012
     * @tc.desc   Verify napi_is_date with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDateMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDateMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDateMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDateMultiCtx
     * @tc.number SUB_NAPI_NOCOV_DBG_0013
     * @tc.desc   Verify napi_is_date with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDateMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDateMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDateMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDateWorker
     * @tc.number SUB_NAPI_NOCOV_DBG_0014
     * @tc.desc   Verify napi_is_date with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDateWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDateWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDateWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintInt64RetVal
     * @tc.number SUB_NAPI_NOCOV_DBG_0015
     * @tc.desc   Verify napi_create_bigint_int64 with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintInt64RetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintInt64RetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintInt64RetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintInt64Stable
     * @tc.number SUB_NAPI_NOCOV_DBG_0016
     * @tc.desc   Verify napi_create_bigint_int64 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintInt64Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintInt64Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintInt64Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintInt64MultiThread
     * @tc.number SUB_NAPI_NOCOV_DBG_0017
     * @tc.desc   Verify napi_create_bigint_int64 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintInt64MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintInt64MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintInt64MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintInt64MultiCtx
     * @tc.number SUB_NAPI_NOCOV_DBG_0018
     * @tc.desc   Verify napi_create_bigint_int64 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintInt64MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintInt64MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintInt64MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintInt64Runtime
     * @tc.number SUB_NAPI_NOCOV_DBG_0019
     * @tc.desc   Verify napi_create_bigint_int64 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintInt64Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintInt64Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintInt64Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintInt64Worker
     * @tc.number SUB_NAPI_NOCOV_DBG_0020
     * @tc.desc   Verify napi_create_bigint_int64 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintInt64Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintInt64Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintInt64Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintUint64Abnormal
     * @tc.number SUB_NAPI_NOCOV_DBG_0021
     * @tc.desc   Verify napi_create_bigint_uint64 with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintUint64Abnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintUint64Abnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintUint64Abnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintUint64Stable
     * @tc.number SUB_NAPI_NOCOV_DBG_0022
     * @tc.desc   Verify napi_create_bigint_uint64 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintUint64Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintUint64Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintUint64Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintUint64MultiThread
     * @tc.number SUB_NAPI_NOCOV_DBG_0023
     * @tc.desc   Verify napi_create_bigint_uint64 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintUint64MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintUint64MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintUint64MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintUint64MultiCtx
     * @tc.number SUB_NAPI_NOCOV_DBG_0024
     * @tc.desc   Verify napi_create_bigint_uint64 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintUint64MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintUint64MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintUint64MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintUint64Runtime
     * @tc.number SUB_NAPI_NOCOV_DBG_0025
     * @tc.desc   Verify napi_create_bigint_uint64 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintUint64Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintUint64Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintUint64Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintUint64Worker
     * @tc.number SUB_NAPI_NOCOV_DBG_0026
     * @tc.desc   Verify napi_create_bigint_uint64 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintUint64Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintUint64Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintUint64Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintWordsAbnormal
     * @tc.number SUB_NAPI_NOCOV_DBG_0027
     * @tc.desc   Verify napi_create_bigint_words with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintWordsAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintWordsAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintWordsAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintWordsMultiThread
     * @tc.number SUB_NAPI_NOCOV_DBG_0028
     * @tc.desc   Verify napi_create_bigint_words with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintWordsMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintWordsMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintWordsMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintWordsMultiCtx
     * @tc.number SUB_NAPI_NOCOV_DBG_0029
     * @tc.desc   Verify napi_create_bigint_words with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintWordsMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintWordsMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintWordsMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintWordsRuntime
     * @tc.number SUB_NAPI_NOCOV_DBG_0030
     * @tc.desc   Verify napi_create_bigint_words with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintWordsRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintWordsRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintWordsRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBigintWordsWorker
     * @tc.number SUB_NAPI_NOCOV_DBG_0031
     * @tc.desc   Verify napi_create_bigint_words with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBigintWordsWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBigintWordsWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBigintWordsWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintInt64RetVal
     * @tc.number SUB_NAPI_NOCOV_DBG_0032
     * @tc.desc   Verify napi_get_value_bigint_int64 with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintInt64RetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintInt64RetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintInt64RetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintInt64Stable
     * @tc.number SUB_NAPI_NOCOV_DBG_0033
     * @tc.desc   Verify napi_get_value_bigint_int64 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintInt64Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintInt64Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintInt64Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintInt64MultiThread
     * @tc.number SUB_NAPI_NOCOV_DBG_0034
     * @tc.desc   Verify napi_get_value_bigint_int64 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintInt64MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintInt64MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintInt64MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintInt64MultiCtx
     * @tc.number SUB_NAPI_NOCOV_DBG_0035
     * @tc.desc   Verify napi_get_value_bigint_int64 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintInt64MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintInt64MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintInt64MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintInt64Runtime
     * @tc.number SUB_NAPI_NOCOV_DBG_0036
     * @tc.desc   Verify napi_get_value_bigint_int64 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintInt64Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintInt64Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintInt64Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintInt64Worker
     * @tc.number SUB_NAPI_NOCOV_DBG_0037
     * @tc.desc   Verify napi_get_value_bigint_int64 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintInt64Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintInt64Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintInt64Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintUint64Stable
     * @tc.number SUB_NAPI_NOCOV_DBG_0038
     * @tc.desc   Verify napi_get_value_bigint_uint64 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintUint64Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintUint64Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintUint64Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintUint64MultiThread
     * @tc.number SUB_NAPI_NOCOV_DBG_0039
     * @tc.desc   Verify napi_get_value_bigint_uint64 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintUint64MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintUint64MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintUint64MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintUint64MultiCtx
     * @tc.number SUB_NAPI_NOCOV_DBG_0040
     * @tc.desc   Verify napi_get_value_bigint_uint64 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintUint64MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintUint64MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintUint64MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintUint64Runtime
     * @tc.number SUB_NAPI_NOCOV_DBG_0041
     * @tc.desc   Verify napi_get_value_bigint_uint64 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintUint64Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintUint64Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintUint64Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintUint64Worker
     * @tc.number SUB_NAPI_NOCOV_DBG_0042
     * @tc.desc   Verify napi_get_value_bigint_uint64 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintUint64Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintUint64Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintUint64Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintWordsStable
     * @tc.number SUB_NAPI_NOCOV_DBG_0043
     * @tc.desc   Verify napi_get_value_bigint_words with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintWordsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintWordsStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintWordsStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintWordsMultiThread
     * @tc.number SUB_NAPI_NOCOV_DBG_0044
     * @tc.desc   Verify napi_get_value_bigint_words with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintWordsMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintWordsMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintWordsMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintWordsMultiCtx
     * @tc.number SUB_NAPI_NOCOV_DBG_0045
     * @tc.desc   Verify napi_get_value_bigint_words with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintWordsMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintWordsMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintWordsMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintWordsRuntime
     * @tc.number SUB_NAPI_NOCOV_DBG_0046
     * @tc.desc   Verify napi_get_value_bigint_words with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintWordsRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintWordsRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintWordsRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBigintWordsWorker
     * @tc.number SUB_NAPI_NOCOV_DBG_0047
     * @tc.desc   Verify napi_get_value_bigint_words with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBigintWordsWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBigintWordsWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBigintWordsWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}