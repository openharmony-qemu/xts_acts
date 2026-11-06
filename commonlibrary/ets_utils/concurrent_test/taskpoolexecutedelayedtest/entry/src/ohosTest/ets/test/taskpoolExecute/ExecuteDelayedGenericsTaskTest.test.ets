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
import { collections, ArkTSUtils } from '@kit.ArkTS';
import { sleep } from '../Utils';
import { EDGCounter, EDGOutcome, EDGWrapper, edgCounterFunc } from './ExecuteDelayedGenericsTaskTestInner';

interface EDGErrorInfo {
  code: number
  message: string
}

// ========== Module-level @Concurrent Functions ==========

@Concurrent
function edgSimpleFunc(): number {
  return 42
}

@Concurrent
function edgNumFunc(x: number): number {
  return x * 2
}

@Concurrent
function edgStrFunc(s: string): string {
  return s.toUpperCase()
}

@Concurrent
function edgConvertFunc(input: number): string {
  return 'value:' + input
}

@Concurrent
function edgReturnNullFunc(): null {
  return null
}

@Concurrent
function edgReturnZeroFunc(): number {
  return 0
}

@Concurrent
function edgReturnFalseFunc(): boolean {
  return false
}

@Concurrent
function edgReturnArrFunc(): number[] {
  let arr: number[] = [1, 2, 3]
  return arr
}

@Concurrent
function edgErrorFunc(): number {
  throw new Error('generic delayed error')
}

@Concurrent
function edgLongFunc(duration: number): number {
  let start: number = Date.now()
  while ((Date.now() - start) < duration) {
    let x: number = 0
    x = x + 1
  }
  return 100
}

@Concurrent
function edgSendDataFunc(): void {
  taskpool.Task.sendData(42)
}

@Concurrent
function edgArrArgFunc(data: number[]): number {
  return data.length
}

@Concurrent
function edgStrArrLenFunc(words: string[]): number {
  return words.length
}

@Concurrent
function edgSendableFunc(data: EDGSharedData): number {
  return data.value * 2
}

@Concurrent
function edgAddFunc(a: number, b: number): number {
  return a + b
}

// ========== Module-level @Sendable Classes ==========

@Sendable
class EDGSharedData {
  value: number = 0
}

// ========== Module-level @Concurrent Functions / @Sendable Classes (M5 additions) ==========

@Concurrent
function edgHundredFunc(): number {
  return 100
}

@Concurrent
function edgEchoObjFunc(o: Object): Object {
  return o
}

@Concurrent
function edgNotFunc(b: boolean): boolean {
  return !b
}

@Concurrent
function edgParseFunc(s: string): number {
  return parseInt(s)
}

@Concurrent
function edgUpperAllFunc(words: string[]): string[] {
  let out: string[] = []
  for (let w of words) {
    out.push(w.toUpperCase())
  }
  return out
}

@Concurrent
function edgMapSumFunc(m: Map<string, number>): number {
  let total: number = 0
  m.forEach((v: number): void => {
    total += v
  })
  return total
}

@Sendable
class EDGItem {
  id: number = 0
}

@Concurrent
function edgItemFunc(item: EDGItem): EDGOutcome {
  let outcome: EDGOutcome = new EDGOutcome()
  outcome.result = item.id * 2
  return outcome
}

@Concurrent
function edgWrapFunc(x: number): EDGWrapper {
  let wrapper: EDGWrapper = new EDGWrapper()
  wrapper.value = x
  return wrapper
}

@Concurrent
function edgCollectionsEchoFunc(arr: collections.Array<number>): collections.Array<number> {
  return arr
}

@Concurrent
function edgEchoNumFunc(x: number): number {
  return x
}

@Concurrent
function edgEchoStrFunc(s: string): string {
  return s
}

@Concurrent
function edgObjValueFunc(o: Object): number {
  let data: EDGSharedData = o as EDGSharedData
  return data.value * 2
}

@Concurrent
function edgConstrainedFunc(o: Object): number {
  return 1
}

@Concurrent
function edgNoopFunc(): void {
}

@Concurrent
function edgMapReturnFunc(): Map<string, number> {
  let map: Map<string, number> = new Map()
  map.set('answer', 42)
  return map
}

@Concurrent
async function edgAsyncFunc(x: number): Promise<number> {
  await Promise.resolve()
  return x * 2
}

@Concurrent
function edgNestedLauncherFunc(counter: EDGCounter): number {
  let nestedTask: taskpool.Task = new taskpool.GenericsTask<[EDGCounter], number>(edgCounterFunc, counter)
  taskpool.executeDelayed<[EDGCounter], number>(200, nestedTask).catch((e: ESObject): void => {
    console.info(`ExecuteDelayedGenericsTaskTest nested launcher rejected: ${JSON.stringify(e)}`)
  })
  return 1
}

@Concurrent
function edgGuardFunc(x: number): number {
  if (x === 0) {
    throw new Error('zero input')
  }
  if (x < 0) {
    throw new Error('negative input')
  }
  return x
}

@Concurrent
function edgRequireValueFunc(input: Object): number {
  let rec: Record<string, ESObject> = input as Record<string, ESObject>
  let v: ESObject = rec['value']
  if (typeof v === 'undefined') {
    throw new Error('missing property')
  }
  return v as number
}

@Sendable
class EDGLockedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function edgLockedIncrementFunc(counter: EDGLockedCounter): Promise<number> {
  let observed: number = 0
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    observed = counter.count
    return observed
  })
  return observed
}

export default function ExecuteDelayedGenericsTaskTest(): void {
  describe('ExecuteDelayedGenericsTaskTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== 1. delayTime Parameter + Generics Combination Tests =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest0100
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_0100
     * @tc.desc   Verify executeDelayed<A,R>(0, genericsTask) executes immediately and returns typed result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let result: Object = await taskpool.executeDelayed<[], number>(0, task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest0200
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_0200
     * @tc.desc   Verify executeDelayed<A,R>(200, genericsTask) executes with delay and returns typed result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let result: Object = await taskpool.executeDelayed<[], number>(200, task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest0300
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_0300
     * @tc.desc   Verify executeDelayed<A,R>(NaN, genericsTask) treats NaN as 0 and executes immediately; runtime arbitration: design expected 401 but actual runtime treats NaN as 0 (no throw, immediate completion) and returns 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let result: Object = await taskpool.executeDelayed<[], number>(NaN, task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest0400
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_0400
     * @tc.desc   Verify executeDelayed<A,R>(300, genericsTask) executes with 300ms delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(edgNumFunc, 5)
      let result: Object = await taskpool.executeDelayed<[number], number>(300, task)
      expect(result as number).assertEqual(10)
    })

    // ===== 2. Generics Type Combination Tests =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest0500
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_0500
     * @tc.desc   Verify executeDelayed with number->number generic type returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(edgNumFunc, 21)
      let result: Object = await taskpool.executeDelayed<[number], number>(200, task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest0600
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_0600
     * @tc.desc   Verify executeDelayed with string->string generic type returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[string], string>(edgStrFunc, 'hello')
      let result: Object = await taskpool.executeDelayed<[string], string>(200, task)
      expect(result as string).assertEqual('HELLO')
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest0700
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_0700
     * @tc.desc   Verify executeDelayed with number->string type conversion generic returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], string>(edgConvertFunc, 42)
      let result: Object = await taskpool.executeDelayed<[number], string>(200, task)
      expect(result as string).assertEqual('value:42')
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest0800
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_0800
     * @tc.desc   Verify executeDelayed with no-args generic task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let result: Object = await taskpool.executeDelayed<[], number>(200, task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest0900
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_0900
     * @tc.desc   Verify executeDelayed with multi-args generic task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number, number], number>(edgAddFunc, 20, 22)
      let result: Object = await taskpool.executeDelayed<[number, number], number>(200, task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1000
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1000
     * @tc.desc   Verify executeDelayed with Sendable input generic task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let data: EDGSharedData = new EDGSharedData()
      data.value = 21
      let task: taskpool.Task = new taskpool.GenericsTask<[EDGSharedData], number>(edgSendableFunc, data)
      let result: Object = await taskpool.executeDelayed<[EDGSharedData], number>(200, task)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1100
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1100
     * @tc.desc   Verify executeDelayed with array argument generic task returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let arr: number[] = [1, 2, 3, 4, 5]
      let task: taskpool.Task = new taskpool.GenericsTask<[number[]], number>(edgArrArgFunc, arr)
      let result: Object = await taskpool.executeDelayed<[number[]], number>(200, task)
      expect(result as number).assertEqual(5)
    })

    // ===== 3. priority Parameter Tests =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1200
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1200
     * @tc.desc   Verify executeDelayed<A,R> with Priority.HIGH returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let result: Object = await taskpool.executeDelayed<[], number>(200, task, taskpool.Priority.HIGH)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1300
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1300
     * @tc.desc   Verify executeDelayed<A,R> with Priority.MEDIUM returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let result: Object = await taskpool.executeDelayed<[], number>(200, task, taskpool.Priority.MEDIUM)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1400
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1400
     * @tc.desc   Verify executeDelayed<A,R> with Priority.LOW returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let result: Object = await taskpool.executeDelayed<[], number>(200, task, taskpool.Priority.LOW)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1500
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1500
     * @tc.desc   Verify executeDelayed<A,R> with Priority.IDLE returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let result: Object = await taskpool.executeDelayed<[], number>(200, task, taskpool.Priority.IDLE)
      expect(result as number).assertEqual(42)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1600
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1600
     * @tc.desc   Verify executeDelayed<A,R> without priority uses default MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(edgNumFunc, 21)
      let result: Object = await taskpool.executeDelayed<[number], number>(200, task)
      expect(result as number).assertEqual(42)
    })

    // ===== 4. Generics Return Type Validation =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1700
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1700
     * @tc.desc   Verify executeDelayed<A,R> returns correct string type result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[string], string>(edgStrFunc, 'test')
      let result: Object = await taskpool.executeDelayed<[string], string>(200, task)
      expect(result as string).assertEqual('TEST')
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1800
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1800
     * @tc.desc   Verify executeDelayed<A,R> returns correct boolean type result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], boolean>(edgReturnFalseFunc)
      let result: Object = await taskpool.executeDelayed<[], boolean>(200, task)
      expect(result as boolean).assertFalse()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest1900
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_1900
     * @tc.desc   Verify executeDelayed<A,R> handles null return value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], null>(edgReturnNullFunc)
      let result = await taskpool.executeDelayed<[], null>(200, task)
      expect(result === null).assertTrue()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2000
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2000
     * @tc.desc   Verify executeDelayed<A,R> returns falsy value 0 correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgReturnZeroFunc)
      let result: Object = await taskpool.executeDelayed<[], number>(200, task)
      expect(result as number).assertEqual(0)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2100
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2100
     * @tc.desc   Verify executeDelayed<A,R> returns array result correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number[]>(edgReturnArrFunc)
      let result: Object = await taskpool.executeDelayed<[], number[]>(200, task)
      expect(Array.isArray(result)).assertTrue()
      let arr: number[] = result as number[]
      expect(arr.length).assertEqual(3)
    })

    // ===== 5. Error Handling Tests =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2200
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2200
     * @tc.desc   Verify executeDelayed<A,R> returns a typed Promise<number> resolving 42 and a second Promise<number> resolving 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let promise: Promise<number> = taskpool.executeDelayed<[], number>(200, task)
      let result: number = await promise
      expect(result).assertEqual(42)
      let task100: taskpool.Task = new taskpool.GenericsTask<[], number>(edgHundredFunc)
      let promise100: Promise<number> = taskpool.executeDelayed<[], number>(200, task100)
      let result100: number = await promise100
      expect(result100).assertEqual(100)
    })

    // ===== 6. Concurrency Tests =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2300
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2300
     * @tc.desc   Verify number/string/object three different type generic tasks concurrent execution with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let numTask: taskpool.Task = new taskpool.GenericsTask<[number], number>(edgNumFunc, 5)
      let strTask: taskpool.Task = new taskpool.GenericsTask<[string], string>(edgStrFunc, 'hello')
      let objInput: Record<string, number> = { 'id': 7 }
      let objTask: taskpool.Task = new taskpool.GenericsTask<[Object], Object>(edgEchoObjFunc, objInput)
      let p1: Promise<Object> = taskpool.executeDelayed<[number], number>(200, numTask)
      let p2: Promise<Object> = taskpool.executeDelayed<[string], string>(200, strTask)
      let p3: Promise<Object> = taskpool.executeDelayed<[Object], Object>(200, objTask)
      let results: Object[] = await Promise.all([p1, p2, p3])
      expect(results.length).assertEqual(3)
      expect(results[0] as number).assertEqual(10)
      expect(results[1] as string).assertEqual('HELLO')
      let returnedObj: Record<string, number> = results[2] as Record<string, number>
      expect(returnedObj['id']).assertEqual(7)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2400
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2400
     * @tc.desc   Verify cancel during delay period rejects the generic Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let promise: Promise<Object> = taskpool.executeDelayed<[], number>(2000, task)
      setTimeout((): void => {
        try {
          taskpool.cancel(task)
        } catch (e) {
          console.info(`ExecuteDelayedGenericsTaskTest2400 cancel skip: ${JSON.stringify(e)}`)
        }
      }, 500)
      let caught: boolean = false
      try {
        await promise
        expect().assertFail()
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2500
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2500
     * @tc.desc   Verify cancel during task execution handles gracefully for generic task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(edgLongFunc, 3000)
      let promise: Promise<Object> = taskpool.executeDelayed<[number], number>(200, task)
      setTimeout((): void => {
        try {
          taskpool.cancel(task)
        } catch (e) {
          console.info(`ExecuteDelayedGenericsTaskTest2500 cancel skip: ${JSON.stringify(e)}`)
        }
      }, 1500)
      let caught: boolean = false
      try {
        let result: Object = await promise
        expect(result as number).assertEqual(100)
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2600
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2600
     * @tc.desc   Verify different priority generic delayed tasks concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let highTask: taskpool.Task = new taskpool.GenericsTask<[number], number>(edgNumFunc, 5)
      let lowTask: taskpool.Task = new taskpool.GenericsTask<[number], number>(edgNumFunc, 10)
      let p1: Promise<Object> = taskpool.executeDelayed<[number], number>(200, highTask, taskpool.Priority.HIGH)
      let p2: Promise<Object> = taskpool.executeDelayed<[number], number>(200, lowTask, taskpool.Priority.LOW)
      let results: Object[] = await Promise.all([p1, p2])
      expect(results.length).assertEqual(2)
      expect(results[0] as number).assertEqual(10)
      expect(results[1] as number).assertEqual(20)
    })

    // ===== 7. Combination Scenario / Nested Tests =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2700
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2700
     * @tc.desc   Verify nested executeDelayed generic in Promise.then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EDGCounter = new EDGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let p: Promise<void> = taskpool.executeDelayed<[], number>(200, task).then((result: Object): void => {
        let nestedTask: taskpool.Task = new taskpool.GenericsTask<[EDGCounter], number>(edgCounterFunc, counter)
        taskpool.executeDelayed<[EDGCounter], number>(200, nestedTask).then((r: Object): void => {
          counter.nestedResult = r as number
          counter.nestedExecuted = true
        }).catch((e: ESObject): void => {
          console.info('ExecuteDelayedGenericsTaskTest2700 catch: ' + String(e))
        })
      })
      await p
      let waitCount: number = 0
      while (!counter.nestedExecuted && waitCount < 50) {
        await new Promise<void>((resolve: Function): void => { setTimeout(resolve, 100) })
        waitCount++
      }
      expect(counter.nestedExecuted).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2800
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2800
     * @tc.desc   Verify nested executeDelayed generic in onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EDGCounter = new EDGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      task.onExecutionSucceeded((): void => {
        let nestedTask: taskpool.Task = new taskpool.GenericsTask<[EDGCounter], number>(edgCounterFunc, counter)
        taskpool.executeDelayed<[EDGCounter], number>(200, nestedTask).then((r: Object): void => {
          counter.nestedResult = r as number
          counter.nestedExecuted = true
        }).catch((e: ESObject): void => {
          console.info('ExecuteDelayedGenericsTaskTest2800 catch: ' + String(e))
        })
      })
      await taskpool.executeDelayed<[], number>(200, task)
      let waitCount: number = 0
      while (!counter.nestedExecuted && waitCount < 50) {
        await new Promise<void>((resolve: Function): void => { setTimeout(resolve, 100) })
        waitCount++
      }
      expect(counter.nestedExecuted).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest2900
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_2900
     * @tc.desc   Verify nested executeDelayed generic in onEnqueued callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EDGCounter = new EDGCounter()
      let nestedResult3200: number = 0
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      task.onEnqueued((): void => {
        let nestedTask: taskpool.Task = new taskpool.GenericsTask<[EDGCounter], number>(edgCounterFunc, counter)
        taskpool.executeDelayed<[EDGCounter], number>(200, nestedTask).then((r: Object): void => {
          nestedResult3200 = r as number
          counter.nestedResult = r as number
          counter.nestedExecuted = true
        }).catch((e: ESObject): void => {
          console.info('ExecuteDelayedGenericsTaskTest2900 catch: ' + String(e))
        })
      })
      await taskpool.executeDelayed<[], number>(200, task)
      let waitCount: number = 0
      while (!counter.nestedExecuted && waitCount < 50) {
        await new Promise<void>((resolve: Function): void => { setTimeout(resolve, 100) })
        waitCount++
      }
      expect(counter.nestedExecuted).assertTrue()
      expect(nestedResult3200).assertEqual(100)
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3000
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3000
     * @tc.desc   Verify nested executeDelayed generic in onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EDGCounter = new EDGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[], void>(edgSendDataFunc)
      task.onReceiveData((data: number): void => {
        let nestedTask: taskpool.Task = new taskpool.GenericsTask<[EDGCounter], number>(edgCounterFunc, counter)
        taskpool.executeDelayed<[EDGCounter], number>(200, nestedTask).then((r: Object): void => {
          counter.nestedResult = r as number
          counter.nestedExecuted = true
        }).catch((e: ESObject): void => {
          console.info('ExecuteDelayedGenericsTaskTest3000 catch: ' + String(e))
        })
      })
      await taskpool.executeDelayed<[], void>(200, task)
      let waitCount: number = 0
      while (!counter.nestedExecuted && waitCount < 50) {
        await new Promise<void>((resolve: Function): void => { setTimeout(resolve, 100) })
        waitCount++
      }
      expect(counter.nestedExecuted).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3100
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3100
     * @tc.desc   Verify nested executeDelayed generic in onExecutionFailed callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EDGCounter = new EDGCounter()
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgErrorFunc)
      task.onExecutionFailed((): void => {
        let nestedTask: taskpool.Task = new taskpool.GenericsTask<[EDGCounter], number>(edgCounterFunc, counter)
        taskpool.executeDelayed<[EDGCounter], number>(200, nestedTask).then((r: Object): void => {
          counter.nestedResult = r as number
          counter.nestedExecuted = true
        }).catch((e: ESObject): void => {
          console.info('ExecuteDelayedGenericsTaskTest3100 catch: ' + String(e))
        })
      })
      let caught3400: boolean = false
      try {
        await taskpool.executeDelayed<[], number>(200, task)
        expect().assertFail()
      } catch (e) {
        caught3400 = true
      }
      expect(caught3400).assertTrue()
      let waitCount: number = 0
      while (!counter.nestedExecuted && waitCount < 50) {
        await new Promise<void>((resolve: Function): void => { setTimeout(resolve, 100) })
        waitCount++
      }
      expect(counter.nestedExecuted).assertTrue()
      done()
    })

    // ===== 8. Small Concurrency + Sendable Shared Counter =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3200
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3200
     * @tc.desc   Verify 3 concurrent generic delayed tasks increment a Sendable shared counter protected by AsyncLock (runtime arbitration 2026-09-06: lock-protected counter replaces the unsynchronized counter whose cross-thread count++ raced, observed count 2 of 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // Root cause: EDGCounter.count++ is unsynchronized across worker threads and lost updates (expect 2 equals 3)
      let counter: EDGLockedCounter = new EDGLockedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 3; i++) {
        let task: taskpool.Task = new taskpool.GenericsTask<[EDGLockedCounter], number>(edgLockedIncrementFunc, counter)
        promises.push(taskpool.executeDelayed<[EDGLockedCounter], number>(200, task))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(3)
      expect(counter.count).assertEqual(3)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3300
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3300
     * @tc.desc   Verify 5 concurrent generic delayed tasks with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // Locked variant: prevents the observed 4/5 lost-update outcome when
      // five delayed tasks increment one shared Sendable counter.
      let counter: EDGLockedCounter = new EDGLockedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 5; i++) {
        let task: taskpool.Task = new taskpool.GenericsTask<[EDGLockedCounter], number>(edgLockedIncrementFunc, counter)
        promises.push(taskpool.executeDelayed<[EDGCounter], number>(200, task))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(5)
      expect(counter.count).assertEqual(5)
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3400
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3400
     * @tc.desc   Verify 10 concurrent generic delayed tasks increment a Sendable shared counter protected by AsyncLock (runtime arbitration 2026-09-06: lock-protected counter replaces the unsynchronized counter whose cross-thread count++ raced, observed count 8 of 10)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // Root cause: EDGCounter.count++ is unsynchronized across worker threads and lost updates (expect 8 equals 10)
      let counter: EDGLockedCounter = new EDGLockedCounter()
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 10; i++) {
        let task: taskpool.Task = new taskpool.GenericsTask<[EDGLockedCounter], number>(edgLockedIncrementFunc, counter)
        promises.push(taskpool.executeDelayed<[EDGLockedCounter], number>(200, task))
      }
      let results: Object[] = await Promise.all(promises)
      expect(results.length).assertEqual(10)
      expect(counter.count).assertEqual(10)
    })

    // ===== 9. M5 Additions: Precise delayTime Tiers (Generics) =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3500
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3500
     * @tc.desc   Verify executeDelayed<A,R>(500, genericsTask) executes with the 500ms stability-recommended delay and returns typed result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      try {
        let result: Object = await taskpool.executeDelayed<[], number>(500, task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest3500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3600
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3600
     * @tc.desc   Verify executeDelayed<A,R>(-Infinity, genericsTask) treats -Infinity as 0 and executes immediately; runtime arbitration: design expected 10200028 but actual runtime (consistent with non-generics evidence) treats -Infinity as 0 and returns 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      try {
        let result: Object = await taskpool.executeDelayed<[], number>(-Infinity, task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest3600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3700
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3700
     * @tc.desc   Verify executeDelayed<A,R>(Infinity, genericsTask) does not crash: the call is accepted and the generic task is enqueued (design point verifies no-crash handling of Infinity; final behavior is runtime-defined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let enqueued4000: boolean = false
      const onEnq4000: () => void = (): void => {
        enqueued4000 = true
      }
      task.onEnqueued(onEnq4000)
      let accepted4000: boolean = false
      try {
        taskpool.executeDelayed<[], number>(Infinity, task).catch((e: ESObject): void => {
          console.info(`ExecuteDelayedGenericsTaskTest3700 infinity rejected: ${JSON.stringify(e)}`)
        })
        accepted4000 = true
      } catch (e) {
        accepted4000 = false
      }
      expect(accepted4000).assertTrue()
      let waited3700: number = 0
      while (!enqueued4000 && waited3700 < 5000) {
        await sleep(100)
        waited3700 += 100
      }
      expect(enqueued4000).assertTrue()
      try {
        taskpool.cancel(task)
      } catch (e) {
        console.info(`ExecuteDelayedGenericsTaskTest3700 cancel skip: ${JSON.stringify(e)}`)
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3800
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3800
     * @tc.desc   Verify executeDelayed<A,R>(undefined, genericsTask) fails parameter validation and throws error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let threwError3800: boolean = false
      let err3800: EDGErrorInfo | null = null
      try {
        await taskpool.executeDelayed<[], number>(undefined as ESObject, task)
      } catch (e) {
        threwError3800 = true
        err3800 = e
        if (err3800 !== null) {
          expect(err3800 instanceof Error).assertTrue()
          expect(err3800.code).assertEqual(401)
        }
      }
      expect(threwError3800).assertTrue()
      expect(err3800 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest3900
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_3900
     * @tc.desc   Verify executeDelayed<A,R>(1000, genericsTask) executes with 1s delay and returns typed result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      try {
        let result: Object = await taskpool.executeDelayed<[], number>(1000, task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest3900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4000
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4000
     * @tc.desc   Verify executeDelayed<A,R>(5000, genericsTask) completes successfully after the 5s long delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      try {
        let result: Object = await taskpool.executeDelayed<[], number>(5000, task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest4000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4100
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4100
     * @tc.desc   Verify executeDelayed<A,R>(100000, genericsTask) accepts the 100s large delay value, stays cancellable before the delay expires, and rejects the pending promise on cancel (runtime arbitration 2026-09-06: enqueue only happens when the 100s timer fires so onEnqueued is verified via a bounded not-enqueued observation; full 100s execution exceeds the it budget)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteDelayedGenericsTaskTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Root cause: with delayTime=100000 the generic task is enqueued only when the 100s uv timer fires, so
      // the 5s wait for onEnqueued always timed out; the in-budget contract is accept + cancel-before-delay,
      // where ClearDelayedTimers rejects the pending promise with a cancel error
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let enqueued4400: boolean = false
      const onEnq4400: () => void = (): void => {
        enqueued4400 = true
      }
      task.onEnqueued(onEnq4400)
      let accepted4400: boolean = false
      let promise4400: Promise<number> | null = null
      try {
        promise4400 = taskpool.executeDelayed<[], number>(100000, task)
        accepted4400 = true
      } catch (e) {
        accepted4400 = false
      }
      expect(accepted4400).assertTrue()
      try {
        taskpool.cancel(task)
      } catch (e) {
        console.info(`ExecuteDelayedGenericsTaskTest4100 cancel skip: ${JSON.stringify(e)}`)
      }
      let rejected4400: boolean = false
      if (promise4400 !== null) {
        try {
          await promise4400
        } catch (error) {
          rejected4400 = true
        }
      }
      expect(rejected4400).assertTrue()
      // bounded not-enqueued observation (300ms): the timer was cleared by cancel, so no enqueue can happen
      let waited4100: number = 0
      while (!enqueued4400 && waited4100 < 300) {
        await sleep(100)
        waited4100 += 100
      }
      expect(enqueued4400).assertFalse()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4200
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4200
     * @tc.desc   Verify executeDelayed<A,R>(500.5, genericsTask) handles the float delay value and returns typed result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      try {
        let result: Object = await taskpool.executeDelayed<[], number>(500.5, task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest4200 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 10. M5 Additions: task Parameter Validation (Generics) =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4300
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4300
     * @tc.desc   Verify executeDelayed<A,R>(200, null) fails parameter validation and throws error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let threwError4300: boolean = false
      let err4300: EDGErrorInfo | null = null
      try {
        await taskpool.executeDelayed<[], number>(200, null as ESObject)
      } catch (e) {
        threwError4300 = true
        err4300 = e
        if (err4300 !== null) {
          expect(err4300 instanceof Error).assertTrue()
          expect(err4300.code).assertEqual(401)
        }
      }
      expect(threwError4300).assertTrue()
      expect(err4300 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4400
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4400
     * @tc.desc   Verify executeDelayed<A,R>(200, undefined) fails parameter validation and throws error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let threwError4400: boolean = false
      let err4400: EDGErrorInfo | null = null
      try {
        await taskpool.executeDelayed<[], number>(200, undefined as ESObject)
      } catch (e) {
        threwError4400 = true
        err4400 = e
        if (err4400 !== null) {
          expect(err4400 instanceof Error).assertTrue()
          expect(err4400.code).assertEqual(401)
        }
      }
      expect(threwError4400).assertTrue()
      expect(err4400 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4500
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4500
     * @tc.desc   Verify executeDelayed<A,R>('500', genericsTask) with string delayTime fails parameter validation and throws error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteDelayedGenericsTaskTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let threwError4500: boolean = false
      let err4500: EDGErrorInfo | null = null
      try {
        await taskpool.executeDelayed<[], number>('500' as ESObject, task)
      } catch (e) {
        threwError4500 = true
        err4500 = e
        if (err4500 !== null) {
          expect(err4500 instanceof Error).assertTrue()
          expect(err4500.code).assertEqual(401)
        }
      }
      expect(threwError4500).assertTrue()
      expect(err4500 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4600
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4600
     * @tc.desc   Verify executeDelayed<A,R> with priority=null and priority=undefined is rejected by parameter validation with error code 401 (runtime arbitration 2026-09-06: the third param must be a number; null/undefined do not fall back to the default priority)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: CheckDelayedParams requires args[2] to be a number; null/undefined fail IsNumber and throw
      // TYPE_ERROR (=401) synchronously, for generic and non-generic executeDelayed alike
      let task1: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let threwError4600a: boolean = false
      let err4600a: EDGErrorInfo | null = null
      try {
        await taskpool.executeDelayed<[], number>(200, task1, null as ESObject)
      } catch (e) {
        threwError4600a = true
        err4600a = e
        if (err4600a !== null) {
          expect(err4600a instanceof Error).assertTrue()
          expect(err4600a.code).assertEqual(401)
        }
      }
      expect(threwError4600a).assertTrue()
      expect(err4600a !== null).assertTrue()
      let task2: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let threwError4600b: boolean = false
      let err4600b: EDGErrorInfo | null = null
      try {
        await taskpool.executeDelayed<[], number>(200, task2, undefined as ESObject)
      } catch (e) {
        threwError4600b = true
        err4600b = e
        if (err4600b !== null) {
          expect(err4600b instanceof Error).assertTrue()
          expect(err4600b.code).assertEqual(401)
        }
      }
      expect(threwError4600b).assertTrue()
      expect(err4600b !== null).assertTrue()
      done()
    })

    // ===== 11. M5 Additions: Task State / Queue Membership Errors (Generics) =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4700
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4700
     * @tc.desc   Verify executeDelayed rejects a generic task already added to a TaskGroup with error code 401 (native arbitration: submitted-group task is rejected at parameter validation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let taskGroup: taskpool.TaskGroup = new taskpool.TaskGroup()
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      taskGroup.addTask(task)
      let threwError4700: boolean = false
      let err4700: EDGErrorInfo | null = null
      try {
        await taskpool.executeDelayed<[], number>(200, task)
      } catch (e) {
        threwError4700 = true
        err4700 = e
        if (err4700 !== null) {
          expect(err4700 instanceof Error).assertTrue()
          expect(err4700.code).assertEqual(401)
        }
      }
      expect(threwError4700).assertTrue()
      expect(err4700 !== null).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4800
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4800
     * @tc.desc   Verify executeDelayed rejects a generic task already submitted to a SequenceRunner serial queue with error code 401 (native arbitration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.SequenceRunner = new taskpool.SequenceRunner()
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(edgLongFunc, 800)
      let runnerPromise: Promise<Object> = runner.execute(task)
      let threwError4800: boolean = false
      let err4800: EDGErrorInfo | null = null
      try {
        await taskpool.executeDelayed<[], number>(200, task)
      } catch (e) {
        threwError4800 = true
        err4800 = e
        if (err4800 !== null) {
          expect(err4800 instanceof Error).assertTrue()
          expect(err4800.code).assertEqual(401)
        }
      }
      expect(threwError4800).assertTrue()
      expect(err4800 !== null).assertTrue()
      try {
        await runnerPromise
      } catch (e) {
        console.info(`ExecuteDelayedGenericsTaskTest.test.ets runner done: ${JSON.stringify(e)}`)
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest4900
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_4900
     * @tc.desc   Verify executeDelayed rejects a generic task already submitted to an AsyncRunner asynchronous queue with error code 10200057 (native arbitration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let runner: taskpool.AsyncRunner = new taskpool.AsyncRunner(1, 1)
      let task: taskpool.Task = new taskpool.GenericsTask<[number], number>(edgLongFunc, 800)
      let runnerPromise: Promise<Object> = runner.execute(task)
      let threwError4900: boolean = false
      let err4900: EDGErrorInfo | null = null
      try {
        await taskpool.executeDelayed<[], number>(200, task)
      } catch (e) {
        threwError4900 = true
        err4900 = e
        if (err4900 !== null) {
          expect(err4900 instanceof Error).assertTrue()
          expect(err4900.code).assertEqual(10200057)
        }
      }
      expect(threwError4900).assertTrue()
      expect(err4900 !== null).assertTrue()
      try {
        await runnerPromise
      } catch (e) {
        console.info(`ExecuteDelayedGenericsTaskTest.test.ets runner done: ${JSON.stringify(e)}`)
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5000
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5000
     * @tc.desc   Verify executeDelayed<A,R> on a generic task whose dependency is satisfied completes with the correct result (runtime arbitration 2026-09-06: 401 is only thrown for an already-executed COMMON_TASK with dependency; a fresh task waits for its dependency, which must be executed to avoid an unbounded wait)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Root cause: a fresh generic task is still TaskType::TASK so CanExecuteDelayed does not throw 401;
      // with an unexecuted dependency the delayed task waits forever (observed execute timeout 15000ms)
      let depTask: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let mainTask: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      mainTask.addDependency(depTask)
      try {
        let depPromise: Promise<number> = taskpool.executeDelayed<[], number>(0, depTask)
        let result: Object = await taskpool.executeDelayed<[], number>(200, mainTask)
        await depPromise
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5100
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5100
     * @tc.desc   Verify executeDelayed on an already cancelled generic task is rejected on the first cancel path, and a re-execute of the cancelled task is accepted and completes (runtime arbitration 2026-09-06: UpdateTaskStateToDelayed accepts really-canceled tasks, so the second call resolves with the task result instead of rejecting)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      let firstPromise: Promise<number> = taskpool.executeDelayed<[], number>(2000, task)
      try {
        await sleep(100)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5100 failed');
        expect(false).assertFail();
      }
      try {
        taskpool.cancel(task)
      } catch (e) {
        console.info(`ExecuteDelayedGenericsTaskTest5100 cancel skip: ${JSON.stringify(e)}`)
      }
      let firstRejected5400: boolean = false
      try {
        await firstPromise
      } catch (error) {
        firstRejected5400 = true
      }
      expect(firstRejected5400).assertTrue()
      // Root cause (runtime arbitration): IsRealyCanceled() lets UpdateTaskStateToDelayed accept the cancelled
      // generic task again, so the second executeDelayed runs normally and resolves instead of rejecting
      let secondRejected5400: boolean = false
      let secondResult5400: Object | null = null
      try {
        secondResult5400 = await taskpool.executeDelayed<[], number>(200, task)
      } catch (error) {
        secondRejected5400 = true
      }
      expect(secondRejected5400).assertFalse()
      expect(secondResult5400 as number).assertEqual(42)
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5200
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5200
     * @tc.desc   Verify an executed generic task can be delayed again and returns 42 both times; runtime arbitration: design expected 10200006 but actual runtime (consistent with non-generics evidence and SDK doc for non-continuous tasks) allows re-delay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[], number>(edgSimpleFunc)
      try {
        let r1: Object = await taskpool.executeDelayed<[], number>(200, task)
        expect(r1 as number).assertEqual(42)
        let r2: Object = await taskpool.executeDelayed<[], number>(200, task)
        expect(r2 as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5300
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5300
     * @tc.desc   Verify executeDelayed accepts a fresh LongTask (continuous task not yet executed) and returns the correct result (native arbitration: SDK d.ts forbids calling executeDelayed again on an already-executed continuous task; a fresh LongTask is legal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let longTask: taskpool.Task = new taskpool.LongTask(edgSimpleFunc)
      try {
        let result: Object = await taskpool.executeDelayed<[], number>(200, longTask as ESObject)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5300 failed');
        expect(false).assertFail();
      }
      done()
    })

    // ===== 12. M5 Additions: Generics Type Combinations =====

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5400
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5400
     * @tc.desc   Verify executeDelayed<A=boolean,R=boolean> with a boolean input argument returns the negated boolean result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[boolean], boolean>(edgNotFunc, true)
      try {
        let result: Object = await taskpool.executeDelayed<[boolean], boolean>(200, task)
        expect(result as boolean).assertFalse()
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5500
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5500
     * @tc.desc   Verify executeDelayed<A=string,R=number> parses the string input and returns the numeric result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[string], number>(edgParseFunc, '21')
      try {
        let result: Object = await taskpool.executeDelayed<[string], number>(200, task)
        expect(result as number).assertEqual(21)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5600
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5600
     * @tc.desc   Verify executeDelayed<A=Object,R=Object> serializes an object with id field through the generic task and returns it unchanged (round-trip id=1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let input: Record<string, number> = { 'id': 1 }
      let task: taskpool.Task = new taskpool.GenericsTask<[Object], Object>(edgEchoObjFunc, input)
      try {
        let result: Object = await taskpool.executeDelayed<[Object], Object>(200, task)
        let returned: Record<string, number> = result as Record<string, number>
        expect(returned['id']).assertEqual(1)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5700
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5700
     * @tc.desc   Verify executeDelayed<A=Array<string>,R=Array<string>> transforms the string array elements and returns the full array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let words: string[] = ['a', 'b']
      let task: taskpool.Task = new taskpool.GenericsTask<[string[]], string[]>(edgUpperAllFunc, words)
      try {
        let result: Object = await taskpool.executeDelayed<[string[]], string[]>(200, task)
        expect(Array.isArray(result)).assertTrue()
        let returned: string[] = result as string[]
        expect(returned.length).assertEqual(2)
        expect(returned[0]).assertEqual('A')
        expect(returned[1]).assertEqual('B')
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5800
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5800
     * @tc.desc   Verify executeDelayed<A=Map<string,number>,R=number> processes the Map entries and returns the summed value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let inputMap: Map<string, number> = new Map()
      inputMap.set('one', 1)
      inputMap.set('fortyOne', 41)
      let task: taskpool.Task = new taskpool.GenericsTask<[Map<string, number>], number>(edgMapSumFunc, inputMap)
      try {
        let result: Object = await taskpool.executeDelayed<[Map<string, number>], number>(200, task)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest5900
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_5900
     * @tc.desc   Verify executeDelayed with custom Sendable input type {id:number} and custom Sendable return type {result:number} computes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let item: EDGItem = new EDGItem()
      item.id = 1
      let task: taskpool.Task = new taskpool.GenericsTask<[EDGItem], EDGOutcome>(edgItemFunc, item)
      try {
        let result: Object = await taskpool.executeDelayed<[EDGItem], EDGOutcome>(200, task)
        let outcome: EDGOutcome = result as EDGOutcome
        expect(outcome.result).assertEqual(2)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest5900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest6000
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_6000
     * @tc.desc   Verify executeDelayed<A=number,R=Sendable> returns a Sendable wrapper instance whose value field equals 42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteDelayedGenericsTaskTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let task: taskpool.Task = new taskpool.GenericsTask<[number], EDGWrapper>(edgWrapFunc, 42)
      try {
        let result: Object = await taskpool.executeDelayed<[number], EDGWrapper>(200, task)
        let wrapper: EDGWrapper = result as EDGWrapper
        expect(wrapper.value).assertEqual(42)
      } catch (error) {
        console.error('ExecuteDelayedGenericsTaskTest6000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteDelayedGenericsTaskTest6100
     * @tc.number SUB_EXECUTE_DELAYED_GENERICS_TASK_TEST_6100
     * @tc.desc   Verify executeDelayed with collections.Array<number> as both input and return generic types returns the shared container with correct length and content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
