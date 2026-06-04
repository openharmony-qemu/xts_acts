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

import { collections } from '@kit.ArkTS';
import taskpool from '@ohos.taskpool';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../Utils';

// ===== @Sendable Class Definitions =====

@Sendable
class SendableConcatArray {
  _data: collections.Array<number> = new collections.Array<number>()
  get length(): number {
    return this._data.length
  }
  get(index: number): number {
    return this._data[index]
  }
  join(separator?: string): string {
    return this._data.join(separator)
  }
  slice(start?: number, end?: number): collections.Array<number> {
    return this._data.slice(start, end)
  }
  push(value: number): void {
    this._data.push(value)
  }
}

@Sendable
class SendableConcatArrayStr {
  _data: collections.Array<string> = new collections.Array<string>()
  get length(): number {
    return this._data.length
  }
  get(index: number): string {
    return this._data[index]
  }
  join(separator?: string): string {
    return this._data.join(separator)
  }
  slice(start?: number, end?: number): collections.Array<string> {
    return this._data.slice(start, end)
  }
  push(value: string): void {
    this._data.push(value)
  }
}

// ===== @Concurrent Functions =====

@Concurrent
function getArrayLengthConcurrent(arr: collections.Array<number>): number {
  return arr.length
}

@Concurrent
function joinArrayConcurrent(arr: collections.Array<number>): string {
  return arr.join('-')
}

@Concurrent
function processCustomArrayConcurrent(arr: SendableConcatArray): number {
  return arr.length
}

@Concurrent
function joinCustomArrayConcurrent(arr: SendableConcatArray): string {
  return arr.join('-')
}

@Concurrent
function sliceAndJoinConcurrent(arr: collections.Array<number>): string {
  let sliced = arr.slice(1, 3)
  return sliced.join(',')
}

@Concurrent
function modifyCustomArrayConcurrent(arr: SendableConcatArray): number {
  arr.push(100)
  arr.push(200)
  return arr.length
}

@Concurrent
function concatArraysConcurrent(arr1: collections.Array<number>, arr2: collections.Array<number>): number {
  let result = arr1.concat(arr2)
  return result.length
}

@Concurrent
function readCustomArrayConcurrent(arr: SendableConcatArrayStr): string {
  return arr.join(',')
}

@Concurrent
function processMultipleSlicesConcurrent(arr: collections.Array<number>): number {
  let s1 = arr.slice(0, 2)
  let s2 = arr.slice(2, 4)
  return s1.length + s2.length
}

@Concurrent
function checkSendableSemanticsConcurrent(arr: collections.Array<number>): boolean {
  return arr.length > 0 && arr.join(',') !== ''
}

export default function ConcatArrayConcurrentTest(): void {
  describe('ConcatArrayConcurrentTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== Section 2.4/7.1: ISendable semantics & cross-thread (0100-0400) =====

    /**
     * @tc.name   CAConcurrentTest0100
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_0100
     * @tc.desc   Verify collections.Array can be passed to TaskPool and length read correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>(1, 2, 3)
      let task = new taskpool.Task(getArrayLengthConcurrent, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   CAConcurrentTest0200
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_0200
     * @tc.desc   Verify collections.Array join method works correctly in TaskPool worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>(10, 20, 30)
      let task = new taskpool.Task(joinArrayConcurrent, arr)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('10-20-30')
    })

    /**
     * @tc.name   CAConcurrentTest0300
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_0300
     * @tc.desc   Verify collections.Array slice and join work together in TaskPool worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>(1, 2, 3, 4, 5)
      let task = new taskpool.Task(sliceAndJoinConcurrent, arr)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('2,3')
    })

    /**
     * @tc.name   CAConcurrentTest0400
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_0400
     * @tc.desc   Verify ISendable semantics with collections.Array cross-thread data integrity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>(1, 2, 3)
      let task = new taskpool.Task(checkSendableSemanticsConcurrent, arr)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
    })

    // ===== Section 3.10: Custom class cross-thread (0500-0900) =====

    /**
     * @tc.name   CAConcurrentTest0500
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_0500
     * @tc.desc   Verify custom @Sendable class can be passed to TaskPool and length read correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myArr = new SendableConcatArray()
      myArr.push(1)
      myArr.push(2)
      myArr.push(3)
      let task = new taskpool.Task(processCustomArrayConcurrent, myArr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   CAConcurrentTest0600
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_0600
     * @tc.desc   Verify custom @Sendable class join method works correctly in TaskPool worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myArr = new SendableConcatArray()
      myArr.push(10)
      myArr.push(20)
      myArr.push(30)
      let task = new taskpool.Task(joinCustomArrayConcurrent, myArr)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('10-20-30')
    })

    /**
     * @tc.name   CAConcurrentTest0700
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_0700
     * @tc.desc   Verify custom @Sendable class modification in TaskPool syncs back to original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myArr = new SendableConcatArray()
      myArr.push(1)
      myArr.push(2)
      let originalLength = myArr.length
      let task = new taskpool.Task(modifyCustomArrayConcurrent, myArr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(originalLength + 2)
      expect(myArr.length).assertEqual(originalLength + 2)
      expect(myArr.get(originalLength)).assertEqual(100)
      expect(myArr.get(originalLength + 1)).assertEqual(200)
    })

    /**
     * @tc.name   CAConcurrentTest0800
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_0800
     * @tc.desc   Verify custom @Sendable string class cross-thread join works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myArr = new SendableConcatArrayStr()
      myArr.push('a')
      myArr.push('b')
      myArr.push('c')
      let task = new taskpool.Task(readCustomArrayConcurrent, myArr)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('a,b,c')
    })

    // ===== Section 6: Concurrent concat operations (0900-1200) =====

    /**
     * @tc.name   CAConcurrentTest0900
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_0900
     * @tc.desc   Verify concat operation works correctly in TaskPool worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr1 = new collections.Array<number>(1, 2)
      let arr2 = new collections.Array<number>(3, 4)
      let task = new taskpool.Task(concatArraysConcurrent, arr1, arr2)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(4)
    })

    /**
     * @tc.name   CAConcurrentTest1000
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_1000
     * @tc.desc   Verify multiple TaskPool tasks can process collections.Array concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr1 = new collections.Array<number>(1, 2, 3)
      let arr2 = new collections.Array<number>(4, 5, 6)
      let arr3 = new collections.Array<number>(7, 8, 9)
      let p1 = taskpool.execute(new taskpool.Task(getArrayLengthConcurrent, arr1))
      let p2 = taskpool.execute(new taskpool.Task(getArrayLengthConcurrent, arr2))
      let p3 = taskpool.execute(new taskpool.Task(getArrayLengthConcurrent, arr3))
      let results = await Promise.all([p1, p2, p3])
      expect(results[0] as number).assertEqual(3)
      expect(results[1] as number).assertEqual(3)
      expect(results[2] as number).assertEqual(3)
    })

    /**
     * @tc.name   CAConcurrentTest1100
     * @tc.number SUB_CONCATARRAY_CONCURRENT_TEST_1100
     * @tc.desc   Verify multiple slice operations work correctly in TaskPool concurrently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CAConcurrentTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>(1, 2, 3, 4, 5, 6)
      let task = new taskpool.Task(processMultipleSlicesConcurrent, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(4)
    })

  })
}
