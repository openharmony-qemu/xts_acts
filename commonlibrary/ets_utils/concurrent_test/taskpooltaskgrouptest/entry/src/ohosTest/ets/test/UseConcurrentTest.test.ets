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
import { ConcurrentData, ResultData } from '../testability/pages/ConcurrentTestData';

function concurrentAdd(a: number, b: number): number {
  'use concurrent'
  return a + b
}

function concurrentMultiply(a: number, b: number): number {
  'use concurrent'
  return a * b
}

function concurrentIdentity(n: number): number {
  'use concurrent'
  return n
}

function concurrentStringLen(s: string): number {
  'use concurrent'
  return s.length
}

function concurrentBoolToInt(b: boolean): number {
  'use concurrent'
  return b ? 1 : 0
}

function concurrentProcessSendable(data: ConcurrentData): number {
  'use concurrent'
  return data.input_ * 2
}

function concurrentModifySendable(data: ConcurrentData, val: number): void {
  'use concurrent'
  data.output_ = val
}

function concurrentReturnNumber(): number {
  'use concurrent'
  return 42
}

function concurrentReturnString(): string {
  'use concurrent'
  return 'result'
}

function concurrentNoArgs(): number {
  'use concurrent'
  return 100
}

function concurrentMultiArgs(a: number, b: number, c: number): number {
  'use concurrent'
  return a + b + c
}

function concurrentReturnBoolean(val: number): boolean {
  'use concurrent'
  return val > 0
}

function concurrentReturnArray(): collections.Array<number> {
  'use concurrent'
  let arr = new collections.Array<number>()
  arr.push(1)
  arr.push(2)
  arr.push(3)
  return arr
}

function concurrentWithArrayParam(arr: number[]): number {
  'use concurrent'
  let sum = 0
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum
}

function concurrentCreateResult(val: number): ResultData {
  'use concurrent'
  let result = new ResultData()
  result.value_ = val
  return result
}

function concurrentWithCollectionsArray(arr: collections.Array<number>): number {
  'use concurrent'
  return arr.length
}

function concurrentWithCollectionsMap(map: collections.Map<string, number>): number {
  'use concurrent'
  return map.size
}

function concurrentWithCollectionsSet(set: collections.Set<number>): number {
  'use concurrent'
  return set.size
}

function concurrentSquare(n: number): number {
  'use concurrent'
  return n * n
}

function concurrentWithArrayBuffer(ab: ArrayBuffer): number {
  'use concurrent'
  return ab.byteLength
}

function concurrentReturnCollectionsArray(): collections.Array<number> {
  'use concurrent'
  let arr = new collections.Array<number>()
  arr.push(10)
  arr.push(20)
  arr.push(30)
  return arr
}

function concurrentReturnCollectionsMap(): collections.Map<string, number> {
  'use concurrent'
  let map = new collections.Map<string, number>()
  map.set('x', 100)
  map.set('y', 200)
  return map
}

export default function UseConcurrentTest(): void {
  describe('UseConcurrentTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {});
    afterEach((): void => {});
    afterAll((): void => {})

    /**
     * @tc.name   UseConcurrentTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0100
     * @tc.desc   Verify concurrent function with number parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentAdd, 8.0, 2.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(10))
    })

    /**
     * @tc.name   UseConcurrentTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0200
     * @tc.desc   Verify concurrent function with multiplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentMultiply, 6.0, 7.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0300
     * @tc.desc   Verify concurrent function with single number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentIdentity, 99.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(99))
    })

    /**
     * @tc.name   UseConcurrentTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0400
     * @tc.desc   Verify concurrent function with string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentStringLen, 'hello')
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(5))
    })

    /**
     * @tc.name   UseConcurrentTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0500
     * @tc.desc   Verify concurrent function with boolean parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task1 = new taskpool.Task(concurrentBoolToInt, true)
      let task2 = new taskpool.Task(concurrentBoolToInt, false)

      let result1 = await taskpool.execute(task1)
      let result2 = await taskpool.execute(task2)

      expect(String(result1)).assertEqual(String(1))
      expect(String(result2)).assertEqual(String(0))
    })

    /**
     * @tc.name   UseConcurrentTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0600
     * @tc.desc   Verify concurrent function with @Sendable class parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let data = new ConcurrentData()
      data.input_ = 30

      let task = new taskpool.Task(concurrentProcessSendable, data)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(60))
    })

    /**
     * @tc.name   UseConcurrentTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0700
     * @tc.desc   Verify concurrent function modifying @Sendable class property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let data = new ConcurrentData()

      let task = new taskpool.Task(concurrentModifySendable, data, 77.0)
      await taskpool.execute(task)

      expect(data.output_).assertEqual(77)
    })

    /**
     * @tc.name   UseConcurrentTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0800
     * @tc.desc   Verify concurrent function returning number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentReturnNumber)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_0900
     * @tc.desc   Verify concurrent function returning string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentReturnString)
      let result = await taskpool.execute(task)

      expect(result as string).assertEqual('result')
    })

    /**
     * @tc.name   UseConcurrentTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1000
     * @tc.desc   Verify concurrent function with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentNoArgs)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(100))
    })

    /**
     * @tc.name   UseConcurrentTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1100
     * @tc.desc   Verify concurrent function with multiple number arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentMultiArgs, 10.0, 20.0, 30.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(60))
    })

    /**
     * @tc.name   UseConcurrentTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1200
     * @tc.desc   Verify multiple concurrent functions execute concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task1 = new taskpool.Task(concurrentAdd, 5.0, 5.0)
      let task2 = new taskpool.Task(concurrentMultiply, 4.0, 5.0)
      let task3 = new taskpool.Task(concurrentIdentity, 10.0)

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2),
        taskpool.execute(task3)
      ])

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(10))
      expect(String(results[1])).assertEqual(String(20))
      expect(String(results[2])).assertEqual(String(10))
    })

    /**
     * @tc.name   UseConcurrentTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1300
     * @tc.desc   Verify concurrent function with TaskGroup
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let group = new taskpool.TaskGroup()
      group.addTask(concurrentAdd, 1.0, 2.0)
      group.addTask(concurrentMultiply, 3.0, 4.0)
      group.addTask(concurrentIdentity, 42.0)

      let results = await taskpool.execute(group) as Object[]

      expect(results.length).assertEqual(3)
      expect(String(results[0])).assertEqual(String(3))
      expect(String(results[1])).assertEqual(String(12))
      expect(String(results[2])).assertEqual(String(42))
    })

    /**
     * @tc.name   UseConcurrentTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1400
     * @tc.desc   Verify concurrent function with priority execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentAdd, 100.0, 200.0)
      let result = await taskpool.execute(task, taskpool.Priority.HIGH)

      expect(String(result)).assertEqual(String(300))
    })

    /**
     * @tc.name   UseConcurrentTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1500
     * @tc.desc   Verify concurrent function with @Sendable return type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentCreateResult, 55.0)
      let result = await taskpool.execute(task) as ResultData

      expect(result.value_).assertEqual(55)
    })

    /**
     * @tc.name   UseConcurrentTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1600
     * @tc.desc   Verify concurrent function returning boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task1 = new taskpool.Task(concurrentReturnBoolean, 42.0)
      let task2 = new taskpool.Task(concurrentReturnBoolean, -1.0)

      let result1 = await taskpool.execute(task1)
      let result2 = await taskpool.execute(task2)

      expect(result1 as boolean).assertTrue()
      expect(result2 as boolean).assertFalse()
    })

    /**
     * @tc.name   UseConcurrentTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1700
     * @tc.desc   Verify concurrent function returning array container
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentReturnArray)
      let result = await taskpool.execute(task) as collections.Array<number>

      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(2)
      expect(result[2]).assertEqual(3)
    })

    /**
     * @tc.name   UseConcurrentTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1800
     * @tc.desc   Verify concurrent function with array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let arr: number[] = [10, 20, 30]
      let task = new taskpool.Task(concurrentWithArrayParam, arr)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(60))
    })

    /**
     * @tc.name   UseConcurrentTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_1900
     * @tc.desc   Verify concurrent function with collections.Array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let arr = new collections.Array<number>()
      arr.push(1)
      arr.push(2)
      arr.push(3)
      arr.push(4)
      arr.push(5)

      let task = new taskpool.Task(concurrentWithCollectionsArray, arr)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(5))
    })

    /**
     * @tc.name   UseConcurrentTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2000
     * @tc.desc   Verify concurrent function with collections.Map parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let map = new collections.Map<string, number>()
      map.set('a', 1)
      map.set('b', 2)

      let task = new taskpool.Task(concurrentWithCollectionsMap, map)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(2))
    })

    /**
     * @tc.name   UseConcurrentTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2100
     * @tc.desc   Verify concurrent function with collections.Set parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let set = new collections.Set<number>()
      set.add(10)
      set.add(20)
      set.add(30)

      let task = new taskpool.Task(concurrentWithCollectionsSet, set)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(3))
    })

    /**
     * @tc.name   UseConcurrentTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2200
     * @tc.desc   Verify concurrent function computing square of number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentSquare, 7.0)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(49))
    })

    /**
     * @tc.name   UseConcurrentTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2300
     * @tc.desc   Verify concurrent function with ArrayBuffer parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let ab = new ArrayBuffer(32)

      let task = new taskpool.Task(concurrentWithArrayBuffer, ab)
      let result = await taskpool.execute(task)

      expect(String(result)).assertEqual(String(32))
    })

    /**
     * @tc.name   UseConcurrentTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2400
     * @tc.desc   Verify concurrent function returning collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentReturnCollectionsArray)
      let result = await taskpool.execute(task) as collections.Array<number>

      expect(result.length).assertEqual(3)
      expect(result[0]).assertEqual(10)
      expect(result[1]).assertEqual(20)
      expect(result[2]).assertEqual(30)
    })

    /**
     * @tc.name   UseConcurrentTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2500
     * @tc.desc   Verify concurrent function returning collections.Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UseConcurrentTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let task = new taskpool.Task(concurrentReturnCollectionsMap)
      let result = await taskpool.execute(task) as collections.Map<string, number>

      expect(result.size).assertEqual(2)
      expect(result.get('x')).assertEqual(100)
      expect(result.get('y')).assertEqual(200)
    })

    /**
     * @tc.name   UseConcurrentTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2600
     * @tc.desc   Verify sequential task execution with intermediate result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task1 = new taskpool.Task(concurrentAdd, 3.0, 4.0)
      let intermediate = await taskpool.execute(task1)

      let task2 = new taskpool.Task(concurrentMultiply, 7.0, 2.0)
      let finalResult = await taskpool.execute(task2)

      expect(String(intermediate)).assertEqual(String(7))
      expect(String(finalResult)).assertEqual(String(14))
    })

    /**
     * @tc.name   UseConcurrentTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_USE_CONCURRENT_TEST_2700
     * @tc.desc   Verify 5 different functions execute concurrently with correct results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UseConcurrentTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let task1 = new taskpool.Task(concurrentAdd, 1.0, 2.0)
      let task2 = new taskpool.Task(concurrentMultiply, 3.0, 4.0)
      let task3 = new taskpool.Task(concurrentIdentity, 42.0)
      let task4 = new taskpool.Task(concurrentSquare, 5.0)
      let task5 = new taskpool.Task(concurrentStringLen, 'hello')

      let results = await Promise.all([
        taskpool.execute(task1),
        taskpool.execute(task2),
        taskpool.execute(task3),
        taskpool.execute(task4),
        taskpool.execute(task5)
      ])

      expect(results.length).assertEqual(5)
      expect(String(results[0])).assertEqual(String(3))
      expect(String(results[1])).assertEqual(String(12))
      expect(String(results[2])).assertEqual(String(42))
      expect(String(results[3])).assertEqual(String(25))
      expect(String(results[4])).assertEqual(String(5))
    })
  })
}
