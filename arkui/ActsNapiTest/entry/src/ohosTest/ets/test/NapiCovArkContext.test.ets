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
import testNapi from 'libnapiCovArkContext.so';

export default function napiCovArkContextTest() {
  describe('ActsNapiCovArkContextTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateArkContextAbnormal
     * @tc.number SUB_NAPI_NOCOV_CTX_0001
     * @tc.desc   Verify napi_create_ark_context with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArkContextAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArkContextAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArkContextAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArkContextRetVal
     * @tc.number SUB_NAPI_NOCOV_CTX_0002
     * @tc.desc   Verify napi_create_ark_context with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArkContextRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArkContextRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArkContextRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArkContextStable
     * @tc.number SUB_NAPI_NOCOV_CTX_0003
     * @tc.desc   Verify napi_create_ark_context with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArkContextStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArkContextStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArkContextStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArkContextWorker
     * @tc.number SUB_NAPI_NOCOV_CTX_0005
     * @tc.desc   Verify napi_create_ark_context with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArkContextWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArkContextWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArkContextWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSwitchArkContextAbnormal
     * @tc.number SUB_NAPI_NOCOV_CTX_0006
     * @tc.desc   Verify napi_switch_ark_context with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwitchArkContextAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSwitchArkContextAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.switchArkContextAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSwitchArkContextRetVal
     * @tc.number SUB_NAPI_NOCOV_CTX_0007
     * @tc.desc   Verify napi_switch_ark_context with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwitchArkContextRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSwitchArkContextRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.switchArkContextRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSwitchArkContextStable
     * @tc.number SUB_NAPI_NOCOV_CTX_0008
     * @tc.desc   Verify napi_switch_ark_context with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwitchArkContextStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSwitchArkContextStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.switchArkContextStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSwitchArkContextMultiThread
     * @tc.number SUB_NAPI_NOCOV_CTX_0009
     * @tc.desc   Verify napi_switch_ark_context with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwitchArkContextMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSwitchArkContextMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.switchArkContextMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSwitchArkContextWorker
     * @tc.number SUB_NAPI_NOCOV_CTX_0011
     * @tc.desc   Verify napi_switch_ark_context with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSwitchArkContextWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSwitchArkContextWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.switchArkContextWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkContextNormal
     * @tc.number SUB_NAPI_NOCOV_CTX_0012
     * @tc.desc   Verify napi_destroy_ark_context with normal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkContextNormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkContextNormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkContextNormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkContextAbnormal
     * @tc.number SUB_NAPI_NOCOV_CTX_0013
     * @tc.desc   Verify napi_destroy_ark_context with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkContextAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkContextAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkContextAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkContextRetVal
     * @tc.number SUB_NAPI_NOCOV_CTX_0014
     * @tc.desc   Verify napi_destroy_ark_context with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkContextRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkContextRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkContextRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkContextStable
     * @tc.number SUB_NAPI_NOCOV_CTX_0015
     * @tc.desc   Verify napi_destroy_ark_context with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkContextStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkContextStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkContextStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkContextMultiThread
     * @tc.number SUB_NAPI_NOCOV_CTX_0016
     * @tc.desc   Verify napi_destroy_ark_context with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkContextMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkContextMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkContextMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkContextWorker
     * @tc.number SUB_NAPI_NOCOV_CTX_0018
     * @tc.desc   Verify napi_destroy_ark_context with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkContextWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkContextWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkContextWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}