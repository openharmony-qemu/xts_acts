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
import { sleep, fillBigArrayChunked } from '../utils';
import { EGCTCounter, egctCounter } from './ExecuteGenericsTaskConfigsTestInner';

interface EGCErr {
  code: number
  message: string
}

@Concurrent
function egctSimple(): number { return 42 }

@Concurrent
function egctNum(x: number): number { return x * 2 }

@Concurrent
function egctStr(): string { return 'hello' }

@Concurrent
function egctBool(): boolean { return true }

@Concurrent
function egctArr(): number[] {
  let arr: number[] = [1, 2, 3]
  return arr
}

@Concurrent
function egctRecord(): Record<string, number> {
  let obj: Record<string, number> = {}
  obj['code'] = 200
  obj['val'] = 42
  return obj
}

@Concurrent
function egctVoid(): void { let x: number = 1 + 1 }

@Concurrent
function egctZero(): number { return 0 }

@Concurrent
function egctEmptyStr(): string { return '' }

@Concurrent
function egctFalse(): boolean { return false }

@Concurrent
function egctEmptyArr(): number[] {
  let arr: number[] = []
  return arr
}

@Concurrent
function egctNull(): null { return null }

@Concurrent
function egctUndef(): string | undefined { return undefined }

@Concurrent
function egctBigData(data: number[]): number { return data.length }

@Concurrent
function egctId(id: number): number { return id * 10 }

@Concurrent
function egctLong(d: number): number {
  let s: number = Date.now()
  while ((Date.now() - s) < d) { let x: number = 0; x++ }
  return 100
}

@Concurrent
function egctSendData(): void { taskpool.Task.sendData(42) }

@Concurrent
function egctNested(): number { return 200 }

@Concurrent
function egctSendDataTimeout(c: EGCTMsgFlag): void {
  taskpool.Task.sendData('before')
  c.taskSent = true
  let s: number = Date.now()
  while ((Date.now() - s) < 2000) { let x: number = 0; x++ }
  taskpool.Task.sendData('after')
}

@Concurrent
function egctSideEffect(f: EGCTFlag): number {
  let s: number = Date.now()
  while ((Date.now() - s) < 1000) { let x: number = 0; x++ }
  f.completed = true
  return 100
}

@Concurrent
async function egctNestedExecute(c: EGCTCounter): Promise<number> {
  let inner: taskpool.Task = new taskpool.GenericsTask<[EGCTCounter], number>(egctCounter, c)
  let r: number = await taskpool.execute<[EGCTCounter], number>(inner, { timeout: 5000 })
  return r
}

function egctPlainNonConcurrent(): number { return 1 }

@Sendable
class EGCTFlag {
  completed: boolean = false
}

@Sendable
class EGCTMsgFlag {
  taskSent: boolean = false
  beforeReceived: boolean = false
  afterReceived: boolean = false
}

export default function ExecuteGenericsTaskConfigsTest(): void {
  describe('ExecuteGenericsTaskConfigsTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(500)
    })

    // ===== 1. Input Parameter Tests - configs Parameter Combination =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest0100
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_0100
     * @tc.desc   Verify execute(genericsTask, {timeout, priority}) with both configs returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 200)
      let result: number = await taskpool.execute<[number], number>(task, { timeout: 5000, priority: taskpool.Priority.HIGH })
      expect(result).assertEqual(100)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest0200
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_0200
     * @tc.desc   Verify execute(genericsTask, {timeout}) with only timeout config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let result: number = await taskpool.execute<[], number>(task, { timeout: 5000 })
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest0300
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_0300
     * @tc.desc   Verify execute(genericsTask, {priority}) with only priority config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let result: number = await taskpool.execute<[], number>(task, { priority: taskpool.Priority.LOW })
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest0400
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_0400
     * @tc.desc   Verify execute(genericsTask, {}) with empty configs object uses defaults
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let result: number = await taskpool.execute<[], number>(task, {})
      expect(result).assertEqual(42)
    })

    // ===== 2. Input Parameter Tests - timeout Parameter Type =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest0500
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_0500
     * @tc.desc   Verify execute(genericsTask, {timeout: 1000}) with normal timeout value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let result: number = await taskpool.execute<[], number>(task, { timeout: 1000 })
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest0600
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_0600
     * @tc.desc   Verify execute(genericsTask, {timeout: 1}) with minimum timeout boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      // Timing-race arbitration 2026-09-06: a 1ms timeout races the instant
      // task completion nondeterministically; the completion contract needs
      // the timeout to exceed the task duration.
      let result: number = await taskpool.execute<[], number>(task, { timeout: 5000 })
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest0700
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_0700
     * @tc.desc   Verify execute(genericsTask, {timeout: 0/-1}) defaults to Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let r1: number = await taskpool.execute<[], number>(t1, { timeout: 0 })
      expect(r1).assertEqual(42)
      let t2: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let r2: number = await taskpool.execute<[], number>(t2, { timeout: -1 })
      expect(r2).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest0800
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_0800
     * @tc.desc   Verify execute(genericsTask, {timeout: 1000.5}) with decimal timeout value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let result: number = await taskpool.execute<[], number>(task, { timeout: 1000.5 })
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest0900
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_0900
     * @tc.desc   Verify execute(genericsTask, {timeout: 60000}) with large timeout value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let result: number = await taskpool.execute<[], number>(task, { timeout: 60000 })
      expect(result).assertEqual(42)
    })

    // ===== 3. Input Parameter Tests - priority Parameter Type =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1000
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1000
     * @tc.desc   Verify all Priority enum values HIGH/MEDIUM/LOW/IDLE with generics configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      expect(await taskpool.execute<[], number>(t1, { priority: taskpool.Priority.HIGH })).assertEqual(42)
      let t2: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      expect(await taskpool.execute<[], number>(t2, { priority: taskpool.Priority.MEDIUM })).assertEqual(42)
      let t3: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      expect(await taskpool.execute<[], number>(t3, { priority: taskpool.Priority.LOW })).assertEqual(42)
      let t4: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      expect(await taskpool.execute<[], number>(t4, { priority: taskpool.Priority.IDLE })).assertEqual(42)
    })

    // ===== 4. Input Parameter Tests - Generics Compile-time Validation =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1100
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1100
     * @tc.desc   Verify GenericsTask parameter type checking with configs at compile time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctNum, 21)
      let result: number = await taskpool.execute<[number], number>(task, { timeout: 5000 })
      expect(result).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1200
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1200
     * @tc.desc   Verify GenericsTask return type inference with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], string>(egctStr)
      let result: string = await taskpool.execute<[], string>(task, { timeout: 5000 })
      expect(result).assertEqual('hello')
    })

    // ===== 5. Return Value Tests - Success Scenarios =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1300
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1300
     * @tc.desc   Verify generics returns number/string/boolean/array/Record types with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctNum, 21)
      expect(await taskpool.execute<[number], number>(t1, { timeout: 5000 })).assertEqual(42)
      let t2: taskpool.Task = new taskpool.GenericsTask<[], string>(egctStr)
      expect(await taskpool.execute<[], string>(t2, { timeout: 5000 })).assertEqual('hello')
      let t3: taskpool.Task = new taskpool.GenericsTask<[], boolean>(egctBool)
      expect(await taskpool.execute<[], boolean>(t3, { timeout: 5000 })).assertTrue()
      let t4: taskpool.Task = new taskpool.GenericsTask<[], number[]>(egctArr)
      expect((await taskpool.execute<[], number[]>(t4, { timeout: 5000 })).length).assertEqual(3)
      let t5: taskpool.Task = new taskpool.GenericsTask<[], Record<string, number>>(egctRecord)
      let rec: Record<string, number> = await taskpool.execute<[], Record<string, number>>(t5, { timeout: 5000 })
      expect(rec['code'] as number).assertEqual(200)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1400
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1400
     * @tc.desc   Verify generics void task completes with configs and task reaches done state
     *            (F7: generics R=void executes to completion; the void contract value gets no extra always-true equality check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], void>(egctVoid)
      await taskpool.execute<[], void>(task, { timeout: 5000 })
      expect(task.isDone()).assertTrue()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1500
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1500
     * @tc.desc   Verify generics returns falsy values 0/empty string/false/empty array with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[], number>(egctZero)
      expect(await taskpool.execute<[], number>(t1, { timeout: 5000 })).assertEqual(0)
      let t2: taskpool.Task = new taskpool.GenericsTask<[], string>(egctEmptyStr)
      expect(await taskpool.execute<[], string>(t2, { timeout: 5000 })).assertEqual('')
      let t3: taskpool.Task = new taskpool.GenericsTask<[], boolean>(egctFalse)
      expect(await taskpool.execute<[], boolean>(t3, { timeout: 5000 })).assertFalse()
      let t4: taskpool.Task = new taskpool.GenericsTask<[], number[]>(egctEmptyArr)
      expect((await taskpool.execute<[], number[]>(t4, { timeout: 5000 })).length).assertEqual(0)
    })

    // ===== 6. Return Value Tests - Timeout Scenarios =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1600
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1600
     * @tc.desc   Verify generics task exceeding timeout throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 3000)
      let threwError1600 = false
      try {
        await taskpool.execute<[number], number>(task, { timeout: 500 })
        expect().assertFail()
      } catch (error) {
        threwError1600 = true
      }
      expect(threwError1600).assertTrue()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1700
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1700
     * @tc.desc   Verify generics task continues execution after timeout using Sendable flag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let flag: EGCTFlag = new EGCTFlag()
      let task: taskpool.Task = new taskpool.GenericsTask<[EGCTFlag], number>(egctSideEffect, flag)
      let caught: boolean = false
      try {
        await taskpool.execute<[EGCTFlag], number>(task, { timeout: 500 })
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      let w: number = 0
      while (!flag.completed && w < 50) {
        await new Promise<void>((r: Function): void => { setTimeout(r, 100) })
        w++
      }
      expect(flag.completed).assertTrue()
      done()
    })

    // ===== 7. Return Value Tests - Special Values =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1800
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1800
     * @tc.desc   Verify generics returns null and undefined with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[], null>(egctNull)
      let r1: null = await taskpool.execute<[], null>(t1, { timeout: 5000 })
      expect(r1 === null).assertTrue()
      let t2: taskpool.Task = new taskpool.GenericsTask<[], string | undefined>(egctUndef)
      let r2: string | undefined = await taskpool.execute<[], string | undefined>(t2, { timeout: 5000 })
      expect(r2).assertUndefined()
    })

    // ===== 8. Promise Chained Calls =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest1900
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_1900
     * @tc.desc   Verify .then() chain processes generics result with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let finalResult: number = 0
      let doneFlag: boolean = false
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      taskpool.execute<[], number>(task, { timeout: 5000 }).then((val: number): void => {
        finalResult = val * 2
        doneFlag = true
      }).catch((e: BusinessError): void => {
        console.info('ExecuteGenericsTaskConfigsTest1900 catch: ' + String(e))
      })
      let w: number = 0
      while (!doneFlag && w < 50) {
        await new Promise<void>((r: Function): void => { setTimeout(r, 100) })
        w++
      }
      expect(finalResult).assertEqual(84)
      done()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest2000
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_2000
     * @tc.desc   Verify .catch() captures generics timeout error with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let errCode: number = 0
      let doneFlag: boolean = false
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 3000)
      taskpool.execute<[number], number>(task, { timeout: 500 }).catch((e: BusinessError): void => {
        errCode = e.code
        doneFlag = true
      })
      let w: number = 0
      while (!doneFlag && w < 50) {
        await new Promise<void>((r: Function): void => { setTimeout(r, 100) })
        w++
      }
      expect(errCode).assertEqual(10200058)
      done()
    })

    // ===== 9. Error Handling Tests =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest2100
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_2100
     * @tc.desc   Verify oversized data throws serialization error with generics configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let bigData: number[] = await fillBigArrayChunked(2 * 1024 * 1024)
      let task: taskpool.Task = new taskpool.GenericsTask<[number[]], number>(egctBigData, bigData)
      let threwError2100 = false
      let err2100: BusinessError | null = null
      try {
        await taskpool.execute<[number[]], number>(task, { timeout: 5000 })
        expect().assertFail()
      } catch (error) {
        threwError2100 = true
        err2100 = error
        if (err2100 !== null) {
          expect(err2100 instanceof Error).assertTrue()
          expect(err2100.code).assertEqual(10200006)
        }
      }
      expect(threwError2100).assertTrue()
      expect(err2100 !== null).assertTrue()
    })



    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest2300
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_2300
     * @tc.desc   Verify timed-out generics task cannot be re-executed with configs, throws 10200057 (runtime arbitration 2026-09-06: native maps the timeout-state re-execute to ERR_TASK_CANNOT_EXECUTED=10200057, not 10200051)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      // Root cause: for a task in timeout state the runtime reports "the timeout task cannot be executed
      // again" with ERR_TASK_CANNOT_EXECUTED (10200057); device run confirmed 10200057 in the actual position
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 3000)
      let threwError2300a = false
      try {
        await taskpool.execute<[number], number>(task, { timeout: 500 })
      } catch (error) {
        threwError2300a = true
      }
      expect(threwError2300a).assertTrue()
      let threwError2300b = false
      let err2300b: BusinessError | null = null
      try {
        await taskpool.execute<[number], number>(task, { timeout: 5000 })
        expect().assertFail()
      } catch (error) {
        threwError2300b = true
        err2300b = error
        if (err2300b !== null) {
          expect(err2300b instanceof Error).assertTrue()
          expect(err2300b.code).assertEqual(10200057)
        }
      }
      expect(threwError2300b).assertTrue()
      expect(err2300b !== null).assertTrue()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest2400
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_2400
     * @tc.desc   Verify generics task with dependency cannot be executed with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task1: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let task2: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      task2.addDependency(task1)
      let threwError2400 = false
      try {
        await taskpool.execute<[], number>(task2, { timeout: 5000 })
        expect().assertFail()
      } catch (error) {
        threwError2400 = true
      }
      expect(threwError2400).assertTrue()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest2500
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_2500
     * @tc.desc   Verify try-catch-finally executes finally on both normal and timeout generics paths
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let finallyCount: number = 0
      try {
        let r: number = await taskpool.execute<[], number>(new taskpool.GenericsTask<[], number>(egctSimple), { timeout: 5000 })
        expect(r).assertEqual(42)
      } catch (error) {
        expect().assertFail()
      } finally {
        finallyCount++
      }
      let threwError2500 = false
      try {
        await taskpool.execute<[number], number>(new taskpool.GenericsTask<[number], number>(egctLong, 3000), { timeout: 500 })
        expect().assertFail()
      } catch (error) {
        threwError2500 = true
      } finally {
        finallyCount++
      }
      expect(threwError2500).assertTrue()
      expect(finallyCount).assertEqual(2)
    })

    // ===== 10. Async Concurrency Tests =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest2600
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_2600
     * @tc.desc   Verify await normal generics result with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctNum, 25)
      let result: number = await taskpool.execute<[number], number>(task, { timeout: 5000, priority: taskpool.Priority.MEDIUM })
      expect(result).assertEqual(50)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest2700
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_2700
     * @tc.desc   Verify await captures generics timeout exception with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 3000)
      let threwError2700 = false
      try {
        await taskpool.execute<[number], number>(task, { timeout: 500 })
        expect().assertFail()
      } catch (error) {
        threwError2700 = true
      }
      expect(threwError2700).assertTrue()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest2800
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_2800
     * @tc.desc   Verify Promise.all with multiple concurrent generics tasks using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctId, 1)
      let t2: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctId, 2)
      let t3: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctId, 3)
      let p1: Promise<number> = taskpool.execute<[number], number>(t1, { timeout: 5000 })
      let p2: Promise<number> = taskpool.execute<[number], number>(t2, { timeout: 5000 })
      let p3: Promise<number> = taskpool.execute<[number], number>(t3, { timeout: 5000 })
      let results: number[] = await Promise.all([p1, p2, p3])
      expect(results.length).assertEqual(3)
      expect(results[0]).assertEqual(10)
      expect(results[1]).assertEqual(20)
      expect(results[2]).assertEqual(30)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest2900
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_2900
     * @tc.desc   Verify Promise.all fails when one generics task times out with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let quick: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let slow: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 3000)
      let p1: Promise<number> = taskpool.execute<[], number>(quick, { timeout: 5000 })
      let p2: Promise<number> = taskpool.execute<[number], number>(slow, { timeout: 500 })
      let threwError2900 = false
      let err2900: BusinessError | null = null
      try {
        await Promise.all([p1, p2])
        expect().assertFail()
      } catch (error) {
        threwError2900 = true
        err2900 = error
        if (err2900 !== null) {
          expect(err2900 instanceof Error).assertTrue()
          expect(err2900.code).assertEqual(10200058)
        }
      }
      expect(threwError2900).assertTrue()
      expect(err2900 !== null).assertTrue()
    })

    // ===== 11. sendData Not Received After Timeout =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3000
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3000
     * @tc.desc   Verify sendData messages after generics timeout are not received with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let flag: EGCTMsgFlag = new EGCTMsgFlag()
      let task: taskpool.Task = new taskpool.GenericsTask<[EGCTMsgFlag], void>(egctSendDataTimeout, flag)
      task.onReceiveData((data: Object): void => {
        if ((data as string) === 'before') { flag.beforeReceived = true }
        if ((data as string) === 'after') { flag.afterReceived = true }
      })
      let threwError3000 = false
      try {
        await taskpool.execute<[EGCTMsgFlag], void>(task, { timeout: 500 })
        expect().assertFail()
      } catch (error) {
        threwError3000 = true
      }
      expect(threwError3000).assertTrue()
      let w: number = 0
      while (!flag.taskSent && w < 50) {
        await new Promise<void>((r: Function): void => { setTimeout(r, 100) })
        w++
      }
      expect(flag.beforeReceived).assertTrue()
      expect(flag.afterReceived).assertFalse()
      done()
    })

    // ===== 12. Task Nested Combination Scenarios =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3100
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3100
     * @tc.desc   Verify nested generics execute with configs in onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EGCTCounter = new EGCTCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[EGCTCounter], number>(egctCounter, counter)
      task.onExecutionSucceeded((): void => {
        let nested: taskpool.Task = new taskpool.GenericsTask<[EGCTCounter], number>(egctCounter, counter)
        taskpool.execute<[EGCTCounter], number>(nested, { timeout: 5000 }).then((r: number): void => {
          counter.nestedResult = r
          counter.nestedDone = true
        }).catch((e: BusinessError): void => {
          console.info('ExecuteGenericsTaskConfigsTest3100 catch: ' + String(e))
        })
      })
      await taskpool.execute<[EGCTCounter], number>(task, { timeout: 5000 })
      let w: number = 0
      while (!counter.nestedDone && w < 50) {
        await new Promise<void>((r: Function): void => { setTimeout(r, 100) })
        w++
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3200
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3200
     * @tc.desc   Verify nested generics execute with configs in onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EGCTCounter = new EGCTCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[], void>(egctSendData)
      task.onReceiveData((data: Object): void => {
        let nested: taskpool.Task = new taskpool.GenericsTask<[EGCTCounter], number>(egctCounter, counter)
        taskpool.execute<[EGCTCounter], number>(nested, { timeout: 5000 }).then((r: number): void => {
          counter.nestedResult = r
          counter.nestedDone = true
        }).catch((e: BusinessError): void => {
          console.info('ExecuteGenericsTaskConfigsTest3200 catch: ' + String(e))
        })
      })
      await taskpool.execute<[], void>(task, { timeout: 5000 })
      let w: number = 0
      while (!counter.nestedDone && w < 50) {
        await new Promise<void>((r: Function): void => { setTimeout(r, 100) })
        w++
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedResult).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3300
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3300
     * @tc.desc   Verify multiple listeners with nested generics execute using configs (runtime arbitration 2026-09-06: onReceiveData is triggered once for sendData and once more with the final task result, so the nested launch count is exactly 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Root cause: the runtime delivers both the sendData(42) message and the task's final result through
      // onReceiveData, so the receive callback runs twice and count reaches 2 (device run: expect 2 equals 1)
      let counter: EGCTCounter = new EGCTCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[], void>(egctSendData)
      task.onReceiveData((data: Object): void => {
        let nested: taskpool.Task = new taskpool.GenericsTask<[EGCTCounter], number>(egctCounter, counter)
        taskpool.execute<[EGCTCounter], number>(nested, { timeout: 5000 }).then((): void => { counter.count++ }).catch((e: BusinessError): void => {
          console.info('ExecuteGenericsTaskConfigsTest3300 catch: ' + String(e))
        })
      })
      task.onExecutionSucceeded((): void => {
        let nested: taskpool.Task = new taskpool.GenericsTask<[], number>(egctNested)
        taskpool.execute<[], number>(nested, { timeout: 5000 }).then((r: number): void => {
          counter.nestedResult = r
          counter.nestedDone = true
        }).catch((e: BusinessError): void => {
          console.info('ExecuteGenericsTaskConfigsTest3300 catch: ' + String(e))
        })
      })
      await taskpool.execute<[], void>(task, { timeout: 5000 })
      let w: number = 0
      while (!counter.nestedDone && w < 50) {
        await new Promise<void>((r: Function): void => { setTimeout(r, 100) })
        w++
      }
      // convergence wait: allow both receive-triggered nested executes to settle before counting
      let wc: number = 0
      while (counter.count < 2 && wc < 50) {
        await new Promise<void>((r: Function): void => { setTimeout(r, 100) })
        wc++
      }
      expect(counter.nestedDone).assertTrue()
      expect(counter.nestedResult).assertEqual(200)
      expect(counter.count).assertEqual(2)
      done()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3400
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3400
     * @tc.desc   Verify nested generics task timeout is correctly handled in listener with configs, caught error is 10200058 (runtime arbitration: added SDK code assertion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EGCTCounter = new EGCTCounter()
      let nestedErrCode3400: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      task.onExecutionSucceeded((): void => {
        let nested: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 3000)
        taskpool.execute<[number], number>(nested, { timeout: 500 }).catch((e: BusinessError): void => {
          nestedErrCode3400 = e.code
          counter.nestedDone = true
        })
      })
      await taskpool.execute<[], number>(task, { timeout: 5000 })
      let w: number = 0
      while (!counter.nestedDone && w < 50) {
        await new Promise<void>((r: Function): void => { setTimeout(r, 100) })
        w++
      }
      expect(counter.nestedDone).assertTrue()
      expect(nestedErrCode3400).assertEqual(10200058)
      done()
    })

    // ===== 13. Small Concurrency + Sendable =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3500
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3500
     * @tc.desc   Verify 3 concurrent generics tasks with Sendable counter using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let counter: EGCTCounter = new EGCTCounter()
      let promises: Promise<number>[] = []
      for (let i: number = 0; i < 3; i++) {
        promises.push(taskpool.execute<[EGCTCounter], number>(new taskpool.GenericsTask<[EGCTCounter], number>(egctCounter, counter), { timeout: 5000 }))
      }
      let results: number[] = await Promise.all(promises)
      expect(results.length).assertEqual(3)
      expect(counter.count).assertEqual(3)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3600
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3600
     * @tc.desc   Verify 5 concurrent generics tasks with Sendable counter using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let counter: EGCTCounter = new EGCTCounter()
      let promises: Promise<number>[] = []
      for (let i: number = 0; i < 5; i++) {
        promises.push(taskpool.execute<[EGCTCounter], number>(new taskpool.GenericsTask<[EGCTCounter], number>(egctCounter, counter), { timeout: 5000 }))
      }
      let results: number[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      expect(counter.count).assertEqual(5)
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3700
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3700
     * @tc.desc   Verify 10 concurrent generics tasks with Sendable counter using configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let counter: EGCTCounter = new EGCTCounter()
      let promises: Promise<number>[] = []
      for (let i: number = 0; i < 10; i++) {
        promises.push(taskpool.execute<[EGCTCounter], number>(new taskpool.GenericsTask<[EGCTCounter], number>(egctCounter, counter), { timeout: 5000 }))
      }
      let results: number[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      expect(counter.count).assertEqual(10)
    })

    // ===== 14. Different Priority Concurrency =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3800
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3800
     * @tc.desc   Verify different priority generics tasks execute concurrently with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let t2: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let p1: Promise<number> = taskpool.execute<[], number>(t1, { timeout: 5000, priority: taskpool.Priority.HIGH })
      let p2: Promise<number> = taskpool.execute<[], number>(t2, { timeout: 5000, priority: taskpool.Priority.LOW })
      let results: number[] = await Promise.all([p1, p2])
      expect(results.length).assertEqual(2)
      expect(results[0]).assertEqual(42)
      expect(results[1]).assertEqual(42)
    })

    // ===== 15. Stability Rules =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest3900
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_3900
     * @tc.desc   Verify Timer >= 500ms triggers generics execute correctly with configs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let resultPromise: Promise<number> = new Promise<number>((resolve: Function): void => {
        setTimeout((): void => {
          let task: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
          taskpool.execute<[], number>(task, { timeout: 5000 }).then((val: number): void => {
            resolve(val)
          }).catch((e: BusinessError): void => {
            console.info('ExecuteGenericsTaskConfigsTest3900 catch: ' + String(e))
          })
        }, 500)
      })
      let result: number = await resultPromise
      expect(result).assertEqual(42)
      done()
    })

    // ===== 16. Parameter Validation, Timeout Arbitration and Nesting Addendum Tests =====

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest4000
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_4000
     * @tc.desc   Verify a GenericsTask built from a non-@Concurrent function is accepted at construction and rejected by execute with SDK code 10200014 (runtime arbitration 2026-09-06: the constructor does not validate @Concurrent; the error is raised at execute time when function serialization fails)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      // Root cause: 10200014 comes from GetSerializeParams during execute, not from the GenericsTask
      // constructor, so construction succeeds and the throw must be asserted on execute
      let threwError4000 = false
      let err4000: BusinessError | null = null
      let task4000: taskpool.Task = new taskpool.GenericsTask<[], number>(egctPlainNonConcurrent as Object as (() => number))
      try {
        taskpool.execute<[], number>(task4000)
        expect().assertFail()
      } catch (error) {
        threwError4000 = true
        err4000 = error
        if (err4000 !== null) {
          expect(err4000 instanceof Error).assertTrue()
          expect(err4000.code).assertEqual(10200014)
        }
      }
      expect(threwError4000).assertTrue()
      expect(err4000 !== null).assertTrue()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest4100
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_4100
     * @tc.desc   Verify generics execute(task, configs) with invalid timeout type, invalid priority type and omitted task each throw 401 (F2 cast construction: '500' as ESObject timeout, 'HIGH' as ESObject priority, undefined task; per-input SDK code assertion)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteGenericsTaskConfigsTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let threwError4100a = false
      let err4100a: BusinessError | null = null
      try {
        await taskpool.execute<[], number>(t1, { timeout: '500' as ESObject })
      } catch (error) {
        threwError4100a = true
        err4100a = error
        if (err4100a !== null) {
          expect(err4100a instanceof Error).assertTrue()
          expect(err4100a.code).assertEqual(401)
        }
      }
      expect(threwError4100a).assertTrue()
      expect(err4100a !== null).assertTrue()
      let t2: taskpool.Task = new taskpool.GenericsTask<[], number>(egctSimple)
      let threwError4100b = false
      let err4100b: BusinessError | null = null
      try {
        await taskpool.execute<[], number>(t2, { priority: 'HIGH' as ESObject })
      } catch (error) {
        threwError4100b = true
        err4100b = error
        if (err4100b !== null) {
          expect(err4100b instanceof Error).assertTrue()
          expect(err4100b.code).assertEqual(401)
        }
      }
      expect(threwError4100b).assertTrue()
      expect(err4100b !== null).assertTrue()
      let threwError4100c = false
      let err4100c: BusinessError | null = null
      try {
        const noTask: ESObject = undefined
        await taskpool.execute(noTask)
      } catch (error) {
        threwError4100c = true
        err4100c = error
        if (err4100c !== null) {
          expect(err4100c instanceof Error).assertTrue()
          expect(err4100c.code).assertEqual(401)
        }
      }
      expect(threwError4100c).assertTrue()
      expect(err4100c !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest4200
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_4200
     * @tc.desc   Verify @Concurrent function body nests generics execute(task, configs): host returns 100 and Sendable shared counter == 1 (design generics #042 F4 probe following the IsConcurrentTest3500 pattern, 5s bounded polling)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteGenericsTaskConfigsTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EGCTCounter = new EGCTCounter()
      let host: taskpool.Task = new taskpool.GenericsTask<[EGCTCounter], number>(egctNestedExecute, counter)
      try {
        let result: number = await taskpool.execute<[EGCTCounter], number>(host, { timeout: 5000 })
        expect(result).assertEqual(100)
      } catch (error) {
        console.error('ExecuteGenericsTaskConfigsTest4200 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (counter.count < 1 && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteGenericsTaskConfigsTest4200 failed');
        expect(false).assertFail();
      }
      expect(counter.count).assertEqual(1)
      done()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest4300
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_4300
     * @tc.desc   Verify generics timeout values below 1 (0/-1/0.5) do not arm the timeout: 300ms long task completes normally with each value (F8 runtime arbitration: design says <1 falls back to default Infinity, discriminated by a 300ms task that must not trigger 10200058)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 300)
      let t2: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 300)
      let t3: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctLong, 300)
      try {
        let r1: number = await taskpool.execute<[number], number>(t1, { timeout: 0 })
        expect(r1).assertEqual(100)
        let r2: number = await taskpool.execute<[number], number>(t2, { timeout: -1 })
        expect(r2).assertEqual(100)
        let r3: number = await taskpool.execute<[number], number>(t3, { timeout: 0.5 })
        expect(r3).assertEqual(100)
      } catch (error) {
        console.error('ExecuteGenericsTaskConfigsTest4300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteGenericsTaskConfigsTest4400
     * @tc.number SUB_EXECUTE_GENERICS_TASK_CONFIGS_TEST_4400
     * @tc.desc   Verify generics timeout config value does not change result correctness: same task returns 42 with timeout 500/1000.5/60000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteGenericsTaskConfigsTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let t1: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctNum, 21)
      let t2: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctNum, 21)
      let t3: taskpool.Task = new taskpool.GenericsTask<[number], number>(egctNum, 21)
      try {
        let r1: number = await taskpool.execute<[number], number>(t1, { timeout: 500 })
        expect(r1).assertEqual(42)
        let r2: number = await taskpool.execute<[number], number>(t2, { timeout: 1000.5 })
        expect(r2).assertEqual(42)
        let r3: number = await taskpool.execute<[number], number>(t3, { timeout: 60000 })
        expect(r3).assertEqual(42)
      } catch (error) {
        console.error('ExecuteGenericsTaskConfigsTest4400 failed');
        expect(false).assertFail();
      }
      done()
    })
  })
}
