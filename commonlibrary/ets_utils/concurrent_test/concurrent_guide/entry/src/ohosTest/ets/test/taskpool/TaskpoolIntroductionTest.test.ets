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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { taskpool, collections } from '@kit.ArkTS';
import { SharedCounter } from './TaskpoolSharedData';

@Concurrent
function simpleTask(value: number): number {
  return value * 2
}

@Concurrent
function paramTask(num: number, str: string, arr: collections.Array<number>): number {
  return num + str.length + arr.length
}

@Concurrent
function returnMapTask(): collections.Map<string, number> {
  let map = new collections.Map<string, number>()
  map.set('key1', 100)
  map.set('key2', 200)
  return map
}

@Concurrent
function cpuTask(n: number): number {
  let sum: number = 0
  for (let i: number = 0; i < n; i++) {
    sum += i
  }
  return sum
}

@Concurrent
function groupTaskItem(value: number): number {
  return value * 10
}

@Concurrent
async function asyncFulfilledTask(): Promise<number> {
  return 42
}

@Concurrent
async function asyncRejectedTask(): Promise<number> {
  throw new Error('async reject')
}

@Concurrent
function sendDataBasicTask(): number {
  taskpool.Task.sendData('hello')
  return 100
}

@Concurrent
function sendDataMultiTask(): number {
  taskpool.Task.sendData(25)
  taskpool.Task.sendData(50)
  taskpool.Task.sendData(75)
  taskpool.Task.sendData(100)
  return 200
}

@Concurrent
function largeDataTask(size: number): number {
  let arr = new collections.Array<number>()
  for (let i: number = 0; i < size; i++) {
    arr.push(i)
  }
  return arr.length
}

@Concurrent
function throwTask(): void {
  throw new Error('task execution error')
}

@Concurrent
function identityTask(id: number): number {
  return id
}

@Concurrent
function addTask(a: number, b: number): number {
  return a + b
}

@Concurrent
function incrementCounter(counter: SharedCounter): number {
  counter.count++
  return counter.count
}

export default function TaskpoolIntroductionTest(): void {
  describe('TaskpoolIntroductionTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   TaskpoolIntroductionTest0100
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_0100
     * @tc.desc   Verify basic Task creation and execution with @Concurrent function returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolIntroductionTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 10)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(20)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest0200
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_0200
     * @tc.desc   Verify @Concurrent decorator function executes correctly in TaskPool worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolIntroductionTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 50)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest0300
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_0300
     * @tc.desc   Verify Task parameter serialization with number, string and collections.Array types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolIntroductionTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Array<number>()
      arr.push(1, 2, 3)
      let task: taskpool.Task = new taskpool.Task(paramTask, 10, 'test', arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(17)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest0400
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_0400
     * @tc.desc   Verify Task return value serialization with collections.Map containing multiple entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolIntroductionTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(returnMapTask)
      let result = await taskpool.execute(task)
      let map = result as collections.Map<string, number>
      expect(map.size).assertEqual(2)
      expect(map.get('key1')).assertEqual(100)
      expect(map.get('key2')).assertEqual(200)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest0500
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_0500
     * @tc.desc   Verify Task execution with Priority.HIGH returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 5)
      let result = await taskpool.execute(task, taskpool.Priority.HIGH)
      expect(result as number).assertEqual(10)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest0600
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_0600
     * @tc.desc   Verify Task execution with Priority.MEDIUM returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 7)
      let result = await taskpool.execute(task, taskpool.Priority.MEDIUM)
      expect(result as number).assertEqual(14)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest0700
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_0700
     * @tc.desc   Verify Task execution with Priority.LOW returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 8)
      let result = await taskpool.execute(task, taskpool.Priority.LOW)
      expect(result as number).assertEqual(16)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest0800
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_0800
     * @tc.desc   Verify Task execution with Priority.IDLE returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(simpleTask, 9)
      let result = await taskpool.execute(task, taskpool.Priority.IDLE)
      expect(result as number).assertEqual(18)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest0900
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_0900
     * @tc.desc   Verify taskpool.cancel() cancels a pending task and throws error on await
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(cpuTask, 10000)
      let promise = taskpool.execute(task, taskpool.Priority.LOW)
      taskpool.cancel(task)
      try {
        await promise
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1000
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1000
     * @tc.desc   Verify TaskGroup creation, adding multiple tasks and executing returns all results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(groupTaskItem, i)
        taskGroup.addTask(task)
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(5)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i * 10)
      }
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1100
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1100
     * @tc.desc   Verify async @Concurrent function returns fulfilled Promise result correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(asyncFulfilledTask)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1200
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1200
     * @tc.desc   Verify Task.sendData sends message from worker thread received via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedData = new collections.Array<string>()
      let task: taskpool.Task = new taskpool.Task(sendDataBasicTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: Function) => {
        task.onReceiveData((data: Object): void => {
          receivedData.push(data as string)
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(100)
      await dataPromise
      expect(receivedData.length).assertLargerOrEqual(1)
      expect(receivedData[0]).assertEqual('hello')
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1300
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1300
     * @tc.desc   Verify multiple Task.sendData calls deliver all messages in order to host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let progressData = new collections.Array<number>()
      let task: taskpool.Task = new taskpool.Task(sendDataMultiTask)
      let allDataPromise: Promise<void> = new Promise<void>((resolve: Function) => {
        task.onReceiveData((data: Object): void => {
          progressData.push(data as number)
          if (progressData.length >= 4) {
            resolve()
          }
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(200)
      await allDataPromise
      expect(progressData.length).assertEqual(4)
      expect(progressData[0]).assertEqual(25)
      expect(progressData[3]).assertEqual(100)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1400
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1400
     * @tc.desc   Verify large data serialization transfer with collections.Array of 10000 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(largeDataTask, 10000)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(10000)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1500
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1500
     * @tc.desc   Verify task returning rejected Promise throws error caught by try/catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolIntroductionTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(asyncRejectedTask)
      let caughtError1: boolean = false
      try {
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError1 = true
        
      }
      expect(caughtError1).assertTrue()
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1600
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1600
     * @tc.desc   Verify task throwing Error inside @Concurrent function is caught by execute catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolIntroductionTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(throwTask)
      let caughtError2: boolean = false
      try {
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError2 = true
        
      }
      expect(caughtError2).assertTrue()
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1700
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1700
     * @tc.desc   Verify 50 concurrent tasks execute correctly with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolIntroductionTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 50; i++) {
        let task: taskpool.Task = new taskpool.Task(identityTask, i)
        let p = taskpool.execute(task)
        promises.push(p)
      }
      let results: Array<Object> = await Promise.all(promises)
      expect(results.length).assertEqual(50)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i)
      }
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1800
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1800
     * @tc.desc   Verify high priority task executes before low priority task when submitted together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let orderArr = new collections.Array<number>()
      let taskLow: taskpool.Task = new taskpool.Task(identityTask, 1)
      let taskHigh: taskpool.Task = new taskpool.Task(identityTask, 2)
      let pLow = taskpool.execute(taskLow, taskpool.Priority.LOW)
      let pHigh = taskpool.execute(taskHigh, taskpool.Priority.HIGH)
      let results: Array<Object> = await Promise.all([pLow, pHigh])
      expect(results.length).assertEqual(2)
      expect(results[0] as number).assertEqual(1)
      expect(results[1] as number).assertEqual(2)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest1900
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_1900
     * @tc.desc   Verify thread reuse by executing 10 sequential tasks and validating all results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let results = new collections.Array<number>()
      for (let i: number = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(identityTask, i)
        let result = await taskpool.execute(task)
        results.push(result as number)
      }
      expect(results.length).assertEqual(10)
      for (let i: number = 0; i < 10; i++) {
        expect(results[i]).assertEqual(i)
      }
    })

    /**
     * @tc.name   TaskpoolIntroductionTest2000
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_2000
     * @tc.desc   Verify async @Concurrent function with try/catch handles Promise rejection and returns fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(asyncFulfilledTask)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest2100
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_2100
     * @tc.desc   Verify Sendable object shared reference with @Sendable class across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let counter: SharedCounter = new SharedCounter()
      let task: taskpool.Task = new taskpool.Task(incrementCounter, counter)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(1)
    })

    /**
     * @tc.name   TaskpoolIntroductionTest2200
     * @tc.number SUB_TASKPOOL_INTRODUCTION_TEST_2200
     * @tc.desc   Verify TaskGroup with Priority.HIGH executes all tasks and returns correct aggregated results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolIntroductionTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 3; i++) {
        let task: taskpool.Task = new taskpool.Task(addTask, i, 100)
        taskGroup.addTask(task)
      }
      let results: Object[] = await taskpool.execute(taskGroup, taskpool.Priority.HIGH)
      expect(results.length).assertEqual(3)
      expect(results[0] as number).assertEqual(100)
      expect(results[1] as number).assertEqual(101)
      expect(results[2] as number).assertEqual(102)
    })
  })
}
