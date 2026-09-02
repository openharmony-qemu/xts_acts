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
import testNapi from 'libnapiCovArray.so';

export default function napiCovArrayTest() {
  describe('ActsNapiCovArrayTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateArrayRetVal
     * @tc.number SUB_NAPI_NOCOV_ARR_0001
     * @tc.desc   Verify napi_create_array with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArrayStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0002
     * @tc.desc   Verify napi_create_array with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArrayMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0003
     * @tc.desc   Verify napi_create_array with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArrayMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0004
     * @tc.desc   Verify napi_create_array with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArrayRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0005
     * @tc.desc   Verify napi_create_array with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArrayWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0006
     * @tc.desc   Verify napi_create_array with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArrayWithLengthMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0007
     * @tc.desc   Verify napi_create_array_with_length with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayWithLengthMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayWithLengthMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayWithLengthMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArrayWithLengthMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0008
     * @tc.desc   Verify napi_create_array_with_length with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayWithLengthMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayWithLengthMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayWithLengthMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArrayWithLengthRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0009
     * @tc.desc   Verify napi_create_array_with_length with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayWithLengthRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayWithLengthRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayWithLengthRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArrayWithLengthWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0010
     * @tc.desc   Verify napi_create_array_with_length with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArrayWithLengthWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArrayWithLengthWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArrayWithLengthWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArrayLengthRetVal
     * @tc.number SUB_NAPI_NOCOV_ARR_0011
     * @tc.desc   Verify napi_get_array_length with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArrayLengthRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArrayLengthRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArrayLengthRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArrayLengthStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0012
     * @tc.desc   Verify napi_get_array_length with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArrayLengthStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArrayLengthStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArrayLengthStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArrayLengthMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0013
     * @tc.desc   Verify napi_get_array_length with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArrayLengthMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArrayLengthMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArrayLengthMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArrayLengthMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0014
     * @tc.desc   Verify napi_get_array_length with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArrayLengthMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArrayLengthMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArrayLengthMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArrayLengthRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0015
     * @tc.desc   Verify napi_get_array_length with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArrayLengthRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArrayLengthRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArrayLengthRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetArrayLengthWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0016
     * @tc.desc   Verify napi_get_array_length with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetArrayLengthWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetArrayLengthWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getArrayLengthWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArrayRetVal
     * @tc.number SUB_NAPI_NOCOV_ARR_0017
     * @tc.desc   Verify napi_is_array with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArrayRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArrayRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArrayRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArrayStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0018
     * @tc.desc   Verify napi_is_array with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArrayStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArrayStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArrayStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArrayMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0019
     * @tc.desc   Verify napi_is_array with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArrayMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArrayMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArrayMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArrayMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0020
     * @tc.desc   Verify napi_is_array with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArrayMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArrayMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArrayMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArrayRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0021
     * @tc.desc   Verify napi_is_array with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArrayRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArrayRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArrayRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsArrayWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0022
     * @tc.desc   Verify napi_is_array with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsArrayWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsArrayWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isArrayWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetElementStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0023
     * @tc.desc   Verify napi_set_element with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetElementStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetElementStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.setElementStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetElementMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0024
     * @tc.desc   Verify napi_set_element with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetElementMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetElementMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.setElementMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetElementMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0025
     * @tc.desc   Verify napi_set_element with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetElementMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetElementMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.setElementMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetElementRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0026
     * @tc.desc   Verify napi_set_element with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetElementRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetElementRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.setElementRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetElementWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0027
     * @tc.desc   Verify napi_set_element with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetElementWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetElementWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.setElementWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetElementStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0028
     * @tc.desc   Verify napi_get_element with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetElementStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetElementStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getElementStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetElementMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0029
     * @tc.desc   Verify napi_get_element with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetElementMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetElementMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getElementMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetElementMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0030
     * @tc.desc   Verify napi_get_element with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetElementMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetElementMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getElementMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetElementRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0031
     * @tc.desc   Verify napi_get_element with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetElementRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetElementRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getElementRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetElementWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0032
     * @tc.desc   Verify napi_get_element with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetElementWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetElementWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getElementWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasElementStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0033
     * @tc.desc   Verify napi_has_element with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasElementStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasElementStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasElementStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasElementMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0034
     * @tc.desc   Verify napi_has_element with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasElementMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasElementMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasElementMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasElementMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0035
     * @tc.desc   Verify napi_has_element with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasElementMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasElementMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasElementMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasElementRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0036
     * @tc.desc   Verify napi_has_element with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasElementRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasElementRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasElementRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasElementWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0037
     * @tc.desc   Verify napi_has_element with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasElementWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasElementWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasElementWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteElementStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0038
     * @tc.desc   Verify napi_delete_element with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteElementStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteElementStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteElementStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteElementMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0039
     * @tc.desc   Verify napi_delete_element with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteElementMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteElementMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteElementMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteElementMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0040
     * @tc.desc   Verify napi_delete_element with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteElementMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteElementMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteElementMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteElementRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0041
     * @tc.desc   Verify napi_delete_element with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteElementRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteElementRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteElementRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteElementWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0042
     * @tc.desc   Verify napi_delete_element with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteElementWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteElementWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteElementWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypedarrayStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0043
     * @tc.desc   Verify napi_create_typedarray with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypedarrayStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypedarrayStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypedarrayStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypedarrayMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0044
     * @tc.desc   Verify napi_create_typedarray with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypedarrayMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypedarrayMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypedarrayMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypedarrayMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0045
     * @tc.desc   Verify napi_create_typedarray with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypedarrayMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypedarrayMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypedarrayMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypedarrayRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0046
     * @tc.desc   Verify napi_create_typedarray with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypedarrayRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypedarrayRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypedarrayRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateTypedarrayWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0047
     * @tc.desc   Verify napi_create_typedarray with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateTypedarrayWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateTypedarrayWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createTypedarrayWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsTypedarrayStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0048
     * @tc.desc   Verify napi_is_typedarray with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsTypedarrayStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsTypedarrayStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isTypedarrayStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsTypedarrayMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0049
     * @tc.desc   Verify napi_is_typedarray with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsTypedarrayMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsTypedarrayMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isTypedarrayMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsTypedarrayMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0050
     * @tc.desc   Verify napi_is_typedarray with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsTypedarrayMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsTypedarrayMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isTypedarrayMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsTypedarrayWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0051
     * @tc.desc   Verify napi_is_typedarray with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsTypedarrayWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsTypedarrayWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isTypedarrayWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetTypedarrayInfoStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0052
     * @tc.desc   Verify napi_get_typedarray_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTypedarrayInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetTypedarrayInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getTypedarrayInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetTypedarrayInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0053
     * @tc.desc   Verify napi_get_typedarray_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTypedarrayInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetTypedarrayInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getTypedarrayInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetTypedarrayInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0054
     * @tc.desc   Verify napi_get_typedarray_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTypedarrayInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetTypedarrayInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getTypedarrayInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetTypedarrayInfoWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0055
     * @tc.desc   Verify napi_get_typedarray_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetTypedarrayInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetTypedarrayInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getTypedarrayInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDataviewStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0056
     * @tc.desc   Verify napi_create_dataview with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDataviewStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDataviewStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDataviewStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDataviewMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0057
     * @tc.desc   Verify napi_create_dataview with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDataviewMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDataviewMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDataviewMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDataviewMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0058
     * @tc.desc   Verify napi_create_dataview with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDataviewMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDataviewMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDataviewMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDataviewRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0059
     * @tc.desc   Verify napi_create_dataview with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDataviewRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDataviewRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDataviewRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateDataviewWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0060
     * @tc.desc   Verify napi_create_dataview with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateDataviewWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateDataviewWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createDataviewWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDataviewStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0061
     * @tc.desc   Verify napi_is_dataview with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDataviewStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDataviewStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDataviewStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDataviewMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0062
     * @tc.desc   Verify napi_is_dataview with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDataviewMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDataviewMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDataviewMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDataviewMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0063
     * @tc.desc   Verify napi_is_dataview with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDataviewMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDataviewMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDataviewMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDataviewRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0064
     * @tc.desc   Verify napi_is_dataview with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDataviewRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDataviewRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDataviewRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsDataviewWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0065
     * @tc.desc   Verify napi_is_dataview with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsDataviewWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsDataviewWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isDataviewWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDataviewInfoStable
     * @tc.number SUB_NAPI_NOCOV_ARR_0066
     * @tc.desc   Verify napi_get_dataview_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDataviewInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDataviewInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDataviewInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDataviewInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_ARR_0067
     * @tc.desc   Verify napi_get_dataview_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDataviewInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDataviewInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDataviewInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDataviewInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ARR_0068
     * @tc.desc   Verify napi_get_dataview_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDataviewInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDataviewInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDataviewInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDataviewInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_ARR_0069
     * @tc.desc   Verify napi_get_dataview_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDataviewInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDataviewInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDataviewInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetDataviewInfoWorker
     * @tc.number SUB_NAPI_NOCOV_ARR_0070
     * @tc.desc   Verify napi_get_dataview_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetDataviewInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetDataviewInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getDataviewInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}