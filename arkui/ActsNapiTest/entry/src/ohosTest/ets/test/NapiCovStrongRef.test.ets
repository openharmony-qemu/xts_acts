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
import testNapi from 'libnapiCovStrongRef.so';

export default function napiCovStrongRefTest() {
  describe('ActsNapiCovStrongRefTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateStrongReferenceNormal
     * @tc.number SUB_NAPI_NOCOV_SREF_0001
     * @tc.desc   Verify napi_create_strong_reference with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongReferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongReferenceNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongReferenceNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongReferenceStable
     * @tc.number SUB_NAPI_NOCOV_SREF_0002
     * @tc.desc   Verify napi_create_strong_reference with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongReferenceStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongReferenceStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongReferenceStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongReferenceMultiThread
     * @tc.number SUB_NAPI_NOCOV_SREF_0003
     * @tc.desc   Verify napi_create_strong_reference with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongReferenceMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongReferenceMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongReferenceMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongReferenceMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SREF_0004
     * @tc.desc   Verify napi_create_strong_reference with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongReferenceMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongReferenceMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongReferenceMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongReferenceRuntime
     * @tc.number SUB_NAPI_NOCOV_SREF_0005
     * @tc.desc   Verify napi_create_strong_reference with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongReferenceRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongReferenceRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongReferenceRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateStrongReferenceWorker
     * @tc.number SUB_NAPI_NOCOV_SREF_0006
     * @tc.desc   Verify napi_create_strong_reference with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateStrongReferenceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateStrongReferenceWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createStrongReferenceWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongReferenceNormal
     * @tc.number SUB_NAPI_NOCOV_SREF_0007
     * @tc.desc   Verify napi_delete_strong_reference with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongReferenceNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongReferenceNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongReferenceNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongReferenceStable
     * @tc.number SUB_NAPI_NOCOV_SREF_0008
     * @tc.desc   Verify napi_delete_strong_reference with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongReferenceStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongReferenceStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongReferenceStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongReferenceMultiThread
     * @tc.number SUB_NAPI_NOCOV_SREF_0009
     * @tc.desc   Verify napi_delete_strong_reference with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongReferenceMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongReferenceMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongReferenceMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongReferenceMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SREF_0010
     * @tc.desc   Verify napi_delete_strong_reference with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongReferenceMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongReferenceMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongReferenceMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongReferenceRuntime
     * @tc.number SUB_NAPI_NOCOV_SREF_0011
     * @tc.desc   Verify napi_delete_strong_reference with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongReferenceRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongReferenceRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongReferenceRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteStrongReferenceWorker
     * @tc.number SUB_NAPI_NOCOV_SREF_0012
     * @tc.desc   Verify napi_delete_strong_reference with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteStrongReferenceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteStrongReferenceWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteStrongReferenceWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongReferenceValueNormal
     * @tc.number SUB_NAPI_NOCOV_SREF_0013
     * @tc.desc   Verify napi_get_strong_reference_value with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongReferenceValueNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongReferenceValueNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongReferenceValueNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongReferenceValueStable
     * @tc.number SUB_NAPI_NOCOV_SREF_0014
     * @tc.desc   Verify napi_get_strong_reference_value with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongReferenceValueStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongReferenceValueStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongReferenceValueStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongReferenceValueMultiThread
     * @tc.number SUB_NAPI_NOCOV_SREF_0015
     * @tc.desc   Verify napi_get_strong_reference_value with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongReferenceValueMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongReferenceValueMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongReferenceValueMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongReferenceValueMultiCtx
     * @tc.number SUB_NAPI_NOCOV_SREF_0016
     * @tc.desc   Verify napi_get_strong_reference_value with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongReferenceValueMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongReferenceValueMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongReferenceValueMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongReferenceValueRuntime
     * @tc.number SUB_NAPI_NOCOV_SREF_0017
     * @tc.desc   Verify napi_get_strong_reference_value with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongReferenceValueRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongReferenceValueRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongReferenceValueRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetStrongReferenceValueWorker
     * @tc.number SUB_NAPI_NOCOV_SREF_0018
     * @tc.desc   Verify napi_get_strong_reference_value with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetStrongReferenceValueWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetStrongReferenceValueWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getStrongReferenceValueWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}