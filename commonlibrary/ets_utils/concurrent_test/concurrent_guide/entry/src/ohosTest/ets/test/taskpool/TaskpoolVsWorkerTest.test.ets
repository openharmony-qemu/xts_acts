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
import { VsSharedData } from './TaskpoolSharedData';

@Concurrent
function vsWorkerComputeTask(value: number): number {
  return value * 2
}

@Concurrent
function vsWorkerCpuTask(n: number): number {
  let sum: number = 0
  for (let i: number = 0; i < n; i++) {
    sum += i
  }
  return sum
}

@Concurrent
function vsWorkerGroupItem(index: number): number {
  return index * 10
}

@Concurrent
function vsWorkerSendDataTask(taskId: number): number {
  taskpool.Task.sendData(taskId * 100)
  return taskId
}

@Concurrent
function vsWorkerSlowTask(id: number): number {
  let sum: number = 0
  for (let i: number = 0; i < 5000000; i++) {
    sum += i
  }
  return id + sum
}

@Concurrent
function vsWorkerReturnArrTask(size: number): collections.Array<number> {
  let arr = new collections.Array<number>()
  for (let i: number = 0; i < size; i++) {
    arr.push(i * 2)
  }
  return arr
}

@Concurrent
function vsWorkerSendableTask(data: VsSharedData): number {
  data.value = data.value * 3
  return data.value
}

@Concurrent
function vsWorkerPeriodicTask(): number {
  taskpool.Task.sendData(Date.now())
  return 1
}

@Concurrent
function vsWorkerDepTask(id: number): number {
  return id + 100
}

export default function TaskpoolVsWorkerTest(): void {
  describe('TaskpoolVsWorkerTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_0100
     * @tc.desc   Verify TaskPool cancel capability by canceling a pending task before completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(vsWorkerSlowTask, 1)
      let promise = taskpool.execute(task)
      taskpool.cancel(task)
      let caughtError: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (e) {
        caughtError = true
        expect(e instanceof Error).assertTrue()
      }
      expect(caughtError).assertTrue()
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_0200
     * @tc.desc   Verify TaskPool thread reuse by executing 10 sequential tasks without creating new threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let results = new collections.Array<number>()
      for (let i: number = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, i)
        let result = await taskpool.execute(task)
        results.push(result as number)
      }
      expect(results.length).assertEqual(10)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(i * 2)
      }
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_0300
     * @tc.desc   Verify TaskPool TaskGroup batch execution returns all results in single call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(vsWorkerGroupItem, i)
        taskGroup.addTask(task)
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(5)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i * 10)
      }
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_0400
     * @tc.desc   Verify TaskPool priority scheduling with HIGH, MEDIUM, LOW priorities
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskHigh: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, 10)
      let taskMed: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, 20)
      let taskLow: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, 30)
      let pHigh = taskpool.execute(taskHigh, taskpool.Priority.HIGH)
      let pMed = taskpool.execute(taskMed, taskpool.Priority.MEDIUM)
      let pLow = taskpool.execute(taskLow, taskpool.Priority.LOW)
      let results: Array<Object> = await Promise.all([pHigh, pMed, pLow])
      expect(results[0] as number).assertEqual(20)
      expect(results[1] as number).assertEqual(40)
      expect(results[2] as number).assertEqual(60)
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_0500
     * @tc.desc   Verify TaskPool sendData communication from worker thread to host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedData = new collections.Array<number>()
      let task: taskpool.Task = new taskpool.Task(vsWorkerSendDataTask, 5)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedData.push(data as number)
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(5)
      await dataPromise
      expect(receivedData.length).assertLargerOrEqual(1)
      expect(receivedData[0]).assertEqual(500)
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_0600
     * @tc.desc   Verify TaskPool auto lifecycle management with task creation, execution and completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task1: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, 1)
      let result1 = await taskpool.execute(task1)
      expect(result1 as number).assertEqual(2)

      let task2: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, 2)
      let result2 = await taskpool.execute(task2)
      expect(result2 as number).assertEqual(4)

      let task3: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, 3)
      let result3 = await taskpool.execute(task3)
      expect(result3 as number).assertEqual(6)
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_0700
     * @tc.desc   Verify TaskPool parameter passing with collections.Array serialization across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(vsWorkerReturnArrTask, 100)
      let result = await taskpool.execute(task)
      let arr = result as collections.Array<number>
      expect(arr.length).assertEqual(100)
      expect(arr[0]).assertEqual(0)
      expect(arr[99]).assertEqual(198)
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_0800
     * @tc.desc   Verify TaskPool with Sendable object reference passing modifies shared data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let sharedData: VsSharedData = new VsSharedData()
      sharedData.value = 10
      sharedData.name = 'test'
      let task: taskpool.Task = new taskpool.Task(vsWorkerSendableTask, sharedData)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(30)
      expect(sharedData.value).assertEqual(30)
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_0900
     * @tc.desc   Verify TaskPool AsyncRunner concurrency control limits simultaneous task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolVsWorkerTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(3, 10)
      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, i)
        promises.push(runner.execute(task))
      }
      let results: Array<Object> = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i * 2)
      }
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_1000
     * @tc.desc   Verify TaskPool concurrent multi-task execution with 30 simultaneous tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolVsWorkerTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 30; i++) {
        let task: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, i)
        promises.push(taskpool.execute(task))
      }
      let results: Array<Object> = await Promise.all(promises)
      expect(results.length).assertEqual(30)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i * 2)
      }
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_1100
     * @tc.desc   Verify TaskPool task dependency with addDependency ensuring dependent task runs first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolVsWorkerTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let taskA: taskpool.Task = new taskpool.Task(vsWorkerDepTask, 1)
      let taskB: taskpool.Task = new taskpool.Task(vsWorkerDepTask, 2)
      taskB.addDependency(taskA)
      let pA = taskpool.execute(taskA)
      let pB = taskpool.execute(taskB)
      let results: Array<Object> = await Promise.all([pA, pB])
      expect(results[0] as number).assertEqual(101)
      expect(results[1] as number).assertEqual(102)
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_1200
     * @tc.desc   Verify TaskPool delay execution with executeDelayed schedules task after given time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolVsWorkerTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let task: taskpool.Task = new taskpool.Task(vsWorkerComputeTask, 25)
      let startTime: number = Date.now()
      let result = await taskpool.executeDelayed(500, task)
      let elapsed: number = Date.now() - startTime
      expect(result as number).assertEqual(50)
      expect(elapsed >= 499).assertTrue()
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_1300
     * @tc.desc   Verify TaskPool periodic task execution with executePeriodically fires multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolVsWorkerTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let receivedData = new collections.Array<number>()
      let task: taskpool.Task = new taskpool.Task(vsWorkerPeriodicTask)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedData.push(data as number)
          resolve()
        })
      })
      taskpool.executePeriodically(500, task)
      await dataPromise
      taskpool.cancel(task)
      expect(receivedData.length).assertLargerOrEqual(1)
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_1400
     * @tc.desc   Verify TaskPool sendData combined with task result verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let receivedNotify = new collections.Array<number>()
      let task: taskpool.Task = new taskpool.Task(vsWorkerSendDataTask, 3)
      let dataPromise: Promise<void> = new Promise<void>((resolve: () => void) => {
        task.onReceiveData((data: Object): void => {
          receivedNotify.push(data as number)
          resolve()
        })
      })
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
      await dataPromise
      expect(receivedNotify.length).assertLargerOrEqual(1)
      expect(receivedNotify[0]).assertEqual(300)
    })

    /**
     * @tc.name   TaskpoolVsWorkerTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_TASKPOOL_VS_WORKER_TEST_1500
     * @tc.desc   Verify TaskPool CPU intensive task returns correct computation result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolVsWorkerTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(vsWorkerCpuTask, 10000)
      let taskResult = await taskpool.execute(task)
      expect(taskResult as number).assertEqual(49995000)
    })
  })
}
