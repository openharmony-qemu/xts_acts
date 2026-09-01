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
import testNapi from 'libnapiCovClassWrap.so';

export default function napiCovClassWrapTest() {
  describe('ActsNapiCovClassWrapTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testDefineClassStable
     * @tc.number SUB_NAPI_NOCOV_CLS_0001
     * @tc.desc   Verify napi_define_class with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineClassStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineClassStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineClassStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineClassMultiThread
     * @tc.number SUB_NAPI_NOCOV_CLS_0002
     * @tc.desc   Verify napi_define_class with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineClassMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineClassMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineClassMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineClassMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CLS_0003
     * @tc.desc   Verify napi_define_class with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineClassMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineClassMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineClassMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineClassRuntime
     * @tc.number SUB_NAPI_NOCOV_CLS_0004
     * @tc.desc   Verify napi_define_class with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineClassRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineClassRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineClassRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testDefineClassWorker
     * @tc.number SUB_NAPI_NOCOV_CLS_0005
     * @tc.desc   Verify napi_define_class with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDefineClassWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testDefineClassWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.defineClassWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNewInstanceStable
     * @tc.number SUB_NAPI_NOCOV_CLS_0006
     * @tc.desc   Verify napi_new_instance with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewInstanceStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewInstanceStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.newInstanceStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNewInstanceMultiThread
     * @tc.number SUB_NAPI_NOCOV_CLS_0007
     * @tc.desc   Verify napi_new_instance with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewInstanceMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewInstanceMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.newInstanceMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNewInstanceMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CLS_0008
     * @tc.desc   Verify napi_new_instance with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewInstanceMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewInstanceMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.newInstanceMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNewInstanceRuntime
     * @tc.number SUB_NAPI_NOCOV_CLS_0009
     * @tc.desc   Verify napi_new_instance with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewInstanceRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewInstanceRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.newInstanceRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testNewInstanceWorker
     * @tc.number SUB_NAPI_NOCOV_CLS_0010
     * @tc.desc   Verify napi_new_instance with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNewInstanceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testNewInstanceWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.newInstanceWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNewTargetAbnormal
     * @tc.number SUB_NAPI_NOCOV_CLS_0011
     * @tc.desc   Verify napi_get_new_target with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNewTargetAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNewTargetAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNewTargetAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNewTargetStable
     * @tc.number SUB_NAPI_NOCOV_CLS_0012
     * @tc.desc   Verify napi_get_new_target with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNewTargetStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNewTargetStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNewTargetStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNewTargetMultiThread
     * @tc.number SUB_NAPI_NOCOV_CLS_0013
     * @tc.desc   Verify napi_get_new_target with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNewTargetMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNewTargetMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNewTargetMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNewTargetMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CLS_0014
     * @tc.desc   Verify napi_get_new_target with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNewTargetMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNewTargetMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNewTargetMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNewTargetRuntime
     * @tc.number SUB_NAPI_NOCOV_CLS_0015
     * @tc.desc   Verify napi_get_new_target with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNewTargetRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNewTargetRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNewTargetRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetNewTargetWorker
     * @tc.number SUB_NAPI_NOCOV_CLS_0016
     * @tc.desc   Verify napi_get_new_target with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetNewTargetWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetNewTargetWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getNewTargetWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapStable
     * @tc.number SUB_NAPI_NOCOV_CLS_0017
     * @tc.desc   Verify napi_wrap with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapMultiThread
     * @tc.number SUB_NAPI_NOCOV_CLS_0018
     * @tc.desc   Verify napi_wrap with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CLS_0019
     * @tc.desc   Verify napi_wrap with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapWorker
     * @tc.number SUB_NAPI_NOCOV_CLS_0020
     * @tc.desc   Verify napi_wrap with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapStable
     * @tc.number SUB_NAPI_NOCOV_CLS_0021
     * @tc.desc   Verify napi_unwrap with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapMultiThread
     * @tc.number SUB_NAPI_NOCOV_CLS_0022
     * @tc.desc   Verify napi_unwrap with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CLS_0023
     * @tc.desc   Verify napi_unwrap with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testUnwrapWorker
     * @tc.number SUB_NAPI_NOCOV_CLS_0024
     * @tc.desc   Verify napi_unwrap with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUnwrapWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testUnwrapWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.unwrapWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapStable
     * @tc.number SUB_NAPI_NOCOV_CLS_0025
     * @tc.desc   Verify napi_remove_wrap with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapMultiThread
     * @tc.number SUB_NAPI_NOCOV_CLS_0026
     * @tc.desc   Verify napi_remove_wrap with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CLS_0027
     * @tc.desc   Verify napi_remove_wrap with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapRuntime
     * @tc.number SUB_NAPI_NOCOV_CLS_0028
     * @tc.desc   Verify napi_remove_wrap with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveWrapWorker
     * @tc.number SUB_NAPI_NOCOV_CLS_0029
     * @tc.desc   Verify napi_remove_wrap with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveWrapWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveWrapWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeWrapWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapEnhanceStable
     * @tc.number SUB_NAPI_NOCOV_CLS_0030
     * @tc.desc   Verify napi_wrap_enhance with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapEnhanceStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapEnhanceStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapEnhanceStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapEnhanceMultiThread
     * @tc.number SUB_NAPI_NOCOV_CLS_0031
     * @tc.desc   Verify napi_wrap_enhance with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapEnhanceMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapEnhanceMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapEnhanceMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapEnhanceMultiCtx
     * @tc.number SUB_NAPI_NOCOV_CLS_0032
     * @tc.desc   Verify napi_wrap_enhance with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapEnhanceMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapEnhanceMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapEnhanceMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapEnhanceRuntime
     * @tc.number SUB_NAPI_NOCOV_CLS_0033
     * @tc.desc   Verify napi_wrap_enhance with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapEnhanceRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapEnhanceRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapEnhanceRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testWrapEnhanceWorker
     * @tc.number SUB_NAPI_NOCOV_CLS_0034
     * @tc.desc   Verify napi_wrap_enhance with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWrapEnhanceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testWrapEnhanceWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.wrapEnhanceWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}