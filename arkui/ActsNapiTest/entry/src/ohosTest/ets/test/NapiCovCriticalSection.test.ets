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
import testNapi from 'libnapiCovCriticalSection.so';

export default function napiCovCriticalSectionTest() {
  describe('ActsNapiCovCriticalSectionTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testOpenCriticalScopeStable
     * @tc.number SUB_NAPI_NOCOV_CRI_0001
     * @tc.desc   Verify napi_open_critical_scope with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCriticalScopeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCriticalScopeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCriticalScopeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCriticalScopeMultiThread
     * @tc.number SUB_NAPI_NOCOV_CRI_0002
     * @tc.desc   Verify napi_open_critical_scope with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCriticalScopeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCriticalScopeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCriticalScopeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCriticalScopeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CRI_0003
     * @tc.desc   Verify napi_open_critical_scope with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCriticalScopeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCriticalScopeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCriticalScopeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCriticalScopeRuntime
     * @tc.number SUB_NAPI_NOCOV_CRI_0004
     * @tc.desc   Verify napi_open_critical_scope with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCriticalScopeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCriticalScopeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCriticalScopeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenCriticalScopeWorker
     * @tc.number SUB_NAPI_NOCOV_CRI_0005
     * @tc.desc   Verify napi_open_critical_scope with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenCriticalScopeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenCriticalScopeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.openCriticalScopeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCriticalScopeStable
     * @tc.number SUB_NAPI_NOCOV_CRI_0006
     * @tc.desc   Verify napi_close_critical_scope with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCriticalScopeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCriticalScopeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCriticalScopeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCriticalScopeMultiThread
     * @tc.number SUB_NAPI_NOCOV_CRI_0007
     * @tc.desc   Verify napi_close_critical_scope with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCriticalScopeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCriticalScopeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCriticalScopeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCriticalScopeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CRI_0008
     * @tc.desc   Verify napi_close_critical_scope with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCriticalScopeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCriticalScopeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCriticalScopeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCriticalScopeRuntime
     * @tc.number SUB_NAPI_NOCOV_CRI_0009
     * @tc.desc   Verify napi_close_critical_scope with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCriticalScopeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCriticalScopeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCriticalScopeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseCriticalScopeWorker
     * @tc.number SUB_NAPI_NOCOV_CRI_0010
     * @tc.desc   Verify napi_close_critical_scope with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseCriticalScopeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseCriticalScopeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeCriticalScopeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferStringUtf16InCriticalScopeStable
     * @tc.number SUB_NAPI_NOCOV_CRI_0011
     * @tc.desc   Verify napi_get_buffer_string_utf16_in_critical_scope with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferStringUtf16InCriticalScopeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferStringUtf16InCriticalScopeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferStringUtf16InCriticalScopeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferStringUtf16InCriticalScopeMultiThread
     * @tc.number SUB_NAPI_NOCOV_CRI_0012
     * @tc.desc   Verify napi_get_buffer_string_utf16_in_critical_scope with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferStringUtf16InCriticalScopeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferStringUtf16InCriticalScopeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferStringUtf16InCriticalScopeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferStringUtf16InCriticalScopeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CRI_0013
     * @tc.desc   Verify napi_get_buffer_string_utf16_in_critical_scope with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferStringUtf16InCriticalScopeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferStringUtf16InCriticalScopeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferStringUtf16InCriticalScopeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferStringUtf16InCriticalScopeRuntime
     * @tc.number SUB_NAPI_NOCOV_CRI_0014
     * @tc.desc   Verify napi_get_buffer_string_utf16_in_critical_scope with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferStringUtf16InCriticalScopeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferStringUtf16InCriticalScopeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferStringUtf16InCriticalScopeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferStringUtf16InCriticalScopeWorker
     * @tc.number SUB_NAPI_NOCOV_CRI_0015
     * @tc.desc   Verify napi_get_buffer_string_utf16_in_critical_scope with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferStringUtf16InCriticalScopeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferStringUtf16InCriticalScopeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferStringUtf16InCriticalScopeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}