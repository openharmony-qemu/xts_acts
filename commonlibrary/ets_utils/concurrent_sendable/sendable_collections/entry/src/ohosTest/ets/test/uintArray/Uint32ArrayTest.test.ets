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
function processUint32ArrayFunc(arr: collections.Uint32Array): number {
  return arr.length
}

@Concurrent
function modifyUint32ArrayFunc(arr: collections.Uint32Array): void {
  arr[0] = 999999
}

@Concurrent
function sumUint32ArrayFunc(arr: collections.Uint32Array): number {
  let sum: number = 0
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i] as number
  }
  return sum
}

@Concurrent
function readUint32AtFunc(arr: collections.Uint32Array, index: number): number {
  return arr[index] as number
}

@Sendable
class CustomUint32Array extends collections.Uint32Array {
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

@Sendable
class Uint32DataContainer {
  data: collections.Uint32Array = new collections.Uint32Array(5)
}

export default function Uint32ArrayTest(): void {
  describe('Uint32ArrayTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ==================== Constructor Tests ====================

    /**
     * @tc.name   Uint32ArrayTest0100
     * @tc.number SUB_UINT32ARRAY_TEST_0100
     * @tc.desc   Verify empty constructor creates array with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint32Array()
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
      expect(arr.byteOffset).assertEqual(0)
    })

    /**
     * @tc.name   Uint32ArrayTest0200
     * @tc.number SUB_UINT32ARRAY_TEST_0200
     * @tc.desc   Verify length constructor with positive integer creates array with correct length and zero-filled values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr1 = new collections.Uint32Array(5)
      expect(arr1.length).assertEqual(5)
      expect(arr1.byteLength).assertEqual(20)
      expect(arr1[0]).assertEqual(0)
      let arr2 = new collections.Uint32Array(100)
      expect(arr2.length).assertEqual(100)
      expect(arr2.byteLength).assertEqual(400)
    })

    /**
     * @tc.name   Uint32ArrayTest0300
     * @tc.number SUB_UINT32ARRAY_TEST_0300
     * @tc.desc   Verify length constructor with zero creates empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint32Array(0)
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   Uint32ArrayTest0400
     * @tc.number SUB_UINT32ARRAY_TEST_0400
     * @tc.desc   Verify length constructor with negative value throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        let arr = new collections.Uint32Array(-1)
        expect().assertFail()
      } catch (e) {
        expect(e.message).assertContain('integerIndex')
      }
    })

    /**
     * @tc.name   Uint32ArrayTest0500
     * @tc.number SUB_UINT32ARRAY_TEST_0500
     * @tc.desc   Verify ArrayLike constructor with normal uint32 values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 3000000, 2147483648, 4294967295]
      let arr = new collections.Uint32Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(100000)
      expect(arr[1]).assertEqual(3000000)
      expect(arr[2]).assertEqual(2147483648)
      expect(arr[3]).assertEqual(4294967295)
    })

    /**
     * @tc.name   Uint32ArrayTest0600
     * @tc.number SUB_UINT32ARRAY_TEST_0600
     * @tc.desc   Verify ArrayLike constructor with boundary values 0 and 4294967295
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [0, 4294967295, 2147483648, 1]
      let arr = new collections.Uint32Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(4294967295)
      expect(arr[2]).assertEqual(2147483648)
      expect(arr[3]).assertEqual(1)
    })

    /**
     * @tc.name   Uint32ArrayTest0700
     * @tc.number SUB_UINT32ARRAY_TEST_0700
     * @tc.desc   Verify ArrayLike constructor with overflow values truncated to 32-bit unsigned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [4294967296, -1, 4294967297, 8589934592]
      let arr = new collections.Uint32Array(src)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(4294967295)
      expect(arr[2]).assertEqual(1)
      expect(arr[3]).assertEqual(0)
    })

    /**
     * @tc.name   Uint32ArrayTest0800
     * @tc.number SUB_UINT32ARRAY_TEST_0800
     * @tc.desc   Verify constructor from another Uint32Array copies all values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 3000000, 4294967295, 0]
      let arr1 = new collections.Uint32Array(src)
      let arr2 = new collections.Uint32Array(arr1)
      expect(arr2.length).assertEqual(4)
      expect(arr2[0]).assertEqual(100000)
      expect(arr2[2]).assertEqual(4294967295)
      expect(arr2[3]).assertEqual(0)
    })

    /**
     * @tc.name   Uint32ArrayTest0900
     * @tc.number SUB_UINT32ARRAY_TEST_0900
     * @tc.desc   Verify ArrayBuffer constructor with byteOffset and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(40)
      let arr = new collections.Uint32Array(buffer, 4, 5)
      expect(arr.length).assertEqual(5)
      expect(arr.byteOffset).assertEqual(4)
      expect(arr.byteLength).assertEqual(20)
    })

    /**
     * @tc.name   Uint32ArrayTest1000
     * @tc.number SUB_UINT32ARRAY_TEST_1000
     * @tc.desc   Verify static from method with number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = collections.Uint32Array.from(src)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(100000)
      expect(arr[1]).assertEqual(2000000)
      expect(arr[2]).assertEqual(3000000)
    })

    /**
     * @tc.name   Uint32ArrayTest1100
     * @tc.number SUB_UINT32ARRAY_TEST_1100
     * @tc.desc   Verify static of method with multiple uint32 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = collections.Uint32Array.of(0, 2147483648, 4294967295)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(2147483648)
      expect(arr[2]).assertEqual(4294967295)
    })

    // ==================== Property Tests ====================

    /**
     * @tc.name   Uint32ArrayTest1200
     * @tc.number SUB_UINT32ARRAY_TEST_1200
     * @tc.desc   Verify length and byteLength relationship (byteLength = length * 4)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint32Array(10)
      expect(arr.length).assertEqual(10)
      expect(arr.byteLength).assertEqual(40)
      expect(arr.byteLength).assertEqual(arr.length * 4)
    })

    /**
     * @tc.name   Uint32ArrayTest1300
     * @tc.number SUB_UINT32ARRAY_TEST_1300
     * @tc.desc   Verify byteOffset is 0 for direct construction and correct for ArrayBuffer view
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr1 = new collections.Uint32Array(5)
      expect(arr1.byteOffset).assertEqual(0)
      let buffer = new collections.ArrayBuffer(40)
      let arr2 = new collections.Uint32Array(buffer, 8)
      expect(arr2.byteOffset).assertEqual(8)
    })

    /**
     * @tc.name   Uint32ArrayTest1400
     * @tc.number SUB_UINT32ARRAY_TEST_1400
     * @tc.desc   Verify BYTES_PER_ELEMENT static property equals 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(collections.Uint32Array.BYTES_PER_ELEMENT).assertEqual(4)
    })

    /**
     * @tc.name   Uint32ArrayTest1500
     * @tc.number SUB_UINT32ARRAY_TEST_1500
     * @tc.desc   Verify buffer property returns the underlying ArrayBuffer reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(40)
      let arr = new collections.Uint32Array(buffer)
      expect(arr.buffer === buffer).assertTrue()
    })

    /**
     * @tc.name   Uint32ArrayTest1600
     * @tc.number SUB_UINT32ARRAY_TEST_1600
     * @tc.desc   Verify empty array properties are all zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint32Array()
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
      expect(arr.byteOffset).assertEqual(0)
      expect(arr.buffer !== null).assertTrue()
    })

    // ==================== Method Tests ====================

    /**
     * @tc.name   Uint32ArrayTest1700
     * @tc.number SUB_UINT32ARRAY_TEST_1700
     * @tc.desc   Verify at() with positive indices returns correct elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.at(0)).assertEqual(100000)
      expect(arr.at(1)).assertEqual(2000000)
      expect(arr.at(4)).assertEqual(5000000)
    })

    /**
     * @tc.name   Uint32ArrayTest1800
     * @tc.number SUB_UINT32ARRAY_TEST_1800
     * @tc.desc   Verify at() with negative indices counts from end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.at(-1)).assertEqual(5000000)
      expect(arr.at(-2)).assertEqual(4000000)
      expect(arr.at(-5)).assertEqual(100000)
    })

    /**
     * @tc.name   Uint32ArrayTest1900
     * @tc.number SUB_UINT32ARRAY_TEST_1900
     * @tc.desc   Verify at() with out-of-bounds index returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.at(10) === undefined).assertTrue()
      expect(arr.at(-10) === undefined).assertTrue()
    })

    /**
     * @tc.name   Uint32ArrayTest2000
     * @tc.number SUB_UINT32ARRAY_TEST_2000
     * @tc.desc   Verify fill() fills entire array with specified uint32 value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint32Array(5)
      arr.fill(3000000)
      expect(arr[0]).assertEqual(3000000)
      expect(arr[4]).assertEqual(3000000)
    })

    /**
     * @tc.name   Uint32ArrayTest2100
     * @tc.number SUB_UINT32ARRAY_TEST_2100
     * @tc.desc   Verify fill() with start and end range fills only specified indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint32Array(5)
      arr.fill(3000000, 1, 4)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(3000000)
      expect(arr[2]).assertEqual(3000000)
      expect(arr[3]).assertEqual(3000000)
      expect(arr[4]).assertEqual(0)
    })

    /**
     * @tc.name   Uint32ArrayTest2200
     * @tc.number SUB_UINT32ARRAY_TEST_2200
     * @tc.desc   Verify fill() with overflow value truncates to 32-bit unsigned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint32Array(3)
      arr.fill(4294967296)
      expect(arr[0]).assertEqual(0)
      arr.fill(-1)
      expect(arr[0]).assertEqual(4294967295)
    })

    /**
     * @tc.name   Uint32ArrayTest2300
     * @tc.number SUB_UINT32ARRAY_TEST_2300
     * @tc.desc   Verify find() returns first element matching predicate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      let result = arr.find((v: number): boolean => v > 2000000)
      expect(result).assertEqual(3000000)
    })

    /**
     * @tc.name   Uint32ArrayTest2400
     * @tc.number SUB_UINT32ARRAY_TEST_2400
     * @tc.desc   Verify findIndex() returns index of first element matching predicate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      let idx = arr.findIndex((v: number): boolean => v > 2000000)
      expect(idx).assertEqual(2)
    })

    /**
     * @tc.name   Uint32ArrayTest2500
     * @tc.number SUB_UINT32ARRAY_TEST_2500
     * @tc.desc   Verify forEach() iterates all elements with correct values and indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      let sum: number = 0
      let count: number = 0
      arr.forEach((v: number) => { sum += v; count++ })
      expect(count).assertEqual(3)
      expect(sum).assertEqual(5100000)
    })

    /**
     * @tc.name   Uint32ArrayTest2600
     * @tc.number SUB_UINT32ARRAY_TEST_2600
     * @tc.desc   Verify forEach() modifying elements during iteration persists changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      arr.forEach((v: number, i: number) => { arr[i] = 999 })
      expect(arr[0]).assertEqual(999)
      expect(arr[4]).assertEqual(999)
    })

    /**
     * @tc.name   Uint32ArrayTest2700
     * @tc.number SUB_UINT32ARRAY_TEST_2700
     * @tc.desc   Verify indexOf() returns first occurrence index of search element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 2000000, 100000]
      let arr = new collections.Uint32Array(src)
      expect(arr.indexOf(2000000)).assertEqual(1)
      expect(arr.indexOf(100000)).assertEqual(0)
    })

    /**
     * @tc.name   Uint32ArrayTest2800
     * @tc.number SUB_UINT32ARRAY_TEST_2800
     * @tc.desc   Verify indexOf() with fromIndex parameter starts search from specified position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 2000000, 100000]
      let arr = new collections.Uint32Array(src)
      expect(arr.indexOf(2000000, 2)).assertEqual(3)
      expect(arr.indexOf(100000, 1)).assertEqual(4)
    })

    /**
     * @tc.name   Uint32ArrayTest2900
     * @tc.number SUB_UINT32ARRAY_TEST_2900
     * @tc.desc   Verify indexOf() returns -1 for element not in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.indexOf(9999999)).assertEqual(-1)
    })

    /**
     * @tc.name   Uint32ArrayTest3000
     * @tc.number SUB_UINT32ARRAY_TEST_3000
     * @tc.desc   Verify lastIndexOf() returns last occurrence index of search element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 2000000, 100000]
      let arr = new collections.Uint32Array(src)
      expect(arr.lastIndexOf(2000000)).assertEqual(3)
      expect(arr.lastIndexOf(100000)).assertEqual(4)
    })

    /**
     * @tc.name   Uint32ArrayTest3100
     * @tc.number SUB_UINT32ARRAY_TEST_3100
     * @tc.desc   Verify join() with default comma separator produces correct string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.join()).assertEqual('100000,2000000,3000000')
    })

    /**
     * @tc.name   Uint32ArrayTest3200
     * @tc.number SUB_UINT32ARRAY_TEST_3200
     * @tc.desc   Verify join() with custom separator produces correct string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.join('-')).assertEqual('100000-2000000-3000000')
    })

    /**
     * @tc.name   Uint32ArrayTest3300
     * @tc.number SUB_UINT32ARRAY_TEST_3300
     * @tc.desc   Verify map() returns new Uint32Array with transformed values without modifying original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      let mapped = arr.map((v: number): number => v * 2)
      expect(mapped.length).assertEqual(3)
      expect(mapped[0]).assertEqual(200000)
      expect(mapped[1]).assertEqual(4000000)
      expect(mapped[2]).assertEqual(6000000)
      expect(arr[0]).assertEqual(100000)
    })

    /**
     * @tc.name   Uint32ArrayTest3400
     * @tc.number SUB_UINT32ARRAY_TEST_3400
     * @tc.desc   Verify map() with overflow result truncates to 32-bit unsigned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [2147483648]
      let arr = new collections.Uint32Array(src)
      let mapped = arr.map((v: number): number => v * 2)
      expect(mapped[0]).assertEqual(0)
    })

    /**
     * @tc.name   Uint32ArrayTest3500
     * @tc.number SUB_UINT32ARRAY_TEST_3500
     * @tc.desc   Verify reduce() with initial value accumulates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000]
      let arr = new collections.Uint32Array(src)
      let sum = arr.reduce((acc: number, v: number): number => acc + v, 0)
      expect(sum).assertEqual(9100000)
    })

    /**
     * @tc.name   Uint32ArrayTest3600
     * @tc.number SUB_UINT32ARRAY_TEST_3600
     * @tc.desc   Verify reduce() without initial value uses first element as accumulator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000]
      let arr = new collections.Uint32Array(src)
      let sum = arr.reduce((acc: number, v: number): number => acc + v)
      expect(sum).assertEqual(9100000)
    })

    /**
     * @tc.name   Uint32ArrayTest3700
     * @tc.number SUB_UINT32ARRAY_TEST_3700
     * @tc.desc   Verify reduce() on empty array without initial value throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        let arr = new collections.Uint32Array(0)
        arr.reduce((acc: number, v: number): number => acc + v)
        expect().assertFail()
      } catch (e) {
        expect(e.message).assertContain('Reduce')
      }
    })

    /**
     * @tc.name   Uint32ArrayTest3800
     * @tc.number SUB_UINT32ARRAY_TEST_3800
     * @tc.desc   Verify reduceRight() accumulates from right to left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000]
      let arr = new collections.Uint32Array(src)
      let result = arr.reduceRight((acc: number, v: number): number => acc + v, 0)
      expect(result).assertEqual(9100000)
    })

    /**
     * @tc.name   Uint32ArrayTest3900
     * @tc.number SUB_UINT32ARRAY_TEST_3900
     * @tc.desc   Verify reverse() reverses array elements in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      arr.reverse()
      expect(arr[0]).assertEqual(5000000)
      expect(arr[1]).assertEqual(4000000)
      expect(arr[2]).assertEqual(3000000)
      expect(arr[3]).assertEqual(2000000)
      expect(arr[4]).assertEqual(100000)
    })

    /**
     * @tc.name   Uint32ArrayTest4000
     * @tc.number SUB_UINT32ARRAY_TEST_4000
     * @tc.desc   Verify reverse() on empty array and single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let empty = new collections.Uint32Array(0)
      empty.reverse()
      expect(empty.length).assertEqual(0)
      let single = new collections.Uint32Array([4294967295])
      single.reverse()
      expect(single[0]).assertEqual(4294967295)
    })

    /**
     * @tc.name   Uint32ArrayTest4100
     * @tc.number SUB_UINT32ARRAY_TEST_4100
     * @tc.desc   Verify slice() with start and end returns new array without modifying original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      let sliced = arr.slice(1, 4)
      expect(sliced.length).assertEqual(3)
      expect(sliced[0]).assertEqual(2000000)
      expect(sliced[1]).assertEqual(3000000)
      expect(sliced[2]).assertEqual(4000000)
      expect(arr[1]).assertEqual(2000000)
    })

    /**
     * @tc.name   Uint32ArrayTest4200
     * @tc.number SUB_UINT32ARRAY_TEST_4200
     * @tc.desc   Verify slice() with negative indices resolves from end of array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      let sliced = arr.slice(-3, -1)
      expect(sliced.length).assertEqual(2)
      expect(sliced[0]).assertEqual(3000000)
      expect(sliced[1]).assertEqual(4000000)
    })

    /**
     * @tc.name   Uint32ArrayTest4300
     * @tc.number SUB_UINT32ARRAY_TEST_4300
     * @tc.desc   Verify sort() with default comparator sorts uint32 values in ascending numeric order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [3000000000, 100000, 4000000000, 0, 4294967295]
      let arr = new collections.Uint32Array(src)
      arr.sort()
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(100000)
      expect(arr[2]).assertEqual(3000000000)
      expect(arr[3]).assertEqual(4000000000)
      expect(arr[4]).assertEqual(4294967295)
    })

    /**
     * @tc.name   Uint32ArrayTest4400
     * @tc.number SUB_UINT32ARRAY_TEST_4400
     * @tc.desc   Verify sort() with custom descending comparator and safe value range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [3000000, 100000, 4000000, 5000000, 2000000]
      let arr = new collections.Uint32Array(src)
      arr.sort((a: number, b: number): number => b - a)
      expect(arr[0]).assertEqual(5000000)
      expect(arr[1]).assertEqual(4000000)
      expect(arr[2]).assertEqual(3000000)
      expect(arr[3]).assertEqual(2000000)
      expect(arr[4]).assertEqual(100000)
    })

    /**
     * @tc.name   Uint32ArrayTest4500
     * @tc.number SUB_UINT32ARRAY_TEST_4500
     * @tc.desc   Verify subarray() returns view sharing buffer with original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      let sub = arr.subarray(1, 4)
      expect(sub.length).assertEqual(3)
      expect(sub[0]).assertEqual(2000000)
      expect(sub[2]).assertEqual(4000000)
      sub[0] = 6000000
      expect(arr[1]).assertEqual(6000000)
    })

    /**
     * @tc.name   Uint32ArrayTest4600
     * @tc.number SUB_UINT32ARRAY_TEST_4600
     * @tc.desc   Verify includes() returns true when element exists in array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.includes(3000000)).assertTrue()
      expect(arr.includes(100000)).assertTrue()
    })

    /**
     * @tc.name   Uint32ArrayTest4700
     * @tc.number SUB_UINT32ARRAY_TEST_4700
     * @tc.desc   Verify includes() returns false when element does not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.includes(6000000)).assertFalse()
      expect(arr.includes(0)).assertFalse()
    })

    /**
     * @tc.name   Uint32ArrayTest4800
     * @tc.number SUB_UINT32ARRAY_TEST_4800
     * @tc.desc   Verify copyWithin() copies elements within array to target position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      arr.copyWithin(0, 3)
      expect(arr[0]).assertEqual(4000000)
      expect(arr[1]).assertEqual(5000000)
      expect(arr[2]).assertEqual(3000000)
    })

    /**
     * @tc.name   Uint32ArrayTest4900
     * @tc.number SUB_UINT32ARRAY_TEST_4900
     * @tc.desc   Verify set() copies values from source array at specified offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint32Array(5)
      let src: number[] = [100000, 2000000, 3000000]
      arr.set(src, 1)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(100000)
      expect(arr[2]).assertEqual(2000000)
      expect(arr[3]).assertEqual(3000000)
      expect(arr[4]).assertEqual(0)
    })

    /**
     * @tc.name   Uint32ArrayTest5000
     * @tc.number SUB_UINT32ARRAY_TEST_5000
     * @tc.desc   Verify every() returns true when all elements satisfy predicate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.every((v: number): boolean => v >= 0)).assertTrue()
      expect(arr.every((v: number): boolean => v > 1000000)).assertFalse()
    })

    /**
     * @tc.name   Uint32ArrayTest5100
     * @tc.number SUB_UINT32ARRAY_TEST_5100
     * @tc.desc   Verify some() returns true when at least one element satisfies predicate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.some((v: number): boolean => v > 3000000)).assertTrue()
      expect(arr.some((v: number): boolean => v > 9000000)).assertFalse()
    })

    /**
     * @tc.name   Uint32ArrayTest5200
     * @tc.number SUB_UINT32ARRAY_TEST_5200
     * @tc.desc   Verify filter() returns new array with elements matching predicate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      let filtered = arr.filter((v: number): boolean => v > 2000000)
      expect(filtered.length).assertEqual(3)
      expect(filtered[0]).assertEqual(3000000)
      expect(filtered[1]).assertEqual(4000000)
      expect(filtered[2]).assertEqual(5000000)
    })

    /**
     * @tc.name   Uint32ArrayTest5300
     * @tc.number SUB_UINT32ARRAY_TEST_5300
     * @tc.desc   Verify toString() produces comma-separated string representation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      expect(arr.toString()).assertEqual('100000,2000000,3000000')
    })

    /**
     * @tc.name   Uint32ArrayTest5400
     * @tc.number SUB_UINT32ARRAY_TEST_5400
     * @tc.desc   Verify toLocaleString() returns a non-empty string containing element values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100, 200, 300]
      let arr = new collections.Uint32Array(src)
      let str = arr.toLocaleString()
      expect(str).assertContain('100')
    })

    /**
     * @tc.name   Uint32ArrayTest5500
     * @tc.number SUB_UINT32ARRAY_TEST_5500
     * @tc.desc   Verify entries() returns iterator yielding index-value pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      let count: number = 0
      for (let entry of arr.entries()) {
        if (count === 0) {
          expect(entry[0]).assertEqual(0)
          expect(entry[1]).assertEqual(100000)
        }
        count++
      }
      expect(count).assertEqual(3)
    })

    /**
     * @tc.name   Uint32ArrayTest5600
     * @tc.number SUB_UINT32ARRAY_TEST_5600
     * @tc.desc   Verify keys() returns iterator yielding all array indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      let keys: number[] = []
      for (let key of arr.keys()) {
        keys.push(key)
      }
      expect(keys.length).assertEqual(3)
      expect(keys[0]).assertEqual(0)
      expect(keys[2]).assertEqual(2)
    })

    /**
     * @tc.name   Uint32ArrayTest5700
     * @tc.number SUB_UINT32ARRAY_TEST_5700
     * @tc.desc   Verify values() returns iterator yielding all array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100000, 2000000, 3000000]
      let arr = new collections.Uint32Array(src)
      let values: number[] = []
      for (let val of arr.values()) {
        values.push(val)
      }
      expect(values.length).assertEqual(3)
      expect(values[0]).assertEqual(100000)
      expect(values[2]).assertEqual(3000000)
    })

    // ==================== Index Access & Boundary Tests ====================

    /**
     * @tc.name   Uint32ArrayTest5800
     * @tc.number SUB_UINT32ARRAY_TEST_5800
     * @tc.desc   Verify direct index access for read and write operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint32Array(3)
      arr[0] = 100000
      arr[1] = 2147483648
      arr[2] = 4294967295
      expect(arr[0]).assertEqual(100000)
      expect(arr[1]).assertEqual(2147483648)
      expect(arr[2]).assertEqual(4294967295)
    })

    /**
     * @tc.name   Uint32ArrayTest5900
     * @tc.number SUB_UINT32ARRAY_TEST_5900
     * @tc.desc   Verify large array creation and element access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Uint32ArrayTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Uint32Array(1000)
      for (let i = 0; i < 1000; i++) {
        arr[i] = i * 1000000
      }
      expect(arr.length).assertEqual(1000)
      expect(arr[0]).assertEqual(0)
      expect(arr[999]).assertEqual(999000000)
    })

    /**
     * @tc.name   Uint32ArrayTest6000
     * @tc.number SUB_UINT32ARRAY_TEST_6000
     * @tc.desc   Verify boundary values 0, 1, 2147483648, 4294967295 assignment and retrieval
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint32Array(4)
      arr[0] = 0
      arr[1] = 1
      arr[2] = 2147483648
      arr[3] = 4294967295
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(1)
      expect(arr[2]).assertEqual(2147483648)
      expect(arr[3]).assertEqual(4294967295)
    })

    // ==================== Concurrent Tests ====================

    /**
     * @tc.name   Uint32ArrayTest6100
     * @tc.number SUB_UINT32ARRAY_TEST_6100
     * @tc.desc   Verify TaskPool passes Uint32Array and returns correct length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 3000000, 4294967295]
      let arr = new collections.Uint32Array(src)
      let task = new taskpool.Task(processUint32ArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   Uint32ArrayTest6200
     * @tc.number SUB_UINT32ARRAY_TEST_6200
     * @tc.desc   Verify TaskPool modifies Uint32Array element via shared reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 3000000, 4294967295]
      let arr = new collections.Uint32Array(src)
      let task = new taskpool.Task(modifyUint32ArrayFunc, arr)
      await taskpool.execute(task)
      expect(arr[0]).assertEqual(999999)
    })

    /**
     * @tc.name   Uint32ArrayTest6300
     * @tc.number SUB_UINT32ARRAY_TEST_6300
     * @tc.desc   Verify concurrent read from multiple TaskPool tasks returns correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Uint32ArrayTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 4294967295]
      let arr = new collections.Uint32Array(src)
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(readUint32AtFunc, arr, i))
      }
      let p0 = taskpool.execute(tasks[0])
      let p1 = taskpool.execute(tasks[1])
      let p2 = taskpool.execute(tasks[2])
      let p3 = taskpool.execute(tasks[3])
      let p4 = taskpool.execute(tasks[4])
      let results = await Promise.all([p0, p1, p2, p3, p4])
      expect(results[0] as number).assertEqual(100000)
      expect(results[1] as number).assertEqual(2000000)
      expect(results[4] as number).assertEqual(4294967295)
    })

    /**
     * @tc.name   Uint32ArrayTest6400
     * @tc.number SUB_UINT32ARRAY_TEST_6400
     * @tc.desc   Verify TaskPool sum calculation with Uint32Array data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint32ArrayTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100000, 2000000, 3000000, 4000000, 5000000]
      let arr = new collections.Uint32Array(src)
      let task = new taskpool.Task(sumUint32ArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(14100000)
    })

    /**
     * @tc.name   Uint32ArrayTest6500
     * @tc.number SUB_UINT32ARRAY_TEST_6500
     * @tc.desc   Verify Uint32Array boundary values passed through TaskPool remain correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Uint32ArrayTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [0, 4294967295, 2147483648, 1]
      let arr = new collections.Uint32Array(src)
      let task = new taskpool.Task(readUint32AtFunc, arr, 1)
      let r = await taskpool.execute(task)
      expect(r as number).assertEqual(4294967295)
    })

    /**
     * @tc.name   Uint32ArrayTest6600
     * @tc.number SUB_UINT32ARRAY_TEST_6600
     * @tc.desc   Verify large array data integrity through TaskPool sum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Uint32ArrayTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Uint32Array(100)
      for (let i = 0; i < 100; i++) {
        arr[i] = i * 1000000
      }
      let task = new taskpool.Task(sumUint32ArrayFunc, arr)
      let result = await taskpool.execute(task)
      let expected: number = 0
      for (let i = 0; i < 100; i++) {
        expected += i * 1000000
      }
      expect(result as number).assertEqual(expected)
    })

    /**
     * @tc.name   Uint32ArrayTest6700
     * @tc.number SUB_UINT32ARRAY_TEST_6700
     * @tc.desc   Verify Sendable class with nested Uint32Array data access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let container = new Uint32DataContainer()
      container.data[0] = 100000
      container.data[1] = 2000000
      expect(container.data.length).assertEqual(5)
      expect(container.data[0]).assertEqual(100000)
    })

    // ==================== Inheritance Tests ====================

    /**
     * @tc.name   Uint32ArrayTest6800
     * @tc.number SUB_UINT32ARRAY_TEST_6800
     * @tc.desc   Verify custom subclass extends Uint32Array with sumAll and average methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomUint32Array(5)
      arr[0] = 100000
      arr[1] = 2000000
      arr[2] = 3000000
      arr[3] = 4000000
      arr[4] = 5000000
      expect(arr.sumAll()).assertEqual(14100000)
      expect(arr.average()).assertEqual(2820000)
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   Uint32ArrayTest6900
     * @tc.number SUB_UINT32ARRAY_TEST_6900
     * @tc.desc   Verify instanceof check for custom subclass and parent Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomUint32Array(3)
      expect(arr instanceof CustomUint32Array).assertTrue()
      expect(arr instanceof collections.Uint32Array).assertTrue()
    })

    /**
     * @tc.name   Uint32ArrayTest7000
     * @tc.number SUB_UINT32ARRAY_TEST_7000
     * @tc.desc   Verify multiple Uint32Array views sharing same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(40)
      let arr1 = new collections.Uint32Array(buffer, 0, 5)
      let arr2 = new collections.Uint32Array(buffer, 20, 5)
      arr1[0] = 100000
      arr1[4] = 4294967295
      expect(arr1.length).assertEqual(5)
      expect(arr2.length).assertEqual(5)
      expect(arr2.byteOffset).assertEqual(20)
    })

    // ==================== Int32Array Comparison Tests ====================

    /**
     * @tc.name   Uint32ArrayTest7100
     * @tc.number SUB_UINT32ARRAY_TEST_7100
     * @tc.desc   Verify same binary value interpreted differently by Int32Array and Uint32Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(8)
      let uintView = new collections.Uint32Array(buffer)
      let intView = new collections.Int32Array(buffer)
      uintView[0] = 4294967295
      uintView[1] = 2147483648
      expect(uintView[0]).assertEqual(4294967295)
      expect(intView[0]).assertEqual(-1)
      expect(uintView[1]).assertEqual(2147483648)
      expect(intView[1]).assertEqual(-2147483648)
    })

    /**
     * @tc.name   Uint32ArrayTest7200
     * @tc.number SUB_UINT32ARRAY_TEST_7200
     * @tc.desc   Verify Uint32Array specific overflow truncation behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint32ArrayTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [4294967296, -1, 4294967297, 8589934592]
      let arr = new collections.Uint32Array(src)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(4294967295)
      expect(arr[2]).assertEqual(1)
      expect(arr[3]).assertEqual(0)
    })
  })
}