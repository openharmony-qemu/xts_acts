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
import testNapi from 'libnapiCovBasicNum.so';

export default function napiCovBasicNumTest() {
  describe('ActsNapiCovBasicNumTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateInt32Stable
     * @tc.number SUB_NAPI_NOCOV_NUM_0001
     * @tc.desc   Verify napi_create_int32 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt32Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt32Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt32Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt32MultiThread
     * @tc.number SUB_NAPI_NOCOV_NUM_0002
     * @tc.desc   Verify napi_create_int32 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt32MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt32MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt32MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt32MultiCtx
     * @tc.number SUB_NAPI_NOCOV_NUM_0003
     * @tc.desc   Verify napi_create_int32 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt32MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt32MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt32MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt32Runtime
     * @tc.number SUB_NAPI_NOCOV_NUM_0004
     * @tc.desc   Verify napi_create_int32 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt32Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt32Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt32Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt32Worker
     * @tc.number SUB_NAPI_NOCOV_NUM_0005
     * @tc.desc   Verify napi_create_int32 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt32Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt32Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt32Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateUint32Abnormal
     * @tc.number SUB_NAPI_NOCOV_NUM_0006
     * @tc.desc   Verify napi_create_uint32 with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUint32Abnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateUint32Abnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createUint32Abnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateUint32Stable
     * @tc.number SUB_NAPI_NOCOV_NUM_0007
     * @tc.desc   Verify napi_create_uint32 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUint32Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateUint32Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createUint32Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateUint32MultiThread
     * @tc.number SUB_NAPI_NOCOV_NUM_0008
     * @tc.desc   Verify napi_create_uint32 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUint32MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateUint32MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createUint32MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateUint32MultiCtx
     * @tc.number SUB_NAPI_NOCOV_NUM_0009
     * @tc.desc   Verify napi_create_uint32 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUint32MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateUint32MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createUint32MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateUint32Runtime
     * @tc.number SUB_NAPI_NOCOV_NUM_0010
     * @tc.desc   Verify napi_create_uint32 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUint32Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateUint32Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createUint32Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateUint32Worker
     * @tc.number SUB_NAPI_NOCOV_NUM_0011
     * @tc.desc   Verify napi_create_uint32 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateUint32Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateUint32Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createUint32Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt64Abnormal
     * @tc.number SUB_NAPI_NOCOV_NUM_0012
     * @tc.desc   Verify napi_create_int64 with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt64Abnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt64Abnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt64Abnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt64Stable
     * @tc.number SUB_NAPI_NOCOV_NUM_0013
     * @tc.desc   Verify napi_create_int64 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt64Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt64Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt64Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt64MultiThread
     * @tc.number SUB_NAPI_NOCOV_NUM_0014
     * @tc.desc   Verify napi_create_int64 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt64MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt64MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt64MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt64MultiCtx
     * @tc.number SUB_NAPI_NOCOV_NUM_0015
     * @tc.desc   Verify napi_create_int64 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt64MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt64MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt64MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt64Runtime
     * @tc.number SUB_NAPI_NOCOV_NUM_0016
     * @tc.desc   Verify napi_create_int64 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt64Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt64Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt64Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateInt64Worker
     * @tc.number SUB_NAPI_NOCOV_NUM_0017
     * @tc.desc   Verify napi_create_int64 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateInt64Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateInt64Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createInt64Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDoubleAbnormal
     * @tc.number SUB_NAPI_NOCOV_NUM_0018
     * @tc.desc   Verify napi_create_double with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDoubleAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDoubleAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDoubleAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDoubleRetVal
     * @tc.number SUB_NAPI_NOCOV_NUM_0019
     * @tc.desc   Verify napi_create_double with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDoubleRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDoubleRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDoubleRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDoubleStable
     * @tc.number SUB_NAPI_NOCOV_NUM_0020
     * @tc.desc   Verify napi_create_double with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDoubleStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDoubleStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDoubleStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDoubleMultiThread
     * @tc.number SUB_NAPI_NOCOV_NUM_0021
     * @tc.desc   Verify napi_create_double with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDoubleMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDoubleMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDoubleMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDoubleMultiCtx
     * @tc.number SUB_NAPI_NOCOV_NUM_0022
     * @tc.desc   Verify napi_create_double with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDoubleMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDoubleMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDoubleMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDoubleRuntime
     * @tc.number SUB_NAPI_NOCOV_NUM_0023
     * @tc.desc   Verify napi_create_double with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDoubleRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDoubleRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDoubleRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDoubleWorker
     * @tc.number SUB_NAPI_NOCOV_NUM_0024
     * @tc.desc   Verify napi_create_double with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDoubleWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDoubleWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDoubleWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt32Abnormal
     * @tc.number SUB_NAPI_NOCOV_NUM_0025
     * @tc.desc   Verify napi_get_value_int32 with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt32Abnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt32Abnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt32Abnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt32Stable
     * @tc.number SUB_NAPI_NOCOV_NUM_0026
     * @tc.desc   Verify napi_get_value_int32 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt32Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt32Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt32Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt32MultiThread
     * @tc.number SUB_NAPI_NOCOV_NUM_0027
     * @tc.desc   Verify napi_get_value_int32 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt32MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt32MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt32MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt32MultiCtx
     * @tc.number SUB_NAPI_NOCOV_NUM_0028
     * @tc.desc   Verify napi_get_value_int32 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt32MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt32MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt32MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt32Runtime
     * @tc.number SUB_NAPI_NOCOV_NUM_0029
     * @tc.desc   Verify napi_get_value_int32 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt32Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt32Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt32Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt32Worker
     * @tc.number SUB_NAPI_NOCOV_NUM_0030
     * @tc.desc   Verify napi_get_value_int32 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt32Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt32Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt32Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueUint32Abnormal
     * @tc.number SUB_NAPI_NOCOV_NUM_0031
     * @tc.desc   Verify napi_get_value_uint32 with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueUint32Abnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueUint32Abnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueUint32Abnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueUint32Stable
     * @tc.number SUB_NAPI_NOCOV_NUM_0032
     * @tc.desc   Verify napi_get_value_uint32 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueUint32Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueUint32Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueUint32Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueUint32MultiThread
     * @tc.number SUB_NAPI_NOCOV_NUM_0033
     * @tc.desc   Verify napi_get_value_uint32 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueUint32MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueUint32MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueUint32MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueUint32MultiCtx
     * @tc.number SUB_NAPI_NOCOV_NUM_0034
     * @tc.desc   Verify napi_get_value_uint32 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueUint32MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueUint32MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueUint32MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueUint32Runtime
     * @tc.number SUB_NAPI_NOCOV_NUM_0035
     * @tc.desc   Verify napi_get_value_uint32 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueUint32Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueUint32Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueUint32Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueUint32Worker
     * @tc.number SUB_NAPI_NOCOV_NUM_0036
     * @tc.desc   Verify napi_get_value_uint32 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueUint32Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueUint32Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueUint32Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt64Stable
     * @tc.number SUB_NAPI_NOCOV_NUM_0037
     * @tc.desc   Verify napi_get_value_int64 with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt64Stable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt64Stable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt64Stable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt64MultiThread
     * @tc.number SUB_NAPI_NOCOV_NUM_0038
     * @tc.desc   Verify napi_get_value_int64 with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt64MultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt64MultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt64MultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt64MultiCtx
     * @tc.number SUB_NAPI_NOCOV_NUM_0039
     * @tc.desc   Verify napi_get_value_int64 with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt64MultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt64MultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt64MultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt64Runtime
     * @tc.number SUB_NAPI_NOCOV_NUM_0040
     * @tc.desc   Verify napi_get_value_int64 with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt64Runtime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt64Runtime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt64Runtime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueInt64Worker
     * @tc.number SUB_NAPI_NOCOV_NUM_0041
     * @tc.desc   Verify napi_get_value_int64 with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueInt64Worker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueInt64Worker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueInt64Worker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueDoubleAbnormal
     * @tc.number SUB_NAPI_NOCOV_NUM_0042
     * @tc.desc   Verify napi_get_value_double with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueDoubleAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueDoubleAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueDoubleAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueDoubleRetVal
     * @tc.number SUB_NAPI_NOCOV_NUM_0043
     * @tc.desc   Verify napi_get_value_double with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueDoubleRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueDoubleRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueDoubleRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueDoubleStable
     * @tc.number SUB_NAPI_NOCOV_NUM_0044
     * @tc.desc   Verify napi_get_value_double with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueDoubleStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueDoubleStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueDoubleStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueDoubleMultiThread
     * @tc.number SUB_NAPI_NOCOV_NUM_0045
     * @tc.desc   Verify napi_get_value_double with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueDoubleMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueDoubleMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueDoubleMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueDoubleMultiCtx
     * @tc.number SUB_NAPI_NOCOV_NUM_0046
     * @tc.desc   Verify napi_get_value_double with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueDoubleMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueDoubleMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueDoubleMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueDoubleRuntime
     * @tc.number SUB_NAPI_NOCOV_NUM_0047
     * @tc.desc   Verify napi_get_value_double with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueDoubleRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueDoubleRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueDoubleRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueDoubleWorker
     * @tc.number SUB_NAPI_NOCOV_NUM_0048
     * @tc.desc   Verify napi_get_value_double with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueDoubleWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueDoubleWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueDoubleWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBoolAbnormal
     * @tc.number SUB_NAPI_NOCOV_NUM_0049
     * @tc.desc   Verify napi_get_value_bool with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBoolAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBoolAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBoolAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBoolStable
     * @tc.number SUB_NAPI_NOCOV_NUM_0050
     * @tc.desc   Verify napi_get_value_bool with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBoolStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBoolStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBoolStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBoolMultiThread
     * @tc.number SUB_NAPI_NOCOV_NUM_0051
     * @tc.desc   Verify napi_get_value_bool with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBoolMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBoolMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBoolMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBoolMultiCtx
     * @tc.number SUB_NAPI_NOCOV_NUM_0052
     * @tc.desc   Verify napi_get_value_bool with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBoolMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBoolMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBoolMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBoolRuntime
     * @tc.number SUB_NAPI_NOCOV_NUM_0053
     * @tc.desc   Verify napi_get_value_bool with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBoolRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBoolRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBoolRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueBoolWorker
     * @tc.number SUB_NAPI_NOCOV_NUM_0054
     * @tc.desc   Verify napi_get_value_bool with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueBoolWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueBoolWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueBoolWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}