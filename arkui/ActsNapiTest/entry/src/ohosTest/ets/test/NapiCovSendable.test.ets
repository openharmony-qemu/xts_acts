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
import testNapi from 'libnapiCovSendable.so';

export default function napiCovSendableTest() {
  describe('ActsNapiCovSendableTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testIsSendableAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0001
     * @tc.desc   Verify napi_is_sendable with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendableAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsSendableAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.isSendableAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsSendableRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0002
     * @tc.desc   Verify napi_is_sendable with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendableRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsSendableRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.isSendableRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsSendableStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0003
     * @tc.desc   Verify napi_is_sendable with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendableStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsSendableStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isSendableStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsSendableMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0004
     * @tc.desc   Verify napi_is_sendable with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendableMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsSendableMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isSendableMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsSendableMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0005
     * @tc.desc   Verify napi_is_sendable with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendableMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsSendableMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isSendableMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsSendableWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0006
     * @tc.desc   Verify napi_is_sendable with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsSendableWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsSendableWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isSendableWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineSendableClassAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0007
     * @tc.desc   Verify napi_define_sendable_class with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineSendableClassAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineSendableClassAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineSendableClassAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineSendableClassRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0008
     * @tc.desc   Verify napi_define_sendable_class with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineSendableClassRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineSendableClassRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineSendableClassRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineSendableClassStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0009
     * @tc.desc   Verify napi_define_sendable_class with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineSendableClassStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineSendableClassStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineSendableClassStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineSendableClassMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0010
     * @tc.desc   Verify napi_define_sendable_class with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineSendableClassMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineSendableClassMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineSendableClassMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineSendableClassMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0011
     * @tc.desc   Verify napi_define_sendable_class with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineSendableClassMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineSendableClassMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineSendableClassMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineSendableClassWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0012
     * @tc.desc   Verify napi_define_sendable_class with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineSendableClassWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineSendableClassWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineSendableClassWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableObjectWithPropertiesAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0013
     * @tc.desc   Verify napi_create_sendable_object_with_properties with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableObjectWithPropertiesAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableObjectWithPropertiesAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableObjectWithPropertiesAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableObjectWithPropertiesRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0014
     * @tc.desc   Verify napi_create_sendable_object_with_properties with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableObjectWithPropertiesRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableObjectWithPropertiesRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableObjectWithPropertiesRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableObjectWithPropertiesStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0015
     * @tc.desc   Verify napi_create_sendable_object_with_properties with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableObjectWithPropertiesStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableObjectWithPropertiesStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableObjectWithPropertiesStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableObjectWithPropertiesMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0016
     * @tc.desc   Verify napi_create_sendable_object_with_properties with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableObjectWithPropertiesMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableObjectWithPropertiesMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableObjectWithPropertiesMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableObjectWithPropertiesMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0017
     * @tc.desc   Verify napi_create_sendable_object_with_properties with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableObjectWithPropertiesMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableObjectWithPropertiesMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableObjectWithPropertiesMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableObjectWithPropertiesWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0018
     * @tc.desc   Verify napi_create_sendable_object_with_properties with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableObjectWithPropertiesWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableObjectWithPropertiesWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableObjectWithPropertiesWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0019
     * @tc.desc   Verify napi_create_sendable_array with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0020
     * @tc.desc   Verify napi_create_sendable_array with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0021
     * @tc.desc   Verify napi_create_sendable_array with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0022
     * @tc.desc   Verify napi_create_sendable_array with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0023
     * @tc.desc   Verify napi_create_sendable_array with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0024
     * @tc.desc   Verify napi_create_sendable_array with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayWithLengthAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0025
     * @tc.desc   Verify napi_create_sendable_array_with_length with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayWithLengthAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayWithLengthAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayWithLengthAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayWithLengthRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0026
     * @tc.desc   Verify napi_create_sendable_array_with_length with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayWithLengthRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayWithLengthRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayWithLengthRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayWithLengthStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0027
     * @tc.desc   Verify napi_create_sendable_array_with_length with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayWithLengthStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayWithLengthStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayWithLengthStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayWithLengthMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0028
     * @tc.desc   Verify napi_create_sendable_array_with_length with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayWithLengthMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayWithLengthMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayWithLengthMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayWithLengthMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0029
     * @tc.desc   Verify napi_create_sendable_array_with_length with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayWithLengthMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayWithLengthMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayWithLengthMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArrayWithLengthWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0030
     * @tc.desc   Verify napi_create_sendable_array_with_length with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArrayWithLengthWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArrayWithLengthWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArrayWithLengthWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArraybufferAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0031
     * @tc.desc   Verify napi_create_sendable_arraybuffer with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArraybufferAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArraybufferAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArraybufferAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArraybufferRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0032
     * @tc.desc   Verify napi_create_sendable_arraybuffer with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArraybufferRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArraybufferRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArraybufferRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArraybufferStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0033
     * @tc.desc   Verify napi_create_sendable_arraybuffer with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArraybufferStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArraybufferStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArraybufferStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArraybufferMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0034
     * @tc.desc   Verify napi_create_sendable_arraybuffer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArraybufferMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArraybufferMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArraybufferMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArraybufferMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0035
     * @tc.desc   Verify napi_create_sendable_arraybuffer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArraybufferMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArraybufferMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArraybufferMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableArraybufferWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0036
     * @tc.desc   Verify napi_create_sendable_arraybuffer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableArraybufferWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableArraybufferWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableArraybufferWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableTypedarrayAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0037
     * @tc.desc   Verify napi_create_sendable_typedarray with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableTypedarrayAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableTypedarrayAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableTypedarrayAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableTypedarrayRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0038
     * @tc.desc   Verify napi_create_sendable_typedarray with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableTypedarrayRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableTypedarrayRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableTypedarrayRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableTypedarrayStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0039
     * @tc.desc   Verify napi_create_sendable_typedarray with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableTypedarrayStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableTypedarrayStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableTypedarrayStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableTypedarrayMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0040
     * @tc.desc   Verify napi_create_sendable_typedarray with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableTypedarrayMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableTypedarrayMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableTypedarrayMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableTypedarrayMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0041
     * @tc.desc   Verify napi_create_sendable_typedarray with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableTypedarrayMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableTypedarrayMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableTypedarrayMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSendableTypedarrayWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0042
     * @tc.desc   Verify napi_create_sendable_typedarray with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSendableTypedarrayWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSendableTypedarrayWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSendableTypedarrayWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0043
     * @tc.desc   Verify napi_wrap_sendable with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0044
     * @tc.desc   Verify napi_wrap_sendable with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0045
     * @tc.desc   Verify napi_wrap_sendable with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0046
     * @tc.desc   Verify napi_wrap_sendable with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0047
     * @tc.desc   Verify napi_wrap_sendable with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0048
     * @tc.desc   Verify napi_wrap_sendable with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableWithSizeAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0049
     * @tc.desc   Verify napi_wrap_sendable_with_size with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableWithSizeAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableWithSizeAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableWithSizeAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableWithSizeRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0050
     * @tc.desc   Verify napi_wrap_sendable_with_size with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableWithSizeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableWithSizeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableWithSizeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableWithSizeStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0051
     * @tc.desc   Verify napi_wrap_sendable_with_size with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableWithSizeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableWithSizeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableWithSizeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableWithSizeMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0052
     * @tc.desc   Verify napi_wrap_sendable_with_size with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableWithSizeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableWithSizeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableWithSizeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableWithSizeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0053
     * @tc.desc   Verify napi_wrap_sendable_with_size with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableWithSizeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableWithSizeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableWithSizeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapSendableWithSizeWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0054
     * @tc.desc   Verify napi_wrap_sendable_with_size with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapSendableWithSizeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapSendableWithSizeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapSendableWithSizeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapSendableAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0055
     * @tc.desc   Verify napi_unwrap_sendable with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapSendableAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapSendableAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapSendableAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapSendableRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0056
     * @tc.desc   Verify napi_unwrap_sendable with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapSendableRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapSendableRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapSendableRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapSendableStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0057
     * @tc.desc   Verify napi_unwrap_sendable with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapSendableStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapSendableStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapSendableStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapSendableMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0058
     * @tc.desc   Verify napi_unwrap_sendable with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapSendableMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapSendableMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapSendableMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapSendableMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0059
     * @tc.desc   Verify napi_unwrap_sendable with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapSendableMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapSendableMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapSendableMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapSendableWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0060
     * @tc.desc   Verify napi_unwrap_sendable with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapSendableWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapSendableWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapSendableWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapSendableAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0061
     * @tc.desc   Verify napi_remove_wrap_sendable with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapSendableAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapSendableAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapSendableAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapSendableRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0062
     * @tc.desc   Verify napi_remove_wrap_sendable with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapSendableRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapSendableRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapSendableRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapSendableStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0063
     * @tc.desc   Verify napi_remove_wrap_sendable with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapSendableStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapSendableStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapSendableStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapSendableMultiThread
     * @tc.number SUB_NAPI_NOCOV_SEND_0064
     * @tc.desc   Verify napi_remove_wrap_sendable with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapSendableMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapSendableMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapSendableMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapSendableMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0065
     * @tc.desc   Verify napi_remove_wrap_sendable with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapSendableMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapSendableMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapSendableMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapSendableWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0066
     * @tc.desc   Verify napi_remove_wrap_sendable with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapSendableWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapSendableWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapSendableWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongSendableReferenceNormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0067
     * @tc.desc   Verify napi_create_strong_sendable_reference with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongSendableReferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongSendableReferenceNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongSendableReferenceNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongSendableReferenceAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0068
     * @tc.desc   Verify napi_create_strong_sendable_reference with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongSendableReferenceAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongSendableReferenceAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongSendableReferenceAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongSendableReferenceRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0069
     * @tc.desc   Verify napi_create_strong_sendable_reference with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongSendableReferenceRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongSendableReferenceRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongSendableReferenceRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongSendableReferenceStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0070
     * @tc.desc   Verify napi_create_strong_sendable_reference with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongSendableReferenceStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongSendableReferenceStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongSendableReferenceStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongSendableReferenceMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0071
     * @tc.desc   Verify napi_create_strong_sendable_reference with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongSendableReferenceMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongSendableReferenceMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongSendableReferenceMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongSendableReferenceWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0072
     * @tc.desc   Verify napi_create_strong_sendable_reference with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongSendableReferenceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongSendableReferenceWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongSendableReferenceWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongSendableReferenceNormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0073
     * @tc.desc   Verify napi_delete_strong_sendable_reference with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongSendableReferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongSendableReferenceNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongSendableReferenceNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongSendableReferenceAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0074
     * @tc.desc   Verify napi_delete_strong_sendable_reference with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongSendableReferenceAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongSendableReferenceAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongSendableReferenceAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongSendableReferenceRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0075
     * @tc.desc   Verify napi_delete_strong_sendable_reference with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongSendableReferenceRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongSendableReferenceRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongSendableReferenceRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongSendableReferenceStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0076
     * @tc.desc   Verify napi_delete_strong_sendable_reference with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongSendableReferenceStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongSendableReferenceStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongSendableReferenceStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongSendableReferenceMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0077
     * @tc.desc   Verify napi_delete_strong_sendable_reference with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongSendableReferenceMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongSendableReferenceMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongSendableReferenceMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongSendableReferenceWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0078
     * @tc.desc   Verify napi_delete_strong_sendable_reference with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongSendableReferenceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongSendableReferenceWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongSendableReferenceWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongSendableReferenceValueNormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0079
     * @tc.desc   Verify napi_get_strong_sendable_reference_value with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongSendableReferenceValueNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongSendableReferenceValueNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongSendableReferenceValueNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongSendableReferenceValueAbnormal
     * @tc.number SUB_NAPI_NOCOV_SEND_0080
     * @tc.desc   Verify napi_get_strong_sendable_reference_value with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongSendableReferenceValueAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongSendableReferenceValueAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongSendableReferenceValueAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongSendableReferenceValueRetVal
     * @tc.number SUB_NAPI_NOCOV_SEND_0081
     * @tc.desc   Verify napi_get_strong_sendable_reference_value with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongSendableReferenceValueRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongSendableReferenceValueRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongSendableReferenceValueRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongSendableReferenceValueStable
     * @tc.number SUB_NAPI_NOCOV_SEND_0082
     * @tc.desc   Verify napi_get_strong_sendable_reference_value with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongSendableReferenceValueStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongSendableReferenceValueStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongSendableReferenceValueStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongSendableReferenceValueMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SEND_0083
     * @tc.desc   Verify napi_get_strong_sendable_reference_value with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongSendableReferenceValueMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongSendableReferenceValueMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongSendableReferenceValueMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongSendableReferenceValueWorker
     * @tc.number SUB_NAPI_NOCOV_SEND_0084
     * @tc.desc   Verify napi_get_strong_sendable_reference_value with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongSendableReferenceValueWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongSendableReferenceValueWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongSendableReferenceValueWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}