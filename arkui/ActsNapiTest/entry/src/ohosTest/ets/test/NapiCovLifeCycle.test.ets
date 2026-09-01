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
import testNapi from 'libnapiCovLifeCycle.so';

export default function napiCovLifeCycleTest() {
  describe('ActsNapiCovLifeCycleTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testOpenHandleScopeStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0001
     * @tc.desc   Verify napi_open_handle_scope with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenHandleScopeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenHandleScopeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.openHandleScopeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenHandleScopeMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0002
     * @tc.desc   Verify napi_open_handle_scope with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenHandleScopeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenHandleScopeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.openHandleScopeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenHandleScopeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0003
     * @tc.desc   Verify napi_open_handle_scope with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenHandleScopeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenHandleScopeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.openHandleScopeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenHandleScopeRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0004
     * @tc.desc   Verify napi_open_handle_scope with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenHandleScopeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenHandleScopeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.openHandleScopeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenHandleScopeWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0005
     * @tc.desc   Verify napi_open_handle_scope with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenHandleScopeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenHandleScopeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.openHandleScopeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseHandleScopeRetVal
     * @tc.number SUB_NAPI_NOCOV_LFC_0006
     * @tc.desc   Verify napi_close_handle_scope with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseHandleScopeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseHandleScopeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeHandleScopeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseHandleScopeStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0007
     * @tc.desc   Verify napi_close_handle_scope with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseHandleScopeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseHandleScopeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeHandleScopeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseHandleScopeMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0008
     * @tc.desc   Verify napi_close_handle_scope with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseHandleScopeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseHandleScopeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeHandleScopeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseHandleScopeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0009
     * @tc.desc   Verify napi_close_handle_scope with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseHandleScopeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseHandleScopeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeHandleScopeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseHandleScopeRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0010
     * @tc.desc   Verify napi_close_handle_scope with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseHandleScopeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseHandleScopeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeHandleScopeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseHandleScopeWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0011
     * @tc.desc   Verify napi_close_handle_scope with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseHandleScopeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseHandleScopeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeHandleScopeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenEscapableHandleScopeRetVal
     * @tc.number SUB_NAPI_NOCOV_LFC_0012
     * @tc.desc   Verify napi_open_escapable_handle_scope with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenEscapableHandleScopeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenEscapableHandleScopeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.openEscapableHandleScopeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenEscapableHandleScopeStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0013
     * @tc.desc   Verify napi_open_escapable_handle_scope with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenEscapableHandleScopeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenEscapableHandleScopeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.openEscapableHandleScopeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenEscapableHandleScopeMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0014
     * @tc.desc   Verify napi_open_escapable_handle_scope with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenEscapableHandleScopeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenEscapableHandleScopeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.openEscapableHandleScopeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenEscapableHandleScopeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0015
     * @tc.desc   Verify napi_open_escapable_handle_scope with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenEscapableHandleScopeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenEscapableHandleScopeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.openEscapableHandleScopeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenEscapableHandleScopeRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0016
     * @tc.desc   Verify napi_open_escapable_handle_scope with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenEscapableHandleScopeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenEscapableHandleScopeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.openEscapableHandleScopeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testOpenEscapableHandleScopeWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0017
     * @tc.desc   Verify napi_open_escapable_handle_scope with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOpenEscapableHandleScopeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testOpenEscapableHandleScopeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.openEscapableHandleScopeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseEscapableHandleScopeAbnormal
     * @tc.number SUB_NAPI_NOCOV_LFC_0018
     * @tc.desc   Verify napi_close_escapable_handle_scope with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseEscapableHandleScopeAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseEscapableHandleScopeAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeEscapableHandleScopeAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseEscapableHandleScopeRetVal
     * @tc.number SUB_NAPI_NOCOV_LFC_0019
     * @tc.desc   Verify napi_close_escapable_handle_scope with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseEscapableHandleScopeRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseEscapableHandleScopeRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeEscapableHandleScopeRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseEscapableHandleScopeStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0020
     * @tc.desc   Verify napi_close_escapable_handle_scope with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseEscapableHandleScopeStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseEscapableHandleScopeStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeEscapableHandleScopeStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseEscapableHandleScopeMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0021
     * @tc.desc   Verify napi_close_escapable_handle_scope with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseEscapableHandleScopeMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseEscapableHandleScopeMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeEscapableHandleScopeMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseEscapableHandleScopeMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0022
     * @tc.desc   Verify napi_close_escapable_handle_scope with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseEscapableHandleScopeMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseEscapableHandleScopeMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeEscapableHandleScopeMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseEscapableHandleScopeRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0023
     * @tc.desc   Verify napi_close_escapable_handle_scope with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseEscapableHandleScopeRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseEscapableHandleScopeRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeEscapableHandleScopeRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCloseEscapableHandleScopeWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0024
     * @tc.desc   Verify napi_close_escapable_handle_scope with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCloseEscapableHandleScopeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCloseEscapableHandleScopeWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.closeEscapableHandleScopeWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testEscapeHandleRetVal
     * @tc.number SUB_NAPI_NOCOV_LFC_0025
     * @tc.desc   Verify napi_escape_handle with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEscapeHandleRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testEscapeHandleRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.escapeHandleRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testEscapeHandleStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0026
     * @tc.desc   Verify napi_escape_handle with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEscapeHandleStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testEscapeHandleStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.escapeHandleStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testEscapeHandleMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0027
     * @tc.desc   Verify napi_escape_handle with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEscapeHandleMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testEscapeHandleMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.escapeHandleMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testEscapeHandleMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0028
     * @tc.desc   Verify napi_escape_handle with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEscapeHandleMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testEscapeHandleMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.escapeHandleMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testEscapeHandleRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0029
     * @tc.desc   Verify napi_escape_handle with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEscapeHandleRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testEscapeHandleRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.escapeHandleRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testEscapeHandleWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0030
     * @tc.desc   Verify napi_escape_handle with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEscapeHandleWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testEscapeHandleWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.escapeHandleWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateReferenceStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0031
     * @tc.desc   Verify napi_create_reference with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateReferenceStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateReferenceStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createReferenceStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateReferenceMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0032
     * @tc.desc   Verify napi_create_reference with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateReferenceMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateReferenceMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createReferenceMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateReferenceMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0033
     * @tc.desc   Verify napi_create_reference with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateReferenceMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateReferenceMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createReferenceMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateReferenceRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0034
     * @tc.desc   Verify napi_create_reference with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateReferenceRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateReferenceRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createReferenceRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateReferenceWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0035
     * @tc.desc   Verify napi_create_reference with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateReferenceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateReferenceWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createReferenceWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteReferenceRetVal
     * @tc.number SUB_NAPI_NOCOV_LFC_0036
     * @tc.desc   Verify napi_delete_reference with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteReferenceRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteReferenceRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteReferenceRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteReferenceStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0037
     * @tc.desc   Verify napi_delete_reference with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteReferenceStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteReferenceStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteReferenceStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteReferenceMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0038
     * @tc.desc   Verify napi_delete_reference with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteReferenceMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteReferenceMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteReferenceMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteReferenceMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0039
     * @tc.desc   Verify napi_delete_reference with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteReferenceMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteReferenceMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteReferenceMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteReferenceRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0040
     * @tc.desc   Verify napi_delete_reference with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteReferenceRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteReferenceRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteReferenceRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDeleteReferenceWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0041
     * @tc.desc   Verify napi_delete_reference with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDeleteReferenceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDeleteReferenceWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.deleteReferenceWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceRefAbnormal
     * @tc.number SUB_NAPI_NOCOV_LFC_0042
     * @tc.desc   Verify napi_reference_ref with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceRefAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceRefAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceRefAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceRefRetVal
     * @tc.number SUB_NAPI_NOCOV_LFC_0043
     * @tc.desc   Verify napi_reference_ref with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceRefRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceRefRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceRefRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceRefStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0044
     * @tc.desc   Verify napi_reference_ref with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceRefStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceRefStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceRefStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceRefMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0045
     * @tc.desc   Verify napi_reference_ref with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceRefMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceRefMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceRefMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceRefMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0046
     * @tc.desc   Verify napi_reference_ref with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceRefMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceRefMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceRefMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceRefRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0047
     * @tc.desc   Verify napi_reference_ref with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceRefRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceRefRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceRefRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceRefWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0048
     * @tc.desc   Verify napi_reference_ref with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceRefWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceRefWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceRefWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceUnrefAbnormal
     * @tc.number SUB_NAPI_NOCOV_LFC_0049
     * @tc.desc   Verify napi_reference_unref with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceUnrefAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceUnrefAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceUnrefAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceUnrefRetVal
     * @tc.number SUB_NAPI_NOCOV_LFC_0050
     * @tc.desc   Verify napi_reference_unref with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceUnrefRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceUnrefRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceUnrefRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceUnrefStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0051
     * @tc.desc   Verify napi_reference_unref with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceUnrefStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceUnrefStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceUnrefStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceUnrefMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0052
     * @tc.desc   Verify napi_reference_unref with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceUnrefMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceUnrefMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceUnrefMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceUnrefMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0053
     * @tc.desc   Verify napi_reference_unref with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceUnrefMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceUnrefMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceUnrefMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceUnrefRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0054
     * @tc.desc   Verify napi_reference_unref with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceUnrefRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceUnrefRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceUnrefRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testReferenceUnrefWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0055
     * @tc.desc   Verify napi_reference_unref with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testReferenceUnrefWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testReferenceUnrefWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.referenceUnrefWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetReferenceValueRetVal
     * @tc.number SUB_NAPI_NOCOV_LFC_0056
     * @tc.desc   Verify napi_get_reference_value with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetReferenceValueRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetReferenceValueRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getReferenceValueRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetReferenceValueStable
     * @tc.number SUB_NAPI_NOCOV_LFC_0057
     * @tc.desc   Verify napi_get_reference_value with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetReferenceValueStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetReferenceValueStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getReferenceValueStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetReferenceValueMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0058
     * @tc.desc   Verify napi_get_reference_value with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetReferenceValueMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetReferenceValueMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getReferenceValueMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetReferenceValueMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0059
     * @tc.desc   Verify napi_get_reference_value with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetReferenceValueMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetReferenceValueMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getReferenceValueMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetReferenceValueRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0060
     * @tc.desc   Verify napi_get_reference_value with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetReferenceValueRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetReferenceValueRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getReferenceValueRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetReferenceValueWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0061
     * @tc.desc   Verify napi_get_reference_value with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetReferenceValueWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetReferenceValueWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getReferenceValueWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddFinalizerMultiThread
     * @tc.number SUB_NAPI_NOCOV_LFC_0062
     * @tc.desc   Verify napi_add_finalizer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddFinalizerMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddFinalizerMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.addFinalizerMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddFinalizerMultiCtx
     * @tc.number SUB_NAPI_NOCOV_LFC_0063
     * @tc.desc   Verify napi_add_finalizer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddFinalizerMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddFinalizerMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.addFinalizerMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddFinalizerRuntime
     * @tc.number SUB_NAPI_NOCOV_LFC_0064
     * @tc.desc   Verify napi_add_finalizer with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddFinalizerRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddFinalizerRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.addFinalizerRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddFinalizerWorker
     * @tc.number SUB_NAPI_NOCOV_LFC_0065
     * @tc.desc   Verify napi_add_finalizer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddFinalizerWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddFinalizerWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.addFinalizerWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}