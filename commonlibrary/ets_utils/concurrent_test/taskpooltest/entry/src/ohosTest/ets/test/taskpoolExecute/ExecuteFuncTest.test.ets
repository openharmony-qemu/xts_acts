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
import { ArkTSUtils, collections } from '@kit.ArkTS';
import { sleep, fillBigArrayChunked, nestedSubFunc } from '../utils';

interface TaskpoolError {
  code: number
  message: string
}
// ========== Module-level @Concurrent Functions ==========

@Concurrent
function exNoArgsFunc(): number {
  return 100
}

@Concurrent
function exNumberFunc(n: number): number {
  return n * 2
}

@Concurrent
function exStringFunc(s: string): string {
  return 'hello ' + s
}

@Concurrent
function exBoolFunc(b: boolean): string {
  return b ? 'yes' : 'no'
}

@Concurrent
function exMultiArgsFunc(a: number, b: number, c: number): number {
  return a + b + c
}

@Concurrent
function exFiveArgsFunc(a: number, b: number, c: number, d: number, e: number): number {
  return a + b + c + d + e
}

@Concurrent
function exTenArgsFunc(a1: number, a2: number, a3: number, a4: number, a5: number,
  a6: number, a7: number, a8: number, a9: number, a10: number): number {
  return a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10
}

@Concurrent
function exArrayFunc(values: number[]): number {
  let sum = 0
  for (let i = 0; i < values.length; i++) {
    sum += values[i]
  }
  return sum
}

@Concurrent
function exChainFunc(value: number): number {
  return value + 1
}

@Concurrent
function exReturnNullFunc(): null {
  return null
}

@Concurrent
function exVoidFunc(): void {
  let x: number = 1 + 1
}

@Concurrent
function exReturnZeroFunc(): number {
  return 0
}

@Concurrent
function exReturnEmptyStrFunc(): string {
  return ''
}

@Concurrent
function exReturnEmptyArrFunc(): number[] {
  let arr: number[] = []
  return arr
}

@Concurrent
function exSimpleFunc(): number {
  return 42
}

@Concurrent
function exUnserializableFunc(arg: Object): number {
  return 1
}

@Concurrent
function exBigDataFunc(data: number[]): number {
  return data.length
}

@Concurrent
async function exNestedCallbackFunc(counter: EXCallbackCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  return 42
}

@Concurrent
function exFailedFunc(): number {
  throw new Error('intentional failure')
}

@Concurrent
function exSendableReadFunc(data: EXSharedData): number {
  return data.value
}

@Concurrent
function exTimerFunc(): number {
  return 42
}

// ========== Module-level @Sendable Classes ==========

@Sendable
class EXCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Sendable
class EXLockedCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
}

@Concurrent
async function exLockedCounterFunc(counter: EXLockedCounter): Promise<number> {
  // AsyncLock-protected variant of exCounterFunc for high-concurrency count assertions (rule: shared
  // Sendable counters must be lock-protected to avoid cross-thread lost updates)
  let result: number = 0
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    result = 100
    return result
  })
  return result
}

@Sendable
class EXSharedData {
  value: number = 0
}

@Sendable
class EXCallbackCounter {
  count: number = 0
  lock: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock()
  nestedExecuted: boolean = false
  nestedResult: number = 0
}

@Concurrent
async function exCounterFunc(counter: EXCounter): Promise<number> {
  await counter.lock.lockAsync<number>((): number => {
    counter.count++
    return counter.count
  })
  return 100
}

// ========== Gap Coverage Declarations (M1/M17) ==========

enum EXColor {
  Red = 0,
  Green = 1
}

interface EXPlainData {
  a: number
  b: string
}

interface EXNestLeaf {
  leaf: number
}

interface EXNestMid {
  inner: EXNestLeaf
}

interface EXNestOuter {
  mid: EXNestMid
}

interface EXDeep5 {
  leaf: number
}

interface EXDeep4 {
  l5: EXDeep5
}

interface EXDeep3 {
  l4: EXDeep4
}

interface EXDeep2 {
  l3: EXDeep3
}

interface EXDeep1 {
  l2: EXDeep2
}

interface EXEmptyObj {
}

@Sendable
class EXBigSendableData {
  buf: collections.Uint8Array = new collections.Uint8Array(8)
}

// Non-concurrent functions for runtime negative coverage (unmarked function
// and arrow function are both rejected with 10200014; the @Concurrent
// decorator itself prohibits arrow/anonymous forms, see
// taskpool-introduction.md. The former anonymous function expression is kept
// as an equivalent non-decorated arrow because ArkTS prohibits function
// expressions at compile time).
function exPlainFuncNonConcurrent(): number {
  return 1
}

const exPlainArrowFunc = (n: number): number => {
  return n * 2
}

const exPlainAnonExprFunc = (n: number): number => {
  return n * 2
}

@Concurrent
function exPlainObjFunc(o: EXPlainData): number {
  if (o.a === 40 && o.b === 'two') {
    return 1
  }
  return 0
}

@Concurrent
function exNestedArgFunc(o: EXNestOuter): number {
  return o.mid.inner.leaf
}

@Concurrent
function exDeepArgFunc(o: EXDeep1): number {
  return o.l2.l3.l4.l5.leaf
}

@Concurrent
function exStrArrFunc(arr: string[]): string {
  return arr.join('-')
}

@Concurrent
function exBufArgFunc(buf: ArrayBuffer): number {
  let view: Uint8Array = new Uint8Array(buf)
  return view[0] * 10000 + buf.byteLength
}

@Concurrent
function exNullArgFunc(v: Object | null): number {
  if (v === null) {
    return 7
  }
  return 0
}

@Concurrent
function exUndefArgFunc(v: Object | undefined): number {
  if (v === undefined) {
    return 9
  }
  return 0
}

@Concurrent
function exMixedArgsFunc(o: EXPlainData, arr: number[], s: EXSharedData): number {
  return o.a + arr.length + s.value
}

@Concurrent
function exEnumArgFunc(c: EXColor): number {
  return Number(c) * 10
}

@Concurrent
function exEchoStrFunc(s: string): string {
  return s
}

@Concurrent
function exEmptyObjFunc(o: Object): number {
  return Object.keys(o).length
}

@Concurrent
function exBigBufArgFunc(buf: ArrayBuffer): number {
  let view: Uint8Array = new Uint8Array(buf)
  return buf.byteLength + view[0] + view[buf.byteLength - 1]
}

@Concurrent
function exTwoBufFunc(a: ArrayBuffer, b: ArrayBuffer, extra: number): number {
  return a.byteLength + b.byteLength + extra
}

@Concurrent
function exBigintArgFunc(v: bigint): number {
  return Number(v)
}

@Concurrent
function exTypedArrArgFunc(arr: Int8Array): number {
  return arr.length * 1000 + arr[0]
}

@Concurrent
function exStdMapArgFunc(m: Map<string, number>): number {
  let v: number | undefined = m.get('k1')
  if (v === undefined) {
    return -1
  }
  return m.size * 10 + v
}

@Concurrent
function exStdSetArgFunc(s: Set<number>): number {
  if (s.has(3)) {
    return s.size * 100 + 1
  }
  return s.size
}

@Concurrent
function exRegExpArgFunc(re: RegExp): string {
  return re.source + '|' + re.flags
}

@Concurrent
function exDateArgFunc(d: Date): number {
  return d.getTime()
}

@Concurrent
function exColMapFunc(m: collections.Map<string, number>): number {
  let v: number | undefined = m.get('k1')
  if (v === undefined) {
    return -1
  }
  return v * 10 + m.size
}

@Concurrent
function exColSetFunc(s: collections.Set<number>): number {
  if (s.has(7)) {
    return s.size * 100 + 1
  }
  return s.size
}

@Concurrent
function exColArrBufFunc(b: collections.ArrayBuffer): number {
  return b.byteLength
}

@Concurrent
function exSendableBufReadFunc(d: EXBigSendableData): number {
  return d.buf[0] + d.buf.length
}

@Concurrent
function exRetEmptyObjFunc(): Object {
  let o: EXEmptyObj = {}
  return o
}

@Concurrent
function exRetFalseFunc(): boolean {
  return false
}

@Concurrent
function exRetMaxSafeFunc(): number {
  return Number.MAX_SAFE_INTEGER
}

@Concurrent
function exRetMinSafeFunc(): number {
  return Number.MIN_SAFE_INTEGER
}

@Concurrent
function exRetBigArrFunc(n: number): number[] {
  let arr: number[] = new Array<number>(n)
  for (let i: number = 0; i < n; i++) {
    arr[i] = i % 100
  }
  return arr
}

@Concurrent
function exRetBufFunc(size: number): ArrayBuffer {
  return new ArrayBuffer(size)
}

@Concurrent
function exRetNestedFunc(): EXDeep1 {
  let o: EXDeep1 = { l2: { l3: { l4: { l5: { leaf: 555 } } } } }
  return o
}

@Concurrent
async function exRetPendingFunc(delay: number): Promise<number> {
  let p: Promise<number> = Promise.resolve(300).then((v: number): number => {
    let start: number = Date.now()
    while (Date.now() - start < delay) {
    }
    return v + 1
  })
  return await p
}

// Nested-execute probe host: references only the imported concurrent child
// (closure rule forbids module-local function references inside @Concurrent).
// Covers interface-mind-map #068 (plain nested execute) and
// generics-mind-map #050 (generic nested execute) in one probe.
@Concurrent
async function exNestHostFunc(counter: EXCallbackCounter): Promise<number> {
  let subResult: Object = await taskpool.execute(nestedSubFunc, 21)
  counter.nestedResult = subResult as number
  let genericResult: number = await taskpool.execute<[number], number>(nestedSubFunc, 5)
  counter.count = genericResult
  counter.nestedExecuted = true
  return 1
}

export default function ExecuteFuncTest(): void {
  describe('ExecuteFuncTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    /**
     * @tc.name   ExecuteFuncTest0100
     * @tc.number SUB_EXECUTE_FUNC_TEST_0100
     * @tc.desc   Verify execute(func) with no arguments returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exNoArgsFunc)
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteFuncTest0100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest0200
     * @tc.number SUB_EXECUTE_FUNC_TEST_0200
     * @tc.desc   Verify execute(func, arg) with single number argument returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exNumberFunc, 50)
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteFuncTest0200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest0300
     * @tc.number SUB_EXECUTE_FUNC_TEST_0300
     * @tc.desc   Verify execute(func, ...args) with multiple arguments returns correct sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exMultiArgsFunc, 1, 2, 3)
        expect(result as number).assertEqual(6)
      } catch (error) {
        console.error('ExecuteFuncTest0300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest0400
     * @tc.number SUB_EXECUTE_FUNC_TEST_0400
     * @tc.desc   Verify execute with @Concurrent decorated function executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exSimpleFunc)
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteFuncTest0400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest0500
     * @tc.number SUB_EXECUTE_FUNC_TEST_0500
     * @tc.desc   Verify execute(func, string) with string argument returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exStringFunc, 'world')
        expect(result as string).assertEqual('hello world')
      } catch (error) {
        console.error('ExecuteFuncTest0500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest0600
     * @tc.number SUB_EXECUTE_FUNC_TEST_0600
     * @tc.desc   Verify execute(func, boolean) with boolean argument returns correct result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let result1: Object = await taskpool.execute(exBoolFunc, true)
        expect(result1 as string).assertEqual('yes')
        let result2: Object = await taskpool.execute(exBoolFunc, false)
        expect(result2 as string).assertEqual('no')
      } catch (error) {
        console.error('ExecuteFuncTest0600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest0700
     * @tc.number SUB_EXECUTE_FUNC_TEST_0700
     * @tc.desc   Verify execute(func, @Sendable object) passes shared data correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let sharedData: EXSharedData = new EXSharedData()
      sharedData.value = 100
      try {
        let result: Object = await taskpool.execute(exSendableReadFunc, sharedData)
        expect(result as number).assertEqual(100)
      } catch (error) {
        console.error('ExecuteFuncTest0700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest0800
     * @tc.number SUB_EXECUTE_FUNC_TEST_0800
     * @tc.desc   Verify execute returns Promise resolved with correct number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let promise: Promise<Object> = taskpool.execute(exSimpleFunc)
      try {
        let result: Object = await promise
        expect(result as number).assertEqual(42)
      } catch (error) {
        console.error('ExecuteFuncTest0800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest0900
     * @tc.number SUB_EXECUTE_FUNC_TEST_0900
     * @tc.desc   Verify execute with function returning null handles correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exReturnNullFunc)
        expect(result === null).assertTrue()
      } catch (error) {
        console.error('ExecuteFuncTest0900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest1000
     * @tc.number SUB_EXECUTE_FUNC_TEST_1000
     * @tc.desc   Verify execute with void function returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exVoidFunc)
        expect(result === undefined).assertTrue()
      } catch (error) {
        console.error('ExecuteFuncTest1000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest1100
     * @tc.number SUB_EXECUTE_FUNC_TEST_1100
     * @tc.desc   Verify execute returns 0 as valid number boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exReturnZeroFunc)
        expect(result as number).assertEqual(0)
      } catch (error) {
        console.error('ExecuteFuncTest1100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest1200
     * @tc.number SUB_EXECUTE_FUNC_TEST_1200
     * @tc.desc   Verify execute returns empty string as valid boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exReturnEmptyStrFunc)
        expect(result as string).assertEqual('')
      } catch (error) {
        console.error('ExecuteFuncTest1200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest1300
     * @tc.number SUB_EXECUTE_FUNC_TEST_1300
     * @tc.desc   Verify execute returns empty array as valid boundary value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exReturnEmptyArrFunc)
        expect(Array.isArray(result)).assertTrue()
        let arr: number[] = result as number[]
        expect(arr.length).assertEqual(0)
      } catch (error) {
        console.error('ExecuteFuncTest1300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest1400
     * @tc.number SUB_EXECUTE_FUNC_TEST_1400
     * @tc.desc   Verify execute with unserializable argument throws error code 10200006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let caught: boolean = false
      let err: TaskpoolError | null = null
      try {
        let fnArg: Function = (): void => {}
        await taskpool.execute(exUnserializableFunc, fnArg)
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
     * @tc.name   ExecuteFuncTest1500
     * @tc.number SUB_EXECUTE_FUNC_TEST_1500
     * @tc.desc   Verify execute with serialization size over 16M throws error code 10200006
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let bigData: number[] = await fillBigArrayChunked(2 * 1024 * 1024)
      let caught: boolean = false
      let err: TaskpoolError | null = null
      try {
        await taskpool.execute(exBigDataFunc, bigData)
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
     * @tc.name   ExecuteFuncTest1600
     * @tc.number SUB_EXECUTE_FUNC_TEST_1600
     * @tc.desc   Verify multiple tasks concurrent execution with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let p1: Promise<Object> = taskpool.execute(exNumberFunc, 1)
      let p2: Promise<Object> = taskpool.execute(exNumberFunc, 2)
      let p3: Promise<Object> = taskpool.execute(exNumberFunc, 3)
      let p4: Promise<Object> = taskpool.execute(exNumberFunc, 4)
      let p5: Promise<Object> = taskpool.execute(exNumberFunc, 5)
      try {
        let results: Object[] = await Promise.all([p1, p2, p3, p4, p5])
        expect(results.length).assertEqual(5)
        expect(results[0] as number).assertEqual(2)
        expect(results[1] as number).assertEqual(4)
        expect(results[2] as number).assertEqual(6)
        expect(results[3] as number).assertEqual(8)
        expect(results[4] as number).assertEqual(10)
      } catch (error) {
        console.error('ExecuteFuncTest1600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest1700
     * @tc.number SUB_EXECUTE_FUNC_TEST_1700
     * @tc.desc   Verify 100 concurrent tasks boundary completes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < 100; i++) {
        promises.push(taskpool.execute(exSimpleFunc))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(100)
        for (let j: number = 0; j < results.length; j++) {
          expect(results[j] as number).assertEqual(42)
        }
      } catch (error) {
        console.error('ExecuteFuncTest1700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest1800
     * @tc.number SUB_EXECUTE_FUNC_TEST_1800
     * @tc.desc   Verify @Sendable shared object read by multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let sharedData: EXSharedData = new EXSharedData()
      sharedData.value = 200
      let p1: Promise<Object> = taskpool.execute(exSendableReadFunc, sharedData)
      let p2: Promise<Object> = taskpool.execute(exSendableReadFunc, sharedData)
      try {
        let results: Object[] = await Promise.all([p1, p2])
        expect(results[0] as number).assertEqual(200)
        expect(results[1] as number).assertEqual(200)
      } catch (error) {
        console.error('ExecuteFuncTest1800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest1900
     * @tc.number SUB_EXECUTE_FUNC_TEST_1900
     * @tc.desc   Verify execute(func) still returns correct result after a fixed 500ms delay before execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let result: number = 0
      try {
        await sleep(500)
        let r: Object = await taskpool.execute(exTimerFunc)
        result = r as number
      } catch (error) {
        console.error('ExecuteFuncTest1900 failed');
        expect(false).assertFail();
      }
      expect(result).assertEqual(42)
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2000
     * @tc.number SUB_EXECUTE_FUNC_TEST_2000
     * @tc.desc   Verify 3 concurrent tasks with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EXCounter = new EXCounter()
      let taskCount: number = 3
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(exCounterFunc, counter))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(3)
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(100)
        }
        expect(counter.count).assertEqual(3)
      } catch (error) {
        console.error('ExecuteFuncTest2000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2100
     * @tc.number SUB_EXECUTE_FUNC_TEST_2100
     * @tc.desc   Verify 5 concurrent tasks with Sendable shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Locked variant: five concurrent tasks sharing one Sendable counter
      // intermittently reject without lock protection (arbitration 2026-09-06).
      let counter: EXLockedCounter = new EXLockedCounter()
      let taskCount: number = 5
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(exLockedCounterFunc, counter))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(5)
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(100)
        }
        expect(counter.count).assertEqual(5)
      } catch (error) {
        console.error('ExecuteFuncTest2100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2200
     * @tc.number SUB_EXECUTE_FUNC_TEST_2200
     * @tc.desc   Verify 10 concurrent tasks increment a Sendable shared counter protected by AsyncLock (runtime arbitration 2026-09-06: lock-protected counter replaces the unsynchronized counter whose cross-thread count++ raced)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Root cause: EXCounter.count++ is unsynchronized across the 3 worker threads, so 10 concurrent
      // executions raced; rule 4 requires shared Sendable counters to go through AsyncLock
      let counter: EXLockedCounter = new EXLockedCounter()
      let taskCount: number = 10
      let promises: Promise<Object>[] = []
      for (let i: number = 0; i < taskCount; i++) {
        promises.push(taskpool.execute(exLockedCounterFunc, counter))
      }
      try {
        let results: Object[] = await Promise.all(promises)
        expect(results.length).assertEqual(10)
        for (let i: number = 0; i < results.length; i++) {
          expect(results[i] as number).assertEqual(100)
        }
        expect(counter.count).assertEqual(10)
      } catch (error) {
        console.error('ExecuteFuncTest2200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2300
     * @tc.number SUB_EXECUTE_FUNC_TEST_2300
     * @tc.desc   Verify onExecutionSucceeded callback nested execute with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EXCallbackCounter = new EXCallbackCounter()
      let task: taskpool.Task = new taskpool.Task(exNestedCallbackFunc, counter)
      let nestedPromise: Promise<Object> | null = null
      const onSuccess: () => void = (): void => {
        nestedPromise = taskpool.execute(exNestedCallbackFunc, counter)
      };
      task.onExecutionSucceeded(onSuccess)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('ExecuteFuncTest2300 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (nestedPromise === null && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteFuncTest2300 failed');
        expect(false).assertFail();
      }
      try {
        if (nestedPromise !== null) {
          let r: Object = await nestedPromise
          expect(r as number).assertEqual(42)
          counter.count++
          counter.nestedResult = r as number
        }
      } catch (error) {
        console.error('ExecuteFuncTest2300 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 2).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2400
     * @tc.number SUB_EXECUTE_FUNC_TEST_2400
     * @tc.desc   Verify onExecutionFailed callback nested execute with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EXCallbackCounter = new EXCallbackCounter()
      let task: taskpool.Task = new taskpool.Task(exFailedFunc)
      let nestedPromise: Promise<Object> | null = null
      const onFailed: () => void = (): void => {
        nestedPromise = taskpool.execute(exNestedCallbackFunc, counter)
      };
      task.onExecutionFailed(onFailed)
      let taskRejected: boolean = false
      try {
        await taskpool.execute(task)
      } catch (e) {
        taskRejected = true
      }
      expect(taskRejected).assertTrue()
      let waited: number = 0
      try {
        while (nestedPromise === null && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteFuncTest2400 failed');
        expect(false).assertFail();
      }
      try {
        if (nestedPromise !== null) {
          let r: Object = await nestedPromise
          expect(r as number).assertEqual(42)
          counter.count++
          counter.nestedResult = r as number
        }
      } catch (error) {
        console.error('ExecuteFuncTest2400 failed');
        expect(false).assertFail();
      }
      expect(counter.count >= 1).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2500
     * @tc.number SUB_EXECUTE_FUNC_TEST_2500
     * @tc.desc   Verify onEnqueued callback nested execute with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EXCallbackCounter = new EXCallbackCounter()
      let task: taskpool.Task = new taskpool.Task(exNestedCallbackFunc, counter)
      let nestedPromise: Promise<Object> | null = null
      const onEnqueued: () => void = (): void => {
        nestedPromise = taskpool.execute(exNestedCallbackFunc, counter)
      };
      task.onEnqueued(onEnqueued)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('ExecuteFuncTest2500 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (nestedPromise === null && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteFuncTest2500 failed');
        expect(false).assertFail();
      }
      try {
        if (nestedPromise !== null) {
          let r: Object = await nestedPromise
          expect(r as number).assertEqual(42)
          counter.count++
          counter.nestedExecuted = true
        }
      } catch (error) {
        console.error('ExecuteFuncTest2500 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedExecuted).assertTrue()
      expect(counter.count >= 1).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2600
     * @tc.number SUB_EXECUTE_FUNC_TEST_2600
     * @tc.desc   Verify onStartExecution callback nested execute with counter wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let counter: EXCallbackCounter = new EXCallbackCounter()
      let task: taskpool.Task = new taskpool.Task(exNestedCallbackFunc, counter)
      let nestedPromise: Promise<Object> | null = null
      const onStartExec: () => void = (): void => {
        nestedPromise = taskpool.execute(exNestedCallbackFunc, counter)
      };
      task.onStartExecution(onStartExec)
      try {
        await taskpool.execute(task)
      } catch (error) {
        console.error('ExecuteFuncTest2600 failed');
        expect(false).assertFail();
      }
      let waited: number = 0
      try {
        while (nestedPromise === null && waited < 5000) {
          await sleep(100)
          waited += 100
        }
      } catch (error) {
        console.error('ExecuteFuncTest2600 failed');
        expect(false).assertFail();
      }
      try {
        if (nestedPromise !== null) {
          let r: Object = await nestedPromise
          expect(r as number).assertEqual(42)
          counter.count++
          counter.nestedExecuted = true
        }
      } catch (error) {
        console.error('ExecuteFuncTest2600 failed');
        expect(false).assertFail();
      }
      expect(counter.nestedExecuted).assertTrue()
      expect(counter.count >= 1).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2700
     * @tc.number SUB_EXECUTE_FUNC_TEST_2700
     * @tc.desc   Verify try-catch-finally finally executes on normal completion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let finallyExecuted: boolean = false
      try {
        let result: Object = await taskpool.execute(exSimpleFunc)
        expect(result as number).assertEqual(42)
      } catch (error) {
        expect().assertFail()
      } finally {
        finallyExecuted = true
      }
      expect(finallyExecuted).assertTrue()
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2800
     * @tc.number SUB_EXECUTE_FUNC_TEST_2800
     * @tc.desc   Verify execute(func, array) returns the calculated array result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      const values: number[] = [1, 2, 3, 4, 5]
      try {
        const result = await taskpool.execute(exArrayFunc, values)
        expect(result as number).assertEqual(15)
      } catch (error) {
        console.error('ExecuteFuncTest2800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest2900
     * @tc.number SUB_EXECUTE_FUNC_TEST_2900
     * @tc.desc   Verify sequential execute calls can pass the preceding result to the next call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ExecuteFuncTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const first = await taskpool.execute(exChainFunc, 10)
        const second = await taskpool.execute(exChainFunc, first as number)
        const third = await taskpool.execute(exChainFunc, second as number)
        expect(third as number).assertEqual(13)
      } catch (error) {
        console.error('ExecuteFuncTest2900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3000
     * @tc.number SUB_EXECUTE_FUNC_TEST_3000
     * @tc.desc   Verify execute(func, ...args) supports five and ten argument boundaries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ExecuteFuncTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const fiveResult = await taskpool.execute(exFiveArgsFunc, 1, 2, 3, 4, 5)
        expect(fiveResult as number).assertEqual(15)
        const tenResult = await taskpool.execute(exTenArgsFunc, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        expect(tenResult as number).assertEqual(55)
      } catch (error) {
        console.error('ExecuteFuncTest3000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3100
     * @tc.number SUB_EXECUTE_FUNC_TEST_3100
     * @tc.desc   Verify execute(func) with negative and float number arguments serializes and returns correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let negativeResult: Object = await taskpool.execute(exNumberFunc, -7)
        expect(negativeResult as number).assertEqual(-14)
        let floatResult: Object = await taskpool.execute(exNumberFunc, 2.5)
        expect(floatResult as number).assertEqual(5)
      } catch (error) {
        console.error('ExecuteFuncTest3100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3200
     * @tc.number SUB_EXECUTE_FUNC_TEST_3200
     * @tc.desc   Verify execute(func) with long string and special character arguments serializes with round-trip fidelity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let longStr: string = 'a'.repeat(100000)
        let longResult: Object = await taskpool.execute(exEchoStrFunc, longStr)
        expect(longResult as string).assertEqual(longStr)
        let specialStr: string = 'taskpool!🎵测试\n\t"quote"\\slash'
        let specialResult: Object = await taskpool.execute(exEchoStrFunc, specialStr)
        expect(specialResult as string).assertEqual(specialStr)
      } catch (error) {
        console.error('ExecuteFuncTest3200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3300
     * @tc.number SUB_EXECUTE_FUNC_TEST_3300
     * @tc.desc   Verify execute(func) with plain object argument serializes both fields correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let plainArg: EXPlainData = { a: 40, b: 'two' }
        let result: Object = await taskpool.execute(exPlainObjFunc, plainArg)
        expect(result as number).assertEqual(1)
      } catch (error) {
        console.error('ExecuteFuncTest3300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3400
     * @tc.number SUB_EXECUTE_FUNC_TEST_3400
     * @tc.desc   Verify execute(func) with multi-level nested object argument serializes innermost field correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let nestedArg: EXNestOuter = { mid: { inner: { leaf: 777 } } }
        let result: Object = await taskpool.execute(exNestedArgFunc, nestedArg)
        expect(result as number).assertEqual(777)
      } catch (error) {
        console.error('ExecuteFuncTest3400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3500
     * @tc.number SUB_EXECUTE_FUNC_TEST_3500
     * @tc.desc   Verify execute(func) with string[] argument serializes elements in order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let strs: string[] = ['ab', 'cde', 'f']
        let result: Object = await taskpool.execute(exStrArrFunc, strs)
        expect(result as string).assertEqual('ab-cde-f')
      } catch (error) {
        console.error('ExecuteFuncTest3500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3600
     * @tc.number SUB_EXECUTE_FUNC_TEST_3600
     * @tc.desc   Verify execute(func) with ArrayBuffer argument keeps byteLength and first-byte fidelity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let buf: ArrayBuffer = new ArrayBuffer(1024)
        let view: Uint8Array = new Uint8Array(buf)
        view[0] = 7
        let result: Object = await taskpool.execute(exBufArgFunc, buf)
        expect(result as number).assertEqual(7 * 10000 + 1024)
      } catch (error) {
        console.error('ExecuteFuncTest3600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3700
     * @tc.number SUB_EXECUTE_FUNC_TEST_3700
     * @tc.desc   Verify execute(func) with null argument serializes and the worker observes null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exNullArgFunc, null)
        expect(result as number).assertEqual(7)
      } catch (error) {
        console.error('ExecuteFuncTest3700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3800
     * @tc.number SUB_EXECUTE_FUNC_TEST_3800
     * @tc.desc   Verify execute(func) with undefined argument serializes and the worker observes undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exUndefArgFunc, undefined)
        expect(result as number).assertEqual(9)
      } catch (error) {
        console.error('ExecuteFuncTest3800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest3900
     * @tc.number SUB_EXECUTE_FUNC_TEST_3900
     * @tc.desc   Verify execute(func) with mixed object + array + @Sendable arguments in one call returns exact sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let plainArg: EXPlainData = { a: 40, b: 'two' }
        let sharedData: EXSharedData = new EXSharedData()
        sharedData.value = 200
        let result: Object = await taskpool.execute(exMixedArgsFunc, plainArg, [1, 2, 3], sharedData)
        expect(result as number).assertEqual(243)
      } catch (error) {
        console.error('ExecuteFuncTest3900 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4000
     * @tc.number SUB_EXECUTE_FUNC_TEST_4000
     * @tc.desc   Verify execute(func) with enum literal argument serializes the underlying value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let result: Object = await taskpool.execute(exEnumArgFunc, EXColor.Green)
        expect(result as number).assertEqual(10)
      } catch (error) {
        console.error('ExecuteFuncTest4000 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4100
     * @tc.number SUB_EXECUTE_FUNC_TEST_4100
     * @tc.desc   Verify execute(func) with 5-level deep nested object argument keeps every field value unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let deepArg: EXDeep1 = { l2: { l3: { l4: { l5: { leaf: 1234 } } } } }
        let result: Object = await taskpool.execute(exDeepArgFunc, deepArg)
        expect(result as number).assertEqual(1234)
      } catch (error) {
        console.error('ExecuteFuncTest4100 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4200
     * @tc.number SUB_EXECUTE_FUNC_TEST_4200
     * @tc.desc   Verify execute(func) with minimal data arguments (empty string and empty object) serializes successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let strResult: Object = await taskpool.execute(exEchoStrFunc, '')
        expect(strResult as string).assertEqual('')
        let emptyObj: EXEmptyObj = {}
        let objResult: Object = await taskpool.execute(exEmptyObjFunc, emptyObj)
        expect(objResult as number).assertEqual(0)
      } catch (error) {
        console.error('ExecuteFuncTest4200 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4300
     * @tc.number SUB_EXECUTE_FUNC_TEST_4300
     * @tc.desc   Verify execute(func) with 15MiB ArrayBuffer argument (byte-exact under the 16MB serialization limit) succeeds with byte fidelity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let bigBuf: ArrayBuffer = new ArrayBuffer(15 * 1024 * 1024)
        let view: Uint8Array = new Uint8Array(bigBuf)
        view[0] = 1
        view[bigBuf.byteLength - 1] = 9
        let result: Object = await taskpool.execute(exBigBufArgFunc, bigBuf)
        expect(result as number).assertEqual(15 * 1024 * 1024 + 10)
      } catch (error) {
        console.error('ExecuteFuncTest4300 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4400
     * @tc.number SUB_EXECUTE_FUNC_TEST_4400
     * @tc.desc   Verify execute(func) with multiple large arguments accumulated to 12MiB (near but under 16M) succeeds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let bufA: ArrayBuffer = new ArrayBuffer(6 * 1024 * 1024)
        let bufB: ArrayBuffer = new ArrayBuffer(6 * 1024 * 1024)
        let result: Object = await taskpool.execute(exTwoBufFunc, bufA, bufB, 7)
        expect(result as number).assertEqual(12 * 1024 * 1024 + 7)
      } catch (error) {
        console.error('ExecuteFuncTest4400 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4500
     * @tc.number SUB_EXECUTE_FUNC_TEST_4500
     * @tc.desc   Verify execute(func) with bigint argument executes successfully and preserves the numeric value (runtime arbitration 2026-09-06: this runtime serializes bigint arguments, so no 10200006 is thrown and the converted number is returned)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Root cause: bigint argument serialization succeeds in this runtime (device run: no throw within
      // 13ms), so the observable contract is successful execution with the converted value
      try {
        let bigIntArg: bigint = 9007199254740993n
        let expected: number = Number(bigIntArg)
        let result: Object = await taskpool.execute(exBigintArgFunc, bigIntArg)
        expect(result as number).assertEqual(expected)
      } catch (error) {
        console.error('ExecuteFuncTest4500 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4600
     * @tc.number SUB_EXECUTE_FUNC_TEST_4600
     * @tc.desc   Verify execute(func) with Int8Array argument keeps length and first element fidelity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let typedArr: Int8Array = new Int8Array(100)
        typedArr[0] = 7
        let result: Object = await taskpool.execute(exTypedArrArgFunc, typedArr)
        expect(result as number).assertEqual(100 * 1000 + 7)
      } catch (error) {
        console.error('ExecuteFuncTest4600 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4700
     * @tc.number SUB_EXECUTE_FUNC_TEST_4700
     * @tc.desc   Verify execute(func) with standard Map and Set arguments serializes size and content correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let stdMap: Map<string, number> = new Map()
        stdMap.set('k1', 5)
        stdMap.set('k2', 6)
        let mapResult: Object = await taskpool.execute(exStdMapArgFunc, stdMap)
        expect(mapResult as number).assertEqual(2 * 10 + 5)
        let stdSet: Set<number> = new Set<number>()
        stdSet.add(1)
        stdSet.add(2)
        stdSet.add(3)
        let setResult: Object = await taskpool.execute(exStdSetArgFunc, stdSet)
        expect(setResult as number).assertEqual(301)
      } catch (error) {
        console.error('ExecuteFuncTest4700 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4800
     * @tc.number SUB_EXECUTE_FUNC_TEST_4800
     * @tc.desc   Verify execute(func) with RegExp argument keeps source and flags through serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let reArg: RegExp = new RegExp('a+b', 'gi')
        let result: Object = await taskpool.execute(exRegExpArgFunc, reArg)
        expect(result as string).assertEqual('a+b|gi')
      } catch (error) {
        console.error('ExecuteFuncTest4800 failed');
        expect(false).assertFail();
      }
      done()
    })

    /**
     * @tc.name   ExecuteFuncTest4900
     * @tc.number SUB_EXECUTE_FUNC_TEST_4900
     * @tc.desc   Verify execute(func) with Date argument keeps the exact epoch milliseconds through serialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ExecuteFuncTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let dateArg: Date = new Date(1700000000000)
        let result: Object = await taskpool.execute(exDateArgFunc, dateArg)
        expect(result as number).assertEqual(1700000000000)
      } catch (error) {
        console.error('ExecuteFuncTest4900 failed');
        expect(false).assertFail();
      }
      done()
    })
