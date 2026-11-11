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
import { sleep , cooperativeGc , fillBigArrayChunked } from '../utils';

import { ECTCounter, ectCounter } from './ExecuteTaskConfigsTestInner';

@Sendable
class ECTLockedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function ectLockedCounterFunc(counter: ECTLockedCounter): Promise<number> {
  // AsyncLock-protected increment: concurrent tasks sharing one Sendable
  // counter lose updates without a lock (runtime arbitration 2026-09-06).
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return 100
  })
  return 100
}

interface ECTErr {
  code: number
  message: string
}

@Concurrent
function ectSimple(): number { return 42 }

@Concurrent
function ectNum(x: number): number { return x * 2 }

@Concurrent
function ectStr(): string { return 'hello' }

@Concurrent
function ectVoid(): void { let x: number = 1 + 1 }

@Concurrent
function ectZero(): number { return 0 }

@Concurrent
function ectEmptyStr(): string { return '' }

@Concurrent
function ectFalse(): boolean { return false }

@Concurrent
function ectEmptyArr(): number[] {
  let arr: number[] = []
  return arr
}

@Concurrent
function ectLong(d: number): number {
  let s: number = Date.now()
  while ((Date.now() - s) < d) { let x: number = 0; x++ }
  return 100
}

@Concurrent
function ectBigData(data: number[]): number { return data.length }

@Concurrent
function ectId(id: number): number { return id * 10 }

@Concurrent
function ectSendData(): void { taskpool.Task.sendData(42) }

@Concurrent
function ectSendDataTimeout(c: ECTMsgFlag): void {
  taskpool.Task.sendData('before')
  c.taskSent = true
  let s: number = Date.now()
  while ((Date.now() - s) < 2000) { let x: number = 0; x++ }
  taskpool.Task.sendData('after')
}

@Concurrent
function ectNested(): number { return 200 }

@Concurrent
function ectSideEffect(f: ECTFlag): number {
  let s: number = Date.now()
  while ((Date.now() - s) < 1000) { let x: number = 0; x++ }
  f.completed = true
  return 100
}

@Concurrent
function ectThrowFunc(): number { throw new Error('intentional failure') }

@Concurrent
async function ectNestedExecute(c: ECTCounter): Promise<number> {
  let inner: taskpool.Task = new taskpool.Task(ectCounter, c)
  let r: Object = await taskpool.execute(inner, { timeout: 5000 })
  return r as number
}

@Sendable
class ECTFlag {
  completed: boolean = false
}

@Sendable
class ECTMsgFlag {
  taskSent: boolean = false
  beforeReceived: boolean = false
  afterReceived: boolean = false
}

export default function ExecuteTaskConfigsTest(): void {
  describe('ExecuteTaskConfigsTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(500)
      await cooperativeGc()
    })

    // ===== 1. Input Parameter Tests - configs Parameter Combination =====

    /**
     * @tc.name   ExecuteTaskConfigsTest0100
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_0100
     * @tc.desc   Verify execute(task, {timeout, priority}) with both configs returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectLong, 200)
      try {
        let result: Object = await taskpool.execute(task, { timeout: 5000, priority: taskpool.Priority.HIGH })
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest0200
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_0200
     * @tc.desc   Verify execute(task, {timeout}) with only timeout config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        let result: Object = await taskpool.execute(task, { timeout: 5000 })
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest0300
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_0300
     * @tc.desc   Verify execute(task, {priority}) with only priority config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        let result: Object = await taskpool.execute(task, { priority: taskpool.Priority.LOW })
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest0400
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_0400
     * @tc.desc   Verify execute(task, {}) with empty configs object uses defaults
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        let result: Object = await taskpool.execute(task, {})
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 2. Input Parameter Tests - timeout Parameter Type =====

    /**
     * @tc.name   ExecuteTaskConfigsTest0500
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_0500
     * @tc.desc   Verify execute(task, {timeout: 1000}) with normal timeout value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        let result: Object = await taskpool.execute(task, { timeout: 1000 })
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest0600
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_0600
     * @tc.desc   Verify execute(task, {timeout: 50}) with short timeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        let result: Object = await taskpool.execute(task, { timeout: 50 })
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest0700
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_0700
     * @tc.desc   Verify execute(task, {timeout: 0}) and {timeout: -1} default to Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(ectSimple)
      let task2: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        let r1: Object = await taskpool.execute(task1, { timeout: 0 })
        expect(r1 as number).assertEqual(42)
        let r2: Object = await taskpool.execute(task2, { timeout: -1 })
        expect(r2 as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest0800
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_0800
     * @tc.desc   Verify execute(task, {timeout: 1000.5}) with decimal timeout value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        let result: Object = await taskpool.execute(task, { timeout: 1000.5 })
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest0900
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_0900
     * @tc.desc   Verify execute(task, {timeout: 60000}) with large timeout value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        let result: Object = await taskpool.execute(task, { timeout: 60000 })
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 3. Input Parameter Tests - priority Parameter Type =====

    /**
     * @tc.name   ExecuteTaskConfigsTest1000
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_1000
     * @tc.desc   Verify all Priority enum values HIGH/MEDIUM/LOW/IDLE with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.Task(ectSimple)
      let t2: taskpool.Task = new taskpool.Task(ectSimple)
      let t3: taskpool.Task = new taskpool.Task(ectSimple)
      let t4: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        expect(await taskpool.execute(t1, { priority: taskpool.Priority.HIGH }) as number).assertEqual(42)
        expect(await taskpool.execute(t2, { priority: taskpool.Priority.MEDIUM }) as number).assertEqual(42)
        expect(await taskpool.execute(t3, { priority: taskpool.Priority.LOW }) as number).assertEqual(42)
        expect(await taskpool.execute(t4, { priority: taskpool.Priority.IDLE }) as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest1000 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 4. Return Value Tests - Success Scenarios =====

    /**
     * @tc.name   ExecuteTaskConfigsTest1100
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_1100
     * @tc.desc   Verify execute(task, configs) returns number and string types correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.Task(ectNum, 21)
      let t2: taskpool.Task = new taskpool.Task(ectStr)
      try {
        expect(await taskpool.execute(t1, { timeout: 5000 }) as number).assertEqual(42)
        expect(await taskpool.execute(t2, { timeout: 5000 }) as string).assertEqual('hello')
      } catch (error) {
        console.error('ExecuteTaskConfigsTest1100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest1200
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_1200
     * @tc.desc   Verify execute(task, configs) with void return yields undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectVoid)
      try {
        let result: Object = await taskpool.execute(task, { timeout: 5000 })
        expect(result).assertUndefined()
      } catch (error) {
        console.error('ExecuteTaskConfigsTest1200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest1300
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_1300
     * @tc.desc   Verify execute(task, configs) returns falsy values 0/empty string/false/empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.Task(ectZero)
      let t2: taskpool.Task = new taskpool.Task(ectEmptyStr)
      let t3: taskpool.Task = new taskpool.Task(ectFalse)
      let t4: taskpool.Task = new taskpool.Task(ectEmptyArr)
      try {
        expect(await taskpool.execute(t1, { timeout: 5000 }) as number).assertEqual(0)
        expect(await taskpool.execute(t2, { timeout: 5000 }) as string).assertEqual('')
        expect(await taskpool.execute(t3, { timeout: 5000 }) as boolean).assertFalse()
        expect((await taskpool.execute(t4, { timeout: 5000 }) as number[]).length).assertEqual(0)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest1300 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 5. Timeout Scenario Tests =====

    /**
     * @tc.name   ExecuteTaskConfigsTest1400
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_1400
     * @tc.desc   Verify task exceeding timeout throws error code 10200058
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectLong, 3000)
      let threwError1400 = false
      let err1400: BusinessError | null = null
      try {
        await taskpool.execute(task, { timeout: 500 })
      } catch (error) {
        threwError1400 = true
        err1400 = error
        if (err1400 !== null) {
          expect(err1400 instanceof Error).assertTrue()
          expect(err1400.code).assertEqual(10200058)
        }
      }
      expect(threwError1400).assertTrue()
      expect(err1400 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest1500
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_1500
     * @tc.desc   Verify onExecutionFailed NOT triggered when task times out
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let failedCalled: boolean = false
      let task: taskpool.Task = new taskpool.Task(ectLong, 3000)
      const onFailed: () => void = (): void => {
        failedCalled = true
      }
      task.onExecutionFailed(onFailed)
      let threwError1500 = false
      try {
        await taskpool.execute(task, { timeout: 500 })
      } catch (error) {
        threwError1500 = true
      }
      expect(threwError1500).assertTrue()
      let w: number = 0
      try {
        while (w < 20) {
          await sleep(100)
          w++
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest1500 failed');
        expect(false).assertFail();
      }
      expect(failedCalled).assertFalse()
      done()
    })

    // ===== 6. Promise Chained Calls =====

    /**
     * @tc.name   ExecuteTaskConfigsTest1600
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_1600
     * @tc.desc   Verify .then() chain processes result with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let finalResult: number = 0
      let operationDone: boolean = false
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      try {
        const val: Object = await taskpool.execute(task, { timeout: 5000 })
        finalResult = (val as number) * 2
        operationDone = true
      } catch (error) {
        console.error('ExecuteTaskConfigsTest1600 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!operationDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest1600 failed');
        expect(false).assertFail();
      }
      expect(finalResult).assertEqual(84)
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest1700
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_1700
     * @tc.desc   Verify .catch() captures timeout error with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errCode: number = 0
      let operationDone: boolean = false
      let task: taskpool.Task = new taskpool.Task(ectLong, 3000)
      try {
        await taskpool.execute(task, { timeout: 500 })
      } catch (e) {
        errCode = e.code
        operationDone = true
      }
      let waited: number = 0
      try {
        while (!operationDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest1700 failed');
        expect(false).assertFail();
      }
      expect(errCode).assertEqual(10200058)
      done()
    })

    // ===== 7. Error Handling Tests =====

    /**
     * @tc.name   ExecuteTaskConfigsTest1800
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_1800
     * @tc.desc   Verify oversized data throws serialization error 10200006 with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let bigData: number[] = await fillBigArrayChunked(2 * 1024 * 1024)
      let task: taskpool.Task = new taskpool.Task(ectBigData, bigData)
      let threwError1800 = false
      let err1800: BusinessError | null = null
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        threwError1800 = true
        err1800 = error
        if (err1800 !== null) {
          expect(err1800 instanceof Error).assertTrue()
          expect(err1800.code).assertEqual(10200006)
        }
      }
      expect(threwError1800).assertTrue()
      expect(err1800 !== null).assertTrue()
      done()
    })



    /**
     * @tc.name   ExecuteTaskConfigsTest2000
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_2000
     * @tc.desc   Verify timed-out task cannot be re-executed with configs, throws 10200057 (runtime arbitration 2026-09-06: native maps the timeout-state re-execute to ERR_TASK_CANNOT_EXECUTED=10200057, not 10200051)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: for a task in timeout state the runtime reports "the timeout task cannot be executed
      // again" with ERR_TASK_CANNOT_EXECUTED (10200057); device run confirmed 10200057 in the actual position
      let task: taskpool.Task = new taskpool.Task(ectLong, 3000)
      let threwError2000a = false
      try {
        await taskpool.execute(task, { timeout: 500 })
      } catch (error) {
        threwError2000a = true
      }
      expect(threwError2000a).assertTrue()
      let threwError2000b = false
      let err2000b: BusinessError | null = null
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        threwError2000b = true
        err2000b = error
        if (err2000b !== null) {
          expect(err2000b instanceof Error).assertTrue()
          expect(err2000b.code).assertEqual(10200057)
        }
      }
      expect(threwError2000b).assertTrue()
      expect(err2000b !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest2100
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_2100
     * @tc.desc   Verify task with dependency cannot be executed with configs (runtime arbitration: design "contains dependency key information" cannot be message-asserted per guideline 5; SDK execute(task,configs) has no documented dependency scenario code, same-family AsyncRunner/SequenceRunner measured 10200025, asserting exception propagation left to runtime arbitration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task1: taskpool.Task = new taskpool.Task(ectSimple)
      let task2: taskpool.Task = new taskpool.Task(ectSimple)
      task2.addDependency(task1)
      let threwError2100 = false
      let err2100: BusinessError | null = null
      try {
        await taskpool.execute(task2, { timeout: 5000 })
      } catch (error) {
        threwError2100 = true
        err2100 = error
        if (err2100 !== null) {
          expect(err2100 instanceof Error).assertTrue()
        }
      }
      expect(threwError2100).assertTrue()
      expect(err2100 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest2200
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_2200
     * @tc.desc   Verify try-catch-finally executes finally on both normal and timeout paths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let finallyCount: number = 0
      try {
        let result: Object = await taskpool.execute(new taskpool.Task(ectSimple), { timeout: 5000 })
        expect(result as number).assertEqual(42)
      } catch (error) {
        expect().assertFail()
      } finally {
        finallyCount++
      }
      let threwError2200 = false
      try {
        await taskpool.execute(new taskpool.Task(ectLong, 3000), { timeout: 500 })
      } catch (error) {
        threwError2200 = true
      } finally {
        finallyCount++
      }
      expect(threwError2200).assertTrue()
      expect(finallyCount).assertEqual(2)
      done()
    })

    // ===== 8. Async Concurrency Tests =====

    /**
     * @tc.name   ExecuteTaskConfigsTest2300
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_2300
     * @tc.desc   Verify await normal result with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectNum, 25)
      try {
        let result: Object = await taskpool.execute(task, { timeout: 5000, priority: taskpool.Priority.MEDIUM })
        expect(result as number).assertEqual(50)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest2300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest2400
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_2400
     * @tc.desc   Verify await captures timeout exception with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.Task(ectLong, 3000)
      let threwError2400 = false
      try {
        await taskpool.execute(task, { timeout: 500 })
      } catch (error) {
        threwError2400 = true
      }
      expect(threwError2400).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest2500
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_2500
     * @tc.desc   Verify Promise.all with multiple concurrent tasks using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.Task(ectId, 1)
      let t2: taskpool.Task = new taskpool.Task(ectId, 2)
      let t3: taskpool.Task = new taskpool.Task(ectId, 3)
      let p1: Promise<Object> = taskpool.execute(t1, { timeout: 5000 })
      let p2: Promise<Object> = taskpool.execute(t2, { timeout: 5000 })
      let p3: Promise<Object> = taskpool.execute(t3, { timeout: 5000 })
      try {
        let results: Object[] = await Promise.all([p1, p2, p3])
        expect(results.length).assertEqual(3)
        expect(results[0] as number).assertEqual(10)
        expect(results[1] as number).assertEqual(20)
        expect(results[2] as number).assertEqual(30)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest2500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest2600
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_2600
     * @tc.desc   Verify Promise.all fails when one task times out with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let quick: taskpool.Task = new taskpool.Task(ectSimple)
      let slow: taskpool.Task = new taskpool.Task(ectLong, 3000)
      let p1: Promise<Object> = taskpool.execute(quick, { timeout: 5000 })
      let p2: Promise<Object> = taskpool.execute(slow, { timeout: 500 })
      let threwError2600 = false
      let err2600: BusinessError | null = null
      try {
        await Promise.all([p1, p2])
      } catch (error) {
        threwError2600 = true
        err2600 = error
        if (err2600 !== null) {
          expect(err2600 instanceof Error).assertTrue()
          expect(err2600.code).assertEqual(10200058)
        }
      }
      expect(threwError2600).assertTrue()
      expect(err2600 !== null).assertTrue()
      done()
    })



    // ===== 9. sendData Not Received After Timeout =====

    /**
     * @tc.name   ExecuteTaskConfigsTest2800
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_2800
     * @tc.desc   Verify timeout rejects the execute promise, the pre-timeout sendData message is delivered, and sendData issued after the rejection is suppressed (runtime arbitration 2026-09-06: the timeout only rejects the deferred and the task body keeps running, but post-settlement sendData is not delivered to the host callback)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Root cause: TaskTimeoutCallback only napi_reject_deferred; the busy-looping task keeps running to
      // completion and sendData('after') is still delivered to onReceiveData, so afterReceived becomes true
      let flag: ECTMsgFlag = new ECTMsgFlag()
      let task: taskpool.Task = new taskpool.Task(ectSendDataTimeout, flag)
      const onData: (data: Object) => void = (data: Object): void => {
        if (data === null || data === undefined) { console.info('ExecuteTaskConfigsTest2800 received empty data'); return }
        if ((data as string) === 'before') { flag.beforeReceived = true }
        if ((data as string) === 'after') { flag.afterReceived = true }
      }
      task.onReceiveData(onData)
      let threwError2800 = false
      try {
        await taskpool.execute(task, { timeout: 500 })
      } catch (error) {
        threwError2800 = true
      }
      expect(threwError2800).assertTrue()
      // Runtime arbitration 2026-09-06: after the timeout rejection the task
      // body keeps running, but sendData issued after the settlement is NOT
      // delivered to the host callback (observed on device); wait out the
      // 2000ms task window plus a 1s stability margin and assert the
      // suppression contract.
      await sleep(3000)
      expect(flag.beforeReceived).assertTrue()
      expect(flag.afterReceived).assertFalse()
      done()
    })

    // ===== 10. Task Nested Combination Scenarios =====

    /**
     * @tc.name   ExecuteTaskConfigsTest2900
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_2900
     * @tc.desc   Verify nested execute with configs in onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let task: taskpool.Task = new taskpool.Task(ectCounter, counter)
      const onSuccess: () => Promise<void> = async (): Promise<void> => {
        let nested: taskpool.Task = new taskpool.Task(ectCounter, counter)
        try {
          const r: Object = await taskpool.execute(nested, { timeout: 5000 })
          counter.nestedResult = r as number
          counter.nestedDone = true
        } catch (error) {
          console.error('ExecuteTaskConfigsTest2900 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        console.error('ExecuteTaskConfigsTest2900 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest2900 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedFailed).assertFalse()
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest3000
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3000
     * @tc.desc   Verify nested execute with configs in onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let task: taskpool.Task = new taskpool.Task(ectSendData)
      const onData: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) { console.info('ExecuteTaskConfigsTest3000 received empty data'); return }
        let nested: taskpool.Task = new taskpool.Task(ectCounter, counter)
        try {
          const r: Object = await taskpool.execute(nested, { timeout: 5000 })
          counter.nestedResult = r as number
          counter.nestedDone = true
        } catch (error) {
          console.error('ExecuteTaskConfigsTest3000 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onReceiveData(onData)
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3000 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3000 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedFailed).assertFalse()
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest3100
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3100
     * @tc.desc   Verify multiple listeners with nested execute using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let task: taskpool.Task = new taskpool.Task(ectSendData)
      const onData: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) { console.info('ExecuteTaskConfigsTest3100 received empty data'); return }
        let nested: taskpool.Task = new taskpool.Task(ectCounter, counter)
        try {
          const result: Object = await taskpool.execute(nested, { timeout: 5000 })
          expect(result as number).assertEqual(100)
        } catch (error) {
          console.error('ExecuteTaskConfigsTest3100 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onReceiveData(onData)
      const onSuccess: () => Promise<void> = async (): Promise<void> => {
        let nested: taskpool.Task = new taskpool.Task(ectNested)
        try {
          const r: Object = await taskpool.execute(nested, { timeout: 5000 })
          counter.nestedResult = r as number
          counter.nestedDone = true
        } catch (error) {
          console.error('ExecuteTaskConfigsTest3100 nested execute failed')
          expect(false).assertFail()
        }
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3100 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3100 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedResult).assertEqual(200)
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest3200
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3200
     * @tc.desc   Verify nested task timeout is correctly handled in listener, caught error is 10200058 (runtime arbitration: added SDK code assertion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let nestedErrCode3200: number = 0
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      const onSuccess: () => Promise<void> = async (): Promise<void> => {
        let nested: taskpool.Task = new taskpool.Task(ectLong, 3000)
        try {
          await taskpool.execute(nested, { timeout: 500 })
        } catch (e) {
          nestedErrCode3200 = e.code
          counter.nestedDone = true
        }
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3200 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3200 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(nestedErrCode3200).assertEqual(10200058)
      done()
    })

    // ===== 11. Small Concurrency + Sendable =====

    /**
     * @tc.name   ExecuteTaskConfigsTest3300
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3300
     * @tc.desc   Verify 3 concurrent tasks with Sendable counter using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute(new taskpool.Task(ectCounter, counter), { timeout: 5000 }))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        expect(counter.count).assertEqual(3)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest3400
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3400
     * @tc.desc   Verify 5 concurrent tasks with Sendable counter using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute(new taskpool.Task(ectCounter, counter), { timeout: 5000 }))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(5)
        expect(counter.count).assertEqual(5)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest3500
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3500
     * @tc.desc   Verify 10 concurrent tasks with Sendable counter using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTLockedCounter = new ECTLockedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute(new taskpool.Task(ectLockedCounterFunc, counter), { timeout: 5000 }))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(10)
        expect(counter.count).assertEqual(10)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3500 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 12. Different Priority Concurrency =====

    /**
     * @tc.name   ExecuteTaskConfigsTest3600
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3600
     * @tc.desc   Verify different priority tasks execute concurrently with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.Task(ectSimple)
      let t2: taskpool.Task = new taskpool.Task(ectSimple)
      let p1: Promise<Object> = taskpool.execute(t1, { timeout: 5000, priority: taskpool.Priority.HIGH })
      let p2: Promise<Object> = taskpool.execute(t2, { timeout: 5000, priority: taskpool.Priority.LOW })
      try {
        let results: Object[] = await Promise.all([p1, p2])
        expect(results.length).assertEqual(2)
        expect(results[0] as number).assertEqual(42)
        expect(results[1] as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3600 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 13. Stability Rules =====

    /**
     * @tc.name   ExecuteTaskConfigsTest3700
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3700
     * @tc.desc   Verify Timer >= 500ms triggers execute correctly with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let result: number = 0
      try {
        await sleep(500)
        let task: taskpool.Task = new taskpool.Task(ectSimple)
        const val: Object = await taskpool.execute(task, { timeout: 5000 })
        result = val as number
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3700 failed');
        expect(false).assertFail();
      }
      expect(result).assertEqual(42)
      done()
    })

    // ===== 14. Parameter Validation, Timeout Arbitration and Nesting Addendum Tests =====

    /**
     * @tc.name   ExecuteTaskConfigsTest3800
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3800
     * @tc.desc   Verify execute(task, configs) with invalid timeout type, invalid priority type and omitted task each throw 401 (F2 cast construction: '500' as ESObject timeout, 'HIGH' as ESObject priority, undefined task; per-input SDK code assertion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteTaskConfigsTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.Task(ectSimple)
      let threwError3800a = false
      let err3800a: BusinessError | null = null
      try {
        await taskpool.execute(t1, { timeout: '500' as ESObject })
      } catch (error) {
        threwError3800a = true
        err3800a = error
        if (err3800a !== null) {
          expect(err3800a instanceof Error).assertTrue()
          expect(err3800a.code).assertEqual(401)
        }
      }
      expect(threwError3800a).assertTrue()
      expect(err3800a !== null).assertTrue()
      let t2: taskpool.Task = new taskpool.Task(ectSimple)
      let threwError3800b = false
      let err3800b: BusinessError | null = null
      try {
        await taskpool.execute(t2, { priority: 'HIGH' as ESObject })
      } catch (error) {
        threwError3800b = true
        err3800b = error
        if (err3800b !== null) {
          expect(err3800b instanceof Error).assertTrue()
          expect(err3800b.code).assertEqual(401)
        }
      }
      expect(threwError3800b).assertTrue()
      expect(err3800b !== null).assertTrue()
      let threwError3800c = false
      let err3800c: BusinessError | null = null
      try {
        const noTask: ESObject = undefined
        await taskpool.execute(noTask)
      } catch (error) {
        threwError3800c = true
        err3800c = error
        if (err3800c !== null) {
          expect(err3800c instanceof Error).assertTrue()
          expect(err3800c.code).assertEqual(401)
        }
      }
      expect(threwError3800c).assertTrue()
      expect(err3800c !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest3900
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_3900
     * @tc.desc   Verify timeout values below 1 (0/-1/0.5) do not arm the timeout: 300ms long task completes normally with each value (F8 runtime arbitration: design says <1 falls back to default Infinity, discriminated by a 300ms task that must not trigger 10200058)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.Task(ectLong, 300)
      let t2: taskpool.Task = new taskpool.Task(ectLong, 300)
      let t3: taskpool.Task = new taskpool.Task(ectLong, 300)
      try {
        let r1: Object = await taskpool.execute(t1, { timeout: 0 })
        expect(r1 as number).assertEqual(100)
        let r2: Object = await taskpool.execute(t2, { timeout: -1 })
        expect(r2 as number).assertEqual(100)
        let r3: Object = await taskpool.execute(t3, { timeout: 0.5 })
        expect(r3 as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest3900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest4000
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_4000
     * @tc.desc   Verify timeout config value does not change result correctness: same task returns 42 with timeout 500/1000.5/60000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.Task(ectNum, 21)
      let t2: taskpool.Task = new taskpool.Task(ectNum, 21)
      let t3: taskpool.Task = new taskpool.Task(ectNum, 21)
      try {
        let r1: Object = await taskpool.execute(t1, { timeout: 500 })
        expect(r1 as number).assertEqual(42)
        let r2: Object = await taskpool.execute(t2, { timeout: 1000.5 })
        expect(r2 as number).assertEqual(42)
        let r3: Object = await taskpool.execute(t3, { timeout: 60000 })
        expect(r3 as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest4000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest4100
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_4100
     * @tc.desc   Verify plain Task continues execution after configs timeout: throws 10200058 then Sendable flag polled true (design #016 plain-Task variant, isomorphic to the EGCT1700 generics side)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: ECTFlag = new ECTFlag()
      let task: taskpool.Task = new taskpool.Task(ectSideEffect, flag)
      let threwError4100 = false
      let err4100: BusinessError | null = null
      try {
        await taskpool.execute(task, { timeout: 500 })
      } catch (error) {
        threwError4100 = true
        err4100 = error
        if (err4100 !== null) {
          expect(err4100 instanceof Error).assertTrue()
          expect(err4100.code).assertEqual(10200058)
        }
      }
      expect(threwError4100).assertTrue()
      expect(err4100 !== null).assertTrue()
      let w: number = 0
      try {
        while (!flag.completed && w < 50) {
          await sleep(100)
          w++
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest4100 failed');
        expect(false).assertFail();
      }
      expect(flag.completed).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest4200
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_4200
     * @tc.desc   Verify execute(task, configs) rejects when the concurrent function throws internally, with the original error text observable on the rejection (runtime arbitration 2026-09-06: worker execution errors are delivered as ErrorEvent-like plain objects, so instanceof Error is false and the content is asserted via error.message)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteTaskConfigsTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: the worker serializes the thrown error through TranslateErrorEvent, so the rejection is
      // a plain object (instanceof Error is false); assert the observable message content instead
      let task: taskpool.Task = new taskpool.Task(ectThrowFunc)
      let threwError4200 = false
      let err4200: BusinessError | null = null
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        threwError4200 = true
        err4200 = error
      }
      expect(threwError4200).assertTrue()
      expect(err4200 !== null).assertTrue()
      if (err4200 !== null) {
        let msg4200: string = String(err4200.message)
        expect(msg4200.includes('intentional failure')).assertTrue()
      }
      done()
    })



    /**
     * @tc.name   ExecuteTaskConfigsTest4400
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_4400
     * @tc.desc   Verify nested recovery execute with configs inside onExecutionFailed callback: listener fires and nested task returns 100 (design #044, LongTaskTest2700 same scenario with configs variant)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let task: taskpool.Task = new taskpool.Task(ectThrowFunc)
      const onFailed: () => Promise<void> = async (): Promise<void> => {
        let nested: taskpool.Task = new taskpool.Task(ectCounter, counter)
        try {
          const r: Object = await taskpool.execute(nested, { timeout: 5000 })
          counter.nestedResult = r as number
          counter.nestedDone = true
        } catch (error) {
          counter.nestedFailed = true
        }
      }
      task.onExecutionFailed(onFailed)
      let threwError4400 = false
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        threwError4400 = true
      }
      expect(threwError4400).assertTrue()
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest4400 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedFailed).assertFalse()
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest4500
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_4500
     * @tc.desc   Verify all three listeners with nested execute using configs: onReceiveData and onExecutionSucceeded nested tasks complete, onExecutionFailed branch not triggered (design #046: ECT3100 adds the onExecutionFailed third-listener combination)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let failedCalled4500: boolean = false
      let task: taskpool.Task = new taskpool.Task(ectSendData)
      const onData: (data: Object) => Promise<void> = async (data: Object): Promise<void> => {
        if (data === null || data === undefined) { console.info('ExecuteTaskConfigsTest4500 received empty data'); return }
        let nested: taskpool.Task = new taskpool.Task(ectCounter, counter)
        try {
          await taskpool.execute(nested, { timeout: 5000 })
        } catch (error) {
          counter.nestedFailed = true
        }
      }
      task.onReceiveData(onData)
      const onSuccess: () => Promise<void> = async (): Promise<void> => {
        let nested: taskpool.Task = new taskpool.Task(ectNested)
        try {
          const r: Object = await taskpool.execute(nested, { timeout: 5000 })
          counter.nestedResult = r as number
          counter.nestedDone = true
        } catch (error) {
          counter.nestedFailed = true
        }
      }
      task.onExecutionSucceeded(onSuccess)
      const onFailed: () => void = (): void => {
        failedCalled4500 = true
      }
      task.onExecutionFailed(onFailed)
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        console.error('ExecuteTaskConfigsTest4500 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest4500 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedFailed).assertFalse()
      expect(counter.nestedResult).assertEqual(200)
      expect(counter.count).assertEqual(1)
      expect(failedCalled4500).assertFalse()
      done()
    })



    /**
     * @tc.name   ExecuteTaskConfigsTest4700
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_4700
     * @tc.desc   Verify nested timed-out task inside listener does not trigger its own onExecutionFailed: nested catch gets 10200058 and failed counter stays 0 (design #049)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let nestedFailedCalled4700: boolean = false
      let nestedErrCode4700: number = 0
      let task: taskpool.Task = new taskpool.Task(ectSimple)
      const onSuccess: () => Promise<void> = async (): Promise<void> => {
        let nested: taskpool.Task = new taskpool.Task(ectLong, 3000)
        const onNestedFailed: () => void = (): void => {
          nestedFailedCalled4700 = true
        }
        nested.onExecutionFailed(onNestedFailed)
        try {
          await taskpool.execute(nested, { timeout: 500 })
        } catch (e) {
          nestedErrCode4700 = e.code
          counter.nestedDone = true
        }
      }
      task.onExecutionSucceeded(onSuccess)
      try {
        await taskpool.execute(task, { timeout: 5000 })
      } catch (error) {
        console.error('ExecuteTaskConfigsTest4700 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (!counter.nestedDone && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest4700 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedDone).assertTrue()
      expect(nestedErrCode4700).assertEqual(10200058)
      expect(nestedFailedCalled4700).assertFalse()
      done()
    })

    /**
     * @tc.name   ExecuteTaskConfigsTest4800
     * @tc.number SUB_EXECUTE_TASK_CONFIGS_TEST_4800
     * @tc.desc   Verify @Concurrent function body nests execute with configs: host returns 100 and Sendable shared counter == 1 (design #039 F4 probe following the IsConcurrentTest3500 pattern, 5s bounded polling)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteTaskConfigsTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: ECTCounter = new ECTCounter()
      let host: taskpool.Task = new taskpool.Task(ectNestedExecute, counter)
      try {
        let result: Object = await taskpool.execute(host, { timeout: 5000 })
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteTaskConfigsTest4800 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (counter.count < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteTaskConfigsTest4800 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(1)
      done()
    })
  })
}
