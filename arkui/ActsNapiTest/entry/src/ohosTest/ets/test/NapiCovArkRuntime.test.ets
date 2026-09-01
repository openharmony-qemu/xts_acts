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
import testNapi from 'libnapiCovArkRuntime.so';

export default function napiCovArkRuntimeTest() {
  describe('ActsNapiCovArkRuntimeTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateArkRuntimeAbnormal
     * @tc.number SUB_NAPI_NOCOV_RUN_0001
     * @tc.desc   Verify napi_create_ark_runtime with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArkRuntimeAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArkRuntimeAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArkRuntimeAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArkRuntimeRetVal
     * @tc.number SUB_NAPI_NOCOV_RUN_0002
     * @tc.desc   Verify napi_create_ark_runtime with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArkRuntimeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArkRuntimeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArkRuntimeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArkRuntimeStable
     * @tc.number SUB_NAPI_NOCOV_RUN_0003
     * @tc.desc   Verify napi_create_ark_runtime with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArkRuntimeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArkRuntimeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArkRuntimeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArkRuntimeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_RUN_0004
     * @tc.desc   Verify napi_create_ark_runtime with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArkRuntimeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArkRuntimeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArkRuntimeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateArkRuntimeWorker
     * @tc.number SUB_NAPI_NOCOV_RUN_0005
     * @tc.desc   Verify napi_create_ark_runtime with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateArkRuntimeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateArkRuntimeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createArkRuntimeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkRuntimeAbnormal
     * @tc.number SUB_NAPI_NOCOV_RUN_0006
     * @tc.desc   Verify napi_destroy_ark_runtime with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkRuntimeAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkRuntimeAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkRuntimeAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkRuntimeRetVal
     * @tc.number SUB_NAPI_NOCOV_RUN_0007
     * @tc.desc   Verify napi_destroy_ark_runtime with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkRuntimeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkRuntimeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkRuntimeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkRuntimeStable
     * @tc.number SUB_NAPI_NOCOV_RUN_0008
     * @tc.desc   Verify napi_destroy_ark_runtime with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkRuntimeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkRuntimeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkRuntimeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkRuntimeMultiThread
     * @tc.number SUB_NAPI_NOCOV_RUN_0009
     * @tc.desc   Verify napi_destroy_ark_runtime with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkRuntimeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkRuntimeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkRuntimeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkRuntimeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_RUN_0010
     * @tc.desc   Verify napi_destroy_ark_runtime with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkRuntimeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkRuntimeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkRuntimeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDestroyArkRuntimeWorker
     * @tc.number SUB_NAPI_NOCOV_RUN_0011
     * @tc.desc   Verify napi_destroy_ark_runtime with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDestroyArkRuntimeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDestroyArkRuntimeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.destroyArkRuntimeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunEventLoopAbnormal
     * @tc.number SUB_NAPI_NOCOV_RUN_0012
     * @tc.desc   Verify napi_run_event_loop with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunEventLoopAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunEventLoopAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.runEventLoopAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunEventLoopRetVal
     * @tc.number SUB_NAPI_NOCOV_RUN_0013
     * @tc.desc   Verify napi_run_event_loop with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunEventLoopRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunEventLoopRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.runEventLoopRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunEventLoopStable
     * @tc.number SUB_NAPI_NOCOV_RUN_0014
     * @tc.desc   Verify napi_run_event_loop with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunEventLoopStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunEventLoopStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.runEventLoopStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunEventLoopMultiThread
     * @tc.number SUB_NAPI_NOCOV_RUN_0015
     * @tc.desc   Verify napi_run_event_loop with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunEventLoopMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunEventLoopMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.runEventLoopMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunEventLoopMultiCtx
     * @tc.number SUB_NAPI_NOCOV_RUN_0016
     * @tc.desc   Verify napi_run_event_loop with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunEventLoopMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunEventLoopMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.runEventLoopMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRunEventLoopWorker
     * @tc.number SUB_NAPI_NOCOV_RUN_0018
     * @tc.desc   Verify napi_run_event_loop with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRunEventLoopWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRunEventLoopWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.runEventLoopWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStopEventLoopAbnormal
     * @tc.number SUB_NAPI_NOCOV_RUN_0019
     * @tc.desc   Verify napi_stop_event_loop with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopEventLoopAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStopEventLoopAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.stopEventLoopAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStopEventLoopRetVal
     * @tc.number SUB_NAPI_NOCOV_RUN_0020
     * @tc.desc   Verify napi_stop_event_loop with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopEventLoopRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStopEventLoopRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.stopEventLoopRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStopEventLoopStable
     * @tc.number SUB_NAPI_NOCOV_RUN_0021
     * @tc.desc   Verify napi_stop_event_loop with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopEventLoopStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStopEventLoopStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.stopEventLoopStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStopEventLoopMultiThread
     * @tc.number SUB_NAPI_NOCOV_RUN_0022
     * @tc.desc   Verify napi_stop_event_loop with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopEventLoopMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStopEventLoopMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.stopEventLoopMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStopEventLoopMultiCtx
     * @tc.number SUB_NAPI_NOCOV_RUN_0023
     * @tc.desc   Verify napi_stop_event_loop with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopEventLoopMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStopEventLoopMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.stopEventLoopMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStopEventLoopRuntime
     * @tc.number SUB_NAPI_NOCOV_RUN_0024
     * @tc.desc   Verify napi_stop_event_loop with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopEventLoopRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStopEventLoopRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.stopEventLoopRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testStopEventLoopWorker
     * @tc.number SUB_NAPI_NOCOV_RUN_0025
     * @tc.desc   Verify napi_stop_event_loop with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStopEventLoopWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testStopEventLoopWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.stopEventLoopWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}