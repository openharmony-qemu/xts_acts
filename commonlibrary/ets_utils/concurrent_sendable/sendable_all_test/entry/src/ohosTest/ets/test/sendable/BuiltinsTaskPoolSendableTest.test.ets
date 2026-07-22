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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import taskpool from '@ohos.taskpool'
import { SharedCounter, SharedArrayContainer } from '../../../workers/sendable'
import Utils from '../utils'

@Concurrent
function modifySharedCounter(counter: SharedCounter): number {
  counter.count_++
  return counter.count_
}

@Concurrent
function multiParamSharedFunc(counter1: SharedCounter, counter2: SharedCounter, n: number): number {
  counter1.count_ += n
  counter2.count_ += n
  return counter1.count_ + counter2.count_
}

@Concurrent
function sendDataSharedFunc(counter: SharedCounter): void {
  taskpool.Task.sendData(counter)
}

@Concurrent
function modifySharedArray(container: SharedArrayContainer): number {
  container.arrayCount_++
  return container.arrayCount_
}

@Concurrent
function readSharedCounter(counter: SharedCounter): number {
  return counter.count_
}

export default function BuiltinsTaskPoolSendableTest(): void {
  describe('BuiltinsTaskPoolSendableTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll((): void => {})

    /**
     * @tc.name   testTaskPoolSendable0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_SENDABLE_TEST_0100
     * @tc.desc   Verify single Sendable param passes by reference in TaskPool execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolSendable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new SharedCounter()
      const task = new taskpool.Task(modifySharedCounter, counter)
      const result = await taskpool.execute(task) as number
      expect(result).assertEqual(1)
      expect(counter.count_).assertEqual(1)
    })

    /**
     * @tc.name   testTaskPoolSendable0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_SENDABLE_TEST_0200
     * @tc.desc   Verify multiple Sendable params pass by reference in TaskPool execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolSendable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter1 = new SharedCounter()
      const counter2 = new SharedCounter()
      const task = new taskpool.Task(multiParamSharedFunc, counter1, counter2, 5)
      const result = await taskpool.execute(task) as number
      expect(result).assertEqual(10)
      expect(counter1.count_).assertEqual(5)
      expect(counter2.count_).assertEqual(5)
    })

    /**
     * @tc.name   testTaskPoolSendable0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_SENDABLE_TEST_0300
     * @tc.desc   Verify collections container as Sendable param in TaskPool execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolSendable0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const container = new SharedArrayContainer()
      const task = new taskpool.Task(modifySharedArray, container)
      const result = await taskpool.execute(task) as number
      expect(result).assertEqual(1)
      expect(container.arrayCount_).assertEqual(1)
    })

    /**
     * @tc.name   testTaskPoolSendable0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_SENDABLE_TEST_0400
     * @tc.desc   Verify sendData sends Sendable instance by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolSendable0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new SharedCounter()
      counter.count_ = 42
      const task = new taskpool.Task(sendDataSharedFunc, counter)
      let receivedCounter: SharedCounter | null = null
      task.onReceiveData((data: SharedCounter): void => {
        receivedCounter = data
      })
      await taskpool.execute(task)
      await new Promise<void>((resolve): void => {
        const checkInterval = setInterval((): void => {
          if (receivedCounter !== null) {
            clearInterval(checkInterval)
            resolve()
          }
        }, 10)
      })
      expect(receivedCounter!.count_).assertEqual(42)
    })

    /**
     * @tc.name   testTaskPoolSendable0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_SENDABLE_TEST_0500
     * @tc.desc   Verify 3 sequential tasks modify Sendable correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolSendable0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new SharedCounter()
      for (let i = 0; i < 3; i++) {
        const task = new taskpool.Task(modifySharedCounter, counter)
        await taskpool.execute(task)
      }
      expect(counter.count_).assertEqual(3)
    })

    /**
     * @tc.name   testTaskPoolSendable0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_SENDABLE_TEST_0600
     * @tc.desc   Verify 5 sequential tasks modify Sendable correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolSendable0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new SharedCounter()
      for (let i = 0; i < 5; i++) {
        const task = new taskpool.Task(modifySharedCounter, counter)
        await taskpool.execute(task)
      }
      expect(counter.count_).assertEqual(5)
    })

    /**
     * @tc.name   testTaskPoolSendable0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_SENDABLE_TEST_0700
     * @tc.desc   Verify 10 sequential tasks modify Sendable correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTaskPoolSendable0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const counter = new SharedCounter()
      for (let i = 0; i < 10; i++) {
        const task = new taskpool.Task(modifySharedCounter, counter)
        await taskpool.execute(task)
      }
      expect(counter.count_).assertEqual(10)
    })

    /**
     * @tc.name   testTaskPoolSendable0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_SENDABLE_TEST_0800
     * @tc.desc   Verify Sendable reference modification syncs across tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolSendable0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new SharedCounter()
      counter.count_ = 10
      const task1 = new taskpool.Task(readSharedCounter, counter)
      const result1 = await taskpool.execute(task1) as number
      expect(result1).assertEqual(10)
      const task2 = new taskpool.Task(modifySharedCounter, counter)
      const result2 = await taskpool.execute(task2) as number
      expect(result2).assertEqual(11)
      expect(counter.count_).assertEqual(11)
    })

    /**
     * @tc.name   testTaskPoolSendable0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_SENDABLE_TEST_0900
     * @tc.desc   Verify Sendable instance reference persists after task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testTaskPoolSendable0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const counter = new SharedCounter()
      const task = new taskpool.Task(modifySharedCounter, counter)
      await taskpool.execute(task)
      expect(counter.count_).assertEqual(1)
      counter.count_ = 50
      const task2 = new taskpool.Task(readSharedCounter, counter)
      const result = await taskpool.execute(task2) as number
      expect(result).assertEqual(50)
    })
  })
}
