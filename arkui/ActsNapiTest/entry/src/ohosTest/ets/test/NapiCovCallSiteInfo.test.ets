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
import testNapi from 'libnapiCovCallSiteInfo.so';

export default function napiCovCallSiteInfoTest() {
  describe('ActsNapiCovCallSiteInfoTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateCallsiteInfoStable
     * @tc.number SUB_NAPI_NOCOV_CSI_0001
     * @tc.desc   Verify napi_create_callsite_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCallsiteInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateCallsiteInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createCallsiteInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateCallsiteInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_CSI_0002
     * @tc.desc   Verify napi_create_callsite_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCallsiteInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateCallsiteInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createCallsiteInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateCallsiteInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CSI_0003
     * @tc.desc   Verify napi_create_callsite_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCallsiteInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateCallsiteInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createCallsiteInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateCallsiteInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_CSI_0004
     * @tc.desc   Verify napi_create_callsite_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCallsiteInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateCallsiteInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createCallsiteInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateCallsiteInfoWorker
     * @tc.number SUB_NAPI_NOCOV_CSI_0005
     * @tc.desc   Verify napi_create_callsite_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateCallsiteInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateCallsiteInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createCallsiteInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteCallsiteInfoNormal
     * @tc.number SUB_NAPI_NOCOV_CSI_0006
     * @tc.desc   Verify napi_delete_callsite_info with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteCallsiteInfoNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteCallsiteInfoNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteCallsiteInfoNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteCallsiteInfoStable
     * @tc.number SUB_NAPI_NOCOV_CSI_0007
     * @tc.desc   Verify napi_delete_callsite_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteCallsiteInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteCallsiteInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteCallsiteInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteCallsiteInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_CSI_0008
     * @tc.desc   Verify napi_delete_callsite_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteCallsiteInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteCallsiteInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteCallsiteInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteCallsiteInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CSI_0009
     * @tc.desc   Verify napi_delete_callsite_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteCallsiteInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteCallsiteInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteCallsiteInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteCallsiteInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_CSI_0010
     * @tc.desc   Verify napi_delete_callsite_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteCallsiteInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteCallsiteInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteCallsiteInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteCallsiteInfoWorker
     * @tc.number SUB_NAPI_NOCOV_CSI_0011
     * @tc.desc   Verify napi_delete_callsite_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteCallsiteInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteCallsiteInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteCallsiteInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyWithCallsiteInfoStable
     * @tc.number SUB_NAPI_NOCOV_CSI_0012
     * @tc.desc   Verify napi_get_property_with_callsite_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyWithCallsiteInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyWithCallsiteInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyWithCallsiteInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyWithCallsiteInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_CSI_0013
     * @tc.desc   Verify napi_get_property_with_callsite_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyWithCallsiteInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyWithCallsiteInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyWithCallsiteInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyWithCallsiteInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CSI_0014
     * @tc.desc   Verify napi_get_property_with_callsite_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyWithCallsiteInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyWithCallsiteInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyWithCallsiteInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyWithCallsiteInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_CSI_0015
     * @tc.desc   Verify napi_get_property_with_callsite_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyWithCallsiteInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyWithCallsiteInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyWithCallsiteInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetPropertyWithCallsiteInfoWorker
     * @tc.number SUB_NAPI_NOCOV_CSI_0016
     * @tc.desc   Verify napi_get_property_with_callsite_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetPropertyWithCallsiteInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetPropertyWithCallsiteInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getPropertyWithCallsiteInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyWithCallsiteInfoRetVal
     * @tc.number SUB_NAPI_NOCOV_CSI_0017
     * @tc.desc   Verify napi_set_property_with_callsite_info with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyWithCallsiteInfoRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyWithCallsiteInfoRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyWithCallsiteInfoRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyWithCallsiteInfoStable
     * @tc.number SUB_NAPI_NOCOV_CSI_0018
     * @tc.desc   Verify napi_set_property_with_callsite_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyWithCallsiteInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyWithCallsiteInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyWithCallsiteInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyWithCallsiteInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_CSI_0019
     * @tc.desc   Verify napi_set_property_with_callsite_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyWithCallsiteInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyWithCallsiteInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyWithCallsiteInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyWithCallsiteInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CSI_0020
     * @tc.desc   Verify napi_set_property_with_callsite_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyWithCallsiteInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyWithCallsiteInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyWithCallsiteInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyWithCallsiteInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_CSI_0021
     * @tc.desc   Verify napi_set_property_with_callsite_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyWithCallsiteInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyWithCallsiteInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyWithCallsiteInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetPropertyWithCallsiteInfoWorker
     * @tc.number SUB_NAPI_NOCOV_CSI_0022
     * @tc.desc   Verify napi_set_property_with_callsite_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetPropertyWithCallsiteInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetPropertyWithCallsiteInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.setPropertyWithCallsiteInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}