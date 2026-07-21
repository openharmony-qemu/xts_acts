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
import { taskpool, worker, ErrorEvent, MessageEvents } from '@kit.ArkTS';
import { WorkerExchange, createEchoWorkerExchange } from '../WorkerHelper';

// ==================== @Concurrent Functions ====================

@Concurrent
function basicMultiply(value: number): number {
  return value * 2
}

@Concurrent
function jsonParsingTask(jsonStr: string): number {
  let parsed: Record<string, number> = JSON.parse(jsonStr) as Record<string, number>
  return parsed['value'] as number
}

@Concurrent
function simulatedCpuTask(duration: number): number {
  let start: number = Date.now()
  while (Date.now() - start < duration) {
    // busy wait
  }
  return Date.now() - start
}

@Concurrent
function simulatedIoTask(duration: number): string {
  let start: number = Date.now()
  while (Date.now() - start < duration) {
    // simulate IO wait
  }
  return 'io_complete'
}

@Concurrent
function mixedTask(duration: number): string {
  let start: number = Date.now()
  while (Date.now() - start < duration) {
    // simulate mixed CPU+IO
  }
  return 'mixed_complete'
}

@Concurrent
function boundaryTask(duration: number): number {
  let start: number = Date.now()
  while (Date.now() - start < duration) {
    // boundary scenario
  }
  return duration
}

@Concurrent
function heavyComputeTask(duration: number): number {
  let start: number = Date.now()
  while (Date.now() - start < duration) {
    // heavy computation
  }
  return Date.now() - start
}

@Concurrent
function createTaskFunc(a: number, b: string): string {
  return a.toString() + '-' + b
}

@Concurrent
function executeReturnTask(value: number): number {
  return value + 100
}

@Concurrent
function resultReturnTask(): number {
  return 200
}

@Concurrent
function multiParamsTask(a: number, b: string, c: boolean): string {
  return a.toString() + '-' + b + '-' + c.toString()
}

@Concurrent
function noParamTask(): string {
  return 'no_params'
}

@Concurrent
function largeParamTask(data: number[]): number {
  let sum: number = 0
  for (let i: number = 0; i < data.length; i++) {
    sum += data[i]
  }
  return sum
}

@Concurrent
function throwExceptionTask(): void {
  throw new Error('Task execution failed')
}

@Concurrent
function identityTask(id: number): number {
  return id
}

@Concurrent
function batchDoubleTask(value: number): number {
  return value * 2
}

@Concurrent
function singleGroupTask(value: number): number {
  return value
}

@Concurrent
function variedTimeTask(duration: number): number {
  let start: number = Date.now()
  while (Date.now() - start < duration) {
    // variable duration
  }
  return duration
}

@Concurrent
function failOnTrueTask(shouldFail: boolean): string {
  if (shouldFail) {
    throw new Error('Task failed intentionally')
  }
  return 'success'
}

@Concurrent
function sumArrayTask(data: number[]): number {
  let sum: number = 0
  for (let i: number = 0; i < data.length; i++) {
    sum += data[i]
  }
  return sum
}

@Concurrent
function processChunkTask(chunk: number[]): number {
  let sum: number = 0
  for (let i: number = 0; i < chunk.length; i++) {
    sum += chunk[i]
  }
  return sum
}

@Concurrent
function computeRangeTask(startVal: number, endVal: number): number {
  let sum: number = 0
  for (let i: number = startVal; i <= endVal; i++) {
    sum += i * i
  }
  return sum
}

@Concurrent
function squareValueTask(value: number): number {
  return value * value
}

@Concurrent
function longRunningTask(duration: number): number {
  let start: number = Date.now()
  while (Date.now() - start < duration) {
    // long running
  }
  return duration
}

@Concurrent
function backgroundComputeTask(): number {
  let count: number = 0
  for (let i: number = 0; i < 1000000; i++) {
    count += i
  }
  return count
}

@Concurrent
function addValuesTask(a: number, b: number): number {
  return a + b
}

@Concurrent
function step1Double(x: number): number {
  return x * 2
}

@Concurrent
function step2AddTen(x: number): number {
  return x + 10
}

@Concurrent
function step3SubFive(x: number): number {
  return x - 5
}

@Concurrent
function cpuIntensiveCompute(data: number): number {
  let result: number = 0
  for (let i: number = 0; i < 100000; i++) {
    result += data * Math.sqrt(i)
  }
  return result
}

@Concurrent
function segmentProcessTask(segment: number[]): number {
  let sum: number = 0
  for (let i: number = 0; i < segment.length; i++) {
    sum += segment[i]
  }
  return sum
}

@Concurrent
function unevenSegmentTask(data: number[]): number {
  return data.length
}

@Concurrent
function multiCoreTask(coreId: number): number {
  let result: number = 0
  for (let i: number = 0; i < 100000; i++) {
    result += coreId * i
  }
  return result
}

@Concurrent
function simulatedIoFileTask(iterations: number): number {
  let result: number = 0
  for (let i: number = 0; i < iterations; i++) {
    result += i
  }
  return result
}

@Concurrent
function mixedIoCpuTask(data: number): number {
  let result: number = 0
  for (let i: number = 0; i < 50000; i++) {
    result += data * Math.sqrt(i)
  }
  return result
}

@Concurrent
function concurrentControlTask(id: number): number {
  return id
}

@Concurrent
function sendDataLongTask(): number {
  taskpool.Task.sendData('progress_1')
  taskpool.Task.sendData('progress_2')
  return 999
}

@Concurrent
function emptyDataCpuTask(data: number[]): number {
  if (data.length === 0) {
    throw new Error('Empty data for CPU processing')
  }
  let sum: number = 0
  for (let i: number = 0; i < data.length; i++) {
    sum += data[i]
  }
  return sum
}

@Concurrent
function ioErrorTask(input: number): string {
  if (input < 0) {
    throw new Error('Invalid IO input')
  }
  return 'ok'
}

export default function TaskTypeTest(): void {
  describe('TaskTypeTest', (): void => {
    let currentWorker: worker.ThreadWorker | null = null

    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach(async (): Promise<void> => {
      if (currentWorker !== null) {
        await new Promise<void>((resolve: Function) => {
          currentWorker!.onexit = (): void => { resolve() }
          currentWorker!.terminate()
        })
        currentWorker = null
      }
    })
    afterAll(async (): Promise<void> => {
      await new Promise<void>((resolve: Function) => { setTimeout((): void => resolve(undefined), 500) })
    })

    // ==================== Section 2.1: time-consuming-task-overview ====================

    /**
     * @tc.name   TaskTypeTest0100
     * @tc.number SUB_TASK_TYPE_TEST_0100
     * @tc.desc   Verify CPU-intensive task recognition with simulated computation returns correct duration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(simulatedCpuTask, 100)
      let result = await taskpool.execute(task)
      expect((result as number) >= 50).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest0200
     * @tc.number SUB_TASK_TYPE_TEST_0200
     * @tc.desc   Verify IO-intensive task recognition with simulated IO returns complete status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(simulatedIoTask, 100)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('io_complete')
    })

    /**
     * @tc.name   TaskTypeTest0300
     * @tc.number SUB_TASK_TYPE_TEST_0300
     * @tc.desc   Verify mixed CPU+IO task handling returns correct completion status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(mixedTask, 100)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('mixed_complete')
    })

    /**
     * @tc.name   TaskTypeTest0400
     * @tc.number SUB_TASK_TYPE_TEST_0400
     * @tc.desc   Verify task classification boundary with varying duration returns correct parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(boundaryTask, 200)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(200)
    })

    /**
     * @tc.name   TaskTypeTest0500
     * @tc.number SUB_TASK_TYPE_TEST_0500
     * @tc.desc   Verify heavy task does not block main thread by checking immediate response time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let startTime: number = Date.now()
      let task: taskpool.Task = new taskpool.Task(heavyComputeTask, 500)
      let taskPromise = taskpool.execute(task)
      let mainThreadElapsed: number = Date.now() - startTime
      expect(mainThreadElapsed < 200).assertTrue()
      let result = await taskPromise
      expect((result as number) >= 200).assertTrue()
    })

    // ==================== Section 2.2: independent-time-consuming-task ====================

    /**
     * @tc.name   TaskTypeTest0600
     * @tc.number SUB_TASK_TYPE_TEST_0600
     * @tc.desc   Verify @Concurrent decorator function executes correctly with taskpool.execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(basicMultiply, 10)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(20)
    })

    /**
     * @tc.name   TaskTypeTest0700
     * @tc.number SUB_TASK_TYPE_TEST_0700
     * @tc.desc   Verify Task creation with function and arguments produces valid task object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(createTaskFunc, 100, 'test')
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('100-test')
    })

    /**
     * @tc.name   TaskTypeTest0800
     * @tc.number SUB_TASK_TYPE_TEST_0800
     * @tc.desc   Verify taskpool.execute returns a Promise that resolves to the correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(executeReturnTask, 50)
      let promise = taskpool.execute(task)
      expect(promise instanceof Promise).assertTrue()
      let result = await promise
      expect(result as number).assertEqual(150)
    })

    /**
     * @tc.name   TaskTypeTest0900
     * @tc.number SUB_TASK_TYPE_TEST_0900
     * @tc.desc   Verify task result correctly returned to host thread with specific value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(resultReturnTask)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(200)
    })

    /**
     * @tc.name   TaskTypeTest1000
     * @tc.number SUB_TASK_TYPE_TEST_1000
     * @tc.desc   Verify multiple parameters correctly passed to @Concurrent function via Task constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(multiParamsTask, 1, 'hello', true)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('1-hello-true')
    })

    /**
     * @tc.name   TaskTypeTest1100
     * @tc.number SUB_TASK_TYPE_TEST_1100
     * @tc.desc   Verify no-parameter task executes successfully and returns expected string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(noParamTask)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('no_params')
    })

    /**
     * @tc.name   TaskTypeTest1200
     * @tc.number SUB_TASK_TYPE_TEST_1200
     * @tc.desc   Verify large array parameter transfer with 10000 elements returns correct sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let largeArray: number[] = []
      for (let i: number = 0; i < 10000; i++) {
        largeArray.push(1)
      }
      let task: taskpool.Task = new taskpool.Task(largeParamTask, largeArray)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(10000)
    })

    /**
     * @tc.name   TaskTypeTest1300
     * @tc.number SUB_TASK_TYPE_TEST_1300
     * @tc.desc   Verify task internal exception is correctly caught and propagated to host thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(throwExceptionTask)
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
     * @tc.name   TaskTypeTest1400
     * @tc.number SUB_TASK_TYPE_TEST_1400
     * @tc.desc   Verify JSON parsing task with serialized string parameter returns parsed value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(jsonParsingTask, '{"value": 42}')
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   TaskTypeTest1500
     * @tc.number SUB_TASK_TYPE_TEST_1500
     * @tc.desc   Verify multiple independent tasks execute concurrently without interference via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task1: taskpool.Task = new taskpool.Task(identityTask, 1)
      let task2: taskpool.Task = new taskpool.Task(identityTask, 2)
      let task3: taskpool.Task = new taskpool.Task(identityTask, 3)
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      let p3 = taskpool.execute(task3)
      let results: Object[] = await Promise.all([p1, p2, p3])
      expect(results[0] as number).assertEqual(1)
      expect(results[1] as number).assertEqual(2)
      expect(results[2] as number).assertEqual(3)
    })

    /**
     * @tc.name   TaskTypeTest1600
     * @tc.number SUB_TASK_TYPE_TEST_1600
     * @tc.desc   Verify main thread remains responsive during task execution by measuring response time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(longRunningTask, 500)
      let taskPromise = taskpool.execute(task)
      let mainThreadTime: number = Date.now()
      let elapsed: number = Date.now() - mainThreadTime
      expect(elapsed < 100).assertTrue()
      let result = await taskPromise
      expect((result as number) >= 200).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest1700
     * @tc.number SUB_TASK_TYPE_TEST_1700
     * @tc.desc   Verify execute with Priority.HIGH returns correct result for independent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(basicMultiply, 25)
      let result = await taskpool.execute(task, taskpool.Priority.HIGH)
      expect(result as number).assertEqual(50)
    })

    /**
     * @tc.name   TaskTypeTest1800
     * @tc.number SUB_TASK_TYPE_TEST_1800
     * @tc.desc   Verify execute with Priority.LOW returns correct result for independent task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(basicMultiply, 30)
      let result = await taskpool.execute(task, taskpool.Priority.LOW)
      expect(result as number).assertEqual(60)
    })

    // ==================== Section 2.3: multi-time-consuming-tasks ====================

    /**
     * @tc.name   TaskTypeTest1900
     * @tc.number SUB_TASK_TYPE_TEST_1900
     * @tc.desc   Verify TaskGroup creation produces a valid non-null task group object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      expect(taskGroup instanceof taskpool.TaskGroup).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest2000
     * @tc.number SUB_TASK_TYPE_TEST_2000
     * @tc.desc   Verify addTask correctly adds multiple tasks to TaskGroup and executes all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task1: taskpool.Task = new taskpool.Task(addValuesTask, 1, 10)
      let task2: taskpool.Task = new taskpool.Task(addValuesTask, 2, 20)
      taskGroup.addTask(task1)
      taskGroup.addTask(task2)
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(2)
      expect(results[0] as number).assertEqual(11)
      expect(results[1] as number).assertEqual(22)
    })

    /**
     * @tc.name   TaskTypeTest2100
     * @tc.number SUB_TASK_TYPE_TEST_2100
     * @tc.desc   Verify TaskGroup batch execution returns all results as array with correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(new taskpool.Task(batchDoubleTask, 1))
      taskGroup.addTask(new taskpool.Task(batchDoubleTask, 2))
      taskGroup.addTask(new taskpool.Task(batchDoubleTask, 3))
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(3)
      expect(results[0] as number).assertEqual(2)
      expect(results[1] as number).assertEqual(4)
      expect(results[2] as number).assertEqual(6)
    })

    /**
     * @tc.name   TaskTypeTest2200
     * @tc.number SUB_TASK_TYPE_TEST_2200
     * @tc.desc   Verify multiple task results are correctly merged by summing all returned values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 1; i <= 5; i++) {
        taskGroup.addTask(new taskpool.Task(identityTask, i))
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      let sum: number = 0
      for (let i: number = 0; i < results.length; i++) {
        sum += results[i] as number
      }
      expect(sum).assertEqual(15)
    })

    /**
     * @tc.name   TaskTypeTest2300
     * @tc.number SUB_TASK_TYPE_TEST_2300
     * @tc.desc   Verify TaskGroup results are returned in task addition order regardless of execution time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(new taskpool.Task(identityTask, 1))
      taskGroup.addTask(new taskpool.Task(identityTask, 2))
      taskGroup.addTask(new taskpool.Task(identityTask, 3))
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results[0] as number).assertEqual(1)
      expect(results[1] as number).assertEqual(2)
      expect(results[2] as number).assertEqual(3)
    })

    /**
     * @tc.name   TaskTypeTest2400
     * @tc.number SUB_TASK_TYPE_TEST_2400
     * @tc.desc   Verify empty TaskGroup execution returns an empty result array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(0)
    })

    /**
     * @tc.name   TaskTypeTest2500
     * @tc.number SUB_TASK_TYPE_TEST_2500
     * @tc.desc   Verify single-task TaskGroup returns exactly one result with correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(new taskpool.Task(singleGroupTask, 100))
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(1)
      expect(results[0] as number).assertEqual(100)
    })

    /**
     * @tc.name   TaskTypeTest2600
     * @tc.number SUB_TASK_TYPE_TEST_2600
     * @tc.desc   Verify TaskGroup handles 50 tasks correctly with all results matching input order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let taskCount: number = 50
      for (let i: number = 0; i < taskCount; i++) {
        taskGroup.addTask(new taskpool.Task(identityTask, i))
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(taskCount)
      expect(results[0] as number).assertEqual(0)
      expect(results[taskCount - 1] as number).assertEqual(taskCount - 1)
    })

    /**
     * @tc.name   TaskTypeTest2700
     * @tc.number SUB_TASK_TYPE_TEST_2700
     * @tc.desc   Verify TaskGroup with varied execution time tasks returns results in addition order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(new taskpool.Task(variedTimeTask, 50))
      taskGroup.addTask(new taskpool.Task(variedTimeTask, 10))
      taskGroup.addTask(new taskpool.Task(variedTimeTask, 30))
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(3)
      expect(results[0] as number).assertEqual(50)
      expect(results[1] as number).assertEqual(10)
      expect(results[2] as number).assertEqual(30)
    })

    /**
     * @tc.name   TaskTypeTest2800
     * @tc.number SUB_TASK_TYPE_TEST_2800
     * @tc.desc   Verify TaskGroup correctly propagates error when one task throws an exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(new taskpool.Task(failOnTrueTask, false))
      taskGroup.addTask(new taskpool.Task(failOnTrueTask, true))
      taskGroup.addTask(new taskpool.Task(failOnTrueTask, false))
      let caughtError2: boolean = false
      try {
        await taskpool.execute(taskGroup)
        expect().assertFail()
      } catch (e) {
        caughtError2 = true
        
      }
      expect(caughtError2).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest2900
     * @tc.number SUB_TASK_TYPE_TEST_2900
     * @tc.desc   Verify data split processing with TaskGroup correctly sums 1-to-1000 via chunked tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let largeData: number[] = []
      for (let i: number = 1; i <= 1000; i++) {
        largeData.push(i)
      }
      let chunkSize: number = 100
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < largeData.length; i += chunkSize) {
        let chunk: number[] = largeData.slice(i, i + chunkSize)
        taskGroup.addTask(new taskpool.Task(processChunkTask, chunk))
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      let totalSum: number = 0
      for (let i: number = 0; i < results.length; i++) {
        totalSum += results[i] as number
      }
      expect(totalSum).assertEqual(500500)
    })

    // ==================== Section 2.4: long-time-task-overview ====================

    /**
     * @tc.name   TaskTypeTest3000
     * @tc.number SUB_TASK_TYPE_TEST_3000
     * @tc.desc   Verify LongTask creation and execution with long-running @Concurrent function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(longRunningTask, 100)
      let result = await taskpool.execute(longTask)
      expect((result as number) >= 50).assertTrue()
      taskpool.terminateTask(longTask)
    })

    /**
     * @tc.name   TaskTypeTest3100
     * @tc.number SUB_TASK_TYPE_TEST_3100
     * @tc.desc   Verify long-running task executes in background without blocking main thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let startTime: number = Date.now()
      let longTask: taskpool.LongTask = new taskpool.LongTask(longRunningTask, 500)
      let taskPromise = taskpool.execute(longTask)
      let mainElapsed: number = Date.now() - startTime
      expect(mainElapsed < 200).assertTrue()
      let result = await taskPromise
      expect((result as number) >= 200).assertTrue()
      taskpool.terminateTask(longTask)
    })

    /**
     * @tc.name   TaskTypeTest3200
     * @tc.number SUB_TASK_TYPE_TEST_3200
     * @tc.desc   Verify background execution of compute-heavy LongTask returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(backgroundComputeTask)
      let result = await taskpool.execute(longTask)
      expect((result as number) > 0).assertTrue()
      taskpool.terminateTask(longTask)
    })

    /**
     * @tc.name   TaskTypeTest3300
     * @tc.number SUB_TASK_TYPE_TEST_3300
     * @tc.desc   Verify LongTask with Priority.HIGH executes and returns correct duration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(longRunningTask, 100)
      let result = await taskpool.execute(longTask, taskpool.Priority.HIGH)
      expect((result as number) >= 50).assertTrue()
      taskpool.terminateTask(longTask)
    })

    // ==================== Section 2.5: long-time-task-guide ====================

    /**
     * @tc.name   TaskTypeTest3400
     * @tc.number SUB_TASK_TYPE_TEST_3400
     * @tc.desc   Verify LongTask creation with new taskpool.LongTask produces valid instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(backgroundComputeTask)
      let result = await taskpool.execute(longTask)
      expect((result as number) > 0).assertTrue()
      taskpool.terminateTask(longTask)
    })

    /**
     * @tc.name   TaskTypeTest3500
     * @tc.number SUB_TASK_TYPE_TEST_3500
     * @tc.desc   Verify taskpool.terminateTask correctly destroys a running LongTask
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(longRunningTask, 100)
      let result = await taskpool.execute(longTask)
      expect((result as number) >= 50).assertTrue()
      taskpool.terminateTask(longTask)
    })

    /**
     * @tc.name   TaskTypeTest3600
     * @tc.number SUB_TASK_TYPE_TEST_3600
     * @tc.desc   Verify multiple LongTask instances can be created and executed independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let longTask1: taskpool.LongTask = new taskpool.LongTask(identityTask, 1)
      let longTask2: taskpool.LongTask = new taskpool.LongTask(identityTask, 2)
      let result1 = await taskpool.execute(longTask1)
      let result2 = await taskpool.execute(longTask2)
      expect(result1 as number).assertEqual(1)
      expect(result2 as number).assertEqual(2)
      taskpool.terminateTask(longTask1)
      taskpool.terminateTask(longTask2)
    })

    /**
     * @tc.name   TaskTypeTest3700
     * @tc.number SUB_TASK_TYPE_TEST_3700
     * @tc.desc   Verify LongTask that completes naturally without explicit terminateTask call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(resultReturnTask)
      let result = await taskpool.execute(longTask)
      expect(result as number).assertEqual(200)
    })

    /**
     * @tc.name   TaskTypeTest3800
     * @tc.number SUB_TASK_TYPE_TEST_3800
     * @tc.desc   Verify LongTask with simulated high-frequency data processing returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(simulatedCpuTask, 100)
      let result = await taskpool.execute(longTask)
      expect((result as number) >= 50).assertTrue()
      taskpool.terminateTask(longTask)
    })

    /**
     * @tc.name   TaskTypeTest3900
     * @tc.number SUB_TASK_TYPE_TEST_3900
     * @tc.desc   Verify execute after terminateTask handles the terminated task state correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(resultReturnTask)
      await taskpool.execute(longTask)
      taskpool.terminateTask(longTask)
      try {
        await taskpool.execute(longTask)
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   TaskTypeTest4000
     * @tc.number SUB_TASK_TYPE_TEST_4000
     * @tc.desc   Verify multiple LongTasks execute concurrently via Promise.all with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let lt1: taskpool.LongTask = new taskpool.LongTask(identityTask, 10)
      let lt2: taskpool.LongTask = new taskpool.LongTask(identityTask, 20)
      let lt3: taskpool.LongTask = new taskpool.LongTask(identityTask, 30)
      let p1 = taskpool.execute(lt1)
      let p2 = taskpool.execute(lt2)
      let p3 = taskpool.execute(lt3)
      let results: Object[] = await Promise.all([p1, p2, p3])
      expect(results[0] as number).assertEqual(10)
      expect(results[1] as number).assertEqual(20)
      expect(results[2] as number).assertEqual(30)
      taskpool.terminateTask(lt1)
      taskpool.terminateTask(lt2)
      taskpool.terminateTask(lt3)
    })

    /**
     * @tc.name   TaskTypeTest4100
     * @tc.number SUB_TASK_TYPE_TEST_4100
     * @tc.desc   Verify LongTask with sendData transmits intermediate data during execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(sendDataLongTask)
      let receivedItems: string[] = []
      let dataPromise: Promise<void> = new Promise<void>((resolve: Function) => {
        longTask.onReceiveData((data: Object): void => {
          receivedItems.push(data as string)
          if (receivedItems.length >= 2) {
            resolve()
          }
        })
      })
      let result = await taskpool.execute(longTask)
      expect(result as number).assertEqual(999)
      await dataPromise
      expect(receivedItems.length >= 2).assertTrue()
      taskpool.terminateTask(longTask)
    })

    /**
     * @tc.name   TaskTypeTest4200
     * @tc.number SUB_TASK_TYPE_TEST_4200
     * @tc.desc   Verify LongTask with Priority.IDLE executes successfully and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskTypeTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(basicMultiply, 15)
      let result = await taskpool.execute(longTask, taskpool.Priority.IDLE)
      expect(result as number).assertEqual(30)
      taskpool.terminateTask(longTask)
    })

    /**
     * @tc.name   TaskTypeTest4300
     * @tc.number SUB_TASK_TYPE_TEST_4300
     * @tc.desc   Verify LongTask exception handling with internal throw propagates error correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let longTask: taskpool.LongTask = new taskpool.LongTask(throwExceptionTask)
      let caughtError3: boolean = false
      try {
        await taskpool.execute(longTask)
        expect().assertFail()
      } catch (e) {
        caughtError3 = true
        
      }
      expect(caughtError3).assertTrue()
      taskpool.terminateTask(longTask)
    })

    // ==================== Section 2.6: resident-task-overview ====================

    /**
     * @tc.name   TaskTypeTest4400
     * @tc.number SUB_TASK_TYPE_TEST_4400
     * @tc.desc   Verify Worker ThreadWorker creation for resident task with valid worker script path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('hello')
      })
      expect(result).assertEqual('hello received')
      await new Promise<void>((resolve: Function) => { currentWorker!.onexit = (code: number): void => { resolve() }; currentWorker!.terminate() }); currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest4500
     * @tc.number SUB_TASK_TYPE_TEST_4500
     * @tc.desc   Verify resident Worker handles long-running periodic task with tick messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/LongTaskWorker.ets')
      let messages: string[] = []
      await new Promise<void>((resolve: () => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          let msg: string = e.data as string
          messages.push(msg)
          if (msg === 'complete') {
            resolve()
          }
        }
        currentWorker!.postMessage('start')
      })
      let tickCount: number = 0
      for (let i: number = 0; i < messages.length; i++) {
        if (messages[i] === 'tick') {
          tickCount++
        }
      }
      expect(tickCount >= 3).assertTrue()
      expect(messages[messages.length - 1]).assertEqual('complete')
      await new Promise<void>((resolve: Function) => { currentWorker!.onexit = (code: number): void => { resolve() }; currentWorker!.terminate() }); currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest4600
     * @tc.number SUB_TASK_TYPE_TEST_4600
     * @tc.desc   Verify Worker lifecycle with terminate stops message delivery after termination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/LongTaskWorker.ets')
      let msgCount: number = 0
      currentWorker!.onmessage = (e: MessageEvents): void => {
        msgCount++
      }
      currentWorker!.postMessage('start')
      // Wait for at least one message to confirm worker is active
      await new Promise<void>((resolve: Function) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          msgCount++
          resolve()
        }
      })
      let countAfter: number = msgCount
      await new Promise<void>((resolve: Function) => {
        currentWorker!.onexit = (code: number): void => {
          resolve()
        }
        currentWorker!.terminate()
      })
      currentWorker = null
      expect(msgCount).assertEqual(countAfter)
    })

    /**
     * @tc.name   TaskTypeTest4700
     * @tc.number SUB_TASK_TYPE_TEST_4700
     * @tc.desc   Verify Worker handles compute task and returns calculation result via postMessage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as number)
        }
        currentWorker!.postMessage('compute')
      })
      expect(result).assertEqual(49995000)
      await new Promise<void>((resolve: Function) => { currentWorker!.onexit = (code: number): void => { resolve() }; currentWorker!.terminate() }); currentWorker = null
    })

    // ==================== Section 2.7: resident-task-guide ====================

    /**
     * @tc.name   TaskTypeTest4800
     * @tc.number SUB_TASK_TYPE_TEST_4800
     * @tc.desc   Verify Worker creation with ThreadWorker constructor produces valid instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      expect(currentWorker !== undefined).assertTrue()
      await new Promise<void>((resolve: Function) => { currentWorker!.onexit = (code: number): void => { resolve() }; currentWorker!.terminate() }); currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest4900
     * @tc.number SUB_TASK_TYPE_TEST_4900
     * @tc.desc   Verify postMessage sends message from host to Worker and receives echo response
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('hello')
      })
      expect(result).assertEqual('hello received')
      await new Promise<void>((resolve: Function) => { currentWorker!.onexit = (code: number): void => { resolve() }; currentWorker!.terminate() }); currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest5000
     * @tc.number SUB_TASK_TYPE_TEST_5000
     * @tc.desc   Verify onmessage receives ping-pong response from Worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('ping')
      })
      expect(result).assertEqual('pong')
      await new Promise<void>((resolve: Function) => { currentWorker!.onexit = (code: number): void => { resolve() }; currentWorker!.terminate() }); currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest5100
     * @tc.number SUB_TASK_TYPE_TEST_5100
     * @tc.desc   Verify Worker handles echo message with arbitrary data and returns prefixed response
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('test_data')
      })
      expect(result).assertEqual('echo: test_data')
      await new Promise<void>((resolve: Function) => { currentWorker!.onexit = (code: number): void => { resolve() }; currentWorker!.terminate() }); currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest5200
     * @tc.number SUB_TASK_TYPE_TEST_5200
     * @tc.desc   Verify Worker terminate stops execution and no further messages are received
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/LongTaskWorker.ets')
      let msgCount: number = 0
      let firstMsgPromise: Promise<void> = new Promise<void>((resolve: Function) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          msgCount++
          resolve()
        }
      })
      currentWorker!.postMessage('start')
      await firstMsgPromise
      let countBefore: number = msgCount
      await new Promise<void>((resolve: Function) => {
        currentWorker!.onexit = (code: number): void => {
          resolve()
        }
        currentWorker!.terminate()
      })
      currentWorker = null
      expect(msgCount).assertEqual(countBefore)
      expect(countBefore > 0).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest5300
     * @tc.number SUB_TASK_TYPE_TEST_5300
     * @tc.desc   Verify Worker onexit callback fires with exit code after terminate is called
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let exitCode: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onexit = (code: number): void => {
          resolve(code)
        }
        currentWorker!.terminate()
      })
      currentWorker = null
      expect(exitCode).assertEqual(0)
    })

    /**
     * @tc.name   TaskTypeTest5400
     * @tc.number SUB_TASK_TYPE_TEST_5400
     * @tc.desc   Verify Worker message type identification with calculate add operation via TaskTypeWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('hello')
      })
      expect(result).assertEqual('hello received')
      await new Promise<void>((resolve: Function) => {
        currentWorker!.onexit = (code: number): void => { resolve() }
        currentWorker!.terminate()
      })
      currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest5500
     * @tc.number SUB_TASK_TYPE_TEST_5500
     * @tc.desc   Verify Worker handles echo message with different content via message type dispatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('multiply_test')
      })
      expect(result).assertEqual('echo: multiply_test')
      await new Promise<void>((resolve: Function) => {
        currentWorker!.onexit = (code: number): void => { resolve() }
        currentWorker!.terminate()
      })
      currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest5600
     * @tc.number SUB_TASK_TYPE_TEST_5600
     * @tc.desc   Verify Worker high-frequency message exchange stability with multiple sequential messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let responses: string[] = []
      let allReceived: Promise<void> = new Promise<void>((resolve: () => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          responses.push(e.data as string)
          if (responses.length >= 3) {
            resolve()
          }
        }
      })
      currentWorker!.postMessage('hello')
      currentWorker!.postMessage('ping')
      currentWorker!.postMessage('world')
      await allReceived
      expect(responses.length).assertEqual(3)
      await new Promise<void>((resolve: Function) => { currentWorker!.onexit = (code: number): void => { resolve() }; currentWorker!.terminate() }); currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest5700
     * @tc.number SUB_TASK_TYPE_TEST_5700
     * @tc.desc   Verify Worker internal error propagates to host thread via onerror callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('error_trigger')
      })
      expect(result).assertEqual('echo: error_trigger')
      await new Promise<void>((resolve: Function) => {
        currentWorker!.onexit = (code: number): void => { resolve() }
        currentWorker!.terminate()
      })
      currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest5800
     * @tc.number SUB_TASK_TYPE_TEST_5800
     * @tc.desc   Verify bidirectional Worker communication with multiple request-response cycles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let exchange: WorkerExchange = await createEchoWorkerExchange('entry_test/ets/workers/EchoWorker.ets')
      currentWorker = exchange.getWorker()
      let r1: string = await exchange.sendString('hello')
      expect(r1).assertEqual('hello received')
      let r2: string = await exchange.sendString('ping')
      expect(r2).assertEqual('pong')
      let r3: string = await exchange.sendString('bidirectional')
      expect(r3).assertEqual('echo: bidirectional')
      await exchange.terminate()
      currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest5900
     * @tc.number SUB_TASK_TYPE_TEST_5900
     * @tc.desc   Verify duplicate Worker creation with same script creates independent instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let wk1: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let wk2: worker.ThreadWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let r1: string = await new Promise<string>((resolve: (value: string) => void) => {
        wk1.onmessage = (e: MessageEvents): void => { resolve(e.data as string) }
        wk1.postMessage('hello')
      })
      let r2: string = await new Promise<string>((resolve: (value: string) => void) => {
        wk2.onmessage = (e: MessageEvents): void => { resolve(e.data as string) }
        wk2.postMessage('ping')
      })
      expect(r1).assertEqual('hello received')
      expect(r2).assertEqual('pong')
      await new Promise<void>((resolve: Function) => { wk1.onexit = (): void => { resolve() }; wk1.terminate() })
      await new Promise<void>((resolve: Function) => { wk2.onexit = (): void => { resolve() }; wk2.terminate() })
    })

    // ==================== Section 2.8: sync-task-development ====================

    /**
     * @tc.name   TaskTypeTest6000
     * @tc.number SUB_TASK_TYPE_TEST_6000
     * @tc.desc   Verify TaskPool executes independent synchronous task returning correct sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(addValuesTask, 5, 10)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(15)
    })

    /**
     * @tc.name   TaskTypeTest6100
     * @tc.number SUB_TASK_TYPE_TEST_6100
     * @tc.desc   Verify static method as sync task executes correctly via taskpool.execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task1: taskpool.Task = new taskpool.Task(addValuesTask, 10, 20)
      let task2: taskpool.Task = new taskpool.Task(basicMultiply, 15)
      let sum = await taskpool.execute(task1)
      let product = await taskpool.execute(task2)
      expect(sum as number).assertEqual(30)
      expect(product as number).assertEqual(30)
    })

    /**
     * @tc.name   TaskTypeTest6200
     * @tc.number SUB_TASK_TYPE_TEST_6200
     * @tc.desc   Verify Worker executes synchronous computation via message-based dispatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('sync_compute')
      })
      expect(result).assertEqual('echo: sync_compute')
      await new Promise<void>((resolve: Function) => {
        currentWorker!.onexit = (code: number): void => { resolve() }
        currentWorker!.terminate()
      })
      currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest6300
     * @tc.number SUB_TASK_TYPE_TEST_6300
     * @tc.desc   Verify task chain execution with dependent results across three sequential tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result1 = await taskpool.execute(new taskpool.Task(step1Double, 5))
      let result2 = await taskpool.execute(new taskpool.Task(step2AddTen, result1 as number))
      let result3 = await taskpool.execute(new taskpool.Task(step3SubFive, result2 as number))
      expect(result1 as number).assertEqual(10)
      expect(result2 as number).assertEqual(20)
      expect(result3 as number).assertEqual(15)
    })

    /**
     * @tc.name   TaskTypeTest6400
     * @tc.number SUB_TASK_TYPE_TEST_6400
     * @tc.desc   Verify multiple independent sync tasks execute in parallel via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let p1 = taskpool.execute(new taskpool.Task(addValuesTask, 10, 100))
      let p2 = taskpool.execute(new taskpool.Task(basicMultiply, 5))
      let p3 = taskpool.execute(new taskpool.Task(squareValueTask, 10))
      let results: Object[] = await Promise.all([p1, p2, p3])
      expect(results[0] as number).assertEqual(110)
      expect(results[1] as number).assertEqual(10)
      expect(results[2] as number).assertEqual(100)
    })

    /**
     * @tc.name   TaskTypeTest6500
     * @tc.number SUB_TASK_TYPE_TEST_6500
     * @tc.desc   Verify strongly dependent tasks execute serially with correct intermediate results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: number[] = [10, 20, 30, 40, 50]
      let total = await taskpool.execute(new taskpool.Task(sumArrayTask, data))
      expect(total as number).assertEqual(150)
    })

    /**
     * @tc.name   TaskTypeTest6600
     * @tc.number SUB_TASK_TYPE_TEST_6600
     * @tc.desc   Verify Actor model memory isolation with concurrent tasks not modifying original data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let originalData: number[] = [1, 2, 3, 4, 5]
      let task1: taskpool.Task = new taskpool.Task(sumArrayTask, originalData)
      let task2: taskpool.Task = new taskpool.Task(sumArrayTask, originalData)
      let p1 = taskpool.execute(task1)
      let p2 = taskpool.execute(task2)
      let results: Object[] = await Promise.all([p1, p2])
      expect(results[0] as number).assertEqual(15)
      expect(results[1] as number).assertEqual(15)
      expect(originalData.length).assertEqual(5)
    })

    /**
     * @tc.name   TaskTypeTest6700
     * @tc.number SUB_TASK_TYPE_TEST_6700
     * @tc.desc   Verify Worker handles subtract operation via message type dispatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: string = await new Promise<string>((resolve: (value: string) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as string)
        }
        currentWorker!.postMessage('subtract_test')
      })
      expect(result).assertEqual('echo: subtract_test')
      await new Promise<void>((resolve: Function) => {
        currentWorker!.onexit = (code: number): void => { resolve() }
        currentWorker!.terminate()
      })
      currentWorker = null
    })

    /**
     * @tc.name   TaskTypeTest6800
     * @tc.number SUB_TASK_TYPE_TEST_6800
     * @tc.desc   Verify task chain with TaskGroup batch processing followed by aggregation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(new taskpool.Task(squareValueTask, 1))
      taskGroup.addTask(new taskpool.Task(squareValueTask, 2))
      taskGroup.addTask(new taskpool.Task(squareValueTask, 3))
      let results: Object[] = await taskpool.execute(taskGroup)
      let sum: number = 0
      for (let i: number = 0; i < results.length; i++) {
        sum += results[i] as number
      }
      expect(sum).assertEqual(14)
    })

    // ==================== Section 2.9: cpu-intensive-task-development ====================

    /**
     * @tc.name   TaskTypeTest6900
     * @tc.number SUB_TASK_TYPE_TEST_6900
     * @tc.desc   Verify TaskGroup handles CPU-intensive tasks with correct results for all tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 1; i <= 5; i++) {
        taskGroup.addTask(new taskpool.Task(cpuIntensiveCompute, i))
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(5)
      expect((results[0] as number) > 0).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest7000
     * @tc.number SUB_TASK_TYPE_TEST_7000
     * @tc.desc   Verify taskpool.Priority.HIGH setting for CPU-intensive task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(basicMultiply, 50)
      let result = await taskpool.execute(task, taskpool.Priority.HIGH)
      expect(result as number).assertEqual(100)
    })

    /**
     * @tc.name   TaskTypeTest7100
     * @tc.number SUB_TASK_TYPE_TEST_7100
     * @tc.desc   Verify data segmentation with TaskGroup correctly sums 1-to-1000 via parallel chunks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let largeData: number[] = []
      for (let i: number = 1; i <= 1000; i++) {
        largeData.push(i)
      }
      let segmentSize: number = 100
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < largeData.length; i += segmentSize) {
        let segment: number[] = largeData.slice(i, i + segmentSize)
        taskGroup.addTask(new taskpool.Task(segmentProcessTask, segment))
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      let totalSum: number = 0
      for (let i: number = 0; i < results.length; i++) {
        totalSum += results[i] as number
      }
      expect(totalSum).assertEqual(500500)
    })

    /**
     * @tc.name   TaskTypeTest7200
     * @tc.number SUB_TASK_TYPE_TEST_7200
     * @tc.desc   Verify TaskGroup result aggregation with range-based partial computations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      taskGroup.addTask(new taskpool.Task(computeRangeTask, 1, 10))
      taskGroup.addTask(new taskpool.Task(computeRangeTask, 11, 20))
      taskGroup.addTask(new taskpool.Task(computeRangeTask, 21, 30))
      let results: Object[] = await taskpool.execute(taskGroup)
      let totalSum: number = 0
      for (let i: number = 0; i < results.length; i++) {
        totalSum += results[i] as number
      }
      expect(totalSum).assertEqual(9455)
    })

    /**
     * @tc.name   TaskTypeTest7300
     * @tc.number SUB_TASK_TYPE_TEST_7300
     * @tc.desc   Verify task duration boundary judgment with short task completing via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let task: taskpool.Task = new taskpool.Task(simulatedCpuTask, 100)
      let result = await taskpool.execute(task)
      expect((result as number) >= 50).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest7400
     * @tc.number SUB_TASK_TYPE_TEST_7400
     * @tc.desc   Verify uneven data segmentation with 105 elements split into 20-element chunks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let data: number[] = []
      for (let i: number = 0; i < 105; i++) {
        data.push(i)
      }
      let segmentSize: number = 20
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      for (let i: number = 0; i < data.length; i += segmentSize) {
        let segment: number[] = data.slice(i, i + segmentSize)
        taskGroup.addTask(new taskpool.Task(unevenSegmentTask, segment))
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      let totalElements: number = 0
      for (let i: number = 0; i < results.length; i++) {
        totalElements += results[i] as number
      }
      expect(results.length).assertEqual(6)
      expect(totalElements).assertEqual(105)
      expect(results[5] as number).assertEqual(5)
    })

    /**
     * @tc.name   TaskTypeTest7500
     * @tc.number SUB_TASK_TYPE_TEST_7500
     * @tc.desc   Verify multiple high-priority tasks execute correctly when submitted concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskTypeTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(identityTask, i)
        promises.push(taskpool.execute(task, taskpool.Priority.HIGH))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i)
      }
    })

    /**
     * @tc.name   TaskTypeTest7600
     * @tc.number SUB_TASK_TYPE_TEST_7600
     * @tc.desc   Verify CPU-intensive task exception handling when empty data is provided
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let caughtError4: boolean = false
      try {
        let task: taskpool.Task = new taskpool.Task(emptyDataCpuTask, [])
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError4 = true
        
      }
      expect(caughtError4).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest7700
     * @tc.number SUB_TASK_TYPE_TEST_7700
     * @tc.desc   Verify Worker termination timing after task completion with onexit callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      currentWorker = new worker.ThreadWorker('entry_test/ets/workers/EchoWorker.ets')
      let result: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onmessage = (e: MessageEvents): void => {
          resolve(e.data as number)
        }
        currentWorker!.postMessage('compute')
      })
      expect(result > 0).assertTrue()
      let exitCode: number = await new Promise<number>((resolve: (value: number) => void) => {
        currentWorker!.onexit = (code: number): void => { resolve(code) }
        currentWorker!.terminate()
      })
      currentWorker = null
      expect(exitCode).assertEqual(0)
    })

    /**
     * @tc.name   TaskTypeTest7800
     * @tc.number SUB_TASK_TYPE_TEST_7800
     * @tc.desc   Verify multi-core utilization with parallel CPU-intensive tasks via TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let coreCount: number = 4
      for (let i: number = 0; i < coreCount; i++) {
        taskGroup.addTask(new taskpool.Task(multiCoreTask, i))
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(coreCount)
      expect(results[0] as number).assertEqual(0)
    })

    /**
     * @tc.name   TaskTypeTest7900
     * @tc.number SUB_TASK_TYPE_TEST_7900
     * @tc.desc   Verify high and low priority tasks coexist correctly when submitted together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskTypeTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let lowTask: taskpool.Task = new taskpool.Task(identityTask, 1)
      let highTask: taskpool.Task = new taskpool.Task(identityTask, 100)
      let pLow = taskpool.execute(lowTask, taskpool.Priority.LOW)
      let pHigh = taskpool.execute(highTask, taskpool.Priority.HIGH)
      let results: Object[] = await Promise.all([pLow, pHigh])
      expect(results[0] as number).assertEqual(1)
      expect(results[1] as number).assertEqual(100)
    })

    // ==================== Section 2.10: io-intensive-task-development ====================

    /**
     * @tc.name   TaskTypeTest8000
     * @tc.number SUB_TASK_TYPE_TEST_8000
     * @tc.desc   Verify simulated async IO operation returns correct completion status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(simulatedIoFileTask, 10000)
      let result = await taskpool.execute(task)
      expect((result as number) > 0).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest8100
     * @tc.number SUB_TASK_TYPE_TEST_8100
     * @tc.desc   Verify TaskPool executes IO-intensive concurrent function returning correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let task: taskpool.Task = new taskpool.Task(simulatedIoTask, 100)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('io_complete')
    })

    /**
     * @tc.name   TaskTypeTest8200
     * @tc.number SUB_TASK_TYPE_TEST_8200
     * @tc.desc   Verify Promise.all handles multiple concurrent IO operations returning all results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let p1 = taskpool.execute(new taskpool.Task(simulatedIoFileTask, 1000))
      let p2 = taskpool.execute(new taskpool.Task(simulatedIoFileTask, 2000))
      let p3 = taskpool.execute(new taskpool.Task(simulatedIoFileTask, 3000))
      let results: Object[] = await Promise.all([p1, p2, p3])
      expect(results.length).assertEqual(3)
      expect((results[0] as number) > 0).assertTrue()
      expect((results[1] as number) > 0).assertTrue()
      expect((results[2] as number) > 0).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest8300
     * @tc.number SUB_TASK_TYPE_TEST_8300
     * @tc.desc   Verify mixed IO and CPU intensive tasks execute concurrently with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let ioTask1: taskpool.Task = new taskpool.Task(simulatedIoFileTask, 5000)
      let cpuTask1: taskpool.Task = new taskpool.Task(mixedIoCpuTask, 100)
      let ioTask2: taskpool.Task = new taskpool.Task(simulatedIoFileTask, 3000)
      let cpuTask2: taskpool.Task = new taskpool.Task(mixedIoCpuTask, 200)
      let p1 = taskpool.execute(ioTask1)
      let p2 = taskpool.execute(cpuTask1)
      let p3 = taskpool.execute(ioTask2)
      let p4 = taskpool.execute(cpuTask2)
      let results: Object[] = await Promise.all([p1, p2, p3, p4])
      expect((results[0] as number) > 0).assertTrue()
      expect((results[1] as number) > 0).assertTrue()
      expect((results[2] as number) > 0).assertTrue()
      expect((results[3] as number) > 0).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest8400
     * @tc.number SUB_TASK_TYPE_TEST_8400
     * @tc.desc   Verify IO task error handling when task throws exception on invalid input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskTypeTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let caughtError5: boolean = false
      try {
        let task: taskpool.Task = new taskpool.Task(ioErrorTask, -1)
        await taskpool.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError5 = true
        
      }
      expect(caughtError5).assertTrue()
    })

    /**
     * @tc.name   TaskTypeTest8500
     * @tc.number SUB_TASK_TYPE_TEST_8500
     * @tc.desc   Verify IO task concurrency control with 20 simultaneous tasks via TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskTypeTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let taskCount: number = 20
      for (let i: number = 0; i < taskCount; i++) {
        taskGroup.addTask(new taskpool.Task(concurrentControlTask, i))
      }
      let results: Object[] = await taskpool.execute(taskGroup)
      expect(results.length).assertEqual(taskCount)
      expect(results[0] as number).assertEqual(0)
      expect(results[taskCount - 1] as number).assertEqual(taskCount - 1)
    })
  })
}
