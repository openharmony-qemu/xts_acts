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
import testNapi from 'libnapiCovCustomAsync.so';

export default function napiCovCustomAsyncTest() {
  describe('ActsNapiCovCustomAsyncTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testAsyncInitRetVal
     * @tc.number SUB_NAPI_NOCOV_CASY_0001
     * @tc.desc   Verify napi_async_init with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncInitRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncInitRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncInitRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAsyncInitStable
     * @tc.number SUB_NAPI_NOCOV_CASY_0002
     * @tc.desc   Verify napi_async_init with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncInitStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncInitStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncInitStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAsyncInitMultiThread
     * @tc.number SUB_NAPI_NOCOV_CASY_0003
     * @tc.desc   Verify napi_async_init with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncInitMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncInitMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncInitMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAsyncInitRuntime
     * @tc.number SUB_NAPI_NOCOV_CASY_0004
     * @tc.desc   Verify napi_async_init with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncInitRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncInitRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncInitRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAsyncInitWorker
     * @tc.number SUB_NAPI_NOCOV_CASY_0005
     * @tc.desc   Verify napi_async_init with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncInitWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncInitWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncInitWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAsyncDestroyRetVal
     * @tc.number SUB_NAPI_NOCOV_CASY_0006
     * @tc.desc   Verify napi_async_destroy with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncDestroyRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncDestroyRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncDestroyRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAsyncDestroyStable
     * @tc.number SUB_NAPI_NOCOV_CASY_0007
     * @tc.desc   Verify napi_async_destroy with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncDestroyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncDestroyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncDestroyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAsyncDestroyMultiThread
     * @tc.number SUB_NAPI_NOCOV_CASY_0008
     * @tc.desc   Verify napi_async_destroy with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncDestroyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncDestroyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncDestroyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAsyncDestroyRuntime
     * @tc.number SUB_NAPI_NOCOV_CASY_0009
     * @tc.desc   Verify napi_async_destroy with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncDestroyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncDestroyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncDestroyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAsyncDestroyWorker
     * @tc.number SUB_NAPI_NOCOV_CASY_0010
     * @tc.desc   Verify napi_async_destroy with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAsyncDestroyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAsyncDestroyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.asyncDestroyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMakeCallbackStable
     * @tc.number SUB_NAPI_NOCOV_CASY_0011
     * @tc.desc   Verify napi_make_callback with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeCallbackStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMakeCallbackStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.makeCallbackStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMakeCallbackMultiThread
     * @tc.number SUB_NAPI_NOCOV_CASY_0012
     * @tc.desc   Verify napi_make_callback with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeCallbackMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMakeCallbackMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.makeCallbackMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMakeCallbackRuntime
     * @tc.number SUB_NAPI_NOCOV_CASY_0013
     * @tc.desc   Verify napi_make_callback with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeCallbackRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMakeCallbackRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.makeCallbackRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMakeCallbackWorker
     * @tc.number SUB_NAPI_NOCOV_CASY_0014
     * @tc.desc   Verify napi_make_callback with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMakeCallbackWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMakeCallbackWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.makeCallbackWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCallbackScopeRetVal
     * @tc.number SUB_NAPI_NOCOV_CASY_0015
     * @tc.desc   Verify napi_open_callback_scope with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCallbackScopeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCallbackScopeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCallbackScopeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCallbackScopeStable
     * @tc.number SUB_NAPI_NOCOV_CASY_0016
     * @tc.desc   Verify napi_open_callback_scope with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCallbackScopeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCallbackScopeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCallbackScopeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCallbackScopeMultiThread
     * @tc.number SUB_NAPI_NOCOV_CASY_0017
     * @tc.desc   Verify napi_open_callback_scope with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCallbackScopeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCallbackScopeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCallbackScopeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCallbackScopeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CASY_0018
     * @tc.desc   Verify napi_open_callback_scope with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCallbackScopeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCallbackScopeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCallbackScopeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCallbackScopeRuntime
     * @tc.number SUB_NAPI_NOCOV_CASY_0019
     * @tc.desc   Verify napi_open_callback_scope with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCallbackScopeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCallbackScopeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCallbackScopeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCallbackScopeWorker
     * @tc.number SUB_NAPI_NOCOV_CASY_0020
     * @tc.desc   Verify napi_open_callback_scope with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCallbackScopeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCallbackScopeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCallbackScopeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCallbackScopeStable
     * @tc.number SUB_NAPI_NOCOV_CASY_0021
     * @tc.desc   Verify napi_close_callback_scope with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCallbackScopeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCallbackScopeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCallbackScopeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCallbackScopeMultiThread
     * @tc.number SUB_NAPI_NOCOV_CASY_0022
     * @tc.desc   Verify napi_close_callback_scope with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCallbackScopeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCallbackScopeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCallbackScopeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCallbackScopeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CASY_0023
     * @tc.desc   Verify napi_close_callback_scope with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCallbackScopeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCallbackScopeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCallbackScopeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCallbackScopeRuntime
     * @tc.number SUB_NAPI_NOCOV_CASY_0024
     * @tc.desc   Verify napi_close_callback_scope with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCallbackScopeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCallbackScopeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCallbackScopeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCallbackScopeWorker
     * @tc.number SUB_NAPI_NOCOV_CASY_0025
     * @tc.desc   Verify napi_close_callback_scope with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCallbackScopeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCallbackScopeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCallbackScopeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}