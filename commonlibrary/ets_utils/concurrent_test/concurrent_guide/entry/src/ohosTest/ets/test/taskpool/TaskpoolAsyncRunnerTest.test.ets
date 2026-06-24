/*
 * Copyright (c) 2026 RKH Corp.
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

@Concurrent
function runnerBasicTask(id: number): number {
  return id * 2
}

@Concurrent
function runnerSlowTask(id: number): number {
  let sum: number = 0
  for (let i: number = 0; i < 1000000; i++) {
    sum += i
  }
  return id + sum
}

@Concurrent
function runnerErrorTask(): void {
  throw new Error('Task execution error')
}

@Concurrent
function runnerComputeTask(a: number, b: number): number {
  return a + b
}

@Concurrent
function runnerReturnTask(value: number): string {
  return 'result_' + value.toString()
}

export default function TaskpoolAsyncRunnerTest(): void {
  describe('TaskpoolAsyncRunnerTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await Promise.resolve()
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest0100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_0100
     * @tc.desc   Verify AsyncRunner creation with runningCapacity and basic task execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolAsyncRunnerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(3, 10)
      let task: taskpool.Task = new taskpool.Task(runnerBasicTask, 5)
      let result = await runner.execute(task)
      expect(result as number).assertEqual(10)
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest0200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_0200
     * @tc.desc   Verify AsyncRunner named constructor creates singleton queue with same name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolAsyncRunnerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner('namedRunner', 2, 5)
      let task: taskpool.Task = new taskpool.Task(runnerBasicTask, 10)
      let result = await runner.execute(task)
      expect(result as number).assertEqual(20)
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest0300
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_0300
     * @tc.desc   Verify AsyncRunner concurrency control with runningCapacity=2 executing 5 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolAsyncRunnerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 10)
      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(runnerBasicTask, i)
        promises.push(runner.execute(task))
      }
      let results: Array<Object> = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i * 2)
      }
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest0400
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_0400
     * @tc.desc   Verify AsyncRunner with waitingCapacity=0 allows unlimited queued tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolAsyncRunnerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 0)
      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.Task(runnerBasicTask, i)
        promises.push(runner.execute(task))
      }
      let results: Array<Object> = await Promise.all(promises)
      expect(results.length).assertEqual(10)
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest0500
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_0500
     * @tc.desc   Verify AsyncRunner task execution result correctness with string return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolAsyncRunnerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 5)
      let task: taskpool.Task = new taskpool.Task(runnerReturnTask, 42)
      let result = await runner.execute(task)
      expect(result as string).assertEqual('result_42')
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest0600
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_0600
     * @tc.desc   Verify AsyncRunner with zero runningCapacity throws parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolAsyncRunnerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let caughtError1: boolean = false
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(0, 10)
        expect().assertFail()
      } catch (e) {
        caughtError1 = true
        expect(e instanceof Error).assertTrue()
      }
      expect(caughtError1).assertTrue()
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest0700
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_0700
     * @tc.desc   Verify AsyncRunner with runningCapacity=1 executes tasks serially and correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolAsyncRunnerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 5)
      let task: taskpool.Task = new taskpool.Task(runnerBasicTask, 3)
      let result = await runner.execute(task)
      expect(result as number).assertEqual(6)
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest0800
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_0800
     * @tc.desc   Verify AsyncRunner with large runningCapacity exceeding thread limit works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolAsyncRunnerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(100, 10)
      let task: taskpool.Task = new taskpool.Task(runnerBasicTask, 7)
      let result = await runner.execute(task)
      expect(result as number).assertEqual(14)
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest0900
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_0900
     * @tc.desc   Verify AsyncRunner task execution exception caught by execute promise rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TaskpoolAsyncRunnerTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 5)
      let task: taskpool.Task = new taskpool.Task(runnerErrorTask)
      let caughtError2: boolean = false
      try {
        await runner.execute(task)
        expect().assertFail()
      } catch (e) {
        caughtError2 = true
        
      }
      expect(caughtError2).assertTrue()
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest1000
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_1000
     * @tc.desc   Verify AsyncRunner with Priority.HIGH executes task and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolAsyncRunnerTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(3, 10)
      let task: taskpool.Task = new taskpool.Task(runnerBasicTask, 15)
      let result = await runner.execute(task, taskpool.Priority.HIGH)
      expect(result as number).assertEqual(30)
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest1100
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_1100
     * @tc.desc   Verify multiple independent AsyncRunner instances execute tasks concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolAsyncRunnerTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let runner1: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 5)
      let runner2: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, 5)
      let task1: taskpool.Task = new taskpool.Task(runnerBasicTask, 10)
      let task2: taskpool.Task = new taskpool.Task(runnerBasicTask, 20)
      let p1 = runner1.execute(task1)
      let p2 = runner2.execute(task2)
      let results: Array<Object> = await Promise.all([p1, p2])
      expect(results[0] as number).assertEqual(20)
      expect(results[1] as number).assertEqual(40)
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest1200
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_1200
     * @tc.desc   Verify AsyncRunner sequential task execution with 8 tasks one by one
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolAsyncRunnerTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 10)
      let results = new collections.Array<number>()
      for (let i: number = 0; i < 8; i++) {
        let task: taskpool.Task = new taskpool.Task(runnerBasicTask, i)
        let result = await runner.execute(task)
        results.push(result as number)
      }
      expect(results.length).assertEqual(8)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(i * 2)
      }
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest1300
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_1300
     * @tc.desc   Verify AsyncRunner with negative waitingCapacity throws parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolAsyncRunnerTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let caughtError3: boolean = false
      try {
        let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(2, -1)
        expect().assertFail()
      } catch (e) {
        caughtError3 = true
        expect(e instanceof Error).assertTrue()
      }
      expect(caughtError3).assertTrue()
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest1400
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_1400
     * @tc.desc   Verify AsyncRunner compute task with two parameters returns correct sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolAsyncRunnerTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(3, 10)
      let task: taskpool.Task = new taskpool.Task(runnerComputeTask, 100, 200)
      let result = await runner.execute(task)
      expect(result as number).assertEqual(300)
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest1500
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_1500
     * @tc.desc   Verify AsyncRunner with large batch of 20 concurrent tasks completes all correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TaskpoolAsyncRunnerTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(5, 20)
      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 20; i++) {
        let task: taskpool.Task = new taskpool.Task(runnerBasicTask, i)
        promises.push(runner.execute(task))
      }
      let results: Array<Object> = await Promise.all(promises)
      expect(results.length).assertEqual(20)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i * 2)
      }
    })

    /**
     * @tc.name   TaskpoolAsyncRunnerTest1600
     * @tc.number SUB_TASKPOOL_ASYNC_RUNNER_TEST_1600
     * @tc.desc   Verify AsyncRunner with runningCapacity=1 executes tasks serially in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TaskpoolAsyncRunnerTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 10)
      let orderArr = new collections.Array<number>()
      let promises: Array<Promise<Object>> = []
      for (let i: number = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.Task(runnerBasicTask, i)
        let p = runner.execute(task)
        promises.push(p)
      }
      let results: Array<Object> = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i] as number).assertEqual(i * 2)
      }
    })
  })
}
