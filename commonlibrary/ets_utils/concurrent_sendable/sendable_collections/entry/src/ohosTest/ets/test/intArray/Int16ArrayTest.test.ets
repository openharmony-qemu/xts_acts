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
function processInt16ArrayFunc(arr: collections.Int16Array): number {
  return arr.length
}

@Concurrent
function modifyInt16ArrayFunc(arr: collections.Int16Array): void {
  arr[0] = 9999
}

@Concurrent
function sumInt16ArrayFunc(arr: collections.Int16Array): number {
  let sum: number = 0
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function readInt16AtFunc(arr: collections.Int16Array, index: number): number {
  return arr[index] as number
}

@Sendable
class CustomInt16Array extends collections.Int16Array {
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

export default function Int16ArrayTest(): void {
  describe('Int16ArrayTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ==================== Constructor Tests ====================

    /**
     * @tc.name   Int16ArrayTest0100
     * @tc.number SUB_INT16ARRAY_TEST_0100
     * @tc.desc   Verify empty constructor creates array with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int16Array()
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
      expect(arr.byteOffset).assertEqual(0)
    })

    /**
     * @tc.name   Int16ArrayTest0200
     * @tc.number SUB_INT16ARRAY_TEST_0200
     * @tc.desc   Verify length constructor with positive integer values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr1 = new collections.Int16Array(5)
      expect(arr1.length).assertEqual(5)
      expect(arr1.byteLength).assertEqual(10)
      expect(arr1[0]).assertEqual(0)
      let arr2 = new collections.Int16Array(100)
      expect(arr2.length).assertEqual(100)
      expect(arr2.byteLength).assertEqual(200)
    })

    /**
     * @tc.name   Int16ArrayTest0300
     * @tc.number SUB_INT16ARRAY_TEST_0300
     * @tc.desc   Verify length constructor with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int16Array(0)
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   Int16ArrayTest0400
     * @tc.number SUB_INT16ARRAY_TEST_0400
     * @tc.desc   Verify length constructor with negative value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        let arr = new collections.Int16Array(-1)
        expect().assertFail()
      } catch (e) {
        expect(e.message).assertContain('integerIndex')
      }
    })

    /**
     * @tc.name   Int16ArrayTest0500
     * @tc.number SUB_INT16ARRAY_TEST_0500
     * @tc.desc   Verify ArrayLike constructor with normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, -2000, 32767, -32768]
      let arr = new collections.Int16Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(1000)
      expect(arr[1]).assertEqual(-2000)
      expect(arr[2]).assertEqual(32767)
      expect(arr[3]).assertEqual(-32768)
    })

    /**
     * @tc.name   Int16ArrayTest0600
     * @tc.number SUB_INT16ARRAY_TEST_0600
     * @tc.desc   Verify ArrayLike constructor with boundary values -32768 and 32767
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [-32768, 32767, 0, -1]
      let arr = new collections.Int16Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(-32768)
      expect(arr[1]).assertEqual(32767)
      expect(arr[2]).assertEqual(0)
      expect(arr[3]).assertEqual(-1)
    })

    /**
     * @tc.name   Int16ArrayTest0700
     * @tc.number SUB_INT16ARRAY_TEST_0700
     * @tc.desc   Verify ArrayLike constructor with overflow values truncated to 16-bit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [32768, -32769, 65536, 65535]
      let arr = new collections.Int16Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(-32768)
      expect(arr[1]).assertEqual(32767)
      expect(arr[2]).assertEqual(0)
      expect(arr[3]).assertEqual(-1)
    })

    /**
     * @tc.name   Int16ArrayTest0800
     * @tc.number SUB_INT16ARRAY_TEST_0800
     * @tc.desc   Verify constructor from another Int16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, -2000, 32767, -32768]
      let arr1 = new collections.Int16Array(src)
      let arr2 = new collections.Int16Array(arr1)
      expect(arr2.length).assertEqual(4)
      expect(arr2[0]).assertEqual(1000)
      expect(arr2[1]).assertEqual(-2000)
      expect(arr2[2]).assertEqual(32767)
      expect(arr2[3]).assertEqual(-32768)
    })

    /**
     * @tc.name   Int16ArrayTest0900
     * @tc.number SUB_INT16ARRAY_TEST_0900
     * @tc.desc   Verify ArrayBuffer constructor with byteOffset and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(20)
      let arr = new collections.Int16Array(buffer, 2, 5)
      expect(arr.length).assertEqual(5)
      expect(arr.byteOffset).assertEqual(2)
      expect(arr.byteLength).assertEqual(10)
    })

    /**
     * @tc.name   Int16ArrayTest1000
     * @tc.number SUB_INT16ARRAY_TEST_1000
     * @tc.desc   Verify static from method with ArrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 30000]
      let arr = collections.Int16Array.from(src)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1000)
      expect(arr[1]).assertEqual(2000)
      expect(arr[2]).assertEqual(30000)
    })

    /**
     * @tc.name   Int16ArrayTest1100
     * @tc.number SUB_INT16ARRAY_TEST_1100
     * @tc.desc   Verify static from method with mapFn transform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [10000, 20000]
      let arr = collections.Int16Array.from<number>(src, (v: number, k: number): number => v * 2)
      expect(arr.length).assertEqual(2)
      expect(arr[0]).assertEqual(20000)
      expect(arr[1]).assertEqual(-25536)
    })

    /**
     * @tc.name   Int16ArrayTest1200
     * @tc.number SUB_INT16ARRAY_TEST_1200
     * @tc.desc   Verify static of method with variadic arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = collections.Int16Array.of(1000, -2000, 32767, -32768)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(1000)
      expect(arr[2]).assertEqual(32767)
      expect(arr[3]).assertEqual(-32768)
    })

    /**
     * @tc.name   Int16ArrayTest1300
     * @tc.number SUB_INT16ARRAY_TEST_1300
     * @tc.desc   Verify static of method with empty arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = collections.Int16Array.of()
      expect(arr.length).assertEqual(0)
    })

    // ==================== Property Tests ====================

    /**
     * @tc.name   Int16ArrayTest1400
     * @tc.number SUB_INT16ARRAY_TEST_1400
     * @tc.desc   Verify length and byteLength relationship (byteLength = length * 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int16Array(10)
      expect(arr.length).assertEqual(10)
      expect(arr.byteLength).assertEqual(20)
      expect(arr.byteLength).assertEqual(arr.length * 2)
    })

    /**
     * @tc.name   Int16ArrayTest1500
     * @tc.number SUB_INT16ARRAY_TEST_1500
     * @tc.desc   Verify BYTES_PER_ELEMENT is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(collections.Int16Array.BYTES_PER_ELEMENT).assertEqual(2)
      let arr = new collections.Int16Array(5)
      expect(arr.byteLength).assertEqual(arr.length * 2)
    })

    /**
     * @tc.name   Int16ArrayTest1600
     * @tc.number SUB_INT16ARRAY_TEST_1600
     * @tc.desc   Verify buffer property returns underlying ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(20)
      let arr = new collections.Int16Array(buffer)
      expect(arr.buffer.byteLength).assertEqual(20)
    })

    /**
     * @tc.name   Int16ArrayTest1700
     * @tc.number SUB_INT16ARRAY_TEST_1700
     * @tc.desc   Verify byteOffset with ArrayBuffer constructor offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(20)
      let arr = new collections.Int16Array(buffer, 4)
      expect(arr.byteOffset).assertEqual(4)
    })

    // ==================== Method Tests ====================

    /**
     * @tc.name   Int16ArrayTest1800
     * @tc.number SUB_INT16ARRAY_TEST_1800
     * @tc.desc   Verify at() with positive and negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      expect(arr.at(0)).assertEqual(1000)
      expect(arr.at(-1)).assertEqual(5000)
      expect(arr.at(2)).assertEqual(3000)
    })

    /**
     * @tc.name   Int16ArrayTest1900
     * @tc.number SUB_INT16ARRAY_TEST_1900
     * @tc.desc   Verify at() returns undefined for out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [1000, 2000]
      let arr = new collections.Int16Array(src)
      let result = arr.at(10)
      expect(result === undefined).assertTrue()
    })

    /**
     * @tc.name   Int16ArrayTest2000
     * @tc.number SUB_INT16ARRAY_TEST_2000
     * @tc.desc   Verify fill() with value and optional start/end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int16Array(5)
      arr.fill(10000)
      expect(arr[0]).assertEqual(10000)
      expect(arr[4]).assertEqual(10000)
      arr.fill(20000, 1, 4)
      expect(arr[0]).assertEqual(10000)
      expect(arr[1]).assertEqual(20000)
      expect(arr[3]).assertEqual(20000)
      expect(arr[4]).assertEqual(10000)
    })

    /**
     * @tc.name   Int16ArrayTest2100
     * @tc.number SUB_INT16ARRAY_TEST_2100
     * @tc.desc   Verify fill() with boundary and overflow values auto-truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int16Array(3)
      arr.fill(-32768)
      expect(arr[0]).assertEqual(-32768)
      arr.fill(32767)
      expect(arr[0]).assertEqual(32767)
      arr.fill(32768)
      expect(arr[0]).assertEqual(-32768)
    })

    /**
     * @tc.name   Int16ArrayTest2200
     * @tc.number SUB_INT16ARRAY_TEST_2200
     * @tc.desc   Verify find() returns first matching element or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      let found = arr.find((v: number): boolean => v > 2000)
      expect(found === undefined).assertFalse()
      expect(found as number).assertEqual(3000)
      let notFound = arr.find((v: number): boolean => v > 10000)
      expect(notFound === undefined).assertTrue()
    })

    /**
     * @tc.name   Int16ArrayTest2300
     * @tc.number SUB_INT16ARRAY_TEST_2300
     * @tc.desc   Verify findIndex() returns correct index or -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      let idx = arr.findIndex((v: number): boolean => v > 2000)
      expect(idx).assertEqual(2)
      let noIdx = arr.findIndex((v: number): boolean => v > 10000)
      expect(noIdx).assertEqual(-1)
    })

    /**
     * @tc.name   Int16ArrayTest2400
     * @tc.number SUB_INT16ARRAY_TEST_2400
     * @tc.desc   Verify forEach() iterates all elements correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000]
      let arr = new collections.Int16Array(src)
      let sum: number = 0
      let count: number = 0
      arr.forEach((v: number): void => {
        sum += v
        count++
      })
      expect(count).assertEqual(3)
      expect(sum).assertEqual(6000)
    })

    /**
     * @tc.name   Int16ArrayTest2500
     * @tc.number SUB_INT16ARRAY_TEST_2500
     * @tc.desc   Verify indexOf() with existing and non-existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 2000, 1000]
      let arr = new collections.Int16Array(src)
      expect(arr.indexOf(1000)).assertEqual(0)
      expect(arr.indexOf(2000)).assertEqual(1)
      expect(arr.indexOf(9999)).assertEqual(-1)
    })

    /**
     * @tc.name   Int16ArrayTest2600
     * @tc.number SUB_INT16ARRAY_TEST_2600
     * @tc.desc   Verify indexOf() with fromIndex parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 2000, 1000]
      let arr = new collections.Int16Array(src)
      expect(arr.indexOf(2000, 2)).assertEqual(3)
      expect(arr.indexOf(1000, 1)).assertEqual(4)
    })

    /**
     * @tc.name   Int16ArrayTest2700
     * @tc.number SUB_INT16ARRAY_TEST_2700
     * @tc.desc   Verify lastIndexOf() with duplicate values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 2000, 1000]
      let arr = new collections.Int16Array(src)
      expect(arr.lastIndexOf(2000)).assertEqual(3)
      expect(arr.lastIndexOf(1000)).assertEqual(4)
      expect(arr.lastIndexOf(9999)).assertEqual(-1)
    })

    /**
     * @tc.name   Int16ArrayTest2800
     * @tc.number SUB_INT16ARRAY_TEST_2800
     * @tc.desc   Verify join() with default and custom separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000]
      let arr = new collections.Int16Array(src)
      expect(arr.join()).assertEqual('1000,2000,3000')
      expect(arr.join('-')).assertEqual('1000-2000-3000')
    })

    /**
     * @tc.name   Int16ArrayTest2900
     * @tc.number SUB_INT16ARRAY_TEST_2900
     * @tc.desc   Verify map() creates new array with transformed elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000]
      let arr = new collections.Int16Array(src)
      let mapped = arr.map((v: number): number => v * 2)
      expect(mapped.length).assertEqual(3)
      expect(mapped[0]).assertEqual(2000)
      expect(mapped[1]).assertEqual(4000)
      expect(mapped[2]).assertEqual(6000)
      expect(arr[0]).assertEqual(1000)
    })

    /**
     * @tc.name   Int16ArrayTest3000
     * @tc.number SUB_INT16ARRAY_TEST_3000
     * @tc.desc   Verify map() with overflow values auto-truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [20000, 20000]
      let arr = new collections.Int16Array(src)
      let mapped = arr.map((v: number): number => v * 2)
      expect(mapped[0]).assertEqual(-25536)
      expect(mapped[1]).assertEqual(-25536)
    })

    /**
     * @tc.name   Int16ArrayTest3100
     * @tc.number SUB_INT16ARRAY_TEST_3100
     * @tc.desc   Verify reduce() without and with initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000]
      let arr = new collections.Int16Array(src)
      let sum = arr.reduce((acc: number, v: number): number => acc + v)
      expect(sum).assertEqual(10000)
      let sumInit = arr.reduce((acc: number, v: number): number => acc + v, 5000)
      expect(sumInit).assertEqual(15000)
    })

    /**
     * @tc.name   Int16ArrayTest3200
     * @tc.number SUB_INT16ARRAY_TEST_3200
     * @tc.desc   Verify reduceRight() processes elements from right to left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000]
      let arr = new collections.Int16Array(src)
      let result = arr.reduceRight((acc: number, v: number): number => acc + v)
      expect(result).assertEqual(10000)
      let resultInit = arr.reduceRight((acc: number, v: number): number => acc + v, 1000)
      expect(resultInit).assertEqual(11000)
    })

    /**
     * @tc.name   Int16ArrayTest3300
     * @tc.number SUB_INT16ARRAY_TEST_3300
     * @tc.desc   Verify reverse() reverses array in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      arr.reverse()
      expect(arr[0]).assertEqual(5000)
      expect(arr[1]).assertEqual(4000)
      expect(arr[4]).assertEqual(1000)
    })

    /**
     * @tc.name   Int16ArrayTest3400
     * @tc.number SUB_INT16ARRAY_TEST_3400
     * @tc.desc   Verify slice() returns new array with selected range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      let sliced = arr.slice(1, 4)
      expect(sliced.length).assertEqual(3)
      expect(sliced[0]).assertEqual(2000)
      expect(sliced[2]).assertEqual(4000)
      expect(arr[1]).assertEqual(2000)
    })

    /**
     * @tc.name   Int16ArrayTest3500
     * @tc.number SUB_INT16ARRAY_TEST_3500
     * @tc.desc   Verify slice() with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      let sliced = arr.slice(-2)
      expect(sliced.length).assertEqual(2)
      expect(sliced[0]).assertEqual(4000)
      expect(sliced[1]).assertEqual(5000)
    })

    /**
     * @tc.name   Int16ArrayTest3600
     * @tc.number SUB_INT16ARRAY_TEST_3600
     * @tc.desc   Verify sort() with ascending comparator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [3000, 1000, 4000, -2000, 5000]
      let arr = new collections.Int16Array(src)
      arr.sort((a: number, b: number): number => a - b)
      expect(arr[0]).assertEqual(-2000)
      expect(arr[1]).assertEqual(1000)
      expect(arr[2]).assertEqual(3000)
      expect(arr[4]).assertEqual(5000)
    })

    /**
     * @tc.name   Int16ArrayTest3700
     * @tc.number SUB_INT16ARRAY_TEST_3700
     * @tc.desc   Verify sort() with descending order and boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [32767, -32768, 0, 10000, -10000]
      let arr = new collections.Int16Array(src)
      arr.sort((a: number, b: number): number => b - a)
      expect(arr[0]).assertEqual(32767)
      expect(arr[1]).assertEqual(10000)
      expect(arr[4]).assertEqual(-32768)
    })

    /**
     * @tc.name   Int16ArrayTest3800
     * @tc.number SUB_INT16ARRAY_TEST_3800
     * @tc.desc   Verify subarray() shares buffer with original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      let sub = arr.subarray(1, 4)
      expect(sub.length).assertEqual(3)
      expect(sub[0]).assertEqual(2000)
      sub[0] = 10000
      expect(arr[1]).assertEqual(10000)
    })

    /**
     * @tc.name   Int16ArrayTest3900
     * @tc.number SUB_INT16ARRAY_TEST_3900
     * @tc.desc   Verify includes() with existing and non-existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, -32768, 32767]
      let arr = new collections.Int16Array(src)
      expect(arr.includes(3000)).assertTrue()
      expect(arr.includes(-32768)).assertTrue()
      expect(arr.includes(32767)).assertTrue()
      expect(arr.includes(9999)).assertFalse()
    })

    /**
     * @tc.name   Int16ArrayTest4000
     * @tc.number SUB_INT16ARRAY_TEST_4000
     * @tc.desc   Verify copyWithin() copies elements within array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      arr.copyWithin(0, 3)
      expect(arr[0]).assertEqual(4000)
      expect(arr[1]).assertEqual(5000)
      expect(arr[2]).assertEqual(3000)
    })

    /**
     * @tc.name   Int16ArrayTest4100
     * @tc.number SUB_INT16ARRAY_TEST_4100
     * @tc.desc   Verify set() writes values from ArrayLike at offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int16Array(5)
      let vals: number[] = [1000, 2000, 3000]
      arr.set(vals, 1)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(1000)
      expect(arr[2]).assertEqual(2000)
      expect(arr[3]).assertEqual(3000)
      expect(arr[4]).assertEqual(0)
    })

    /**
     * @tc.name   Int16ArrayTest4200
     * @tc.number SUB_INT16ARRAY_TEST_4200
     * @tc.desc   Verify every() returns true when all elements match condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      expect(arr.every((v: number): boolean => v > 0)).assertTrue()
      expect(arr.every((v: number): boolean => v > 2000)).assertFalse()
    })

    /**
     * @tc.name   Int16ArrayTest4300
     * @tc.number SUB_INT16ARRAY_TEST_4300
     * @tc.desc   Verify some() returns true when any element matches condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      expect(arr.some((v: number): boolean => v > 3000)).assertTrue()
      expect(arr.some((v: number): boolean => v > 10000)).assertFalse()
    })

    /**
     * @tc.name   Int16ArrayTest4400
     * @tc.number SUB_INT16ARRAY_TEST_4400
     * @tc.desc   Verify filter() returns new array with matching elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      let filtered = arr.filter((v: number): boolean => v > 2000)
      expect(filtered.length).assertEqual(3)
      expect(filtered[0]).assertEqual(3000)
      expect(filtered[1]).assertEqual(4000)
      expect(filtered[2]).assertEqual(5000)
    })

    /**
     * @tc.name   Int16ArrayTest4500
     * @tc.number SUB_INT16ARRAY_TEST_4500
     * @tc.desc   Verify toString() returns comma-separated string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000]
      let arr = new collections.Int16Array(src)
      expect(arr.toString()).assertEqual('1000,2000,3000')
    })

    /**
     * @tc.name   Int16ArrayTest4600
     * @tc.number SUB_INT16ARRAY_TEST_4600
     * @tc.desc   Verify entries() returns key-value iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000]
      let arr = new collections.Int16Array(src)
      let iter: IterableIterator<[number, number]> = arr.entries()
      let first: [number, number] = iter.next().value as [number, number]
      expect(first[0]).assertEqual(0)
      expect(first[1]).assertEqual(1000)
    })

    /**
     * @tc.name   Int16ArrayTest4700
     * @tc.number SUB_INT16ARRAY_TEST_4700
     * @tc.desc   Verify keys() returns index iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000]
      let arr = new collections.Int16Array(src)
      let keysArr: number[] = []
      for (let key of arr.keys()) {
        keysArr.push(key)
      }
      expect(keysArr.length).assertEqual(3)
      expect(keysArr[0]).assertEqual(0)
      expect(keysArr[2]).assertEqual(2)
    })

    /**
     * @tc.name   Int16ArrayTest4800
     * @tc.number SUB_INT16ARRAY_TEST_4800
     * @tc.desc   Verify values() returns value iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000]
      let arr = new collections.Int16Array(src)
      let valsArr: number[] = []
      for (let val of arr.values()) {
        valsArr.push(val)
      }
      expect(valsArr.length).assertEqual(3)
      expect(valsArr[0]).assertEqual(1000)
      expect(valsArr[2]).assertEqual(3000)
    })

    /**
     * @tc.name   Int16ArrayTest4900
     * @tc.number SUB_INT16ARRAY_TEST_4900
     * @tc.desc   Verify index access operator and element assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, -2000, 32767]
      let arr = new collections.Int16Array(src)
      expect(arr[0]).assertEqual(1000)
      expect(arr[2]).assertEqual(32767)
      arr[1] = -32768
      expect(arr[1]).assertEqual(-32768)
    })

    /**
     * @tc.name   Int16ArrayTest5000
     * @tc.number SUB_INT16ARRAY_TEST_5000
     * @tc.desc   Verify Set constructor from Iterable Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let set: Set<number> = new Set<number>([1000, 2000, 3000])
      let arr = new collections.Int16Array(set)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1000)
      expect(arr[1]).assertEqual(2000)
      expect(arr[2]).assertEqual(3000)
    })

    // ==================== Concurrent Tests ====================

    /**
     * @tc.name   Int16ArrayTest5100
     * @tc.number SUB_INT16ARRAY_TEST_5100
     * @tc.desc   Verify TaskPool passes Int16Array and returns correct length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000]
      let arr = new collections.Int16Array(src)
      let task = new taskpool.Task(processInt16ArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   Int16ArrayTest5200
     * @tc.number SUB_INT16ARRAY_TEST_5200
     * @tc.desc   Verify TaskPool modifies Int16Array via reference sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000]
      let arr = new collections.Int16Array(src)
      let task = new taskpool.Task(modifyInt16ArrayFunc, arr)
      await taskpool.execute(task)
      expect(arr[0]).assertEqual(9999)
    })

    /**
     * @tc.name   Int16ArrayTest5300
     * @tc.number SUB_INT16ARRAY_TEST_5300
     * @tc.desc   Verify concurrent read from multiple TaskPool tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Int16ArrayTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(readInt16AtFunc, arr, i))
      }
      let p0 = taskpool.execute(tasks[0])
      let p1 = taskpool.execute(tasks[1])
      let p2 = taskpool.execute(tasks[2])
      let p3 = taskpool.execute(tasks[3])
      let p4 = taskpool.execute(tasks[4])
      let results = await Promise.all([p0, p1, p2, p3, p4])
      expect(results[0] as number).assertEqual(1000)
      expect(results[1] as number).assertEqual(2000)
      expect(results[4] as number).assertEqual(5000)
    })

    /**
     * @tc.name   Int16ArrayTest5400
     * @tc.number SUB_INT16ARRAY_TEST_5400
     * @tc.desc   Verify TaskPool sum calculation with Int16Array data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1000, 2000, 3000, 4000, 5000]
      let arr = new collections.Int16Array(src)
      let task = new taskpool.Task(sumInt16ArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(15000)
    })

    /**
     * @tc.name   Int16ArrayTest5500
     * @tc.number SUB_INT16ARRAY_TEST_5500
     * @tc.desc   Verify Int16Array with boundary values passed through TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Int16ArrayTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [-32768, 32767, 0, -1, 1]
      let arr = new collections.Int16Array(src)
      let task = new taskpool.Task(sumInt16ArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(-1)
    })

    /**
     * @tc.name   Int16ArrayTest5600
     * @tc.number SUB_INT16ARRAY_TEST_5600
     * @tc.desc   Verify concurrent boundary value truncation via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Int16ArrayTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [32768, -32769, 65536, 65535]
      let arr = new collections.Int16Array(src)
      let task = new taskpool.Task(readInt16AtFunc, arr, 0)
      let r0 = await taskpool.execute(task)
      expect(r0 as number).assertEqual(-32768)
      let task2 = new taskpool.Task(readInt16AtFunc, arr, 1)
      let r1 = await taskpool.execute(task2)
      expect(r1 as number).assertEqual(32767)
    })

    // ==================== Inheritance Tests ====================

    /**
     * @tc.name   Int16ArrayTest5700
     * @tc.number SUB_INT16ARRAY_TEST_5700
     * @tc.desc   Verify custom subclass extends Int16Array with sumAll and average methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomInt16Array(5)
      arr[0] = 1000
      arr[1] = 2000
      arr[2] = 3000
      arr[3] = 4000
      arr[4] = 5000
      expect(arr.sumAll()).assertEqual(15000)
      expect(arr.average()).assertEqual(3000)
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   Int16ArrayTest5800
     * @tc.number SUB_INT16ARRAY_TEST_5800
     * @tc.desc   Verify instanceof check for custom subclass and parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomInt16Array(3)
      expect(arr instanceof CustomInt16Array).assertTrue()
      expect(arr instanceof collections.Int16Array).assertTrue()
    })

    /**
     * @tc.name   Int16ArrayTest5900
     * @tc.number SUB_INT16ARRAY_TEST_5900
     * @tc.desc   Verify multiple Int16Array views sharing same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Int16ArrayTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(20)
      let arr1 = new collections.Int16Array(buffer, 0, 5)
      let arr2 = new collections.Int16Array(buffer, 10, 5)
      arr1[0] = 1000
      arr1[4] = -1000
      expect(arr1.length).assertEqual(5)
      expect(arr2.length).assertEqual(5)
      expect(arr2.byteOffset).assertEqual(10)
    })
  })
}
