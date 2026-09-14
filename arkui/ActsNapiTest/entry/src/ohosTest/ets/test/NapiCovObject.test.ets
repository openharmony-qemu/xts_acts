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
import testNapi from 'libnapiCovObject.so';

export default function napiCovObjectTest() {
  describe('ActsNapiCovObjectTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateObjectStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0001
     * @tc.desc   Verify napi_create_object with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0002
     * @tc.desc   Verify napi_create_object with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0003
     * @tc.desc   Verify napi_create_object with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0004
     * @tc.desc   Verify napi_create_object with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0005
     * @tc.desc   Verify napi_create_object with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPrototypeAbnormal
     * @tc.number SUB_NAPI_NOCOV_OBJ_0006
     * @tc.desc   Verify napi_get_prototype with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPrototypeAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPrototypeAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPrototypeAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPrototypeRetVal
     * @tc.number SUB_NAPI_NOCOV_OBJ_0007
     * @tc.desc   Verify napi_get_prototype with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPrototypeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPrototypeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPrototypeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPrototypeStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0008
     * @tc.desc   Verify napi_get_prototype with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPrototypeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPrototypeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPrototypeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPrototypeMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0009
     * @tc.desc   Verify napi_get_prototype with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPrototypeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPrototypeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPrototypeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPrototypeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0010
     * @tc.desc   Verify napi_get_prototype with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPrototypeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPrototypeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPrototypeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPrototypeRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0011
     * @tc.desc   Verify napi_get_prototype with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPrototypeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPrototypeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPrototypeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPrototypeWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0012
     * @tc.desc   Verify napi_get_prototype with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPrototypeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPrototypeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPrototypeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectFreezeStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0013
     * @tc.desc   Verify napi_object_freeze with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectFreezeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectFreezeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectFreezeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectFreezeMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0014
     * @tc.desc   Verify napi_object_freeze with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectFreezeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectFreezeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectFreezeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectFreezeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0015
     * @tc.desc   Verify napi_object_freeze with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectFreezeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectFreezeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectFreezeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectFreezeRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0016
     * @tc.desc   Verify napi_object_freeze with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectFreezeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectFreezeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectFreezeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectFreezeWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0017
     * @tc.desc   Verify napi_object_freeze with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectFreezeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectFreezeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectFreezeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectSealStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0018
     * @tc.desc   Verify napi_object_seal with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectSealStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectSealStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectSealStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectSealMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0019
     * @tc.desc   Verify napi_object_seal with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectSealMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectSealMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectSealMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectSealMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0020
     * @tc.desc   Verify napi_object_seal with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectSealMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectSealMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectSealMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectSealRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0021
     * @tc.desc   Verify napi_object_seal with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectSealRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectSealRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectSealRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testObjectSealWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0022
     * @tc.desc   Verify napi_object_seal with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testObjectSealWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testObjectSealWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.objectSealWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeofStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0023
     * @tc.desc   Verify napi_typeof with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeofStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeofStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeofStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeofMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0024
     * @tc.desc   Verify napi_typeof with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeofMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeofMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeofMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeofMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0025
     * @tc.desc   Verify napi_typeof with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeofMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeofMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeofMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeofRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0026
     * @tc.desc   Verify napi_typeof with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeofRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeofRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeofRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeofWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0027
     * @tc.desc   Verify napi_typeof with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeofWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeofWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeofWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testInstanceofStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0028
     * @tc.desc   Verify napi_instanceof with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInstanceofStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testInstanceofStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.instanceofStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testInstanceofMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0029
     * @tc.desc   Verify napi_instanceof with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInstanceofMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testInstanceofMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.instanceofMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testInstanceofMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0030
     * @tc.desc   Verify napi_instanceof with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInstanceofMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testInstanceofMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.instanceofMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testInstanceofRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0031
     * @tc.desc   Verify napi_instanceof with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInstanceofRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testInstanceofRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.instanceofRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testInstanceofWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0032
     * @tc.desc   Verify napi_instanceof with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInstanceofWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testInstanceofWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.instanceofWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeTagObjectStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0033
     * @tc.desc   Verify napi_type_tag_object with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeTagObjectStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeTagObjectStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeTagObjectStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeTagObjectMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0034
     * @tc.desc   Verify napi_type_tag_object with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeTagObjectMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeTagObjectMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeTagObjectMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeTagObjectMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0035
     * @tc.desc   Verify napi_type_tag_object with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeTagObjectMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeTagObjectMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeTagObjectMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeTagObjectRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0036
     * @tc.desc   Verify napi_type_tag_object with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeTagObjectRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeTagObjectRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeTagObjectRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testTypeTagObjectWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0037
     * @tc.desc   Verify napi_type_tag_object with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTypeTagObjectWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testTypeTagObjectWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.typeTagObjectWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCheckObjectTypeTagStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0038
     * @tc.desc   Verify napi_check_object_type_tag with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckObjectTypeTagStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCheckObjectTypeTagStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.checkObjectTypeTagStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCheckObjectTypeTagMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0039
     * @tc.desc   Verify napi_check_object_type_tag with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckObjectTypeTagMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCheckObjectTypeTagMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.checkObjectTypeTagMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCheckObjectTypeTagMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0040
     * @tc.desc   Verify napi_check_object_type_tag with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckObjectTypeTagMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCheckObjectTypeTagMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.checkObjectTypeTagMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCheckObjectTypeTagRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0041
     * @tc.desc   Verify napi_check_object_type_tag with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckObjectTypeTagRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCheckObjectTypeTagRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.checkObjectTypeTagRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCheckObjectTypeTagWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0042
     * @tc.desc   Verify napi_check_object_type_tag with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCheckObjectTypeTagWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCheckObjectTypeTagWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.checkObjectTypeTagWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSymbolStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0043
     * @tc.desc   Verify napi_create_symbol with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSymbolStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSymbolStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSymbolStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSymbolMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0044
     * @tc.desc   Verify napi_create_symbol with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSymbolMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSymbolMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSymbolMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSymbolMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0045
     * @tc.desc   Verify napi_create_symbol with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSymbolMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSymbolMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSymbolMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSymbolRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0046
     * @tc.desc   Verify napi_create_symbol with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSymbolRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSymbolRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSymbolRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateSymbolWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0047
     * @tc.desc   Verify napi_create_symbol with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateSymbolWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateSymbolWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createSymbolWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0048
     * @tc.desc   Verify napi_create_external with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0049
     * @tc.desc   Verify napi_create_external with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0050
     * @tc.desc   Verify napi_create_external with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0051
     * @tc.desc   Verify napi_create_external with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0052
     * @tc.desc   Verify napi_create_external with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueExternalStable
     * @tc.number SUB_NAPI_NOCOV_OBJ_0053
     * @tc.desc   Verify napi_get_value_external with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueExternalStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueExternalStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueExternalStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueExternalMultiThread
     * @tc.number SUB_NAPI_NOCOV_OBJ_0054
     * @tc.desc   Verify napi_get_value_external with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueExternalMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueExternalMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueExternalMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueExternalMultiCtx
     * @tc.number SUB_NAPI_NOCOV_OBJ_0055
     * @tc.desc   Verify napi_get_value_external with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueExternalMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueExternalMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueExternalMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueExternalRuntime
     * @tc.number SUB_NAPI_NOCOV_OBJ_0056
     * @tc.desc   Verify napi_get_value_external with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueExternalRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueExternalRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueExternalRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetValueExternalWorker
     * @tc.number SUB_NAPI_NOCOV_OBJ_0057
     * @tc.desc   Verify napi_get_value_external with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetValueExternalWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetValueExternalWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getValueExternalWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}