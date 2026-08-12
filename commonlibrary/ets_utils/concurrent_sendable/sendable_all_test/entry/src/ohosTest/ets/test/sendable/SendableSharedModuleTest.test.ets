/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { SharedSingleton } from '../../workers/Sendable'
import Utils from '../utils'

@Concurrent
function accessSharedSingleton(instance: SharedSingleton): number {
  return instance.value_
}

@Concurrent
function modifySharedSingleton(instance: SharedSingleton, value: number): void {
  instance.value_ = value
}

@Concurrent
function incrementSharedSingleton(instance: SharedSingleton): number {
  instance.value_++
  return instance.value_
}

export default function SendableSharedModuleTest(): void {
  describe('SendableSharedModuleTest', (): void => {
    let singleton: SharedSingleton
    beforeEach((): void => {
      singleton = new SharedSingleton()
    })
    /**
     * @tc.name   testSendableSharedModule0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_SHARED_MODULE_TEST_0100
     * @tc.desc   Verify shared module singleton reference consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSharedModule0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(singleton.getValue()).assertEqual(0)
    })

    /**
     * @tc.name   testSendableSharedModule0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_SHARED_MODULE_TEST_0200
     * @tc.desc   Verify TaskPool accesses shared module singleton correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSharedModule0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      singleton.setValue(100)
      const task = new taskpool.Task(accessSharedSingleton, singleton)
      const result = await taskpool.execute(task) as number
      expect(result).assertEqual(100)
    })

    /**
     * @tc.name   testSendableSharedModule0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_SHARED_MODULE_TEST_0300
     * @tc.desc   Verify TaskPool modifies shared module singleton correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSharedModule0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const task = new taskpool.Task(modifySharedSingleton, singleton, 50)
      await taskpool.execute(task)
      expect(singleton.getValue()).assertEqual(50)
    })

    /**
     * @tc.name   testSendableSharedModule0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_SHARED_MODULE_TEST_0400
     * @tc.desc   Verify shared module singleton reference identity across multiple accesses
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSharedModule0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ref1 = singleton
      const ref2 = singleton
      expect(ref1 === ref2).assertTrue()
    })

    /**
     * @tc.name   testSendableSharedModule0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_SHARED_MODULE_TEST_0500
     * @tc.desc   Verify multiple TaskPool tasks sequentially modify shared module singleton
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableSharedModule0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      for (let i = 0; i < 5; i++) {
        const task = new taskpool.Task(incrementSharedSingleton, singleton)
        await taskpool.execute(task)
      }
      expect(singleton.getValue()).assertEqual(5)
    })

    /**
     * @tc.name   testSendableSharedModule0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_SHARED_MODULE_TEST_0600
     * @tc.desc   Verify shared module singleton setValue and getValue round trip
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableSharedModule0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      singleton.setValue(42)
      expect(singleton.getValue()).assertEqual(42)
      singleton.setValue(0)
      expect(singleton.getValue()).assertEqual(0)
    })
  })
}
