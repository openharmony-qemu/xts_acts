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
import testNapi from 'libnapiCovProperty.so';

export default function napiCovPropertyTest() {
  describe('ActsNapiCovPropertyTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testGetPropertyNamesStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0001
     * @tc.desc   Verify napi_get_property_names with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyNamesStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyNamesStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyNamesStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyNamesMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0002
     * @tc.desc   Verify napi_get_property_names with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyNamesMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyNamesMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyNamesMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyNamesMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0003
     * @tc.desc   Verify napi_get_property_names with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyNamesMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyNamesMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyNamesMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyNamesRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0004
     * @tc.desc   Verify napi_get_property_names with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyNamesRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyNamesRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyNamesRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyNamesWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0005
     * @tc.desc   Verify napi_get_property_names with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyNamesWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyNamesWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyNamesWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyAbnormal
     * @tc.number SUB_NAPI_NOCOV_PRP_0006
     * @tc.desc   Verify napi_set_property with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0007
     * @tc.desc   Verify napi_set_property with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0008
     * @tc.desc   Verify napi_set_property with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0009
     * @tc.desc   Verify napi_set_property with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0010
     * @tc.desc   Verify napi_set_property with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0011
     * @tc.desc   Verify napi_set_property with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0012
     * @tc.desc   Verify napi_get_property with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0013
     * @tc.desc   Verify napi_get_property with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0014
     * @tc.desc   Verify napi_get_property with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0015
     * @tc.desc   Verify napi_get_property with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0016
     * @tc.desc   Verify napi_get_property with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasPropertyAbnormal
     * @tc.number SUB_NAPI_NOCOV_PRP_0017
     * @tc.desc   Verify napi_has_property with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasPropertyAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasPropertyAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasPropertyAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasPropertyRetVal
     * @tc.number SUB_NAPI_NOCOV_PRP_0018
     * @tc.desc   Verify napi_has_property with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasPropertyRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasPropertyRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasPropertyRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasPropertyStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0019
     * @tc.desc   Verify napi_has_property with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasPropertyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasPropertyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasPropertyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasPropertyMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0020
     * @tc.desc   Verify napi_has_property with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasPropertyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasPropertyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasPropertyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasPropertyMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0021
     * @tc.desc   Verify napi_has_property with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasPropertyMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasPropertyMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasPropertyMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasPropertyRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0022
     * @tc.desc   Verify napi_has_property with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasPropertyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasPropertyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasPropertyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasPropertyWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0023
     * @tc.desc   Verify napi_has_property with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasPropertyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasPropertyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasPropertyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeletePropertyAbnormal
     * @tc.number SUB_NAPI_NOCOV_PRP_0024
     * @tc.desc   Verify napi_delete_property with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeletePropertyAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeletePropertyAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deletePropertyAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeletePropertyRetVal
     * @tc.number SUB_NAPI_NOCOV_PRP_0025
     * @tc.desc   Verify napi_delete_property with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeletePropertyRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeletePropertyRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deletePropertyRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeletePropertyStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0026
     * @tc.desc   Verify napi_delete_property with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeletePropertyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeletePropertyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.deletePropertyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeletePropertyMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0027
     * @tc.desc   Verify napi_delete_property with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeletePropertyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeletePropertyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.deletePropertyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeletePropertyMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0028
     * @tc.desc   Verify napi_delete_property with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeletePropertyMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeletePropertyMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.deletePropertyMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeletePropertyRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0029
     * @tc.desc   Verify napi_delete_property with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeletePropertyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeletePropertyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.deletePropertyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeletePropertyWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0030
     * @tc.desc   Verify napi_delete_property with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeletePropertyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeletePropertyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.deletePropertyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasOwnPropertyRetVal
     * @tc.number SUB_NAPI_NOCOV_PRP_0031
     * @tc.desc   Verify napi_has_own_property with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasOwnPropertyRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasOwnPropertyRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasOwnPropertyRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasOwnPropertyStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0032
     * @tc.desc   Verify napi_has_own_property with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasOwnPropertyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasOwnPropertyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasOwnPropertyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasOwnPropertyMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0033
     * @tc.desc   Verify napi_has_own_property with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasOwnPropertyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasOwnPropertyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasOwnPropertyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasOwnPropertyMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0034
     * @tc.desc   Verify napi_has_own_property with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasOwnPropertyMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasOwnPropertyMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasOwnPropertyMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasOwnPropertyRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0035
     * @tc.desc   Verify napi_has_own_property with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasOwnPropertyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasOwnPropertyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasOwnPropertyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasOwnPropertyWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0036
     * @tc.desc   Verify napi_has_own_property with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasOwnPropertyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasOwnPropertyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasOwnPropertyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetNamedPropertyAbnormal
     * @tc.number SUB_NAPI_NOCOV_PRP_0037
     * @tc.desc   Verify napi_set_named_property with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNamedPropertyAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetNamedPropertyAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.setNamedPropertyAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetNamedPropertyRetVal
     * @tc.number SUB_NAPI_NOCOV_PRP_0038
     * @tc.desc   Verify napi_set_named_property with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNamedPropertyRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetNamedPropertyRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.setNamedPropertyRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetNamedPropertyStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0039
     * @tc.desc   Verify napi_set_named_property with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNamedPropertyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetNamedPropertyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.setNamedPropertyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetNamedPropertyMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0040
     * @tc.desc   Verify napi_set_named_property with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNamedPropertyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetNamedPropertyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.setNamedPropertyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetNamedPropertyMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0041
     * @tc.desc   Verify napi_set_named_property with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNamedPropertyMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetNamedPropertyMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.setNamedPropertyMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetNamedPropertyRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0042
     * @tc.desc   Verify napi_set_named_property with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNamedPropertyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetNamedPropertyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.setNamedPropertyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetNamedPropertyWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0043
     * @tc.desc   Verify napi_set_named_property with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetNamedPropertyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetNamedPropertyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.setNamedPropertyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNamedPropertyStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0044
     * @tc.desc   Verify napi_get_named_property with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNamedPropertyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNamedPropertyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNamedPropertyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNamedPropertyMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0045
     * @tc.desc   Verify napi_get_named_property with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNamedPropertyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNamedPropertyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNamedPropertyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNamedPropertyMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0046
     * @tc.desc   Verify napi_get_named_property with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNamedPropertyMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNamedPropertyMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNamedPropertyMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNamedPropertyRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0047
     * @tc.desc   Verify napi_get_named_property with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNamedPropertyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNamedPropertyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNamedPropertyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNamedPropertyWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0048
     * @tc.desc   Verify napi_get_named_property with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNamedPropertyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNamedPropertyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNamedPropertyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasNamedPropertyRetVal
     * @tc.number SUB_NAPI_NOCOV_PRP_0049
     * @tc.desc   Verify napi_has_named_property with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasNamedPropertyRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasNamedPropertyRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasNamedPropertyRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasNamedPropertyStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0050
     * @tc.desc   Verify napi_has_named_property with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasNamedPropertyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasNamedPropertyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasNamedPropertyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasNamedPropertyMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0051
     * @tc.desc   Verify napi_has_named_property with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasNamedPropertyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasNamedPropertyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasNamedPropertyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasNamedPropertyMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0052
     * @tc.desc   Verify napi_has_named_property with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasNamedPropertyMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasNamedPropertyMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasNamedPropertyMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasNamedPropertyRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0053
     * @tc.desc   Verify napi_has_named_property with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasNamedPropertyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasNamedPropertyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasNamedPropertyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testHasNamedPropertyWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0054
     * @tc.desc   Verify napi_has_named_property with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHasNamedPropertyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testHasNamedPropertyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.hasNamedPropertyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefinePropertiesStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0055
     * @tc.desc   Verify napi_define_properties with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefinePropertiesStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefinePropertiesStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.definePropertiesStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefinePropertiesMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0056
     * @tc.desc   Verify napi_define_properties with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefinePropertiesMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefinePropertiesMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.definePropertiesMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefinePropertiesMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0057
     * @tc.desc   Verify napi_define_properties with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefinePropertiesMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefinePropertiesMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.definePropertiesMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefinePropertiesRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0058
     * @tc.desc   Verify napi_define_properties with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefinePropertiesRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefinePropertiesRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.definePropertiesRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefinePropertiesWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0059
     * @tc.desc   Verify napi_define_properties with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefinePropertiesWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefinePropertiesWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.definePropertiesWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAllPropertyNamesAbnormal
     * @tc.number SUB_NAPI_NOCOV_PRP_0060
     * @tc.desc   Verify napi_get_all_property_names with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllPropertyNamesAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAllPropertyNamesAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAllPropertyNamesAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAllPropertyNamesRetVal
     * @tc.number SUB_NAPI_NOCOV_PRP_0061
     * @tc.desc   Verify napi_get_all_property_names with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllPropertyNamesRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAllPropertyNamesRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAllPropertyNamesRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAllPropertyNamesStable
     * @tc.number SUB_NAPI_NOCOV_PRP_0062
     * @tc.desc   Verify napi_get_all_property_names with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllPropertyNamesStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAllPropertyNamesStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAllPropertyNamesStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAllPropertyNamesMultiThread
     * @tc.number SUB_NAPI_NOCOV_PRP_0063
     * @tc.desc   Verify napi_get_all_property_names with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllPropertyNamesMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAllPropertyNamesMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAllPropertyNamesMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAllPropertyNamesMultiCtx
     * @tc.number SUB_NAPI_NOCOV_PRP_0064
     * @tc.desc   Verify napi_get_all_property_names with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllPropertyNamesMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAllPropertyNamesMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAllPropertyNamesMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAllPropertyNamesRuntime
     * @tc.number SUB_NAPI_NOCOV_PRP_0065
     * @tc.desc   Verify napi_get_all_property_names with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllPropertyNamesRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAllPropertyNamesRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAllPropertyNamesRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetAllPropertyNamesWorker
     * @tc.number SUB_NAPI_NOCOV_PRP_0066
     * @tc.desc   Verify napi_get_all_property_names with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetAllPropertyNamesWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetAllPropertyNamesWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getAllPropertyNamesWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}