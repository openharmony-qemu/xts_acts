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
import { taskpool, collections, worker, MessageEvents, ErrorEvent } from '@kit.ArkTS';
import { ConcurrentData, ResultData } from '../testability/pages/ConcurrentTestData';
import { ComboData, comboProcess } from '../testability/pages/UseConcurrentCombo';
import { tsConcurrentAdd, tsConcurrentMultiply, tsConcurrentIdentity, tsConcurrentStringLength } from './ConcurrentTsFuncSource';
import { jsConcurrentDouble, jsConcurrentAdd, jsConcurrentStringLength } from './ConcurrentJsFuncSource';

/*
 * Local 'use concurrent' functions that use collections.Array.
 * These cannot live in .ts files (which cannot import collections),
 * so they are defined here in the .ets module.
 */
function tsConcurrentArraySum(arr: collections.Array<number>): number {
  'use concurrent'
  let sum: number = 0
  arr.forEach((v: number): void => {
    sum += v
  })
  return sum
}

function tsConcurrentCreateArray(): collections.Array<number> {
  'use concurrent'
  let arr = new collections.Array<number>()
  arr.push(10)
  arr.push(20)
  arr.push(30)
  return arr
}

/*
 * Functions below use the 'use concurrent' keyword (function-body first-line directive)
 * instead of the @Concurrent decorator. They are functionally equivalent.
 */

function ucAdd(a: number, b: number): number {
  'use concurrent'
  return a + b
}

function ucStringLength(s: string): number {
  'use concurrent'
  return s.length
}

function ucBoolNegate(b: boolean): boolean {
  'use concurrent'
  return !b
}

function ucArrayModify(arr: collections.Array<number>): number {
  'use concurrent'
  arr.push(100)
  return arr.length
}

function ucMapModify(map: collections.Map<string, number>): number {
  'use concurrent'
  map.set('uc_key', 42)
  return map.size
}

function ucSetModify(set: collections.Set<number>): number {
  'use concurrent'
  set.add(99)
  return set.size
}

function ucCreateArray(): collections.Array<number> {
  'use concurrent'
  let arr = new collections.Array<number>()
  arr.push(1)
  arr.push(2)
  arr.push(3)
  return arr
}

function ucCreateMap(): collections.Map<string, number> {
  'use concurrent'
  let map = new collections.Map<string, number>()
  map.set('x', 10)
  map.set('y', 20)
  return map
}

function ucCreateSet(): collections.Set<number> {
  'use concurrent'
  let set = new collections.Set<number>()
  set.add(100)
  set.add(200)
  return set
}

function ucReadSendable(data: ConcurrentData): number {
  'use concurrent'
  return data.input_
}

function ucModifySendable(data: ConcurrentData, val: number): void {
  'use concurrent'
  data.output_ = val
}

function ucCreateResult(val: number): ResultData {
  'use concurrent'
  let result = new ResultData()
  result.value_ = val
  return result
}

function ucNestedConcurrent(): number {
  'use concurrent'
  return 50 + 50
}

function ucSendableCombo(data: collections.Array<number>): number {
  'use concurrent'
  let sum = 0
  data.forEach((v: number): void => {
    sum += v * 3
  })
  return sum
}

function ucSquare(n: number): number {
  'use concurrent'
  return n * n
}

function ucIdentity(n: number): number {
  'use concurrent'
  return n
}

function ucBlankLineFirst(): number {

  'use concurrent'
  return 100
}

function ucNestedLambda(): number {
  'use concurrent'
  const inner = (): number => 50
  return inner() + 50
}

async function ucAsyncConcurrent(): Promise<number> {
  'use concurrent'
  let v = await new Promise<number>((resolve) => {
    setTimeout((): void => {
      resolve(42)
    }, 100)
  })
  return v
}

function ucInvokeSendableMethod(data: ConcurrentData): number {
  'use concurrent'
  return data.getDouble()
}

function ucBitVectorLength(bv: collections.BitVector): number {
  'use concurrent'
  bv.push(1)
  bv.push(1)
  return bv.length
}

export default function useConcurrentTestSupplement(): void {
  describe('UseConcurrentTestSupplement', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   UseConcurrentTestSupplement0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_0100
     * @tc.desc   Verify use concurrent keyword with number addition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(ucAdd, 15.0, 25.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(40))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_0200
     * @tc.desc   Verify use concurrent keyword with string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(ucStringLength, 'concurrent')
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(10))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_0300
     * @tc.desc   Verify use concurrent keyword with boolean parameter and return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task1 = new taskpool.Task(ucBoolNegate, true)
      let task2 = new taskpool.Task(ucBoolNegate, false)

      let result1 = await taskpool.execute(task1)
      let result2 = await taskpool.execute(task2)

      expect(result1 as boolean).assertFalse()
      expect(result2 as boolean).assertTrue()
    })

    /**
     * @tc.name   UseConcurrentTestSupplement0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_0400
     * @tc.desc   Verify use concurrent keyword modifying collections.Array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(1)
      arr.push(2)
      arr.push(3)

      let task = new taskpool.Task(ucArrayModify, arr)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(4))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_0500
     * @tc.desc   Verify use concurrent keyword modifying collections.Map parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let map = new collections.Map<string, number>()
      map.set('existing', 1)

      let task = new taskpool.Task(ucMapModify, map)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(2))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_0600
     * @tc.desc   Verify use concurrent keyword modifying collections.Set parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)

      let task = new taskpool.Task(ucSetModify, set)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(3))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_0700
     * @tc.desc   Verify use concurrent keyword returning collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(ucCreateArray)
      let result = await taskpool.execute(task) as collections.Array<number>

      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
    })

    /**
     * @tc.name   UseConcurrentTestSupplement0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_0800
     * @tc.desc   Verify use concurrent keyword returning collections.Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(ucCreateMap)
      let result = await taskpool.execute(task) as collections.Map<string, number>

      expect(result.size).assertEqual(2)
      expect(result.get('x')).assertEqual(10)
      expect(result.get('y')).assertEqual(20)
    })

    /**
     * @tc.name   UseConcurrentTestSupplement0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_0900
     * @tc.desc   Verify use concurrent keyword returning collections.Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(ucCreateSet)
      let result = await taskpool.execute(task) as collections.Set<number>

      expect(result.size).assertEqual(2)
      expect(result.has(100)).assertTrue()
      expect(result.has(200)).assertTrue()
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1000
     * @tc.desc   Verify use concurrent keyword reading @Sendable class property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let data = new ConcurrentData()
      data.input_ = 88

      let task = new taskpool.Task(ucReadSendable, data)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(88))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1100
     * @tc.desc   Verify use concurrent keyword modifying @Sendable class property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let data = new ConcurrentData()

      let task = new taskpool.Task(ucModifySendable, data, 66.0)
      await taskpool.execute(task)

      expect(data.output_).assertEqual(66)
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1200
     * @tc.desc   Verify use concurrent keyword returning @Sendable class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(ucCreateResult, 99.0)
      let result = await taskpool.execute(task) as ResultData

      expect(result.value_).assertEqual(99)
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1300
     * @tc.desc   Verify use concurrent keyword calling another use concurrent function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(5)
      arr.push(10)

      let task = new taskpool.Task(ucSendableCombo, arr)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(45))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1400
     * @tc.desc   Verify use concurrent keyword with nested concurrent function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new taskpool.Task(ucNestedConcurrent)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(100))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1500
     * @tc.desc   Verify use concurrent keyword with TaskGroup of multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(ucAdd, 10.0, 20.0)
      group.addTask(ucSquare, 6.0)
      group.addTask(ucStringLength, 'hello')

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(30))
      expect(String(results[1])).assertEqual(String(36))
      expect(String(results[2])).assertEqual(String(5))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1600
     * @tc.desc   Verify 10 concurrent use concurrent tasks execute with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(ucIdentity, i))
      }

      let results = await Promise.all(tasks.map((t: taskpool.Task): Promise<Object | void> => {
        return taskpool.execute(t)
      }))

      expect(results.length).assertEqual(10)
      expect(String(results[0])).assertEqual(String(0))
      expect(String(results[5])).assertEqual(String(5))
      expect(String(results[9])).assertEqual(String(9))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1700
     * @tc.desc   Verify use concurrent keyword with priority execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new taskpool.Task(ucAdd, 50.0, 50.0)
      let result = await taskpool.execute(task, taskpool.Priority.HIGH)

      expect(String(result)).assertEqual(String(100))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1800
     * @tc.desc   Verify use concurrent directive works when preceded by a blank line in function body
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(ucBlankLineFirst)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(100))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_1900
     * @tc.desc   Verify use concurrent function can define and invoke an inner lambda
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new taskpool.Task(ucNestedLambda)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(100))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2000
     * @tc.desc   Verify async use concurrent function with await executes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new taskpool.Task(ucAsyncConcurrent)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2100
     * @tc.desc   Verify use concurrent function invokes @Sendable class instance method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let data = new ConcurrentData()
      data.input_ = 21

      let task = new taskpool.Task(ucInvokeSendableMethod, data)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2200
     * @tc.desc   Verify use concurrent function and @Sendable class combined across files
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let data = new ComboData()
      data.value_ = 21

      let task = new taskpool.Task(comboProcess, data)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2300
     * @tc.desc   Verify use concurrent function processes collections.BitVector parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let bv = new collections.BitVector(16)

      let task = new taskpool.Task(ucBitVectorLength, bv)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(18))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2400
     * @tc.desc   Verify TaskPool task and worker thread both execute successfully in one test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let work = new worker.ThreadWorker('../workers/Worker')
      let workerData: string = ''
      let workerDone: boolean = false
      work.onmessage = (e: MessageEvents): void => {
        workerData = String(e.data)
        workerDone = true
        work.terminate()
      }
      work.onerror = (e: ErrorEvent): void => {
        workerDone = true
        work.terminate()
      }
      work.postMessage('1')

      let task = new taskpool.Task(ucAdd, 20.0, 22.0)
      let result = await taskpool.execute(task)
      expect(String(result)).assertEqual(String(42))

      let deadline: number = Date.now() + 10000
      while (!workerDone && Date.now() < deadline) {
        await new Promise<void>((resolve) => {
          setTimeout((): void => {
            resolve()
          }, 100)
        })
      }
      expect(workerData).assertEqual('1')
      if (!workerDone) {
        work.terminate()
      }
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2500
     * @tc.desc   Verify use concurrent function defined in .ts file executes correctly via cross-file import
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(tsConcurrentAdd, 15.0, 27.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2600
     * @tc.desc   Verify use concurrent function from .ts file with collections.Array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(10)
      arr.push(20)
      arr.push(30)

      let task = new taskpool.Task(tsConcurrentArraySum, arr)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(60))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2700
     * @tc.desc   Verify use concurrent function from .ts file returns collections.Array correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(tsConcurrentCreateArray)
      let result = await taskpool.execute(task) as collections.Array<number>

      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(10)
      expect(result[1]).assertEqual(20)
      expect(result[2]).assertEqual(30)
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2800
     * @tc.desc   Verify TaskGroup uses cross-file imported .ts concurrent functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(tsConcurrentAdd, 10.0, 20.0)
      group.addTask(tsConcurrentMultiply, 3.0, 4.0)
      group.addTask(tsConcurrentIdentity, 42.0)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(30))
      expect(String(results[1])).assertEqual(String(12))
      expect(String(results[2])).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_2900
     * @tc.desc   Verify 10 concurrent tasks using .ts imported functions execute with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTestSupplement2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 10; i++) {
        tasks.push(new taskpool.Task(tsConcurrentIdentity, i * 1.0))
      }

      let results = await Promise.all(tasks.map((t: taskpool.Task): Promise<Object | void> => {
        return taskpool.execute(t)
      }))

      expect(results.length).assertEqual(10)
      expect(String(results[0])).assertEqual(String(0))
      expect(String(results[5])).assertEqual(String(5))
      expect(String(results[9])).assertEqual(String(9))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_3000
     * @tc.desc   Verify .ts concurrent function with string parameter via cross-file import
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(tsConcurrentStringLength, 'cross_file')
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(10))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_3100
     * @tc.desc   Verify 'use concurrent' in .js file executed via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(jsConcurrentDouble, 21.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_3200
     * @tc.desc   Verify .ets imports .js concurrent function with two params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(jsConcurrentAdd, 15.0, 27.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTestSupplement3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_SUPPLEMENT_TEST_3300
     * @tc.desc   Verify .js concurrent function in TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTestSupplement3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(jsConcurrentDouble, 5.0)
      group.addTask(jsConcurrentAdd, 10.0, 20.0)
      group.addTask(jsConcurrentStringLength, 'hello')
      let results = await taskpool.execute(group)

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(10))
      expect(String(results[1])).assertEqual(String(30))
      expect(String(results[2])).assertEqual(String(5))
    })
  })
}
