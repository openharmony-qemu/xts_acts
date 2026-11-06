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
import taskpool from '@ohos.taskpool';
import { BusinessError } from '@ohos.base';
import { ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../Utils';
import { ARSharedCounter, arCountFunc } from './AsyncRunnerExecuteTestInner';

@Concurrent
function simpleFunc(): number {
  return 42
}

@Concurrent
function addFunc(n: number): number {
  return n * 2
}

@Concurrent
function longFunc(duration: number): number {
  const start: number = Date.now()
  while (Date.now() - start < duration) {}
  return duration
}

@Concurrent
function errorFunc(): number {
  throw new Error('test error')
}

@Concurrent
function identityFunc(n: number): number {
  return n
}

@Concurrent
function stringFunc(): string {
  return 'hello'
}

@Concurrent
function arrayFunc(): number[] {
  return [1, 2, 3]
}

@Concurrent
function paramFunc(a: number, b: number): number {
  return a + b
}

@Concurrent
function priorityFunc(name: string): string {
  return name
}

@Concurrent
function nullReturnFunc(): Object | null {
  return null
}

@Concurrent
function voidReturnFunc(): void {
}

@Sendable
class SendableData {
  value: number = 0
}

@Concurrent
function sendableFunc(data: SendableData): number {
  return data.value
}

@Sendable
class ARMaxCounter {
  cur: number = 0
  max: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

// runtime arbitration 2026-09-06: unsynchronized cur++/cur-- on the shared Sendable
// counter raced across workers and transiently overcounted (max observed > capacity);
// enter/exit of the busy-wait window are now serialized with AsyncLock.lockAsync
@Concurrent
async function arMaxProbeFunc(counter: ARMaxCounter, duration: number): Promise<number> {
  await counter.lock.lockAsync<void>((): void => {
    counter.cur++
    if (counter.cur > counter.max) {
      counter.max = counter.cur
    }
  })
  const start: number = Date.now()
  while (Date.now() - start < duration) {}
  await counter.lock.lockAsync<void>((): void => {
    counter.cur--
  })
  return 42
}

// AsyncLock-protected increment (multi-worker safe, ref TaskpoolCancelGroupTest locked-counter pattern)
@Concurrent
function arSendDataFunc(): number {
  taskpool.Task.sendData(1)
  taskpool.Task.sendData(2)
  taskpool.Task.sendData(3)
  return 42
}

@Concurrent
async function arAsyncFunc(): Promise<number> {
  return 42
}

@Concurrent
function arBigDataFunc(data: number[]): number {
  return data.length
}

// ============ W5 F4 probe: AsyncRunner constructed inside @Concurrent body ==========

@Sendable
class ARProbeCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function arProbeExecConstructFunc(counter: ARProbeCounter): Promise<number> {
  const probeRunner = new taskpool.AsyncRunner(2)
  const probeTask = new taskpool.Task(arCountFunc, counter)
  try {
    await probeRunner.execute(probeTask)
    counter.count++
    return 1
  } catch (e) {
    return -1
  }
}

// 15s race guard so a wedged nested probe cannot hang the suite
async function arProbeTimeoutGuard(ms: number): Promise<Object> {
  const end: number = Date.now() + ms
  while (Date.now() < end) {
    await sleep(100)
  }
  return 'timeout'
}

export default function AsyncRunnerExecuteTest(): void {
  describe('AsyncRunnerExecuteTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0100
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_0100
     * @tc.desc   Verify execute(task) with single task parameter returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0200
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_0200
     * @tc.desc   Verify execute(task, Priority.HIGH) returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task, taskpool.Priority.HIGH)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0300
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_0300
     * @tc.desc   Verify execute(task, Priority.MEDIUM) returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task, taskpool.Priority.MEDIUM)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0400
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_0400
     * @tc.desc   Verify execute(task, Priority.LOW) returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task, taskpool.Priority.LOW)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0500
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_0500
     * @tc.desc   Verify execute(task, Priority.IDLE) returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task, taskpool.Priority.IDLE)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0600
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_0600
     * @tc.desc   Verify execute with Task carrying parameters passes args correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(paramFunc, 10, 20)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(30)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0700
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_0700
     * @tc.desc   Verify execute with Sendable parameter Task passes data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const data = new SendableData()
      data.value = 100
      const task = new taskpool.Task(sendableFunc, data)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0800
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_0800
     * @tc.desc   Verify execute without an explicit priority succeeds and returns the same result as an explicit MEDIUM priority execution (default priority itself is not observable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task1 = new taskpool.Task(simpleFunc)
      try {
        const result1 = await runner.execute(task1)
        const task2 = new taskpool.Task(simpleFunc)
        const result2 = await runner.execute(task2, taskpool.Priority.MEDIUM)
        expect(result1 as number).assertEqual(result2 as number)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest0900
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_0900
     * @tc.desc   Verify execute with numeric priority value 0 and 1 works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task1 = new taskpool.Task(simpleFunc)
      try {
        const result1 = await runner.execute(task1, 0)
        expect(result1 as number).assertEqual(42)
        const task2 = new taskpool.Task(simpleFunc)
        const result2 = await runner.execute(task2, 1)
        expect(result2 as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1000
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1000
     * @tc.desc   Verify await on execute returns task result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(addFunc, 5)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(10)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest1000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1100
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1100
     * @tc.desc   Verify execute returns number type result correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const result = await runner.execute(task)
        expect(typeof result).assertEqual('number')
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest1100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1200
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1200
     * @tc.desc   Verify execute returns string type result correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(stringFunc)
      try {
        const result = await runner.execute(task)
        expect(typeof result).assertEqual('string')
        expect(result as string).assertEqual('hello')
      } catch (error) {
        console.error('AsyncRunnerExecuteTest1200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1300
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1300
     * @tc.desc   Verify execute returns array type result correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(arrayFunc)
      try {
        const result = await runner.execute(task)
        expect(Array.isArray(result)).assertTrue()
        expect((result as number[]).length).assertEqual(3)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest1300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1400
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1400
     * @tc.desc   Verify execute returns null when task function returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(nullReturnFunc)
      try {
        const result = await runner.execute(task)
        expect(result === null).assertTrue()
      } catch (error) {
        console.error('AsyncRunnerExecuteTest1400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1500
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1500
     * @tc.desc   Verify execute with void-returning task resolves successfully and the runner continues with a subsequent valued task (void result converges to undefined per F7 arbitration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(voidReturnFunc)
      try {
        await runner.execute(task)
        const nextResult = await runner.execute(new taskpool.Task(simpleFunc))
        expect(nextResult as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest1500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1600
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1600
     * @tc.desc   Verify execute with multiple tasks all return correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const promises: Promise<Object>[] = []
      try {
        for (let i = 0; i < 5; i++) {
          promises.push(runner.execute(new taskpool.Task(addFunc, i)))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(5)
        for (let i = 0; i < 5; i++) {
          expect(results[i] as number).assertEqual(i * 2)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest1600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1700
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1700
     * @tc.desc   Verify execute throws error code 10200057 when executing already executed task (runtime arbitration: mindmap 10200006 is the serialization code, d.ts execute contract uses 10200057)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      try {
        await runner.execute(task)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest1700 failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        await runner.execute(task)
      } catch (e) {
        caught = true
        err = e
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      if (err !== null) {
        expect(err.code).assertEqual(10200057)
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1800
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1800
     * @tc.desc   Verify execute throws error code 10200025 when executing task with dependency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task1 = new taskpool.Task(simpleFunc)
      const task2 = new taskpool.Task(simpleFunc)
      task2.addDependency(task1)
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        await runner.execute(task2)
      } catch (e) {
        caught = true
        err = e
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      if (err !== null) {
        expect(err.code).assertEqual(10200025)
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest1900
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_1900
     * @tc.desc   Verify execute throws error 10200055 when executing canceled task (deterministic queue with capacity=1, runtime arbitration per d.ts asyncRunner cancel contract)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1)
      const blocker = new taskpool.Task(longFunc, 500)
      const blockerPromise = runner.execute(blocker)
      const target = new taskpool.Task(simpleFunc)
      const targetPromise = runner.execute(target)
      taskpool.cancel(target)
      let caught: boolean = false
      let cancelErr: BusinessError | null = null
      try {
        await targetPromise
      } catch (e) {
        caught = true
        cancelErr = e
      }
      expect(caught).assertTrue()
      expect(cancelErr !== null).assertTrue()
      if (cancelErr !== null) {
        expect(cancelErr.code).assertEqual(10200055)
      }
      try {
        await blockerPromise
      } catch (error) {
        console.error('AsyncRunnerExecuteTest1900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2000
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2000
     * @tc.desc   Verify execute throws error code 10200057 when task already executed by another AsyncRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner(3)
      const runner2 = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(longFunc, 2000)
      const p1 = runner1.execute(task)
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        await runner2.execute(task)
      } catch (e) {
        caught = true
        err = e
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      if (err !== null) {
        expect(err.code).assertEqual(10200057)
      }
      try {
        await p1
      } catch (error) {
        console.error('AsyncRunnerExecuteTest2000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2100
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2100
     * @tc.desc   Verify execute throws error code 10200057 when task state is invalid (already occupied by taskpool.execute)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(longFunc, 2000)
      const p1 = taskpool.execute(task)
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        await runner.execute(task)
      } catch (e) {
        caught = true
        err = e
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      if (err !== null) {
        expect(err.code).assertEqual(10200057)
      }
      try {
        await p1
      } catch (error) {
        console.error('AsyncRunnerExecuteTest2100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2200
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2200
     * @tc.desc   Verify execute discards tasks with error code 10200054 when waitingCapacity exceeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1, 2)
      const totalTasks: number = 6
      const promises: Promise<Object>[] = []
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(longFunc, 500)
        promises.push(runner.execute(task))
      }
      let successCount: number = 0
      let discardCount: number = 0
      let discardErr: BusinessError | null = null
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          successCount++
        } catch (e) {
          discardCount++
          discardErr = e
          if (discardErr !== null) {
            expect(discardErr.code).assertEqual(10200054)
          }
        }
      }
      expect(successCount + discardCount).assertEqual(totalTasks)
      expect(discardCount > 0).assertTrue()
      expect(successCount > 0).assertTrue()
      expect(discardErr !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2300
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2300
     * @tc.desc   Verify discard removes head-of-queue tasks when waitingCapacity exceeded
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1, 1)
      const totalTasks: number = 4
      const promises: Promise<Object>[] = []
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(longFunc, 500)
        promises.push(runner.execute(task))
      }
      let successCount: number = 0
      let discardCount: number = 0
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          successCount++
        } catch (e) {
          discardCount++
        }
      }
      expect(successCount + discardCount).assertEqual(totalTasks)
      expect(discardCount > 0).assertTrue()
      expect(successCount > 0).assertTrue()
      done()
    })


    /**
     * @tc.name   AsyncRunnerExecuteTest2400
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2400
     * @tc.desc   Verify execute throws error code 10200057 for task already bound to a SequenceRunner
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const seqRunner = new taskpool.SequenceRunner()
      const asyncRunner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(longFunc, 2000)
      const p1 = seqRunner.execute(task)
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        await asyncRunner.execute(task)
      } catch (e) {
        caught = true
        err = e
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      if (err !== null) {
        expect(err.code).assertEqual(10200057)
      }
      try {
        await p1
      } catch (error) {
        console.error('AsyncRunnerExecuteTest2400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2500
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2500
     * @tc.desc   Verify execute with invalid priority value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      let caught: boolean = false
      try {
        await runner.execute(task, 100)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2600
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2600
     * @tc.desc   Verify concurrent tasks complete within runningCapacity constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const taskCount: number = 10
      const promises: Promise<Object>[] = []
      try {
        for (let i = 0; i < taskCount; i++) {
          promises.push(runner.execute(new taskpool.Task(longFunc, 200)))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest2600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2700
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2700
     * @tc.desc   Verify runningCapacity=1 executes tasks sequentially
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1)
      const taskCount: number = 5
      const promises: Promise<Object>[] = []
      try {
        for (let i = 0; i < taskCount; i++) {
          promises.push(runner.execute(new taskpool.Task(identityFunc, i)))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
        for (let i = 0; i < taskCount; i++) {
          expect(results[i] as number).assertEqual(i)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest2700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2800
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2800
     * @tc.desc   Verify runningCapacity=4 executes 12 tasks successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(4)
      const taskCount: number = 12
      const promises: Promise<Object>[] = []
      try {
        for (let i = 0; i < taskCount; i++) {
          promises.push(runner.execute(new taskpool.Task(longFunc, 200)))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest2800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest2900
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_2900
     * @tc.desc   Verify 10 concurrent tasks all complete successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(5)
      const taskCount: number = 10
      const promises: Promise<Object>[] = []
      try {
        for (let i = 0; i < taskCount; i++) {
          promises.push(runner.execute(new taskpool.Task(identityFunc, i)))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest2900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3000
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3000
     * @tc.desc   Verify multiple AsyncRunner instances execute tasks independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner1 = new taskpool.AsyncRunner(2)
      const runner2 = new taskpool.AsyncRunner(3)
      const p1 = runner1.execute(new taskpool.Task(simpleFunc))
      const p2 = runner2.execute(new taskpool.Task(addFunc, 5))
      try {
        const result1 = await p1
        const result2 = await p2
        expect(result1 as number).assertEqual(42)
        expect(result2 as number).assertEqual(10)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest3000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3100
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3100
     * @tc.desc   Verify HIGH and LOW priority tasks both execute successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1, 2)
      const lowTask = new taskpool.Task(longFunc, 500)
      const lowPromise = runner.execute(lowTask, taskpool.Priority.LOW)
      const highTask = new taskpool.Task(simpleFunc)
      const highPromise = runner.execute(highTask, taskpool.Priority.HIGH)
      try {
        const highResult = await highPromise
        expect(highResult as number).assertEqual(42)
        await lowPromise
      } catch (error) {
        console.error('AsyncRunnerExecuteTest3100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3200
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3200
     * @tc.desc   Verify execute with mixed priorities all return correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(4)
      const pH = runner.execute(new taskpool.Task(priorityFunc, 'HIGH'), taskpool.Priority.HIGH)
      const pM = runner.execute(new taskpool.Task(priorityFunc, 'MEDIUM'), taskpool.Priority.MEDIUM)
      const pL = runner.execute(new taskpool.Task(priorityFunc, 'LOW'), taskpool.Priority.LOW)
      const pI = runner.execute(new taskpool.Task(priorityFunc, 'IDLE'), taskpool.Priority.IDLE)
      try {
        const rH = await pH
        const rM = await pM
        const rL = await pL
        const rI = await pI
        expect(rH as string).assertEqual('HIGH')
        expect(rM as string).assertEqual('MEDIUM')
        expect(rL as string).assertEqual('LOW')
        expect(rI as string).assertEqual('IDLE')
      } catch (error) {
        console.error('AsyncRunnerExecuteTest3200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3300
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3300
     * @tc.desc   Verify same priority tasks all complete correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1, 0)
      const taskCount: number = 5
      const promises: Promise<Object>[] = []
      try {
        for (let i = 0; i < taskCount; i++) {
          promises.push(runner.execute(new taskpool.Task(addFunc, i), taskpool.Priority.MEDIUM))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
        for (let i = 0; i < taskCount; i++) {
          expect(results[i] as number).assertEqual(i * 2)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest3300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3400
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3400
     * @tc.desc   Verify waitingCapacity=0 allows all tasks to succeed without discard
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 0)
      const taskCount: number = 10
      const promises: Promise<Object>[] = []
      try {
        for (let i = 0; i < taskCount; i++) {
          promises.push(runner.execute(new taskpool.Task(simpleFunc)))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest3400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3500
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3500
     * @tc.desc   Verify all tasks settled with success plus discard equals total count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1, 2)
      const totalTasks: number = 6
      const promises: Promise<Object>[] = []
      for (let i = 0; i < totalTasks; i++) {
        const task = new taskpool.Task(longFunc, 300)
        promises.push(runner.execute(task))
      }
      let successCount: number = 0
      let discardCount: number = 0
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          successCount++
        } catch (e) {
          discardCount++
        }
      }
      expect(successCount + discardCount).assertEqual(totalTasks)
      expect(discardCount > 0).assertTrue()
      expect(successCount > 0).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3600
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3600
     * @tc.desc   Verify execute returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(addFunc, 21)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest3600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3700
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3700
     * @tc.desc   Verify long-running task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(longFunc, 200)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(200)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest3700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3800
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3800
     * @tc.desc   Verify 100 tasks pressure test with counting wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(10, 0)
      const taskCount: number = 100
      let completedCount: number = 0
      let failureCount: number = 0
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        const task = new taskpool.Task(simpleFunc)
        promises.push(runner.execute(task))
      }
      // waitingCapacity=0 means unlimited waiting, so the single expected path
      // is success for every task; any failure must appear as a shortfall.
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          completedCount++
        } catch (e) {
          failureCount++
        }
      }
      expect(completedCount).assertEqual(taskCount)
      expect(failureCount).assertEqual(0)
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest3900
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_3900
     * @tc.desc   Verify high concurrency(50) pressure test with 60 tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(50, 0)
      const taskCount: number = 60
      const promises: Promise<Object>[] = []
      try {
        for (let i = 0; i < taskCount; i++) {
          promises.push(runner.execute(new taskpool.Task(simpleFunc)))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest3900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest4000
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4000
     * @tc.desc   Verify discard policy burst determinism: 30 instant tasks synchronously submitted into capacity(2,3) settle into exactly 5 executed (2 running + 3 waiting slots) and 25 discarded with code 10200054
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 3)
      const taskCount: number = 30
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        const task = new taskpool.Task(simpleFunc)
        promises.push(runner.execute(task))
      }
      let successCount: number = 0
      let discardCount: number = 0
      let discardErr: BusinessError | null = null
      // All 30 submissions complete inside one synchronous loop, so no worker
      // result can be processed before the loop ends: exactly running(2)+waiting(3)
      // submissions are accepted and the rest are discarded on arrival.
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          successCount++
        } catch (e) {
          discardCount++
          discardErr = e
          if (discardErr !== null) {
            expect(discardErr.code).assertEqual(10200054)
          }
        }
      }
      expect(successCount).assertEqual(5)
      expect(discardCount).assertEqual(taskCount - 5)
      expect(discardErr !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest4100
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4100
     * @tc.desc   Verify 1000 sequential executions return correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(5)
      const loopCount: number = 1000
      let lastResult: Object = new Object()
      try {
        lastResult = await runner.execute(new taskpool.Task(simpleFunc))
        for (let i = 1; i < loopCount; i++) {
          lastResult = await runner.execute(new taskpool.Task(simpleFunc))
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest4100 failed');
        expect(false).assertFail();
      }
      expect(lastResult as number).assertEqual(42)
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest4200
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4200
     * @tc.desc   Verify nested execute after successful task completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      try {
        const outerResult = await runner.execute(new taskpool.Task(simpleFunc))
        expect(outerResult as number).assertEqual(42)
        const innerResult = await runner.execute(new taskpool.Task(addFunc, outerResult as number))
        expect(innerResult as number).assertEqual(84)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest4200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest4300
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4300
     * @tc.desc   Verify nested execute after failed task still works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      let caught: boolean = false
      try {
        await runner.execute(new taskpool.Task(errorFunc))
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      try {
        const innerResult = await runner.execute(new taskpool.Task(simpleFunc))
        expect(innerResult as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest4300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest4400
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4400
     * @tc.desc   Verify nested execute after void task with multiple inner tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      try {
        await runner.execute(new taskpool.Task(voidReturnFunc))
        const promises: Promise<Object>[] = []
        for (let i = 0; i < 3; i++) {
          promises.push(runner.execute(new taskpool.Task(addFunc, i)))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(results[0] as number).assertEqual(0)
        expect(results[1] as number).assertEqual(2)
        expect(results[2] as number).assertEqual(4)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest4400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest4500
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4500
     * @tc.desc   Verify multiple tasks complete correctly with concurrency=3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3, 0)
      const taskCount: number = 6
      const promises: Promise<Object>[] = []
      try {
        for (let i = 0; i < taskCount; i++) {
          promises.push(runner.execute(new taskpool.Task(addFunc, i)))
        }
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest4500 failed');
        expect(false).assertFail();
      }
      done()
    })


    /**
     * @tc.name   AsyncRunnerExecuteTest4600
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4600
     * @tc.desc   Verify chain nested sequential execution produces correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      let chainCount: number = 0
      const chainLength: number = 3
      try {
        const r1 = await runner.execute(new taskpool.Task(simpleFunc))
        chainCount++
        expect(r1 as number).assertEqual(42)
        const r2 = await runner.execute(new taskpool.Task(simpleFunc))
        chainCount++
        expect(r2 as number).assertEqual(42)
        const r3 = await runner.execute(new taskpool.Task(simpleFunc))
        chainCount++
        expect(r3 as number).assertEqual(42)
        expect(chainCount).assertEqual(chainLength)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest4600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest4700
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4700
     * @tc.desc   Verify execute with non-Task argument (null/undefined/object) throws error 401 per input
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      let err: BusinessError | null = null
      try {
        const badTask: ESObject = null
        await runner.execute(badTask)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()

      err = null
      try {
        const badTask: ESObject = undefined
        await runner.execute(badTask)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()

      err = null
      try {
        const badTask: ESObject = new Object()
        await runner.execute(badTask)
      } catch (e) {
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(err !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest4800
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4800
     * @tc.desc   Verify execute with string priority throws error 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        const badPriority: ESObject = 'HIGH'
        await runner.execute(task, badPriority)
      } catch (e) {
        caught = true
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest4900
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_4900
     * @tc.desc   Verify execute return value resolves to the task result through its thenable (Promise contract per d.ts)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AsyncRunnerExecuteTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      try {
        const promise = runner.execute(task)
        const result = await promise
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest4900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5000
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5000
     * @tc.desc   Verify concurrent function returning Promise chains result 42 through AsyncRunner.execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(arAsyncFunc)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5100
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5100
     * @tc.desc   Verify TaskGroup passed to AsyncRunner.execute throws error 401 (task group cannot be added to async queue, param-type arbitration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const group = new taskpool.TaskGroup()
      group.addTask(simpleFunc)
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        const groupAsTask: ESObject = group
        await runner.execute(groupAsTask)
      } catch (e) {
        caught = true
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(401)
        }
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5200
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5200
     * @tc.desc   Verify periodic task passed to AsyncRunner.execute throws error code 10200051 per d.ts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const periodicTask = new taskpool.Task(simpleFunc)
      taskpool.executePeriodically(100, periodicTask)
      try {
        let caught: boolean = false
        let err: BusinessError | null = null
        try {
          await runner.execute(periodicTask)
        } catch (e) {
          caught = true
          err = e
          if (err !== null) {
            expect(err.code).assertEqual(10200051)
          }
        }
        expect(caught).assertTrue()
        expect(err !== null).assertTrue()
      } finally {
        // Always stop the periodic task so a mid-case failure cannot leak a
        // timer that keeps firing into subsequent cases.
        taskpool.cancel(periodicTask)
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5300
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5300
     * @tc.desc   Verify delayed task passed to AsyncRunner.execute throws error code 10200057 (runtime arbitration: task occupied by executeDelayed API)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const delayedTask = new taskpool.Task(simpleFunc)
      const delayedPromise = taskpool.executeDelayed(1000, delayedTask)
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        await runner.execute(delayedTask)
      } catch (e) {
        caught = true
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(10200057)
        }
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      taskpool.cancel(delayedTask)
      try {
        await delayedPromise
      } catch (e) {
        console.info(`AsyncRunnerExecuteTest.test.ets delayed cleanup catch: ${JSON.stringify(e)}`)
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5400
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5400
     * @tc.desc   Verify max concurrent execution count does not exceed runningCapacity=3 via AsyncLock-protected Sendable counter observation (runtime arbitration 2026-09-06: raw counter increments raced and transiently overcounted, lock-protected enter/exit keeps max a true concurrency measure)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const counter = new ARMaxCounter()
      const taskCount: number = 6
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(arMaxProbeFunc, counter, 120)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5400 failed');
        expect(false).assertFail();
      }
      expect(counter.max <= 3).assertTrue()
      expect(counter.max >= 1).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5500
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5500
     * @tc.desc   Verify head-of-queue discard identity: earlier queued tasks rejected with 10200054 while newest submission survives with its own result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(1, 1)
      const blockerPromise = runner.execute(new taskpool.Task(longFunc, 300))
      const pA = runner.execute(new taskpool.Task(identityFunc, 11))
      const pB = runner.execute(new taskpool.Task(identityFunc, 22))
      const pC = runner.execute(new taskpool.Task(identityFunc, 33))
      const pD = runner.execute(new taskpool.Task(identityFunc, 44))
      let discardCount: number = 0
      let discardErr: BusinessError | null = null
      const rejected: Promise<Object>[] = [pA, pB, pC]
      for (let i = 0; i < rejected.length; i++) {
        try {
          await rejected[i]
          console.error('AsyncRunnerExecuteTest5500 rejected promise resolved unexpectedly')
          expect(false).assertFail()
        } catch (e) {
          discardCount++
          discardErr = e
          if (discardErr !== null) {
            expect(discardErr.code).assertEqual(10200054)
          }
        }
      }
      expect(discardCount).assertEqual(3)
      expect(discardErr !== null).assertTrue()
      try {
        const survivor = await pD
        expect(survivor as number).assertEqual(44)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5500 survivor failed');
        expect(false).assertFail();
      }
      try {
        await blockerPromise
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5500 blocker failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5600
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5600
     * @tc.desc   Verify sendData from task executed by AsyncRunner triggers onReceiveData three times with values 1 2 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(arSendDataFunc)
      const received: number[] = []
      task.onReceiveData((data: Object): void => {
        received.push(data as number)
      })
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5600 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      while (received.length < 3 && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(received.length).assertEqual(3)
      expect(received[0]).assertEqual(1)
      expect(received[1]).assertEqual(2)
      expect(received[2]).assertEqual(3)
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5700
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5700
     * @tc.desc   Verify onEnqueued callback triggers when task joins AsyncRunner queue and nested execute inside callback completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      let triggered: boolean = false
      let nestedPromise: Promise<Object> | null = null
      const onEnqueued = (): void => {
        triggered = true
        nestedPromise = runner.execute(new taskpool.Task(simpleFunc))
      }
      task.onEnqueued(onEnqueued)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5700 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      while (nestedPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(triggered).assertTrue()
      try {
        if (nestedPromise !== null) {
          const nestedResult = await nestedPromise
          expect(nestedResult as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5700 nested failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5800
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5800
     * @tc.desc   Verify onStartExecution callback triggers when task actually starts and nested execute inside callback completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      let triggered: boolean = false
      let nestedPromise: Promise<Object> | null = null
      const onStartExec = (): void => {
        triggered = true
        nestedPromise = runner.execute(new taskpool.Task(simpleFunc))
      }
      task.onStartExecution(onStartExec)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5800 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      while (nestedPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(triggered).assertTrue()
      try {
        if (nestedPromise !== null) {
          const nestedResult = await nestedPromise
          expect(nestedResult as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5800 nested failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest5900
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_5900
     * @tc.desc   Verify onExecutionFailed callback triggers on task failure and nested execute inside callback completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(errorFunc)
      let triggered: boolean = false
      let nestedPromise: Promise<Object> | null = null
      const onFailed = (): void => {
        triggered = true
        nestedPromise = runner.execute(new taskpool.Task(simpleFunc))
      }
      task.onExecutionFailed(onFailed)
      let caught: boolean = false
      try {
        await runner.execute(task)
      } catch (e) {
        caught = true
      }
      expect(caught).assertTrue()
      let waited: number = 0
      while (nestedPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(triggered).assertTrue()
      try {
        if (nestedPromise !== null) {
          const nestedResult = await nestedPromise
          expect(nestedResult as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest5900 nested failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest6000
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_6000
     * @tc.desc   Verify onExecutionSucceeded callback triggers on task success and nested execute inside callback completes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const task = new taskpool.Task(simpleFunc)
      let triggered: boolean = false
      let nestedPromise: Promise<Object> | null = null
      const onSuccess = (): void => {
        triggered = true
        nestedPromise = runner.execute(new taskpool.Task(simpleFunc))
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        const result = await runner.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest6000 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      while (nestedPromise === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(triggered).assertTrue()
      try {
        if (nestedPromise !== null) {
          const nestedResult = await nestedPromise
          expect(nestedResult as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest6000 nested failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest6100
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_6100
     * @tc.desc   Verify high concurrency stress with runningCapacity=50 and 100 tasks all complete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(50, 0)
      const taskCount: number = 100
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(simpleFunc)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
        for (let i = 0; i < taskCount; i++) {
          expect(results[i] as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest6100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest6200
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_6200
     * @tc.desc   Verify discard policy stress with 50 tasks and separately counted success and discard outcomes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(2, 3)
      const taskCount: number = 50
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(longFunc, 150)))
      }
      let successCount: number = 0
      let discardCount: number = 0
      for (let i = 0; i < promises.length; i++) {
        try {
          await promises[i]
          successCount++
        } catch (e) {
          discardCount++
          console.info(`AsyncRunnerExecuteTest.test.ets catch error: ${JSON.stringify(e)}`)
        }
      }
      expect(successCount + discardCount).assertEqual(taskCount)
      expect(discardCount > 0).assertTrue()
      expect(successCount > 0).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest6300
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_6300
     * @tc.desc   Verify Sendable shared counter statistics with concurrency 5 and 10 tasks count exactly 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(5)
      const counter = new ARSharedCounter()
      const taskCount: number = 10
      const promises: Promise<Object>[] = []
      for (let i = 0; i < taskCount; i++) {
        promises.push(runner.execute(new taskpool.Task(arCountFunc, counter)))
      }
      try {
        const results = await Promise.all(promises)
        expect(results.length).assertEqual(taskCount)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest6300 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(taskCount)
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest6400
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_6400
     * @tc.desc   Verify two-stage callback chain nesting via onExecutionSucceeded completes all chained tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3, 10)
      let chainCount: number = 0
      let p2: Promise<Object> | null = null
      let p3: Promise<Object> | null = null
      const task1 = new taskpool.Task(simpleFunc)
      task1.onExecutionSucceeded((): void => {
        chainCount++
        const task2 = new taskpool.Task(simpleFunc)
        task2.onExecutionSucceeded((): void => {
          chainCount++
          p3 = runner.execute(new taskpool.Task(addFunc, 21))
        })
        p2 = runner.execute(task2)
      })
      try {
        const r1 = await runner.execute(task1)
        expect(r1 as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest6400 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      while (p2 === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      try {
        if (p2 !== null) {
          const r2 = await p2
          expect(r2 as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest6400 stage2 failed');
        expect(false).assertFail();
      }
      waited = 0
      while (p3 === null && waited < 5000) {
        await sleep(100)
        waited += 100
      }
      expect(chainCount).assertEqual(2)
      try {
        if (p3 !== null) {
          const r3 = await p3
          expect(r3 as number).assertEqual(42)
        }
      } catch (error) {
        console.error('AsyncRunnerExecuteTest6400 stage3 failed');
        expect(false).assertFail();
      }
      expect(chainCount).assertEqual(2)
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest6500
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_6500
     * @tc.desc   Verify AsyncRunner.execute with task argument over 16M serialization limit throws error code 10200006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      let bigData: number[] = new Array<number>(2 * 1024 * 1024)
      for (let i: number = 0; i < bigData.length; i++) {
        bigData[i] = i
      }
      let caught: boolean = false
      let err: BusinessError | null = null
      try {
        await runner.execute(new taskpool.Task(arBigDataFunc, bigData))
      } catch (e) {
        caught = true
        err = e
        if (err !== null) {
          expect(err.code).assertEqual(10200006)
        }
      }
      expect(caught).assertTrue()
      expect(err !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest6600
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_6600
     * @tc.desc   Verify F4 probe: a @Concurrent function body constructs an AsyncRunner and executes an inner task through it while collecting module-level Sendable counts; host polls up to 5s and asserts inner increment plus outer success marker both landed exactly (count == 2, result == 1); 15s race guard prevents a wedged probe from hanging (M15b ex#052; if infeasible at runtime the main workflow converts it to NAC with run evidence)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncRunnerExecuteTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const counter: ARProbeCounter = new ARProbeCounter()
      const probeTask = new taskpool.Task(arProbeExecConstructFunc, counter)
      let probeResult: Object = 'timeout'
      try {
        probeResult = await Promise.race([taskpool.execute(probeTask), arProbeTimeoutGuard(15000)])
      } catch (error) {
        console.info(`AsyncRunnerExecuteTest6600 probe rejected: ${JSON.stringify(error)}`)
        probeResult = 'rejected'
      }
      let waited6600: number = 0
      while (counter.count < 2 && waited6600 < 5000) {
        await sleep(100)
        waited6600 += 100
      }
      expect(probeResult as number).assertEqual(1)
      expect(counter.count).assertEqual(2)
      done()
    })

    /**
     * @tc.name   AsyncRunnerExecuteTest6700
     * @tc.number SUB_ASYNC_RUNNER_EXECUTE_TEST_6700
     * @tc.desc   Verify a GenericsTask instance executed through AsyncRunner.execute returns the exact generic result (M14b #087/#088; GenericsTask subclass instance enqueued into an async Runner)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AsyncRunnerExecuteTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const runner = new taskpool.AsyncRunner(3)
      const genTask = new taskpool.GenericsTask<[number], number>(addFunc, 21)
      try {
        const result = await runner.execute(genTask)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('AsyncRunnerExecuteTest6700 failed');
        expect(false).assertFail();
      }
      done()
    })
  })
}
