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

@Concurrent
function processIntIntArrayFunc(arr: collections.Int32Array): number {
  return arr.length
}

@Concurrent
function modifyIntIntArrayFunc(arr: collections.Int32Array): void {
  arr[0] = 999999
}

@Concurrent
function sumIntIntArrayFunc(arr: collections.Int32Array): number {
  let sum: number = 0
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function readIntIntAtFunc(arr: collections.Int32Array, index: number): number {
  return arr[index] as number
}

@Sendable
class CustomIntIntArray extends collections.Int32Array {
  constructor(length: number) {
    super(length)
  }

  sumAll(): number {
    let s: number = 0
    this.forEach((v: number) => { s += v })
    return s
  }

  average(): number {
    if (this.length === 0) return 0
    return this.sumAll() / this.length
  }
}

export default function IntIntArrayTest(): void {
  describe('IntIntArrayTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ==================== Constructor Tests ====================

    /**
     * @tc.name   IntIntArrayTest0100
     * @tc.number SUB_INT_INT_ARRAY_TEST_0100
     * @tc.desc   Verify empty constructor creates array with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int32Array()
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
      expect(arr.byteOffset).assertEqual(0)
    })

    /**
     * @tc.name   IntIntArrayTest0200
     * @tc.number SUB_INT_INT_ARRAY_TEST_0200
     * @tc.desc   Verify length constructor with positive integer values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr1 = new collections.Int32Array(5)
      expect(arr1.length).assertEqual(5)
      expect(arr1.byteLength).assertEqual(20)
      expect(arr1[0]).assertEqual(0)
      let arr2 = new collections.Int32Array(100)
      expect(arr2.length).assertEqual(100)
      expect(arr2.byteLength).assertEqual(400)
    })

    /**
     * @tc.name   IntIntArrayTest0300
     * @tc.number SUB_INT_INT_ARRAY_TEST_0300
     * @tc.desc   Verify length constructor with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int32Array(0)
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   IntIntArrayTest0400
     * @tc.number SUB_INT_INT_ARRAY_TEST_0400
     * @tc.desc   Verify length constructor with negative value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        let arr = new collections.Int32Array(-1)
        expect().assertFail()
      } catch (e) {
        expect(e instanceof Error).assertTrue()
      }
    })

    /**
     * @tc.name   IntIntArrayTest0500
     * @tc.number SUB_INT_INT_ARRAY_TEST_0500
     * @tc.desc   Verify ArrayLike constructor with normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, -200000, 2147483647, -2147483648]
      let arr = new collections.Int32Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(100000)
      expect(arr[1]).assertEqual(-200000)
      expect(arr[2]).assertEqual(2147483647)
      expect(arr[3]).assertEqual(-2147483648)
    })

    /**
     * @tc.name   IntIntArrayTest0600
     * @tc.number SUB_INT_INT_ARRAY_TEST_0600
     * @tc.desc   Verify ArrayLike constructor with boundary values -2147483648 and 2147483647
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [-2147483648, 2147483647, 0, -1]
      let arr = new collections.Int32Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(-2147483648)
      expect(arr[1]).assertEqual(2147483647)
      expect(arr[2]).assertEqual(0)
      expect(arr[3]).assertEqual(-1)
    })

    /**
     * @tc.name   IntIntArrayTest0700
     * @tc.number SUB_INT_INT_ARRAY_TEST_0700
     * @tc.desc   Verify ArrayLike constructor with overflow values truncated to 32-bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [2147483648, -2147483649, 4294967296, 4294967295]
      let arr = new collections.Int32Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(-2147483648)
      expect(arr[1]).assertEqual(2147483647)
      expect(arr[2]).assertEqual(0)
      expect(arr[3]).assertEqual(-1)
    })

    /**
     * @tc.name   IntIntArrayTest0800
     * @tc.number SUB_INT_INT_ARRAY_TEST_0800
     * @tc.desc   Verify constructor from another IntIntArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, -200000, 2147483647, -2147483648]
      let arr1 = new collections.Int32Array(src)
      let arr2 = new collections.Int32Array(arr1)
      expect(arr2.length).assertEqual(4)
      expect(arr2[0]).assertEqual(100000)
      expect(arr2[1]).assertEqual(-200000)
      expect(arr2[2]).assertEqual(2147483647)
      expect(arr2[3]).assertEqual(-2147483648)
    })

    /**
     * @tc.name   IntIntArrayTest0900
     * @tc.number SUB_INT_INT_ARRAY_TEST_0900
     * @tc.desc   Verify ArrayBuffer constructor with byteOffset and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(40)
      let arr = new collections.Int32Array(buffer, 4, 5)
      expect(arr.length).assertEqual(5)
      expect(arr.byteOffset).assertEqual(4)
      expect(arr.byteLength).assertEqual(20)
    })

    /**
     * @tc.name   IntIntArrayTest1000
     * @tc.number SUB_INT_INT_ARRAY_TEST_1000
     * @tc.desc   Verify static from method with ArrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 1000000]
      let arr = collections.Int32Array.from(src)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(100000)
      expect(arr[1]).assertEqual(200000)
      expect(arr[2]).assertEqual(1000000)
    })

    /**
     * @tc.name   IntIntArrayTest1100
     * @tc.number SUB_INT_INT_ARRAY_TEST_1100
     * @tc.desc   Verify static from method with mapFn transform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [10000, 20000]
      let arr = collections.Int32Array.from<number>(src, (v: number, k: number): number => v * 100)
      expect(arr.length).assertEqual(2)
      expect(arr[0]).assertEqual(1000000)
      expect(arr[1]).assertEqual(2000000)
    })

    /**
     * @tc.name   IntIntArrayTest1200
     * @tc.number SUB_INT_INT_ARRAY_TEST_1200
     * @tc.desc   Verify static of method with variadic arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = collections.Int32Array.of(100000, -200000, 2147483647, -2147483648)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(100000)
      expect(arr[2]).assertEqual(2147483647)
      expect(arr[3]).assertEqual(-2147483648)
    })

    /**
     * @tc.name   IntIntArrayTest1300
     * @tc.number SUB_INT_INT_ARRAY_TEST_1300
     * @tc.desc   Verify static of method with empty arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = collections.Int32Array.of()
      expect(arr.length).assertEqual(0)
    })

    // ==================== Property Tests ====================

    /**
     * @tc.name   IntIntArrayTest1400
     * @tc.number SUB_INT_INT_ARRAY_TEST_1400
     * @tc.desc   Verify length and byteLength relationship (byteLength = length * 4)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int32Array(10)
      expect(arr.length).assertEqual(10)
      expect(arr.byteLength).assertEqual(40)
      expect(arr.byteLength).assertEqual(arr.length * 4)
    })

    /**
     * @tc.name   IntIntArrayTest1500
     * @tc.number SUB_INT_INT_ARRAY_TEST_1500
     * @tc.desc   Verify BYTES_PER_ELEMENT is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(collections.Int32Array.BYTES_PER_ELEMENT).assertEqual(4)
      let arr = new collections.Int32Array(5)
      expect(arr.byteLength).assertEqual(arr.length * 4)
    })

    /**
     * @tc.name   IntIntArrayTest1600
     * @tc.number SUB_INT_INT_ARRAY_TEST_1600
     * @tc.desc   Verify buffer property returns underlying ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(40)
      let arr = new collections.Int32Array(buffer)
      expect(arr.buffer.byteLength).assertEqual(40)
    })

    /**
     * @tc.name   IntIntArrayTest1700
     * @tc.number SUB_INT_INT_ARRAY_TEST_1700
     * @tc.desc   Verify byteOffset with ArrayBuffer constructor offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(40)
      let arr = new collections.Int32Array(buffer, 8)
      expect(arr.byteOffset).assertEqual(8)
    })

    // ==================== Method Tests ====================

    /**
     * @tc.name   IntIntArrayTest1800
     * @tc.number SUB_INT_INT_ARRAY_TEST_1800
     * @tc.desc   Verify at() with positive and negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      expect(arr.at(0)).assertEqual(100000)
      expect(arr.at(-1)).assertEqual(500000)
      expect(arr.at(2)).assertEqual(300000)
    })

    /**
     * @tc.name   IntIntArrayTest1900
     * @tc.number SUB_INT_INT_ARRAY_TEST_1900
     * @tc.desc   Verify at() returns undefined for out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 200000]
      let arr = new collections.Int32Array(src)
      let result = arr.at(10)
      expect(result === undefined).assertTrue()
    })

    /**
     * @tc.name   IntIntArrayTest2000
     * @tc.number SUB_INT_INT_ARRAY_TEST_2000
     * @tc.desc   Verify fill() with value and optional start/end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int32Array(5)
      arr.fill(1000000)
      expect(arr[0]).assertEqual(1000000)
      expect(arr[4]).assertEqual(1000000)
      arr.fill(2000000, 1, 4)
      expect(arr[0]).assertEqual(1000000)
      expect(arr[1]).assertEqual(2000000)
      expect(arr[3]).assertEqual(2000000)
      expect(arr[4]).assertEqual(1000000)
    })

    /**
     * @tc.name   IntIntArrayTest2100
     * @tc.number SUB_INT_INT_ARRAY_TEST_2100
     * @tc.desc   Verify fill() with boundary and overflow values auto-truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int32Array(3)
      arr.fill(-2147483648)
      expect(arr[0]).assertEqual(-2147483648)
      arr.fill(2147483647)
      expect(arr[0]).assertEqual(2147483647)
      arr.fill(2147483648)
      expect(arr[0]).assertEqual(-2147483648)
    })

    /**
     * @tc.name   IntIntArrayTest2200
     * @tc.number SUB_INT_INT_ARRAY_TEST_2200
     * @tc.desc   Verify find() returns first matching element or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      let found = arr.find((v: number): boolean => v > 200000)
      expect(found === undefined).assertFalse()
      expect(found as number).assertEqual(300000)
      let notFound = arr.find((v: number): boolean => v > 1000000)
      expect(notFound === undefined).assertTrue()
    })

    /**
     * @tc.name   IntIntArrayTest2300
     * @tc.number SUB_INT_INT_ARRAY_TEST_2300
     * @tc.desc   Verify findIndex() returns correct index or -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      let idx = arr.findIndex((v: number): boolean => v > 200000)
      expect(idx).assertEqual(2)
      let noIdx = arr.findIndex((v: number): boolean => v > 1000000)
      expect(noIdx).assertEqual(-1)
    })

    /**
     * @tc.name   IntIntArrayTest2400
     * @tc.number SUB_INT_INT_ARRAY_TEST_2400
     * @tc.desc   Verify forEach() iterates all elements correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000]
      let arr = new collections.Int32Array(src)
      let sum: number = 0
      let count: number = 0
      arr.forEach((v: number): void => {
        sum += v
        count++
      })
      expect(count).assertEqual(3)
      expect(sum).assertEqual(600000)
    })

    /**
     * @tc.name   IntIntArrayTest2500
     * @tc.number SUB_INT_INT_ARRAY_TEST_2500
     * @tc.desc   Verify indexOf() with existing and non-existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 200000, 100000]
      let arr = new collections.Int32Array(src)
      expect(arr.indexOf(100000)).assertEqual(0)
      expect(arr.indexOf(200000)).assertEqual(1)
      expect(arr.indexOf(999999)).assertEqual(-1)
    })

    /**
     * @tc.name   IntIntArrayTest2600
     * @tc.number SUB_INT_INT_ARRAY_TEST_2600
     * @tc.desc   Verify indexOf() with fromIndex parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 200000, 100000]
      let arr = new collections.Int32Array(src)
      expect(arr.indexOf(200000, 2)).assertEqual(3)
      expect(arr.indexOf(100000, 1)).assertEqual(4)
    })

    /**
     * @tc.name   IntIntArrayTest2700
     * @tc.number SUB_INT_INT_ARRAY_TEST_2700
     * @tc.desc   Verify lastIndexOf() with duplicate values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 200000, 100000]
      let arr = new collections.Int32Array(src)
      expect(arr.lastIndexOf(200000)).assertEqual(3)
      expect(arr.lastIndexOf(100000)).assertEqual(4)
      expect(arr.lastIndexOf(999999)).assertEqual(-1)
    })

    /**
     * @tc.name   IntIntArrayTest2800
     * @tc.number SUB_INT_INT_ARRAY_TEST_2800
     * @tc.desc   Verify join() with default and custom separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000]
      let arr = new collections.Int32Array(src)
      expect(arr.join()).assertEqual('100000,200000,300000')
      expect(arr.join('-')).assertEqual('100000-200000-300000')
    })

    /**
     * @tc.name   IntIntArrayTest2900
     * @tc.number SUB_INT_INT_ARRAY_TEST_2900
     * @tc.desc   Verify map() creates new array with transformed elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000]
      let arr = new collections.Int32Array(src)
      let mapped = arr.map((v: number): number => v * 2)
      expect(mapped.length).assertEqual(3)
      expect(mapped[0]).assertEqual(200000)
      expect(mapped[1]).assertEqual(400000)
      expect(mapped[2]).assertEqual(600000)
      expect(arr[0]).assertEqual(100000)
    })

    /**
     * @tc.name   IntIntArrayTest3000
     * @tc.number SUB_INT_INT_ARRAY_TEST_3000
     * @tc.desc   Verify map() with overflow values auto-truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [2000000000, 2000000000]
      let arr = new collections.Int32Array(src)
      let mapped = arr.map((v: number): number => v * 2)
      expect(mapped[0]).assertEqual(-294967296)
      expect(mapped[1]).assertEqual(-294967296)
    })

    /**
     * @tc.name   IntIntArrayTest3100
     * @tc.number SUB_INT_INT_ARRAY_TEST_3100
     * @tc.desc   Verify reduce() without and with initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000]
      let arr = new collections.Int32Array(src)
      let sum = arr.reduce((acc: number, v: number): number => acc + v)
      expect(sum).assertEqual(1000000)
      let sumInit = arr.reduce((acc: number, v: number): number => acc + v, 500000)
      expect(sumInit).assertEqual(1500000)
    })

    /**
     * @tc.name   IntIntArrayTest3200
     * @tc.number SUB_INT_INT_ARRAY_TEST_3200
     * @tc.desc   Verify reduceRight() processes elements from right to left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000]
      let arr = new collections.Int32Array(src)
      let result = arr.reduceRight((acc: number, v: number): number => acc + v)
      expect(result).assertEqual(1000000)
      let resultInit = arr.reduceRight((acc: number, v: number): number => acc + v, 100000)
      expect(resultInit).assertEqual(1100000)
    })

    /**
     * @tc.name   IntIntArrayTest3300
     * @tc.number SUB_INT_INT_ARRAY_TEST_3300
     * @tc.desc   Verify reverse() reverses array in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      arr.reverse()
      expect(arr[0]).assertEqual(500000)
      expect(arr[1]).assertEqual(400000)
      expect(arr[4]).assertEqual(100000)
    })

    /**
     * @tc.name   IntIntArrayTest3400
     * @tc.number SUB_INT_INT_ARRAY_TEST_3400
     * @tc.desc   Verify slice() returns new array with selected range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      let sliced = arr.slice(1, 4)
      expect(sliced.length).assertEqual(3)
      expect(sliced[0]).assertEqual(200000)
      expect(sliced[2]).assertEqual(400000)
      expect(arr[1]).assertEqual(200000)
    })

    /**
     * @tc.name   IntIntArrayTest3500
     * @tc.number SUB_INT_INT_ARRAY_TEST_3500
     * @tc.desc   Verify slice() with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      let sliced = arr.slice(-2)
      expect(sliced.length).assertEqual(2)
      expect(sliced[0]).assertEqual(400000)
      expect(sliced[1]).assertEqual(500000)
    })

    /**
     * @tc.name   IntIntArrayTest3600
     * @tc.number SUB_INT_INT_ARRAY_TEST_3600
     * @tc.desc   Verify sort() with ascending comparator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [300000, 100000, 400000, -200000, 500000]
      let arr = new collections.Int32Array(src)
      arr.sort((a: number, b: number): number => a - b)
      expect(arr[0]).assertEqual(-200000)
      expect(arr[1]).assertEqual(100000)
      expect(arr[2]).assertEqual(300000)
      expect(arr[4]).assertEqual(500000)
    })

    /**
     * @tc.name   IntIntArrayTest3700
     * @tc.number SUB_INT_INT_ARRAY_TEST_3700
     * @tc.desc   Verify sort() with descending order and boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [2000000000, -2000000000, 0, 1000000, -1000000]
      let arr = new collections.Int32Array(src)
      arr.sort((a: number, b: number): number => b - a)
      expect(arr[0]).assertEqual(2000000000)
      expect(arr[1]).assertEqual(1000000)
      expect(arr[4]).assertEqual(-2000000000)
    })

    /**
     * @tc.name   IntIntArrayTest3800
     * @tc.number SUB_INT_INT_ARRAY_TEST_3800
     * @tc.desc   Verify subarray() shares buffer with original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      let sub = arr.subarray(1, 4)
      expect(sub.length).assertEqual(3)
      expect(sub[0]).assertEqual(200000)
      sub[0] = 1000000
      expect(arr[1]).assertEqual(1000000)
    })

    /**
     * @tc.name   IntIntArrayTest3900
     * @tc.number SUB_INT_INT_ARRAY_TEST_3900
     * @tc.desc   Verify includes() with existing and non-existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, -2147483648, 2147483647]
      let arr = new collections.Int32Array(src)
      expect(arr.includes(300000)).assertTrue()
      expect(arr.includes(-2147483648)).assertTrue()
      expect(arr.includes(2147483647)).assertTrue()
      expect(arr.includes(999999)).assertFalse()
    })

    /**
     * @tc.name   IntIntArrayTest4000
     * @tc.number SUB_INT_INT_ARRAY_TEST_4000
     * @tc.desc   Verify copyWithin() copies elements within array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      arr.copyWithin(0, 3)
      expect(arr[0]).assertEqual(400000)
      expect(arr[1]).assertEqual(500000)
      expect(arr[2]).assertEqual(300000)
    })

    /**
     * @tc.name   IntIntArrayTest4100
     * @tc.number SUB_INT_INT_ARRAY_TEST_4100
     * @tc.desc   Verify set() writes values from ArrayLike at offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int32Array(5)
      let vals: number[] = [100000, 200000, 300000]
      arr.set(vals, 1)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(100000)
      expect(arr[2]).assertEqual(200000)
      expect(arr[3]).assertEqual(300000)
      expect(arr[4]).assertEqual(0)
    })

    /**
     * @tc.name   IntIntArrayTest4200
     * @tc.number SUB_INT_INT_ARRAY_TEST_4200
     * @tc.desc   Verify every() returns true when all elements match condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      expect(arr.every((v: number): boolean => v > 0)).assertTrue()
      expect(arr.every((v: number): boolean => v > 200000)).assertFalse()
    })

    /**
     * @tc.name   IntIntArrayTest4300
     * @tc.number SUB_INT_INT_ARRAY_TEST_4300
     * @tc.desc   Verify some() returns true when any element matches condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      expect(arr.some((v: number): boolean => v > 300000)).assertTrue()
      expect(arr.some((v: number): boolean => v > 1000000)).assertFalse()
    })

    /**
     * @tc.name   IntIntArrayTest4400
     * @tc.number SUB_INT_INT_ARRAY_TEST_4400
     * @tc.desc   Verify filter() returns new array with matching elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      let filtered = arr.filter((v: number): boolean => v > 200000)
      expect(filtered.length).assertEqual(3)
      expect(filtered[0]).assertEqual(300000)
      expect(filtered[1]).assertEqual(400000)
      expect(filtered[2]).assertEqual(500000)
    })

    /**
     * @tc.name   IntIntArrayTest4500
     * @tc.number SUB_INT_INT_ARRAY_TEST_4500
     * @tc.desc   Verify toString() returns comma-separated string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000]
      let arr = new collections.Int32Array(src)
      expect(arr.toString()).assertEqual('100000,200000,300000')
    })

    /**
     * @tc.name   IntIntArrayTest4600
     * @tc.number SUB_INT_INT_ARRAY_TEST_4600
     * @tc.desc   Verify entries() returns key-value iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000]
      let arr = new collections.Int32Array(src)
      let iter: IterableIterator<[number, number]> = arr.entries()
      let first: [number, number] = iter.next().value as [number, number]
      expect(first[0]).assertEqual(0)
      expect(first[1]).assertEqual(100000)
    })

    /**
     * @tc.name   IntIntArrayTest4700
     * @tc.number SUB_INT_INT_ARRAY_TEST_4700
     * @tc.desc   Verify keys() returns index iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000]
      let arr = new collections.Int32Array(src)
      let keysArr: number[] = []
      for (let key of arr.keys()) {
        keysArr.push(key)
      }
      expect(keysArr.length).assertEqual(3)
      expect(keysArr[0]).assertEqual(0)
      expect(keysArr[2]).assertEqual(2)
    })

    /**
     * @tc.name   IntIntArrayTest4800
     * @tc.number SUB_INT_INT_ARRAY_TEST_4800
     * @tc.desc   Verify values() returns value iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000]
      let arr = new collections.Int32Array(src)
      let valsArr: number[] = []
      for (let val of arr.values()) {
        valsArr.push(val)
      }
      expect(valsArr.length).assertEqual(3)
      expect(valsArr[0]).assertEqual(100000)
      expect(valsArr[2]).assertEqual(300000)
    })

    /**
     * @tc.name   IntIntArrayTest4900
     * @tc.number SUB_INT_INT_ARRAY_TEST_4900
     * @tc.desc   Verify index access operator and element assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, -200000, 2147483647]
      let arr = new collections.Int32Array(src)
      expect(arr[0]).assertEqual(100000)
      expect(arr[2]).assertEqual(2147483647)
      arr[1] = -2147483648
      expect(arr[1]).assertEqual(-2147483648)
    })

    /**
     * @tc.name   IntIntArrayTest5000
     * @tc.number SUB_INT_INT_ARRAY_TEST_5000
     * @tc.desc   Verify Set constructor from Iterable Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let set: Set<number> = new Set<number>([100000, 200000, 300000])
      let arr = new collections.Int32Array(set)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(100000)
      expect(arr[1]).assertEqual(200000)
      expect(arr[2]).assertEqual(300000)
    })

    // ==================== Concurrent Tests ====================

    /**
     * @tc.name   IntIntArrayTest5100
     * @tc.number SUB_INT_INT_ARRAY_TEST_5100
     * @tc.desc   Verify TaskPool passes IntIntArray and returns correct length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000]
      let arr = new collections.Int32Array(src)
      let task = new taskpool.Task(processIntIntArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   IntIntArrayTest5200
     * @tc.number SUB_INT_INT_ARRAY_TEST_5200
     * @tc.desc   Verify TaskPool modifies IntIntArray via reference sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000]
      let arr = new collections.Int32Array(src)
      let task = new taskpool.Task(modifyIntIntArrayFunc, arr)
      await taskpool.execute(task)
      expect(arr[0]).assertEqual(999999)
    })

    /**
     * @tc.name   IntIntArrayTest5300
     * @tc.number SUB_INT_INT_ARRAY_TEST_5300
     * @tc.desc   Verify concurrent read from multiple TaskPool tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IntIntArrayTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(readIntIntAtFunc, arr, i))
      }
      let p0 = taskpool.execute(tasks[0])
      let p1 = taskpool.execute(tasks[1])
      let p2 = taskpool.execute(tasks[2])
      let p3 = taskpool.execute(tasks[3])
      let p4 = taskpool.execute(tasks[4])
      let results = await Promise.all([p0, p1, p2, p3, p4])
      expect(results[0] as number).assertEqual(100000)
      expect(results[1] as number).assertEqual(200000)
      expect(results[4] as number).assertEqual(500000)
    })

    /**
     * @tc.name   IntIntArrayTest5400
     * @tc.number SUB_INT_INT_ARRAY_TEST_5400
     * @tc.desc   Verify TaskPool sum calculation with IntIntArray data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 200000, 300000, 400000, 500000]
      let arr = new collections.Int32Array(src)
      let task = new taskpool.Task(sumIntIntArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(1500000)
    })

    /**
     * @tc.name   IntIntArrayTest5500
     * @tc.number SUB_INT_INT_ARRAY_TEST_5500
     * @tc.desc   Verify IntIntArray with boundary values passed through TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntIntArrayTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [-2147483648, 2147483647, 0, -1, 1]
      let arr = new collections.Int32Array(src)
      let task = new taskpool.Task(sumIntIntArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(-1)
    })

    /**
     * @tc.name   IntIntArrayTest5600
     * @tc.number SUB_INT_INT_ARRAY_TEST_5600
     * @tc.desc   Verify concurrent boundary value truncation via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IntIntArrayTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [2147483648, -2147483649, 4294967296, 4294967295]
      let arr = new collections.Int32Array(src)
      let task = new taskpool.Task(readIntIntAtFunc, arr, 0)
      let r0 = await taskpool.execute(task)
      expect(r0 as number).assertEqual(-2147483648)
      let task2 = new taskpool.Task(readIntIntAtFunc, arr, 1)
      let r1 = await taskpool.execute(task2)
      expect(r1 as number).assertEqual(2147483647)
    })

    // ==================== Inheritance Tests ====================

    /**
     * @tc.name   IntIntArrayTest5700
     * @tc.number SUB_INT_INT_ARRAY_TEST_5700
     * @tc.desc   Verify custom subclass extends IntIntArray with sumAll and average methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomIntIntArray(5)
      arr[0] = 100000
      arr[1] = 200000
      arr[2] = 300000
      arr[3] = 400000
      arr[4] = 500000
      expect(arr.sumAll()).assertEqual(1500000)
      expect(arr.average()).assertEqual(300000)
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   IntIntArrayTest5800
     * @tc.number SUB_INT_INT_ARRAY_TEST_5800
     * @tc.desc   Verify instanceof check for custom subclass and parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomIntIntArray(3)
      expect(arr instanceof CustomIntIntArray).assertTrue()
      expect(arr instanceof collections.Int32Array).assertTrue()
    })

    /**
     * @tc.name   IntIntArrayTest5900
     * @tc.number SUB_INT_INT_ARRAY_TEST_5900
     * @tc.desc   Verify multiple IntIntArray views sharing same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntIntArrayTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(40)
      let arr1 = new collections.Int32Array(buffer, 0, 5)
      let arr2 = new collections.Int32Array(buffer, 20, 5)
      arr1[0] = 100000
      arr1[4] = -100000
      expect(arr1.length).assertEqual(5)
      expect(arr2.length).assertEqual(5)
      expect(arr2.byteOffset).assertEqual(20)
    })
  })
}
