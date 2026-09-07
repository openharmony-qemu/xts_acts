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
import testNapi from 'libnapiCovBuffer.so';

export default function napiCovBufferTest() {
  describe('ActsNapiCovBufferTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testCreateBufferStable
     * @tc.number SUB_NAPI_NOCOV_BUF_0001
     * @tc.desc   Verify napi_create_buffer with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferMultiThread
     * @tc.number SUB_NAPI_NOCOV_BUF_0002
     * @tc.desc   Verify napi_create_buffer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferMultiCtx
     * @tc.number SUB_NAPI_NOCOV_BUF_0003
     * @tc.desc   Verify napi_create_buffer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferRuntime
     * @tc.number SUB_NAPI_NOCOV_BUF_0004
     * @tc.desc   Verify napi_create_buffer with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferWorker
     * @tc.number SUB_NAPI_NOCOV_BUF_0005
     * @tc.desc   Verify napi_create_buffer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferCopyRetVal
     * @tc.number SUB_NAPI_NOCOV_BUF_0006
     * @tc.desc   Verify napi_create_buffer_copy with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferCopyRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferCopyRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferCopyRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferCopyStable
     * @tc.number SUB_NAPI_NOCOV_BUF_0007
     * @tc.desc   Verify napi_create_buffer_copy with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferCopyStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferCopyStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferCopyStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferCopyMultiThread
     * @tc.number SUB_NAPI_NOCOV_BUF_0008
     * @tc.desc   Verify napi_create_buffer_copy with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferCopyMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferCopyMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferCopyMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferCopyMultiCtx
     * @tc.number SUB_NAPI_NOCOV_BUF_0009
     * @tc.desc   Verify napi_create_buffer_copy with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferCopyMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferCopyMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferCopyMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferCopyRuntime
     * @tc.number SUB_NAPI_NOCOV_BUF_0010
     * @tc.desc   Verify napi_create_buffer_copy with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferCopyRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferCopyRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferCopyRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateBufferCopyWorker
     * @tc.number SUB_NAPI_NOCOV_BUF_0011
     * @tc.desc   Verify napi_create_buffer_copy with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateBufferCopyWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateBufferCopyWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createBufferCopyWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalBufferStable
     * @tc.number SUB_NAPI_NOCOV_BUF_0012
     * @tc.desc   Verify napi_create_external_buffer with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalBufferStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalBufferStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalBufferStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalBufferMultiThread
     * @tc.number SUB_NAPI_NOCOV_BUF_0013
     * @tc.desc   Verify napi_create_external_buffer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalBufferMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalBufferMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalBufferMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalBufferMultiCtx
     * @tc.number SUB_NAPI_NOCOV_BUF_0014
     * @tc.desc   Verify napi_create_external_buffer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalBufferMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalBufferMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalBufferMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalBufferRuntime
     * @tc.number SUB_NAPI_NOCOV_BUF_0015
     * @tc.desc   Verify napi_create_external_buffer with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalBufferRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalBufferRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalBufferRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalBufferWorker
     * @tc.number SUB_NAPI_NOCOV_BUF_0016
     * @tc.desc   Verify napi_create_external_buffer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalBufferWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalBufferWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalBufferWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferInfoAbnormal
     * @tc.number SUB_NAPI_NOCOV_BUF_0017
     * @tc.desc   Verify napi_get_buffer_info with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferInfoAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferInfoAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferInfoAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferInfoStable
     * @tc.number SUB_NAPI_NOCOV_BUF_0018
     * @tc.desc   Verify napi_get_buffer_info with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferInfoStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferInfoStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferInfoStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferInfoMultiThread
     * @tc.number SUB_NAPI_NOCOV_BUF_0019
     * @tc.desc   Verify napi_get_buffer_info with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferInfoMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferInfoMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferInfoMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferInfoMultiCtx
     * @tc.number SUB_NAPI_NOCOV_BUF_0020
     * @tc.desc   Verify napi_get_buffer_info with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferInfoMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferInfoMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferInfoMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferInfoRuntime
     * @tc.number SUB_NAPI_NOCOV_BUF_0021
     * @tc.desc   Verify napi_get_buffer_info with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferInfoRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferInfoRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferInfoRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetBufferInfoWorker
     * @tc.number SUB_NAPI_NOCOV_BUF_0022
     * @tc.desc   Verify napi_get_buffer_info with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetBufferInfoWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetBufferInfoWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getBufferInfoWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsBufferStable
     * @tc.number SUB_NAPI_NOCOV_BUF_0023
     * @tc.desc   Verify napi_is_buffer with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBufferStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsBufferStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.isBufferStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsBufferMultiThread
     * @tc.number SUB_NAPI_NOCOV_BUF_0024
     * @tc.desc   Verify napi_is_buffer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBufferMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsBufferMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.isBufferMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsBufferMultiCtx
     * @tc.number SUB_NAPI_NOCOV_BUF_0025
     * @tc.desc   Verify napi_is_buffer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBufferMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsBufferMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.isBufferMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsBufferRuntime
     * @tc.number SUB_NAPI_NOCOV_BUF_0026
     * @tc.desc   Verify napi_is_buffer with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBufferRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsBufferRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.isBufferRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testIsBufferWorker
     * @tc.number SUB_NAPI_NOCOV_BUF_0027
     * @tc.desc   Verify napi_is_buffer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsBufferWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testIsBufferWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.isBufferWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalArraybufferStable
     * @tc.number SUB_NAPI_NOCOV_BUF_0028
     * @tc.desc   Verify napi_create_external_arraybuffer with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalArraybufferStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalArraybufferStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalArraybufferStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalArraybufferMultiThread
     * @tc.number SUB_NAPI_NOCOV_BUF_0029
     * @tc.desc   Verify napi_create_external_arraybuffer with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalArraybufferMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalArraybufferMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalArraybufferMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalArraybufferMultiCtx
     * @tc.number SUB_NAPI_NOCOV_BUF_0030
     * @tc.desc   Verify napi_create_external_arraybuffer with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalArraybufferMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalArraybufferMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalArraybufferMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalArraybufferRuntime
     * @tc.number SUB_NAPI_NOCOV_BUF_0031
     * @tc.desc   Verify napi_create_external_arraybuffer with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalArraybufferRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalArraybufferRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalArraybufferRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testCreateExternalArraybufferWorker
     * @tc.number SUB_NAPI_NOCOV_BUF_0032
     * @tc.desc   Verify napi_create_external_arraybuffer with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testCreateExternalArraybufferWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testCreateExternalArraybufferWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.createExternalArraybufferWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}