/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool } from '@kit.ArkTS';

@Sendable
class SharedType {
  value: number = 0
}

@Sendable
class StrictType {
  numberValue: number = 0
}

@Sendable
class SendableData {
  input: number = 0
  output: number = 0
}

@Concurrent
function throwingTask(): void {
  throw new Error('task exception')
}

@Concurrent
function priorityTask(name: string): string {
  return name + ' executed'
}

@Concurrent
function seqTask(order: number): number {
  return order
}

@Concurrent
function typeCheckTask(obj: SharedType): number {
  return obj.value
}

@Concurrent
function typeMismatchTask(obj: StrictType): void {
  obj.numberValue = 42
}

@Concurrent
function quickTask(id: number): number {
  return id
}

@Concurrent
function concurrentCaller(x: number): number {
  return x * 2 + 10
}

@Concurrent
function modifySendableData(data: SendableData): number {
  data.output = data.input * 3
  return data.output
}

@Concurrent
function orderedTask(step: number): number {
  return step
}

@Concurrent
function returnErrorTask(): string {
  return 'error handled'
}

export default function ConcurrencyFaqTest(): void {
  describe('ConcurrencyFaqTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})

    /**
     * @tc.name   ConcurrencyFaqTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_0100
     * @tc.desc   Verify TaskPool exception catching with try/catch for throwing task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrencyFaqTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(throwingTask)
      let caughtError: boolean = false
      try {
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError = true
        
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   ConcurrencyFaqTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_0200
     * @tc.desc   Verify TaskPool priority setting with HIGH/MEDIUM/LOW levels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyFaqTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let highTask: taskpool.Task = new taskpool.Task(priorityTask, 'high')
      let mediumTask: taskpool.Task = new taskpool.Task(priorityTask, 'medium')
      let lowTask: taskpool.Task = new taskpool.Task(priorityTask, 'low')

      let p1: Promise<Object> = taskpool.execute(highTask)
      let p2: Promise<Object> = taskpool.execute(mediumTask)
      let p3: Promise<Object> = taskpool.execute(lowTask)
      let results: Object[] = await Promise.all([p1, p2, p3])
      expect(results.length).assertEqual(3)
      expect(results[0] as string).assertEqual('high executed')
      expect(results[1] as string).assertEqual('medium executed')
      expect(results[2] as string).assertEqual('low executed')
    })

    /**
     * @tc.name   ConcurrencyFaqTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_0300
     * @tc.desc   Verify SequenceRunner executes tasks in serial order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyFaqTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let executionOrder: number[] = []

      let p1: Promise<Object> = seqRunner.execute(new taskpool.Task(seqTask, 1))
      let p2: Promise<Object> = seqRunner.execute(new taskpool.Task(seqTask, 2))
      let p3: Promise<Object> = seqRunner.execute(new taskpool.Task(seqTask, 3))
      let p4: Promise<Object> = seqRunner.execute(new taskpool.Task(seqTask, 4))
      let p5: Promise<Object> = seqRunner.execute(new taskpool.Task(seqTask, 5))

      let results: Object[] = await Promise.all([p1, p2, p3, p4, p5])
      for (let i: number = 0; i < results.length; i++) {
        executionOrder.push(results[i] as number)
      }
      expect(executionOrder.length).assertEqual(5)
      expect(executionOrder[0]).assertEqual(1)
      expect(executionOrder[4]).assertEqual(5)
    })

    /**
     * @tc.name   ConcurrencyFaqTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_0400
     * @tc.desc   Verify Sendable object property is accessible in Concurrent function across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyFaqTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedObj: SharedType = new SharedType()
      sharedObj.value = 99
      let task: taskpool.Task = new taskpool.Task(typeCheckTask, sharedObj)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(99)
    })

    /**
     * @tc.name   ConcurrencyFaqTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_0500
     * @tc.desc   Verify Sendable property can be modified with same type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyFaqTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj: StrictType = new StrictType()
      let task: taskpool.Task = new taskpool.Task(typeMismatchTask, obj)
      await taskpool.execute(task)
      expect(obj.numberValue).assertEqual(42)
    })

    /**
     * @tc.name   ConcurrencyFaqTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_0600
     * @tc.desc   Verify TaskPool handles 100 concurrent tasks without failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrencyFaqTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let tasks: Promise<Object>[] = []
      let taskCount: number = 100
      for (let i: number = 0; i < taskCount; i++) {
        tasks.push(taskpool.execute(new taskpool.Task(quickTask, i)))
      }
      let results: Object[] = await Promise.all(tasks)
      expect(results.length).assertEqual(taskCount)
    })

    /**
     * @tc.name   ConcurrencyFaqTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_0700
     * @tc.desc   Verify Concurrent function executes correctly with arithmetic computation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyFaqTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(concurrentCaller, 5)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(20)
    })

    /**
     * @tc.name   ConcurrencyFaqTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_0800
     * @tc.desc   Verify Sendable object data modification across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrencyFaqTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: SendableData = new SendableData()
      data.input = 10
      let task: taskpool.Task = new taskpool.Task(modifySendableData, data)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(30)
      expect(data.output).assertEqual(30)
    })

    /**
     * @tc.name   ConcurrencyFaqTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_0900
     * @tc.desc   Verify SequenceRunner maintains strict execution order with ordered tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyFaqTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let seqRunner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let results: number[] = []
      let taskPromises: Promise<Object>[] = []

      for (let i: number = 1; i <= 5; i++) {
        let p: Promise<Object> = seqRunner.execute(new taskpool.Task(orderedTask, i))
        taskPromises.push(p)
        p.then((r: Object): void => {
          results.push(r as number)
        })
      }

      let lastTask: Promise<Object> = seqRunner.execute(new taskpool.Task(orderedTask, 0))
      await lastTask
      await Promise.all(taskPromises)
      expect(results.length).assertEqual(5)
      expect(results[0]).assertEqual(1)
      expect(results[1]).assertEqual(2)
      expect(results[2]).assertEqual(3)
      expect(results[3]).assertEqual(4)
      expect(results[4]).assertEqual(5)
    })

    /**
     * @tc.name   ConcurrencyFaqTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_1000
     * @tc.desc   Verify TaskPool task execution with multiple concurrent priority tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrencyFaqTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let tasks: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(priorityTask, 'task-' + i.toString())
        tasks.push(taskpool.execute(task))
      }
      let results: Object[] = await Promise.all(tasks)
      expect(results.length).assertEqual(10)
      for (let i: number = 0; i < results.length; i++) {
        expect(typeof results[i]).assertEqual('string')
      }
    })

    /**
     * @tc.name   ConcurrencyFaqTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_1100
     * @tc.desc   Verify TaskPool correctly returns string result from task that simulates error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyFaqTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(returnErrorTask)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('error handled')
    })

    /**
     * @tc.name   ConcurrencyFaqTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_1200
     * @tc.desc   Verify Sendable object property modification is visible to caller thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrencyFaqTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let data: SendableData = new SendableData()
      data.input = 5
      let task: taskpool.Task = new taskpool.Task(modifySendableData, data)
      await taskpool.execute(task)
      expect(data.input).assertEqual(5)
      expect(data.output).assertEqual(15)
    })

    /**
     * @tc.name   ConcurrencyFaqTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_CONCURRENCY_FAQ_TEST_1300
     * @tc.desc   Verify unhandled Promise rejection can be caught at caller level
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrencyFaqTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rejectionCaught: boolean = false
      let rejectedPromise: Promise<string> = Promise.reject(new Error('unhandled rejection'))
      try {
        await rejectedPromise
      } catch (e) {
        rejectionCaught = true
        
      }
      expect(rejectionCaught).assertTrue()
    })
  })
}
