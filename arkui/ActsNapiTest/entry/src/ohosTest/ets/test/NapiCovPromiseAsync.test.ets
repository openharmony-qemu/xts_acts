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
import testNapi from 'libnapiCovPromiseAsync.so';

export default function napiCovPromiseAsyncTest() {
  describe('ActsNapiCovPromiseAsyncTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreatePromiseStable
     * @tc.number SUB_NAPI_NOCOV_ASY_0001
     * @tc.desc   Verify napi_create_promise with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePromiseStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreatePromiseStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createPromiseStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreatePromiseMultiThread
     * @tc.number SUB_NAPI_NOCOV_ASY_0002
     * @tc.desc   Verify napi_create_promise with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePromiseMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreatePromiseMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createPromiseMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreatePromiseMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ASY_0003
     * @tc.desc   Verify napi_create_promise with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePromiseMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreatePromiseMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createPromiseMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreatePromiseRuntime
     * @tc.number SUB_NAPI_NOCOV_ASY_0004
     * @tc.desc   Verify napi_create_promise with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePromiseRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreatePromiseRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createPromiseRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreatePromiseWorker
     * @tc.number SUB_NAPI_NOCOV_ASY_0005
     * @tc.desc   Verify napi_create_promise with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreatePromiseWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreatePromiseWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createPromiseWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testResolveDeferredStable
     * @tc.number SUB_NAPI_NOCOV_ASY_0006
     * @tc.desc   Verify napi_resolve_deferred with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResolveDeferredStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testResolveDeferredStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.resolveDeferredStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testResolveDeferredMultiThread
     * @tc.number SUB_NAPI_NOCOV_ASY_0007
     * @tc.desc   Verify napi_resolve_deferred with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResolveDeferredMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testResolveDeferredMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.resolveDeferredMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testResolveDeferredMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ASY_0008
     * @tc.desc   Verify napi_resolve_deferred with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResolveDeferredMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testResolveDeferredMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.resolveDeferredMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testResolveDeferredRuntime
     * @tc.number SUB_NAPI_NOCOV_ASY_0009
     * @tc.desc   Verify napi_resolve_deferred with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResolveDeferredRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testResolveDeferredRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.resolveDeferredRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testResolveDeferredWorker
     * @tc.number SUB_NAPI_NOCOV_ASY_0010
     * @tc.desc   Verify napi_resolve_deferred with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testResolveDeferredWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testResolveDeferredWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.resolveDeferredWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRejectDeferredRetVal
     * @tc.number SUB_NAPI_NOCOV_ASY_0011
     * @tc.desc   Verify napi_reject_deferred with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRejectDeferredRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRejectDeferredRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.rejectDeferredRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRejectDeferredStable
     * @tc.number SUB_NAPI_NOCOV_ASY_0012
     * @tc.desc   Verify napi_reject_deferred with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRejectDeferredStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRejectDeferredStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.rejectDeferredStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRejectDeferredMultiThread
     * @tc.number SUB_NAPI_NOCOV_ASY_0013
     * @tc.desc   Verify napi_reject_deferred with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRejectDeferredMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRejectDeferredMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.rejectDeferredMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRejectDeferredMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ASY_0014
     * @tc.desc   Verify napi_reject_deferred with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRejectDeferredMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRejectDeferredMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.rejectDeferredMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRejectDeferredRuntime
     * @tc.number SUB_NAPI_NOCOV_ASY_0015
     * @tc.desc   Verify napi_reject_deferred with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRejectDeferredRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRejectDeferredRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.rejectDeferredRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRejectDeferredWorker
     * @tc.number SUB_NAPI_NOCOV_ASY_0016
     * @tc.desc   Verify napi_reject_deferred with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRejectDeferredWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRejectDeferredWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.rejectDeferredWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsPromiseStable
     * @tc.number SUB_NAPI_NOCOV_ASY_0017
     * @tc.desc   Verify napi_is_promise with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromiseStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsPromiseStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isPromiseStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsPromiseMultiThread
     * @tc.number SUB_NAPI_NOCOV_ASY_0018
     * @tc.desc   Verify napi_is_promise with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromiseMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsPromiseMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isPromiseMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsPromiseMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ASY_0019
     * @tc.desc   Verify napi_is_promise with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromiseMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsPromiseMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isPromiseMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsPromiseRuntime
     * @tc.number SUB_NAPI_NOCOV_ASY_0020
     * @tc.desc   Verify napi_is_promise with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromiseRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsPromiseRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.isPromiseRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsPromiseWorker
     * @tc.number SUB_NAPI_NOCOV_ASY_0021
     * @tc.desc   Verify napi_is_promise with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsPromiseWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsPromiseWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isPromiseWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateAsyncWorkAbnormal
     * @tc.number SUB_NAPI_NOCOV_ASY_0022
     * @tc.desc   Verify napi_create_async_work with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateAsyncWorkRetVal
     * @tc.number SUB_NAPI_NOCOV_ASY_0023
     * @tc.desc   Verify napi_create_async_work with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateAsyncWorkStable
     * @tc.number SUB_NAPI_NOCOV_ASY_0024
     * @tc.desc   Verify napi_create_async_work with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateAsyncWorkMultiThread
     * @tc.number SUB_NAPI_NOCOV_ASY_0025
     * @tc.desc   Verify napi_create_async_work with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateAsyncWorkMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ASY_0026
     * @tc.desc   Verify napi_create_async_work with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateAsyncWorkRuntime
     * @tc.number SUB_NAPI_NOCOV_ASY_0027
     * @tc.desc   Verify napi_create_async_work with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateAsyncWorkWorker
     * @tc.number SUB_NAPI_NOCOV_ASY_0028
     * @tc.desc   Verify napi_create_async_work with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateAsyncWorkWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateAsyncWorkWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createAsyncWorkWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteAsyncWorkRetVal
     * @tc.number SUB_NAPI_NOCOV_ASY_0029
     * @tc.desc   Verify napi_delete_async_work with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteAsyncWorkRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteAsyncWorkRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteAsyncWorkRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteAsyncWorkStable
     * @tc.number SUB_NAPI_NOCOV_ASY_0030
     * @tc.desc   Verify napi_delete_async_work with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteAsyncWorkStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteAsyncWorkStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteAsyncWorkStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteAsyncWorkMultiThread
     * @tc.number SUB_NAPI_NOCOV_ASY_0031
     * @tc.desc   Verify napi_delete_async_work with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteAsyncWorkMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteAsyncWorkMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteAsyncWorkMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteAsyncWorkMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ASY_0032
     * @tc.desc   Verify napi_delete_async_work with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteAsyncWorkMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteAsyncWorkMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteAsyncWorkMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteAsyncWorkRuntime
     * @tc.number SUB_NAPI_NOCOV_ASY_0033
     * @tc.desc   Verify napi_delete_async_work with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteAsyncWorkRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteAsyncWorkRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteAsyncWorkRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteAsyncWorkWorker
     * @tc.number SUB_NAPI_NOCOV_ASY_0034
     * @tc.desc   Verify napi_delete_async_work with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteAsyncWorkWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteAsyncWorkWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteAsyncWorkWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkRetVal
     * @tc.number SUB_NAPI_NOCOV_ASY_0035
     * @tc.desc   Verify napi_queue_async_work with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkStable
     * @tc.number SUB_NAPI_NOCOV_ASY_0036
     * @tc.desc   Verify napi_queue_async_work with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkMultiThread
     * @tc.number SUB_NAPI_NOCOV_ASY_0037
     * @tc.desc   Verify napi_queue_async_work with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ASY_0038
     * @tc.desc   Verify napi_queue_async_work with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkRuntime
     * @tc.number SUB_NAPI_NOCOV_ASY_0039
     * @tc.desc   Verify napi_queue_async_work with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testQueueAsyncWorkWorker
     * @tc.number SUB_NAPI_NOCOV_ASY_0040
     * @tc.desc   Verify napi_queue_async_work with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testQueueAsyncWorkWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testQueueAsyncWorkWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.queueAsyncWorkWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}