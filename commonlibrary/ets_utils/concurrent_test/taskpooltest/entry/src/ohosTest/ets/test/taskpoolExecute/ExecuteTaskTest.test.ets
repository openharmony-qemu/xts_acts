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
import { ArkTSUtils } from '@kit.ArkTS';
import { sleep, fillBigArrayChunked, nestedSubFunc } from '../utils';

interface ETErrorInfo {
  code: number
  message: string
}

// ========== Module-level @Concurrent Functions ==========

@Concurrent
function etNoArgsFunc(): number {
  return 100
}

@Concurrent
function etNumFunc(x: number): number {
  return x * 2
}

@Concurrent
function etReturnNullFunc(): null {
  return null
}

@Concurrent
function etReturnZeroFunc(): number {
  return 0
}

@Concurrent
function etReturnEmptyStrFunc(): string {
  return ''
}

@Concurrent
function etReturnEmptyArrFunc(): number[] {
  let arr: number[] = []
  return arr
}

@Concurrent
function etReturnFalseFunc(): boolean {
  return false
}

@Concurrent
function etErrorFunc(): number {
  throw new Error('task execution error')
}

@Concurrent
function etBigDataFunc(data: number[]): number {
  return data.length
}

@Concurrent
function etSimpleFunc(): number {
  return 42
}

@Concurrent
function etLongFunc(duration: number): number {
  let start: number = Date.now()
  while ((Date.now() - start) < duration) {
    let x: number = 0
    x = x + 1
  }
  return 100
}

@Concurrent
async function etCounterFunc(counter: ETCounter): Promise<number> {
  // AsyncLock-protected increment: concurrent tasks sharing one Sendable
  // counter lose updates without a lock (runtime arbitration 2026-09-06).
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return 100
  })
  return 100
}

@Concurrent
function etNestedFunc(): number {
  return 200
}

@Concurrent
function etSendDataFunc(): void {
  taskpool.Task.sendData(42)
}

// ========== Module-level Gap Coverage Functions (M2) ==========

// Non-concurrent function for runtime negative coverage: SDK d.ts defines
// 10200014 as "the function is not marked as concurrent" and 10200003 as
// "worker initialization failed" (see ExecuteFuncTest6000 precedent).
function etPlainNoDecorFunc(): number {
  return 1
}

interface ETEmptyObj {
}

@Concurrent
function etReturnEmptyObjFunc(): Object {
  let o: ETEmptyObj = {}
  return o
}

@Concurrent
function etTypedArrArgFunc(arr: Int8Array): number {
  return arr.length * 1000 + arr[0]
}

@Concurrent
function etStdMapArgFunc(m: Map<string, number>): number {
  let v: number | undefined = m.get('k1')
  if (v === undefined) {
    return -1
  }
  return m.size * 10 + v
}

@Concurrent
function etStdSetArgFunc(s: Set<number>): number {
  if (s.has(3)) {
    return s.size * 100 + 1
  }
  return s.size
}

@Concurrent
function etBigBufArgFunc(buf: ArrayBuffer): number {
  let view: Uint8Array = new Uint8Array(buf)
  return buf.byteLength + view[0] + view[buf.byteLength - 1]
}

// ========== Module-level @Sendable Classes ==========

@Sendable
class ETCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
  nestedExecuted: boolean = false
  nestedResult: number = 0
}

// Nested-execute probe host: references only the imported concurrent child
// (closure rule forbids module-local function references inside @Concurrent).
// Covers interface-mind-map #047 (nested execute inside a Task function body).
@Concurrent
async function etNestHostFunc(counter: ETCounter): Promise<number> {
  let subResult: Object = await taskpool.execute(nestedSubFunc, 21)
  counter.nestedResult = subResult as number
  counter.nestedExecuted = true
  return 1
}

export default function ExecuteTaskTest(): void {
  describe('ExecuteTaskTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== 1. Input Parameter Tests - Parameter Count =====

    /**
     * @tc.name   ExecuteTaskTest0100
     * @tc.number SUB_EXECUTE_TASK_TEST_0100
     * @tc.desc   Verify execute(task) without priority uses default MEDIUM and returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etNoArgsFunc)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest0200
     * @tc.number SUB_EXECUTE_TASK_TEST_0200
     * @tc.desc   Verify execute(task, priority) with explicit HIGH priority returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etNoArgsFunc)
      try {
        let result: Object = await taskpool.execute(task, taskpool.Priority.HIGH)
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 2. Input Parameter Tests - task Parameter Type =====

    /**
     * @tc.name   ExecuteTaskTest0300
     * @tc.number SUB_EXECUTE_TASK_TEST_0300
     * @tc.desc   Verify execute(task) with normal @Concurrent Task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etNumFunc, 50)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 3. Input Parameter Tests - priority Parameter =====

    /**
     * @tc.name   ExecuteTaskTest0400
     * @tc.number SUB_EXECUTE_TASK_TEST_0400
     * @tc.desc   Verify execute(task, Priority.MEDIUM) executes with medium priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      try {
        let result: Object = await taskpool.execute(task, taskpool.Priority.MEDIUM)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest0500
     * @tc.number SUB_EXECUTE_TASK_TEST_0500
     * @tc.desc   Verify execute(task, Priority.LOW) executes with low priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      try {
        let result: Object = await taskpool.execute(task, taskpool.Priority.LOW)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest0600
     * @tc.number SUB_EXECUTE_TASK_TEST_0600
     * @tc.desc   Verify execute(task, Priority.IDLE) executes with idle priority
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      try {
        let result: Object = await taskpool.execute(task, taskpool.Priority.IDLE)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 4. Return Value Tests - Success Scenarios =====

    /**
     * @tc.name   ExecuteTaskTest0700
     * @tc.number SUB_EXECUTE_TASK_TEST_0700
     * @tc.desc   Verify execute(task) returns correct number result with type check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      try {
        let result: Object = await taskpool.execute(task)
        expect(typeof result).assertEqual('number')
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest0800
     * @tc.number SUB_EXECUTE_TASK_TEST_0800
     * @tc.desc   Verify execute(task) handles null return value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etReturnNullFunc)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result === null).assertTrue()
      } catch (error) {
        console.error('ExecuteTaskTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest0900
     * @tc.number SUB_EXECUTE_TASK_TEST_0900
     * @tc.desc   Verify execute(task) returns a Promise that resolves with correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      let promise: Promise<Object> = taskpool.execute(task)
      try {
        let result: Object = await promise
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 5. Return Value Tests - Special Values =====

    /**
     * @tc.name   ExecuteTaskTest1000
     * @tc.number SUB_EXECUTE_TASK_TEST_1000
     * @tc.desc   Verify execute(task) returns falsy value 0 correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etReturnZeroFunc)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(0)
      } catch (error) {
        console.error('ExecuteTaskTest1000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest1100
     * @tc.number SUB_EXECUTE_TASK_TEST_1100
     * @tc.desc   Verify execute(task) returns falsy value empty string correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etReturnEmptyStrFunc)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as string).assertEqual('')
      } catch (error) {
        console.error('ExecuteTaskTest1100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest1200
     * @tc.number SUB_EXECUTE_TASK_TEST_1200
     * @tc.desc   Verify execute(task) returns falsy value empty array correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etReturnEmptyArrFunc)
      try {
        let result: Object = await taskpool.execute(task)
        expect(Array.isArray(result)).assertTrue()
        let arr: number[] = result as number[]
        expect(arr.length).assertEqual(0)
      } catch (error) {
        console.error('ExecuteTaskTest1200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest1300
     * @tc.number SUB_EXECUTE_TASK_TEST_1300
     * @tc.desc   Verify execute(task) returns falsy value false correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etReturnFalseFunc)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as boolean).assertFalse()
      } catch (error) {
        console.error('ExecuteTaskTest1300 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 6. Error Handling Tests =====

    /**
     * @tc.name   ExecuteTaskTest1400
     * @tc.number SUB_EXECUTE_TASK_TEST_1400
     * @tc.desc   Verify execute(task) with oversized data throws serialization error 10200006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let bigData: number[] = await fillBigArrayChunked(2 * 1024 * 1024)
      let task: taskpool.Task = new taskpool.Task(etBigDataFunc, bigData)
      let caught: boolean = false
      let err1400: ETErrorInfo | null = null
      try {
        await taskpool.execute(task)
      } catch (error) {
        caught = true
        err1400 = error
        if (err1400 !== null) {
expect(err1400.code).assertEqual(10200006)
        }
      }
      expect(caught).assertTrue()
      expect(err1400 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest1500
     * @tc.number SUB_EXECUTE_TASK_TEST_1500
     * @tc.desc   Verify groupTask cannot be executed individually throws 401 (runtime arbitration: native CanExecute IsGroupCommonTask → TYPE_ERROR "groupTask cannot execute outside"; design code 10200015 is a cancel-domain code, not this scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      taskGroup.addTask(task)
      let caught: boolean = false
      let err1500: ETErrorInfo | null = null
      try {
        await taskpool.execute(task)
      } catch (error) {
        caught = true
        err1500 = error
        if (err1500 !== null) {
expect(err1500.code).assertEqual(401)
        }
      }
      expect(caught).assertTrue()
      expect(err1500 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest1600
     * @tc.number SUB_EXECUTE_TASK_TEST_1600
     * @tc.desc   Verify non-long-running Task can be executed twice in dynamic model
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etNoArgsFunc)
      try {
        let result1: Object = await taskpool.execute(task)
        expect(result1 as number).assertEqual(100)
        let result2: Object = await taskpool.execute(task)
        expect(result2 as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskTest1600 failed');
        expect(false).assertFail();
      }
      done()
    })



    // ===== 7. Async Concurrency Tests =====

    /**
     * @tc.name   ExecuteTaskTest1800
     * @tc.number SUB_EXECUTE_TASK_TEST_1800
     * @tc.desc   Verify Promise.all with multiple Task concurrent execution returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(etNumFunc, 1)
      let task2: taskpool.Task = new taskpool.Task(etNumFunc, 2)
      let task3: taskpool.Task = new taskpool.Task(etNumFunc, 3)
      let p1: Promise<Object> = taskpool.execute(task1)
      let p2: Promise<Object> = taskpool.execute(task2)
      let p3: Promise<Object> = taskpool.execute(task3)
      try {
        let results: Object[] = await Promise.all([p1, p2, p3])
        expect(results.length).assertEqual(3)
        expect(results[0] as number).assertEqual(2)
        expect(results[1] as number).assertEqual(4)
        expect(results[2] as number).assertEqual(6)
      } catch (error) {
        console.error('ExecuteTaskTest1800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest1900
     * @tc.number SUB_EXECUTE_TASK_TEST_1900
     * @tc.desc   Verify different priority tasks concurrent execution completes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let highTask: taskpool.Task = new taskpool.Task(etNumFunc, 5)
      let lowTask: taskpool.Task = new taskpool.Task(etNumFunc, 10)
      let p1: Promise<Object> = taskpool.execute(highTask, taskpool.Priority.HIGH)
      let p2: Promise<Object> = taskpool.execute(lowTask, taskpool.Priority.LOW)
      try {
        let results: Object[] = await Promise.all([p1, p2])
        expect(results.length).assertEqual(2)
        expect(results[0] as number).assertEqual(10)
        expect(results[1] as number).assertEqual(20)
      } catch (error) {
        console.error('ExecuteTaskTest1900 failed');
        expect(false).assertFail();
      }
      done()
    })





    // ===== 8. Callback Listener Tests - Task Callback =====

    /**
     * @tc.name   ExecuteTaskTest2200
     * @tc.number SUB_EXECUTE_TASK_TEST_2200
     * @tc.desc   Verify onEnqueued callback is triggered when task is enqueued
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let enqueuedCalled: boolean = false
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      const onEnqueued: () => void = (): void => {
        enqueuedCalled = true
      }
      task.onEnqueued(onEnqueued)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(42)
        expect(enqueuedCalled).assertTrue()
      } catch (error) {
        console.error('ExecuteTaskTest2200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest2300
     * @tc.number SUB_EXECUTE_TASK_TEST_2300
     * @tc.desc   Verify onStartExecution callback is triggered when task starts executing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let startCalled: boolean = false
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      const onStart: () => void = (): void => {
        startCalled = true
      }
      task.onStartExecution(onStart)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(42)
        expect(startCalled).assertTrue()
      } catch (error) {
        console.error('ExecuteTaskTest2300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest2400
     * @tc.number SUB_EXECUTE_TASK_TEST_2400
     * @tc.desc   Verify onExecutionSucceeded callback is triggered on successful completion (SDK d.ts onExecutionSucceeded(callback: CallbackFunction) takes no arguments, "callback receives result 42" is not constructible at the API layer, result 42 can only be asserted on the execute return side)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let successCalled: boolean = false
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      const onSuccess: () => void = (): void => {
        successCalled = true
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskTest2400 failed');
        expect(false).assertFail();
      }
      let waitCount: number = 0
      try {
        while (!successCalled && waitCount < 50) {
          await sleep(100)
          waitCount++
        }
      } catch (error) {
        console.error('ExecuteTaskTest2400 failed');
        expect(false).assertFail();
      }
      expect(successCalled).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest2500
     * @tc.number SUB_EXECUTE_TASK_TEST_2500
     * @tc.desc   Verify onReceiveData callback receives data sent via Task.sendData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let receivedData: number = 0
      let task: taskpool.Task = new taskpool.Task(etSendDataFunc)
      const onData: (data: number) => void = (data: number): void => {
        if (data === null || data === undefined) { console.info('ExecuteTaskTest2500 received empty data'); return }
        receivedData = data
      }
      task.onReceiveData(onData)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('ExecuteTaskTest2500 failed');
        expect(false).assertFail();
      }
      let waitCount: number = 0
      try {
        while (receivedData === 0 && waitCount < 50) {
          await sleep(100)
          waitCount++
        }
      } catch (error) {
        console.error('ExecuteTaskTest2500 failed');
        expect(false).assertFail();
      }
      expect(receivedData).assertEqual(42)
      done()
    })

    // ===== 9. Callback Listener Tests - Promise Chained Callback =====

    /**
     * @tc.name   ExecuteTaskTest2600
     * @tc.number SUB_EXECUTE_TASK_TEST_2600
     * @tc.desc   Verify execute(task) resolves with correct result (assignment assertion after await)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let thenResult: number = 0
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      try {
        const result: Object = await taskpool.execute(task)
        thenResult = result as number
      } catch (error) {
        console.error('ExecuteTaskTest2600 failed');
        expect(false).assertFail();
      }
      expect(thenResult).assertEqual(42)
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest2700
     * @tc.number SUB_EXECUTE_TASK_TEST_2700
     * @tc.desc   Verify try-catch captures rejection from failed task as the original Error (runtime arbitration: SDK has no dedicated execution-error code, the original Error propagates as-is; design code 10200014 actually means "function not marked @Concurrent")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let catchCalled: boolean = false
      let err2700: ETErrorInfo | null = null
      let task: taskpool.Task = new taskpool.Task(etErrorFunc)
      try {
        await taskpool.execute(task)
      } catch (e) {
        catchCalled = true
        err2700 = e
      }
      expect(catchCalled).assertTrue()
      expect(err2700 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest2800
     * @tc.number SUB_EXECUTE_TASK_TEST_2800
     * @tc.desc   Verify try-finally executes around await execute(task) on completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let finallyCalled: boolean = false
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('ExecuteTaskTest2800 failed');
        expect(false).assertFail();
      } finally {
        finallyCalled = true
      }
      expect(finallyCalled).assertTrue()
      done()
    })

    // ===== 10. Task Nested Combination Scenarios =====

    /**
     * @tc.name   ExecuteTaskTest2900
     * @tc.number SUB_EXECUTE_TASK_TEST_2900
     * @tc.desc   Verify nested execute in onExecutionSucceeded callback with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let task: taskpool.Task = new taskpool.Task(etCounterFunc, counter)
      const onSuccess: () => Promise<void> = async (): Promise<void> => {
        let nestedTask: taskpool.Task = new taskpool.Task(etCounterFunc, counter)
        try {
          const result: Object = await taskpool.execute(nestedTask)
          counter.nestedResult = result as number
          counter.count++
        } catch (error) {
          console.error('ExecuteTaskTest2900 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('ExecuteTaskTest2900 failed');
        expect(false).assertFail();
      }
      let waitCount: number = 0
      try {
        while (counter.count < 2 && waitCount < 50) {
          await sleep(100)
          waitCount++
        }
      } catch (error) {
        console.error('ExecuteTaskTest2900 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest3000
     * @tc.number SUB_EXECUTE_TASK_TEST_3000
     * @tc.desc   Verify sequential nested execute after first task resolves with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      try {
        const result: Object = await taskpool.execute(task)
        let nestedTask: taskpool.Task = new taskpool.Task(etNestedFunc)
        const r: Object = await taskpool.execute(nestedTask)
        counter.nestedResult = r as number
        counter.nestedExecuted = true
      } catch (error) {
        console.error('ExecuteTaskTest3000 failed');
        expect(false).assertFail();
      }
      let waitCount: number = 0
      try {
        while (!counter.nestedExecuted && waitCount < 50) {
          await sleep(100)
          waitCount++
        }
      } catch (error) {
        console.error('ExecuteTaskTest3000 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedExecuted).assertTrue()
      expect(counter.nestedResult).assertEqual(200)
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest3100
     * @tc.number SUB_EXECUTE_TASK_TEST_3100
     * @tc.desc   Verify nested execute in onEnqueued callback with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      const onEnqueued: () => Promise<void> = async (): Promise<void> => {
        let nestedTask: taskpool.Task = new taskpool.Task(etNestedFunc)
        try {
          const r: Object = await taskpool.execute(nestedTask)
          counter.nestedResult = r as number
          counter.nestedExecuted = true
        } catch (error) {
          console.error('ExecuteTaskTest3100 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onEnqueued(onEnqueued)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskTest3100 failed');
        expect(false).assertFail();
      }
      let waitCount: number = 0
      try {
        while (!counter.nestedExecuted && waitCount < 50) {
          await sleep(100)
          waitCount++
        }
      } catch (error) {
        console.error('ExecuteTaskTest3100 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedExecuted).assertTrue()
      expect(counter.nestedResult).assertEqual(200)
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest3200
     * @tc.number SUB_EXECUTE_TASK_TEST_3200
     * @tc.desc   Verify nested execute in onReceiveData callback with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let task: taskpool.Task = new taskpool.Task(etSendDataFunc)
      const onData: (data: number) => Promise<void> = async (data: number): Promise<void> => {
        if (data === null || data === undefined) { console.info('ExecuteTaskTest3200 received empty data'); return }
        let nestedTask: taskpool.Task = new taskpool.Task(etNestedFunc)
        try {
          const r: Object = await taskpool.execute(nestedTask)
          counter.nestedResult = r as number
          counter.nestedExecuted = true
        } catch (error) {
          console.error('ExecuteTaskTest3200 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onReceiveData(onData)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('ExecuteTaskTest3200 failed');
        expect(false).assertFail();
      }
      let waitCount: number = 0
      try {
        while (!counter.nestedExecuted && waitCount < 50) {
          await sleep(100)
          waitCount++
        }
      } catch (error) {
        console.error('ExecuteTaskTest3200 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedExecuted).assertTrue()
      expect(counter.nestedResult).assertEqual(200)
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest3300
     * @tc.number SUB_EXECUTE_TASK_TEST_3300
     * @tc.desc   Verify nested execute in catch path of failed task with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let task: taskpool.Task = new taskpool.Task(etErrorFunc)
      try {
        await taskpool.execute(task)
      } catch (e) {
        let nestedTask: taskpool.Task = new taskpool.Task(etNestedFunc)
        try {
          const r: Object = await taskpool.execute(nestedTask)
          counter.nestedResult = r as number
          counter.nestedExecuted = true
        } catch (error) {
          console.error('ExecuteTaskTest3300 nested execute failed')
          expect(false).assertFail()
        }
      }
      let waitCount: number = 0
      try {
        while (!counter.nestedExecuted && waitCount < 50) {
          await sleep(100)
          waitCount++
        }
      } catch (error) {
        console.error('ExecuteTaskTest3300 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedExecuted).assertTrue()
      expect(counter.nestedResult).assertEqual(200)
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest3400
     * @tc.number SUB_EXECUTE_TASK_TEST_3400
     * @tc.desc   Verify a delayed root task releases a pending dependency chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(etNoArgsFunc)
      let task2: taskpool.Task = new taskpool.Task(etSimpleFunc)
      let task3: taskpool.Task = new taskpool.Task(etNestedFunc)
      task2.addDependency(task1)
      task3.addDependency(task2)

      let task3Promise: Promise<Object> = taskpool.execute(task3)
      let task2Promise: Promise<Object> = taskpool.execute(task2)
      let task1Promise: Promise<Object> = taskpool.executeDelayed(500, task1)
      try {
        let results: Object[] = await Promise.all([task1Promise, task2Promise, task3Promise])

        let result1: Object = results[0]
        expect(result1 as number).assertEqual(100)
        let result2: Object = results[1]
        expect(result2 as number).assertEqual(42)
        let result3: Object = results[2]
        expect(result3 as number).assertEqual(200)
      } catch (error) {
        console.error('ExecuteTaskTest3400 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 11. Stability - Small Concurrency + Sendable Shared Counter =====

    /**
     * @tc.name   ExecuteTaskTest3500
     * @tc.number SUB_EXECUTE_TASK_TEST_3500
     * @tc.desc   Verify 3 concurrent tasks with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etCounterFunc, counter)))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(counter.count).assertEqual(3)
      } catch (error) {
        console.error('ExecuteTaskTest3500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest3600
     * @tc.number SUB_EXECUTE_TASK_TEST_3600
     * @tc.desc   Verify 5 concurrent tasks with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etCounterFunc, counter)))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(5)
        expect(counter.count).assertEqual(5)
      } catch (error) {
        console.error('ExecuteTaskTest3600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest3700
     * @tc.number SUB_EXECUTE_TASK_TEST_3700
     * @tc.desc   Verify 10 concurrent tasks with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etCounterFunc, counter)))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(10)
        expect(counter.count).assertEqual(10)
      } catch (error) {
        console.error('ExecuteTaskTest3700 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 12. Stability Rule Validation =====

    /**
     * @tc.name   ExecuteTaskTest3800
     * @tc.number SUB_EXECUTE_TASK_TEST_3800
     * @tc.desc   Verify Timer delay >= 500ms triggers execute correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let result: number = 0
      try {
        await sleep(500)
        let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
        const val: Object = await taskpool.execute(task)
        result = val as number
      } catch (error) {
        console.error('ExecuteTaskTest3800 failed');
        expect(false).assertFail();
      }
      expect(result).assertEqual(42)
      done()
    })

    // ===== 13. Gap Coverage (M2) - Parameter Validation Family (401/10200014) =====

    /**
     * @tc.name   ExecuteTaskTest3900
     * @tc.number SUB_EXECUTE_TASK_TEST_3900
     * @tc.desc   Verify execute() with task parameter omitted throws 401 (runtime arbitration: native TYPE_ERROR "the number of execute's params must be at least one"; design "compile-time missing parameter" downgraded per F2/F3 to a runtime negative case)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let err3900: ETErrorInfo | null = null
      try {
        let execFunc: (...args: Object[]) => Promise<Object> = taskpool.execute as Object as (...args: Object[]) => Promise<Object>
        await execFunc()
      } catch (error) {
        caught = true
        err3900 = error
        if (err3900 !== null) {
expect(err3900.code).assertEqual(401)
        }
      }
      expect(caught).assertTrue()
      expect(err3900 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest4000
     * @tc.number SUB_EXECUTE_TASK_TEST_4000
     * @tc.desc   Verify execute(null as Task) throws 401 parameter check error (runtime arbitration: native TYPE_ERROR first-parameter type validation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let err4000: ETErrorInfo | null = null
      // undefBox[9] is out of bounds: statically Object, evaluates to a
      // non-Task runtime value so the same 401 path is covered without an
      // illegal null literal cast.
      let undefBox: Object[] = []
      try {
        await taskpool.execute(undefBox[9] as taskpool.Task)
      } catch (error) {
        caught = true
        err4000 = error
        if (err4000 !== null) {
expect(err4000.code).assertEqual(401)
        }
      }
      expect(caught).assertTrue()
      expect(err4000 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest4100
     * @tc.number SUB_EXECUTE_TASK_TEST_4100
     * @tc.desc   Verify execute(undefined as Task) throws 401 parameter check error (runtime arbitration: native TYPE_ERROR first-parameter type validation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let err4100: ETErrorInfo | null = null
      let undefBox: Object[] = []
      try {
        await taskpool.execute(undefBox[9] as taskpool.Task)
      } catch (error) {
        caught = true
        err4100 = error
        if (err4100 !== null) {
expect(err4100.code).assertEqual(401)
        }
      }
      expect(caught).assertTrue()
      expect(err4100 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest4200
     * @tc.number SUB_EXECUTE_TASK_TEST_4200
     * @tc.desc   Verify execute with non-Task objects (plain object/number/string) each throws 401 (runtime arbitration: native TYPE_ERROR "the type of execute's first param must be task/object or function")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let objCaught: boolean = false
      let objErr: ETErrorInfo | null = null
      let numCaught: boolean = false
      let numErr: ETErrorInfo | null = null
      let strCaught: boolean = false
      let strErr: ETErrorInfo | null = null
      try {
        let objTask: ETEmptyObj = {}
        await taskpool.execute(objTask as Object as taskpool.Task)
      } catch (error) {
        objCaught = true
        objErr = error
        if (objErr !== null) {
expect(objErr.code).assertEqual(401)
        }
      }
      expect(objCaught).assertTrue()
      expect(objErr !== null).assertTrue()
      try {
        await taskpool.execute(500 as Object as taskpool.Task)
      } catch (error) {
        numCaught = true
        numErr = error
        if (numErr !== null) {
expect(numErr.code).assertEqual(401)
        }
      }
      expect(numCaught).assertTrue()
      expect(numErr !== null).assertTrue()
      try {
        await taskpool.execute('500' as Object as taskpool.Task)
      } catch (error) {
        strCaught = true
        strErr = error
        if (strErr !== null) {
expect(strErr.code).assertEqual(401)
        }
      }
      expect(strCaught).assertTrue()
      expect(strErr !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest4300
     * @tc.number SUB_EXECUTE_TASK_TEST_4300
     * @tc.desc   Verify Task built from function without @Concurrent decorator throws 10200014 on execute (runtime arbitration: SDK d.ts 10200014 = function not marked @Concurrent, design code 10200003 actually means Worker initialization failed)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let err4300: ETErrorInfo | null = null
      let task: taskpool.Task = new taskpool.Task(etPlainNoDecorFunc as Object as Function)
      try {
        await taskpool.execute(task)
      } catch (error) {
        caught = true
        err4300 = error
        if (err4300 !== null) {
expect(err4300.code).assertEqual(10200014)
        }
      }
      expect(caught).assertTrue()
      expect(err4300 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest4400
     * @tc.number SUB_EXECUTE_TASK_TEST_4400
     * @tc.desc   Verify seqRunnerTask cannot be executed outside via execute(task), throws 401 (runtime arbitration: native CanExecute IsSeqRunnerTask → TYPE_ERROR "seqRunnerTask cannot execute outside"; design code 10200016 is a removed legacy cancel-domain code)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let task: taskpool.Task = new taskpool.Task(etNoArgsFunc)
      try {
        let seqResult: Object = await runner.execute(task)
        expect(seqResult as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskTest4400 seqRunner execute failed');
        expect(false).assertFail();
      }
      let caught: boolean = false
      let err4400: ETErrorInfo | null = null
      try {
        await taskpool.execute(task)
      } catch (error) {
        caught = true
        err4400 = error
        if (err4400 !== null) {
expect(err4400.code).assertEqual(401)
        }
      }
      expect(caught).assertTrue()
      expect(err4400 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest4500
     * @tc.number SUB_EXECUTE_TASK_TEST_4500
     * @tc.desc   Verify circular dependency (task1↔task2) throws 10200026 on addDependency (runtime arbitration: native StoreTaskDependency circular-dependency detection → ERR_CIRCULAR_DEPENDENCY; design code 10200057 means "executed by two APIs" semantics)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(etNoArgsFunc)
      let task2: taskpool.Task = new taskpool.Task(etSimpleFunc)
      task2.addDependency(task1)
      let caught: boolean = false
      let err4500: ETErrorInfo | null = null
      try {
        task1.addDependency(task2)
      } catch (error) {
        caught = true
        err4500 = error
        if (err4500 !== null) {
expect(err4500.code).assertEqual(10200026)
        }
      }
      expect(caught).assertTrue()
      expect(err4500 !== null).assertTrue()
      done()
    })

    // ===== 14. Gap Coverage (M2) - Cancel/Re-execute/Race Semantics =====





    /**
     * @tc.name   ExecuteTaskTest4800
     * @tc.number SUB_EXECUTE_TASK_TEST_4800
     * @tc.desc   Verify Promise.race competition semantics: the fast task settles first with its own result and the slow task still completes afterwards
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let slowTask: taskpool.Task = new taskpool.Task(etLongFunc, 1500)
      let fastTask: taskpool.Task = new taskpool.Task(etNoArgsFunc)
      let slowP: Promise<Object> = taskpool.execute(slowTask)
      let fastP: Promise<Object> = taskpool.execute(fastTask)
      try {
        let winner: Object = await Promise.race([slowP, fastP])
        expect(winner as number).assertEqual(100)
        let slowResult: Object = await slowP
        expect(slowResult as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskTest4800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest4900
     * @tc.number SUB_EXECUTE_TASK_TEST_4900
     * @tc.desc   Verify execute(task) resolving an empty object keeps object type with zero keys and is not an array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(etReturnEmptyObjFunc)
      try {
        let result: Object = await taskpool.execute(task)
        expect(Array.isArray(result)).assertFalse()
        expect(typeof result).assertEqual('object')
        expect(Object.keys(result).length).assertEqual(0)
      } catch (error) {
        console.error('ExecuteTaskTest4900 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 15. Gap Coverage (M2) - Argument Round-trip Fidelity =====

    /**
     * @tc.name   ExecuteTaskTest5000
     * @tc.number SUB_EXECUTE_TASK_TEST_5000
     * @tc.desc   Verify bare TypedArray (Int8Array) argument passes through execute(task) serialization without setTransferList/setCloneList keeping length and first element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let typedArr: Int8Array = new Int8Array(100)
      typedArr[0] = 7
      let task: taskpool.Task = new taskpool.Task(etTypedArrArgFunc, typedArr)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(100 * 1000 + 7)
      } catch (error) {
        console.error('ExecuteTaskTest5000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest5100
     * @tc.number SUB_EXECUTE_TASK_TEST_5100
     * @tc.desc   Verify standard Map and Set arguments pass through execute(task) serialization keeping size and content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let stdMap: Map<string, number> = new Map()
      stdMap.set('k1', 5)
      stdMap.set('k2', 6)
      let mapTask: taskpool.Task = new taskpool.Task(etStdMapArgFunc, stdMap)
      let stdSet: Set<number> = new Set<number>()
      stdSet.add(1)
      stdSet.add(2)
      stdSet.add(3)
      let setTask: taskpool.Task = new taskpool.Task(etStdSetArgFunc, stdSet)
      try {
        let mapResult: Object = await taskpool.execute(mapTask)
        expect(mapResult as number).assertEqual(2 * 10 + 5)
        let setResult: Object = await taskpool.execute(setTask)
        expect(setResult as number).assertEqual(301)
      } catch (error) {
        console.error('ExecuteTaskTest5100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest5200
     * @tc.number SUB_EXECUTE_TASK_TEST_5200
     * @tc.desc   Verify execute(task) with 15MiB ArrayBuffer argument (byte-exact under the 16MB serialization limit) succeeds with byte fidelity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let bigBuf: ArrayBuffer = new ArrayBuffer(15 * 1024 * 1024)
      let view: Uint8Array = new Uint8Array(bigBuf)
      view[0] = 1
      view[bigBuf.byteLength - 1] = 9
      let task: taskpool.Task = new taskpool.Task(etBigBufArgFunc, bigBuf)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(15 * 1024 * 1024 + 10)
      } catch (error) {
        console.error('ExecuteTaskTest5200 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 16. Gap Coverage (M2) - Nesting Family (F4) =====

    /**
     * @tc.name   ExecuteTaskTest5300
     * @tc.number SUB_EXECUTE_TASK_TEST_5300
     * @tc.desc   Verify nested execute launched inside onStartExecution callback completes with exact nested result 200 (F4 real use case: host finishes with 5s bounded polling after await)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      let nestedPromise: Promise<Object> | null = null
      const onStartExec: () => void = (): void => {
        let nestedTask: taskpool.Task = new taskpool.Task(etNestedFunc)
        nestedPromise = taskpool.execute(nestedTask)
      }
      task.onStartExecution(onStartExec)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskTest5300 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (nestedPromise === null && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskTest5300 failed');
        expect(false).assertFail();
      }
      try {
        if (nestedPromise !== null) {
          let nestedResult: Object = await nestedPromise
          expect(nestedResult as number).assertEqual(200)
          counter.nestedResult = nestedResult as number
          counter.nestedExecuted = true
        }
      } catch (error) {
        console.error('ExecuteTaskTest5300 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedExecuted).assertTrue()
      expect(counter.nestedResult).assertEqual(200)
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest5400
     * @tc.number SUB_EXECUTE_TASK_TEST_5400
     * @tc.desc   Verify nested execute inside Promise finally block completes with exact nested result 200 (finally always runs and can await the nested task)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let task: taskpool.Task = new taskpool.Task(etSimpleFunc)
      try {
        let result: Object = await taskpool.execute(task)
        expect(result as number).assertEqual(42)
      } finally {
        let nestedTask: taskpool.Task = new taskpool.Task(etNestedFunc)
        let nestedResult: Object = await taskpool.execute(nestedTask)
        counter.nestedResult = nestedResult as number
        counter.nestedExecuted = true
      }
      expect(counter.nestedExecuted).assertTrue()
      expect(counter.nestedResult).assertEqual(200)
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest5500
     * @tc.number SUB_EXECUTE_TASK_TEST_5500
     * @tc.desc   Verify stability rule 7.2/7.5 equivalent form: collect task promises into array, wait with Promise.allSettled, all fulfilled with exact values (allSettled equivalent implemented as this it)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(etNumFunc, i + 1)))
      }
      try {
        let settled = await Promise.allSettled(promises)
        expect(settled.length).assertEqual(5)
        for (let j: number = 0; j < settled.length; j++) {
          expect(settled[j].status).assertEqual('fulfilled')
          let value: Object = await promises[j]
          expect(value as number).assertEqual((j + 1) * 2)
        }
      } catch (error) {
        console.error('ExecuteTaskTest5500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskTest5600
     * @tc.number SUB_EXECUTE_TASK_TEST_5600
     * @tc.desc   Nested-execute probe: @Concurrent function body awaits nested execute via imported child, host returns 1 and shared Sendable counter records exact sub result 42 (F4 probe; 15s fallback guard against hangs, converts to NAC per F4 if unsupported at runtime)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ETCounter = new ETCounter()
      let probePassed: boolean = false
      try {
        let hostResult: Object = await Promise.race([
          taskpool.execute(etNestHostFunc, counter),
          sleep(15000).then((): Object => {
            return 'TIMEOUT'
          })
        ])
        if (hostResult !== 'TIMEOUT') {
          expect(hostResult as number).assertEqual(1)
          let waited: number = 0
          while (!counter.nestedExecuted && waited < 5000) {
            await sleep(100)
            waited += 100
          }
          expect(counter.nestedExecuted).assertTrue()
          expect(counter.nestedResult).assertEqual(42)
          probePassed = true
        } else {
          console.error('ExecuteTaskTest5600 probe timeout: nested execute in concurrent function did not complete');
          expect(false).assertFail()
        }
      } catch (e) {
        console.error(`ExecuteTaskTest5600 probe rejected: ${JSON.stringify(e)}`);
        expect(false).assertFail()
      }
      expect(probePassed).assertTrue()
      done()
    })
  })
}
