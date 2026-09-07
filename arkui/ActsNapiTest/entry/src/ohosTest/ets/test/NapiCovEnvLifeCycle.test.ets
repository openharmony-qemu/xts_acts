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
import testNapi from 'libnapiCovEnvLifeCycle.so';

export default function napiCovEnvLifeCycleTest() {
  describe('ActsNapiCovEnvLifeCycleTest', () => {
    beforeEach(async () => {
      await Utils.sleep(50);
    });

    /**
     * @tc.name   testSetInstanceDataAbnormal
     * @tc.number SUB_NAPI_NOCOV_ELC_0001
     * @tc.desc   Verify napi_set_instance_data with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetInstanceDataAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetInstanceDataAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.setInstanceDataAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetInstanceDataRetVal
     * @tc.number SUB_NAPI_NOCOV_ELC_0002
     * @tc.desc   Verify napi_set_instance_data with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetInstanceDataRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetInstanceDataRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.setInstanceDataRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetInstanceDataStable
     * @tc.number SUB_NAPI_NOCOV_ELC_0003
     * @tc.desc   Verify napi_set_instance_data with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetInstanceDataStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetInstanceDataStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.setInstanceDataStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetInstanceDataMultiThread
     * @tc.number SUB_NAPI_NOCOV_ELC_0004
     * @tc.desc   Verify napi_set_instance_data with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetInstanceDataMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetInstanceDataMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.setInstanceDataMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetInstanceDataMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ELC_0005
     * @tc.desc   Verify napi_set_instance_data with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetInstanceDataMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetInstanceDataMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.setInstanceDataMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetInstanceDataRuntime
     * @tc.number SUB_NAPI_NOCOV_ELC_0006
     * @tc.desc   Verify napi_set_instance_data with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetInstanceDataRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetInstanceDataRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.setInstanceDataRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testSetInstanceDataWorker
     * @tc.number SUB_NAPI_NOCOV_ELC_0007
     * @tc.desc   Verify napi_set_instance_data with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetInstanceDataWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testSetInstanceDataWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.setInstanceDataWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetInstanceDataAbnormal
     * @tc.number SUB_NAPI_NOCOV_ELC_0008
     * @tc.desc   Verify napi_get_instance_data with abnormal parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetInstanceDataAbnormal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetInstanceDataAbnormal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getInstanceDataAbnormal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetInstanceDataRetVal
     * @tc.number SUB_NAPI_NOCOV_ELC_0009
     * @tc.desc   Verify napi_get_instance_data with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetInstanceDataRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetInstanceDataRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.getInstanceDataRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetInstanceDataStable
     * @tc.number SUB_NAPI_NOCOV_ELC_0010
     * @tc.desc   Verify napi_get_instance_data with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetInstanceDataStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetInstanceDataStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.getInstanceDataStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetInstanceDataMultiThread
     * @tc.number SUB_NAPI_NOCOV_ELC_0011
     * @tc.desc   Verify napi_get_instance_data with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetInstanceDataMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetInstanceDataMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.getInstanceDataMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetInstanceDataMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ELC_0012
     * @tc.desc   Verify napi_get_instance_data with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetInstanceDataMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetInstanceDataMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.getInstanceDataMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetInstanceDataRuntime
     * @tc.number SUB_NAPI_NOCOV_ELC_0013
     * @tc.desc   Verify napi_get_instance_data with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetInstanceDataRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetInstanceDataRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.getInstanceDataRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testGetInstanceDataWorker
     * @tc.number SUB_NAPI_NOCOV_ELC_0014
     * @tc.desc   Verify napi_get_instance_data with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetInstanceDataWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testGetInstanceDataWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.getInstanceDataWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddEnvCleanupHookStable
     * @tc.number SUB_NAPI_NOCOV_ELC_0015
     * @tc.desc   Verify napi_add_env_cleanup_hook with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddEnvCleanupHookStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddEnvCleanupHookStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.addEnvCleanupHookStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddEnvCleanupHookMultiThread
     * @tc.number SUB_NAPI_NOCOV_ELC_0016
     * @tc.desc   Verify napi_add_env_cleanup_hook with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddEnvCleanupHookMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddEnvCleanupHookMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.addEnvCleanupHookMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddEnvCleanupHookMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ELC_0017
     * @tc.desc   Verify napi_add_env_cleanup_hook with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddEnvCleanupHookMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddEnvCleanupHookMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.addEnvCleanupHookMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddEnvCleanupHookRuntime
     * @tc.number SUB_NAPI_NOCOV_ELC_0018
     * @tc.desc   Verify napi_add_env_cleanup_hook with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddEnvCleanupHookRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddEnvCleanupHookRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.addEnvCleanupHookRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddEnvCleanupHookWorker
     * @tc.number SUB_NAPI_NOCOV_ELC_0019
     * @tc.desc   Verify napi_add_env_cleanup_hook with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddEnvCleanupHookWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddEnvCleanupHookWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.addEnvCleanupHookWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveEnvCleanupHookRetVal
     * @tc.number SUB_NAPI_NOCOV_ELC_0020
     * @tc.desc   Verify napi_remove_env_cleanup_hook with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveEnvCleanupHookRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveEnvCleanupHookRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeEnvCleanupHookRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveEnvCleanupHookStable
     * @tc.number SUB_NAPI_NOCOV_ELC_0021
     * @tc.desc   Verify napi_remove_env_cleanup_hook with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveEnvCleanupHookStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveEnvCleanupHookStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeEnvCleanupHookStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveEnvCleanupHookMultiThread
     * @tc.number SUB_NAPI_NOCOV_ELC_0022
     * @tc.desc   Verify napi_remove_env_cleanup_hook with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveEnvCleanupHookMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveEnvCleanupHookMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeEnvCleanupHookMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveEnvCleanupHookMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ELC_0023
     * @tc.desc   Verify napi_remove_env_cleanup_hook with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveEnvCleanupHookMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveEnvCleanupHookMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeEnvCleanupHookMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveEnvCleanupHookRuntime
     * @tc.number SUB_NAPI_NOCOV_ELC_0024
     * @tc.desc   Verify napi_remove_env_cleanup_hook with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveEnvCleanupHookRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveEnvCleanupHookRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeEnvCleanupHookRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveEnvCleanupHookWorker
     * @tc.number SUB_NAPI_NOCOV_ELC_0025
     * @tc.desc   Verify napi_remove_env_cleanup_hook with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveEnvCleanupHookWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveEnvCleanupHookWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeEnvCleanupHookWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddAsyncCleanupHookStable
     * @tc.number SUB_NAPI_NOCOV_ELC_0026
     * @tc.desc   Verify napi_add_async_cleanup_hook with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddAsyncCleanupHookStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddAsyncCleanupHookStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.addAsyncCleanupHookStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddAsyncCleanupHookMultiThread
     * @tc.number SUB_NAPI_NOCOV_ELC_0027
     * @tc.desc   Verify napi_add_async_cleanup_hook with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddAsyncCleanupHookMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddAsyncCleanupHookMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.addAsyncCleanupHookMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddAsyncCleanupHookMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ELC_0028
     * @tc.desc   Verify napi_add_async_cleanup_hook with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddAsyncCleanupHookMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddAsyncCleanupHookMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.addAsyncCleanupHookMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddAsyncCleanupHookRuntime
     * @tc.number SUB_NAPI_NOCOV_ELC_0029
     * @tc.desc   Verify napi_add_async_cleanup_hook with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddAsyncCleanupHookRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddAsyncCleanupHookRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.addAsyncCleanupHookRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testAddAsyncCleanupHookWorker
     * @tc.number SUB_NAPI_NOCOV_ELC_0030
     * @tc.desc   Verify napi_add_async_cleanup_hook with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAddAsyncCleanupHookWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testAddAsyncCleanupHookWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.addAsyncCleanupHookWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveAsyncCleanupHookRetVal
     * @tc.number SUB_NAPI_NOCOV_ELC_0031
     * @tc.desc   Verify napi_remove_async_cleanup_hook with retval parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAsyncCleanupHookRetVal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveAsyncCleanupHookRetVal';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeAsyncCleanupHookRetVal() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveAsyncCleanupHookStable
     * @tc.number SUB_NAPI_NOCOV_ELC_0032
     * @tc.desc   Verify napi_remove_async_cleanup_hook with stable parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAsyncCleanupHookStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveAsyncCleanupHookStable';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeAsyncCleanupHookStable() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveAsyncCleanupHookMultiThread
     * @tc.number SUB_NAPI_NOCOV_ELC_0033
     * @tc.desc   Verify napi_remove_async_cleanup_hook with multithread parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAsyncCleanupHookMultiThread', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveAsyncCleanupHookMultiThread';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeAsyncCleanupHookMultiThread() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveAsyncCleanupHookMultiCtx
     * @tc.number SUB_NAPI_NOCOV_ELC_0034
     * @tc.desc   Verify napi_remove_async_cleanup_hook with multictx parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAsyncCleanupHookMultiCtx', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveAsyncCleanupHookMultiCtx';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeAsyncCleanupHookMultiCtx() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveAsyncCleanupHookRuntime
     * @tc.number SUB_NAPI_NOCOV_ELC_0035
     * @tc.desc   Verify napi_remove_async_cleanup_hook with runtime parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAsyncCleanupHookRuntime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveAsyncCleanupHookRuntime';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeAsyncCleanupHookRuntime() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testRemoveAsyncCleanupHookWorker
     * @tc.number SUB_NAPI_NOCOV_ELC_0036
     * @tc.desc   Verify napi_remove_async_cleanup_hook with worker parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRemoveAsyncCleanupHookWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testRemoveAsyncCleanupHookWorker';
      console.info(`${caseName} START`);
      const result: number = testNapi.removeAsyncCleanupHookWorker() as number;
      expect(result).assertEqual(1);
      console.info(`${caseName} END`);
    });
  });
}