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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { ValidSendableClass } from '../../workers/Sendable'
import { collections } from '@kit.ArkTS'
import Utils from '../utils'

@Concurrent
function validSendableParamFunc(instance: ValidSendableClass): number {
  return instance.value_
}

@Concurrent
function modifyValidSendableFunc(instance: ValidSendableClass): number {
  instance.value_++
  return instance.value_
}

@Concurrent
function normalDataFunc(): string {
  return 'normal_size_data'
}

@Concurrent
function returnDataFunc(data: string): string {
  return data
}

@Concurrent
function modifySendableArrayFunc(arr: collections.Array<number>): number {
  let sum: number = 0
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  arr.push(sum)
  return sum
}

export default function SendableConstraintTest(): void {
  describe('SendableConstraintTest', (): void => {
    /**
     * @tc.name   testSendableConstraint0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINT_TEST_0100
     * @tc.desc   Verify valid Sendable class works as TaskPool param correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableConstraint0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const instance = new ValidSendableClass()
        instance.value_ = 100
        const task = new taskpool.Task(validSendableParamFunc, instance)
        const result = await taskpool.execute(task) as number
        expect(result).assertEqual(100)
      } catch (error) {
        console.error("testSendableConstraint0100 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableConstraint0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINT_TEST_0200
     * @tc.desc   Verify valid Sendable class modification works in TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableConstraint0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const instance = new ValidSendableClass()
        instance.value_ = 0
        const task = new taskpool.Task(modifyValidSendableFunc, instance)
        const result = await taskpool.execute(task) as number
        expect(result).assertEqual(1)
        expect(instance.value_).assertEqual(1)
      } catch (error) {
        console.error("testSendableConstraint0200 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableConstraint0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINT_TEST_0300
     * @tc.desc   Verify normal size data serialization works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableConstraint0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const task = new taskpool.Task(normalDataFunc)
        const result = await taskpool.execute(task) as string
        expect(result).assertEqual('normal_size_data')
      } catch (error) {
        console.error("testSendableConstraint0300 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableConstraint0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINT_TEST_0400
     * @tc.desc   Verify @Sendable class property must be initialized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableConstraint0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new ValidSendableClass()
      expect(instance.value_).assertEqual(0)
    })

    /**
     * @tc.name   testSendableConstraint0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINT_TEST_0500
     * @tc.desc   Verify @Sendable class property can be read and written
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableConstraint0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const instance = new ValidSendableClass()
      instance.value_ = 42
      expect(instance.value_).assertEqual(42)
      instance.value_ = 0
      expect(instance.value_).assertEqual(0)
    })

    /**
     * @tc.name   testSendableConstraint0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINT_TEST_0600
     * @tc.desc   Verify sequential tasks concurrently modify Sendable instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSendableConstraint0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const instance = new ValidSendableClass()
        for (let i = 0; i < 5; i++) {
          const task = new taskpool.Task(modifyValidSendableFunc, instance)
          await taskpool.execute(task)
        }
        expect(instance.value_).assertEqual(5)
      } catch (error) {
        console.error("testSendableConstraint0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableConstraint0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINT_TEST_0700
     * @tc.desc   Verify @Sendable class instance can be passed to multiple sequential tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableConstraint0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const instance = new ValidSendableClass()
        instance.value_ = 10
        const task1 = new taskpool.Task(validSendableParamFunc, instance)
        const result1 = await taskpool.execute(task1) as number
        expect(result1).assertEqual(10)
        const task2 = new taskpool.Task(modifyValidSendableFunc, instance)
        const result2 = await taskpool.execute(task2) as number
        expect(result2).assertEqual(11)
        expect(instance.value_).assertEqual(11)
      } catch (error) {
        console.error("testSendableConstraint0700 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testSendableConstraint0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_SENDABLE_CONSTRAINT_TEST_0800
     * @tc.desc   Verify large Sendable collections.Array can be shared across concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSendableConstraint0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const arr = new collections.Array<number>()
        for (let i = 0; i < 1000; i++) {
          arr.push(i)
        }
        const task = new taskpool.Task(modifySendableArrayFunc, arr)
        const result = await taskpool.execute(task) as number
        expect(result).assertEqual(499500)
        expect(arr.length).assertEqual(1001)
        expect(arr[1000]).assertEqual(499500)
      } catch (error) {
        console.error("testSendableConstraint0800 failed");
        expect(false).assertFail();
      }
      done();
    })
  })
}
