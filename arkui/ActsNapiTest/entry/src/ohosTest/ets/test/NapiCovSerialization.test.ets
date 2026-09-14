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
import testNapi from 'libnapiCovSerialization.so';

export default function napiCovSerializationTest() {
  describe('ActsNapiCovSerializationTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testSerializeRetVal
     * @tc.number SUB_NAPI_NOCOV_SER_0001
     * @tc.desc   Verify napi_serialize with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerializeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSerializeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.serializeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSerializeStable
     * @tc.number SUB_NAPI_NOCOV_SER_0002
     * @tc.desc   Verify napi_serialize with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerializeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSerializeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.serializeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSerializeMultiThread
     * @tc.number SUB_NAPI_NOCOV_SER_0003
     * @tc.desc   Verify napi_serialize with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerializeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSerializeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.serializeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSerializeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SER_0004
     * @tc.desc   Verify napi_serialize with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerializeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSerializeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.serializeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSerializeRuntime
     * @tc.number SUB_NAPI_NOCOV_SER_0005
     * @tc.desc   Verify napi_serialize with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerializeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSerializeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.serializeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSerializeWorker
     * @tc.number SUB_NAPI_NOCOV_SER_0006
     * @tc.desc   Verify napi_serialize with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSerializeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSerializeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.serializeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeserializeAbnormal
     * @tc.number SUB_NAPI_NOCOV_SER_0007
     * @tc.desc   Verify napi_deserialize with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeserializeAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeserializeAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deserializeAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeserializeRetVal
     * @tc.number SUB_NAPI_NOCOV_SER_0008
     * @tc.desc   Verify napi_deserialize with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeserializeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeserializeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deserializeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeserializeStable
     * @tc.number SUB_NAPI_NOCOV_SER_0009
     * @tc.desc   Verify napi_deserialize with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeserializeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeserializeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.deserializeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeserializeMultiThread
     * @tc.number SUB_NAPI_NOCOV_SER_0010
     * @tc.desc   Verify napi_deserialize with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeserializeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeserializeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.deserializeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeserializeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SER_0011
     * @tc.desc   Verify napi_deserialize with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeserializeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeserializeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.deserializeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeserializeRuntime
     * @tc.number SUB_NAPI_NOCOV_SER_0012
     * @tc.desc   Verify napi_deserialize with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeserializeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeserializeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.deserializeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeserializeWorker
     * @tc.number SUB_NAPI_NOCOV_SER_0013
     * @tc.desc   Verify napi_deserialize with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeserializeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeserializeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.deserializeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteSerializationDataAbnormal
     * @tc.number SUB_NAPI_NOCOV_SER_0014
     * @tc.desc   Verify napi_delete_serialization_data with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteSerializationDataAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteSerializationDataAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteSerializationDataAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteSerializationDataRetVal
     * @tc.number SUB_NAPI_NOCOV_SER_0015
     * @tc.desc   Verify napi_delete_serialization_data with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteSerializationDataRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteSerializationDataRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteSerializationDataRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteSerializationDataStable
     * @tc.number SUB_NAPI_NOCOV_SER_0016
     * @tc.desc   Verify napi_delete_serialization_data with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteSerializationDataStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteSerializationDataStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteSerializationDataStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteSerializationDataMultiThread
     * @tc.number SUB_NAPI_NOCOV_SER_0017
     * @tc.desc   Verify napi_delete_serialization_data with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteSerializationDataMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteSerializationDataMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteSerializationDataMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteSerializationDataMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SER_0018
     * @tc.desc   Verify napi_delete_serialization_data with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteSerializationDataMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteSerializationDataMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteSerializationDataMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteSerializationDataRuntime
     * @tc.number SUB_NAPI_NOCOV_SER_0019
     * @tc.desc   Verify napi_delete_serialization_data with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteSerializationDataRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteSerializationDataRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteSerializationDataRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteSerializationDataWorker
     * @tc.number SUB_NAPI_NOCOV_SER_0020
     * @tc.desc   Verify napi_delete_serialization_data with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteSerializationDataWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteSerializationDataWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteSerializationDataWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}