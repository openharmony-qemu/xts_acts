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
import testNapi from 'libnapiCovFastObj.so';

export default function napiCovFastObjTest() {
  describe('ActsNapiCovFastObjTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateObjectWithPropertiesStable
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0001
     * @tc.desc   Verify napi_create_object_with_properties with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithPropertiesStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithPropertiesStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithPropertiesStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithPropertiesMultiThread
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0002
     * @tc.desc   Verify napi_create_object_with_properties with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithPropertiesMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithPropertiesMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithPropertiesMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithPropertiesMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0003
     * @tc.desc   Verify napi_create_object_with_properties with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithPropertiesMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithPropertiesMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithPropertiesMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithPropertiesRuntime
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0004
     * @tc.desc   Verify napi_create_object_with_properties with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithPropertiesRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithPropertiesRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithPropertiesRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithPropertiesWorker
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0005
     * @tc.desc   Verify napi_create_object_with_properties with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithPropertiesWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithPropertiesWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithPropertiesWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithNamedPropertiesRetVal
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0006
     * @tc.desc   Verify napi_create_object_with_named_properties with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithNamedPropertiesRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithNamedPropertiesRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithNamedPropertiesRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithNamedPropertiesStable
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0007
     * @tc.desc   Verify napi_create_object_with_named_properties with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithNamedPropertiesStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithNamedPropertiesStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithNamedPropertiesStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithNamedPropertiesMultiThread
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0008
     * @tc.desc   Verify napi_create_object_with_named_properties with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithNamedPropertiesMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithNamedPropertiesMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithNamedPropertiesMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithNamedPropertiesMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0009
     * @tc.desc   Verify napi_create_object_with_named_properties with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithNamedPropertiesMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithNamedPropertiesMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithNamedPropertiesMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithNamedPropertiesRuntime
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0010
     * @tc.desc   Verify napi_create_object_with_named_properties with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithNamedPropertiesRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithNamedPropertiesRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithNamedPropertiesRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateObjectWithNamedPropertiesWorker
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0011
     * @tc.desc   Verify napi_create_object_with_named_properties with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateObjectWithNamedPropertiesWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateObjectWithNamedPropertiesWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createObjectWithNamedPropertiesWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNativeBindingObjectAbnormal
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0012
     * @tc.desc   Verify napi_coerce_to_native_binding_object with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNativeBindingObjectAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNativeBindingObjectAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNativeBindingObjectAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNativeBindingObjectRetVal
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0013
     * @tc.desc   Verify napi_coerce_to_native_binding_object with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNativeBindingObjectRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNativeBindingObjectRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNativeBindingObjectRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNativeBindingObjectStable
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0014
     * @tc.desc   Verify napi_coerce_to_native_binding_object with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNativeBindingObjectStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNativeBindingObjectStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNativeBindingObjectStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNativeBindingObjectMultiThread
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0015
     * @tc.desc   Verify napi_coerce_to_native_binding_object with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNativeBindingObjectMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNativeBindingObjectMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNativeBindingObjectMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNativeBindingObjectMultiCtx
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0016
     * @tc.desc   Verify napi_coerce_to_native_binding_object with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNativeBindingObjectMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNativeBindingObjectMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNativeBindingObjectMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNativeBindingObjectRuntime
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0017
     * @tc.desc   Verify napi_coerce_to_native_binding_object with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNativeBindingObjectRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNativeBindingObjectRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNativeBindingObjectRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCoerceToNativeBindingObjectWorker
     * @tc.number SUB_NAPI_NOCOV_FOBJ_0018
     * @tc.desc   Verify napi_coerce_to_native_binding_object with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCoerceToNativeBindingObjectWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCoerceToNativeBindingObjectWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.coerceToNativeBindingObjectWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}