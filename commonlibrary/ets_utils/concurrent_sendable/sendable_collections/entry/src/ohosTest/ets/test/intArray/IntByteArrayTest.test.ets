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
function processIntByteArrayFunc(arr: collections.Int8Array): number {
  return arr.length
}

@Concurrent
function modifyIntByteArrayFunc(arr: collections.Int8Array): void {
  arr[0] = 99
}

@Concurrent
function sumIntByteArrayFunc(arr: collections.Int8Array): number {
  let sum: number = 0
  for (let i = 0; i < arr.length; i++) {
    sum += arr[i]
  }
  return sum
}

@Concurrent
function readIntByteAtFunc(arr: collections.Int8Array, index: number): number {
  return arr[index] as number
}

@Sendable
class CustomIntByteArray extends collections.Int8Array {
  constructor(length: number) {
    super(length)
  }

  sumAll(): number {
    let s: number = 0
    this.forEach((v: number) => { s += v })
    return s
  }
}

export default function IntByteArrayTest(): void {
  describe('IntByteArrayTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ==================== Constructor Tests ====================

    /**
     * @tc.name   IntByteArrayTest0100
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_0100
     * @tc.desc   Verify empty constructor creates array with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int8Array()
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
      expect(arr.byteOffset).assertEqual(0)
    })

    /**
     * @tc.name   IntByteArrayTest0200
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_0200
     * @tc.desc   Verify length constructor with positive integer values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr1 = new collections.Int8Array(5)
      expect(arr1.length).assertEqual(5)
      expect(arr1.byteLength).assertEqual(5)
      expect(arr1[0]).assertEqual(0)
      let arr2 = new collections.Int8Array(100)
      expect(arr2.length).assertEqual(100)
      expect(arr2.byteLength).assertEqual(100)
    })

    /**
     * @tc.name   IntByteArrayTest0300
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_0300
     * @tc.desc   Verify length constructor with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int8Array(0)
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   IntByteArrayTest0400
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_0400
     * @tc.desc   Verify length constructor with negative value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        let arr = new collections.Int8Array(-1)
        expect().assertFail()
      } catch (e) {
        expect(e.message).assertContain('integerIndex')
      }
    })

    /**
     * @tc.name   IntByteArrayTest0500
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_0500
     * @tc.desc   Verify ArrayLike constructor with normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, -2, 50, 100]
      let arr = new collections.Int8Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(-2)
      expect(arr[2]).assertEqual(50)
      expect(arr[3]).assertEqual(100)
    })

    /**
     * @tc.name   IntByteArrayTest0600
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_0600
     * @tc.desc   Verify ArrayLike constructor with boundary values -128 and 127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [-128, 127, 0, -1]
      let arr = new collections.Int8Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(-128)
      expect(arr[1]).assertEqual(127)
      expect(arr[2]).assertEqual(0)
      expect(arr[3]).assertEqual(-1)
    })

    /**
     * @tc.name   IntByteArrayTest0700
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_0700
     * @tc.desc   Verify ArrayLike constructor with overflow values truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [128, -129, 256, 255]
      let arr = new collections.Int8Array(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(-128)
      expect(arr[1]).assertEqual(127)
      expect(arr[2]).assertEqual(0)
      expect(arr[3]).assertEqual(-1)
    })

    /**
     * @tc.name   IntByteArrayTest0800
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_0800
     * @tc.desc   Verify constructor from another IntByteArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, -2, 127, -128]
      let arr1 = new collections.Int8Array(src)
      let arr2 = new collections.Int8Array(arr1)
      expect(arr2.length).assertEqual(4)
      expect(arr2[0]).assertEqual(1)
      expect(arr2[1]).assertEqual(-2)
      expect(arr2[2]).assertEqual(127)
      expect(arr2[3]).assertEqual(-128)
    })

    /**
     * @tc.name   IntByteArrayTest0900
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_0900
     * @tc.desc   Verify ArrayBuffer constructor with byteOffset and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(10)
      let arr = new collections.Int8Array(buffer, 2, 5)
      expect(arr.length).assertEqual(5)
      expect(arr.byteOffset).assertEqual(2)
      expect(arr.byteLength).assertEqual(5)
    })

    /**
     * @tc.name   IntByteArrayTest1000
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1000
     * @tc.desc   Verify static from method with ArrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = collections.Int8Array.from(src)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(2)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.name   IntByteArrayTest1100
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1100
     * @tc.desc   Verify static from method with mapFn transform
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [100, 200]
      let arr = collections.Int8Array.from<number>(src, (v: number, k: number): number => v / 2)
      expect(arr.length).assertEqual(2)
      expect(arr[0]).assertEqual(50)
      expect(arr[1]).assertEqual(100)
    })

    /**
     * @tc.name   IntByteArrayTest1200
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1200
     * @tc.desc   Verify static of method with variadic arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = collections.Int8Array.of(1, 2, 3, -128, 127)
      expect(arr.length).assertEqual(5)
      expect(arr[0]).assertEqual(1)
      expect(arr[3]).assertEqual(-128)
      expect(arr[4]).assertEqual(127)
    })

    /**
     * @tc.name   IntByteArrayTest1300
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1300
     * @tc.desc   Verify static of method with empty arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = collections.Int8Array.of()
      expect(arr.length).assertEqual(0)
    })

    // ==================== Property Tests ====================

    /**
     * @tc.name   IntByteArrayTest1400
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1400
     * @tc.desc   Verify length and byteLength relationship (byteLength = length * 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int8Array(10)
      expect(arr.length).assertEqual(10)
      expect(arr.byteLength).assertEqual(10)
      expect(arr.byteLength).assertEqual(arr.length * 1)
    })

    /**
     * @tc.name   IntByteArrayTest1500
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1500
     * @tc.desc   Verify BYTES_PER_ELEMENT is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(collections.Int8Array.BYTES_PER_ELEMENT).assertEqual(1)
    })

    /**
     * @tc.name   IntByteArrayTest1600
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1600
     * @tc.desc   Verify buffer property returns underlying ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(10)
      let arr = new collections.Int8Array(buffer)
      expect(arr.buffer.byteLength).assertEqual(10)
    })

    /**
     * @tc.name   IntByteArrayTest1700
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1700
     * @tc.desc   Verify byteOffset with ArrayBuffer constructor offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(20)
      let arr = new collections.Int8Array(buffer, 5)
      expect(arr.byteOffset).assertEqual(5)
    })

    // ==================== Method Tests ====================

    /**
     * @tc.name   IntByteArrayTest1800
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1800
     * @tc.desc   Verify at() with positive and negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      expect(arr.at(0)).assertEqual(1)
      expect(arr.at(-1)).assertEqual(5)
      expect(arr.at(2)).assertEqual(3)
    })

    /**
     * @tc.name   IntByteArrayTest1900
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_1900
     * @tc.desc   Verify at() returns undefined for out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [1, 2]
      let arr = new collections.Int8Array(src)
      let result = arr.at(10)
      expect(result === undefined).assertTrue()
    })

    /**
     * @tc.name   IntByteArrayTest2000
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2000
     * @tc.desc   Verify fill() with value and optional start/end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int8Array(5)
      arr.fill(10)
      expect(arr[0]).assertEqual(10)
      expect(arr[4]).assertEqual(10)
      arr.fill(20, 1, 4)
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
      expect(arr[3]).assertEqual(20)
      expect(arr[4]).assertEqual(10)
    })

    /**
     * @tc.name   IntByteArrayTest2100
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2100
     * @tc.desc   Verify fill() with boundary and overflow values auto-truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Int8Array(3)
      arr.fill(-128)
      expect(arr[0]).assertEqual(-128)
      arr.fill(128)
      expect(arr[0]).assertEqual(-128)
    })

    /**
     * @tc.name   IntByteArrayTest2200
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2200
     * @tc.desc   Verify find() returns first matching element or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 3, 5, 10]
      let arr = new collections.Int8Array(src)
      let found = arr.find((v: number): boolean => v > 2)
      expect(found === undefined).assertFalse()
      expect(found as number).assertEqual(3)
      let notFound = arr.find((v: number): boolean => v > 100)
      expect(notFound === undefined).assertTrue()
    })

    /**
     * @tc.name   IntByteArrayTest2300
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2300
     * @tc.desc   Verify findIndex() returns correct index or -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      let idx = arr.findIndex((v: number): boolean => v > 3)
      expect(idx).assertEqual(3)
      let noIdx = arr.findIndex((v: number): boolean => v > 100)
      expect(noIdx).assertEqual(-1)
    })

    /**
     * @tc.name   IntByteArrayTest2400
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2400
     * @tc.desc   Verify forEach() iterates all elements correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Int8Array(src)
      let sum: number = 0
      let count: number = 0
      arr.forEach((v: number): void => {
        sum += v
        count++
      })
      expect(count).assertEqual(3)
      expect(sum).assertEqual(6)
    })

    /**
     * @tc.name   IntByteArrayTest2500
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2500
     * @tc.desc   Verify indexOf() with existing and non-existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 2, 1]
      let arr = new collections.Int8Array(src)
      expect(arr.indexOf(1)).assertEqual(0)
      expect(arr.indexOf(2)).assertEqual(1)
      expect(arr.indexOf(99)).assertEqual(-1)
    })

    /**
     * @tc.name   IntByteArrayTest2600
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2600
     * @tc.desc   Verify indexOf() with fromIndex parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 2, 1]
      let arr = new collections.Int8Array(src)
      expect(arr.indexOf(2, 2)).assertEqual(3)
      expect(arr.indexOf(1, 1)).assertEqual(4)
    })

    /**
     * @tc.name   IntByteArrayTest2700
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2700
     * @tc.desc   Verify lastIndexOf() with duplicate values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 2, 1]
      let arr = new collections.Int8Array(src)
      expect(arr.lastIndexOf(2)).assertEqual(3)
      expect(arr.lastIndexOf(1)).assertEqual(4)
      expect(arr.lastIndexOf(99)).assertEqual(-1)
    })

    /**
     * @tc.name   IntByteArrayTest2800
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2800
     * @tc.desc   Verify join() with default and custom separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Int8Array(src)
      expect(arr.join()).assertEqual('1,2,3')
      expect(arr.join('-')).assertEqual('1-2-3')
    })

    /**
     * @tc.name   IntByteArrayTest2900
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_2900
     * @tc.desc   Verify map() creates new array with transformed elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Int8Array(src)
      let mapped = arr.map((v: number): number => v * 2)
      expect(mapped.length).assertEqual(3)
      expect(mapped[0]).assertEqual(2)
      expect(mapped[1]).assertEqual(4)
      expect(mapped[2]).assertEqual(6)
      expect(arr[0]).assertEqual(1)
    })

    /**
     * @tc.name   IntByteArrayTest3000
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3000
     * @tc.desc   Verify map() with overflow values auto-truncated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [100, 100]
      let arr = new collections.Int8Array(src)
      let mapped = arr.map((v: number): number => v * 2)
      expect(mapped[0]).assertEqual(-56)
      expect(mapped[1]).assertEqual(-56)
    })

    /**
     * @tc.name   IntByteArrayTest3100
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3100
     * @tc.desc   Verify reduce() without and with initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4]
      let arr = new collections.Int8Array(src)
      let sum = arr.reduce((acc: number, v: number): number => acc + v)
      expect(sum).assertEqual(10)
      let sumInit = arr.reduce((acc: number, v: number): number => acc + v, 10)
      expect(sumInit).assertEqual(20)
    })

    /**
     * @tc.name   IntByteArrayTest3200
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3200
     * @tc.desc   Verify reduceRight() processes elements from right to left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4]
      let arr = new collections.Int8Array(src)
      let result = arr.reduceRight((acc: number, v: number): number => acc + v)
      expect(result).assertEqual(10)
      let resultInit = arr.reduceRight((acc: number, v: number): number => acc + v, 1)
      expect(resultInit).assertEqual(11)
    })

    /**
     * @tc.name   IntByteArrayTest3300
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3300
     * @tc.desc   Verify reverse() reverses array in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      arr.reverse()
      expect(arr[0]).assertEqual(5)
      expect(arr[1]).assertEqual(4)
      expect(arr[4]).assertEqual(1)
    })

    /**
     * @tc.name   IntByteArrayTest3400
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3400
     * @tc.desc   Verify slice() returns new array with selected range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      let sliced = arr.slice(1, 4)
      expect(sliced.length).assertEqual(3)
      expect(sliced[0]).assertEqual(2)
      expect(sliced[2]).assertEqual(4)
      expect(arr[1]).assertEqual(2)
    })

    /**
     * @tc.name   IntByteArrayTest3500
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3500
     * @tc.desc   Verify slice() with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      let sliced = arr.slice(-2)
      expect(sliced.length).assertEqual(2)
      expect(sliced[0]).assertEqual(4)
      expect(sliced[1]).assertEqual(5)
    })

    /**
     * @tc.name   IntByteArrayTest3600
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3600
     * @tc.desc   Verify sort() with default ascending comparator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [3, 1, 4, 1, 5, 9, -2]
      let arr = new collections.Int8Array(src)
      arr.sort((a: number, b: number): number => a - b)
      expect(arr[0]).assertEqual(-2)
      expect(arr[1]).assertEqual(1)
      expect(arr[2]).assertEqual(1)
      expect(arr[6]).assertEqual(9)
    })

    /**
     * @tc.name   IntByteArrayTest3700
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3700
     * @tc.desc   Verify sort() with descending order and boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [127, -128, 0, 50, -50]
      let arr = new collections.Int8Array(src)
      arr.sort((a: number, b: number): number => b - a)
      expect(arr[0]).assertEqual(127)
      expect(arr[1]).assertEqual(50)
      expect(arr[4]).assertEqual(-128)
    })

    /**
     * @tc.name   IntByteArrayTest3800
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3800
     * @tc.desc   Verify subarray() shares buffer with original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      let sub = arr.subarray(1, 4)
      expect(sub.length).assertEqual(3)
      expect(sub[0]).assertEqual(2)
      sub[0] = 10
      expect(arr[1]).assertEqual(10)
    })

    /**
     * @tc.name   IntByteArrayTest3900
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_3900
     * @tc.desc   Verify includes() with existing and non-existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, -128, 127]
      let arr = new collections.Int8Array(src)
      expect(arr.includes(3)).assertTrue()
      expect(arr.includes(-128)).assertTrue()
      expect(arr.includes(127)).assertTrue()
      expect(arr.includes(99)).assertFalse()
    })

    /**
     * @tc.name   IntByteArrayTest4000
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4000
     * @tc.desc   Verify copyWithin() copies elements within array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      arr.copyWithin(0, 3)
      expect(arr[0]).assertEqual(4)
      expect(arr[1]).assertEqual(5)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.name   IntByteArrayTest4100
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4100
     * @tc.desc   Verify set() writes values from ArrayLike at offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Int8Array(5)
      let vals: number[] = [1, 2, 3]
      arr.set(vals, 1)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(1)
      expect(arr[2]).assertEqual(2)
      expect(arr[3]).assertEqual(3)
      expect(arr[4]).assertEqual(0)
    })

    /**
     * @tc.name   IntByteArrayTest4200
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4200
     * @tc.desc   Verify every() returns true when all elements match condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      expect(arr.every((v: number): boolean => v > 0)).assertTrue()
      expect(arr.every((v: number): boolean => v > 2)).assertFalse()
    })

    /**
     * @tc.name   IntByteArrayTest4300
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4300
     * @tc.desc   Verify some() returns true when any element matches condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      expect(arr.some((v: number): boolean => v > 3)).assertTrue()
      expect(arr.some((v: number): boolean => v > 100)).assertFalse()
    })

    /**
     * @tc.name   IntByteArrayTest4400
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4400
     * @tc.desc   Verify filter() returns new array with matching elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      let filtered = arr.filter((v: number): boolean => v > 2)
      expect(filtered.length).assertEqual(3)
      expect(filtered[0]).assertEqual(3)
      expect(filtered[1]).assertEqual(4)
      expect(filtered[2]).assertEqual(5)
    })

    /**
     * @tc.name   IntByteArrayTest4500
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4500
     * @tc.desc   Verify toString() returns comma-separated string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Int8Array(src)
      expect(arr.toString()).assertEqual('1,2,3')
    })

    /**
     * @tc.name   IntByteArrayTest4600
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4600
     * @tc.desc   Verify entries() returns key-value iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [11, 22, 33]
      let arr = new collections.Int8Array(src)
      let iter: IterableIterator<[number, number]> = arr.entries()
      let first: [number, number] = iter.next().value as [number, number]
      expect(first[0]).assertEqual(0)
      expect(first[1]).assertEqual(11)
    })

    /**
     * @tc.name   IntByteArrayTest4700
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4700
     * @tc.desc   Verify keys() returns index iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [10, 20, 30]
      let arr = new collections.Int8Array(src)
      let keysArr: number[] = []
      for (let key of arr.keys()) {
        keysArr.push(key)
      }
      expect(keysArr.length).assertEqual(3)
      expect(keysArr[0]).assertEqual(0)
      expect(keysArr[2]).assertEqual(2)
    })

    /**
     * @tc.name   IntByteArrayTest4800
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4800
     * @tc.desc   Verify values() returns value iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [10, 20, 30]
      let arr = new collections.Int8Array(src)
      let valsArr: number[] = []
      for (let val of arr.values()) {
        valsArr.push(val)
      }
      expect(valsArr.length).assertEqual(3)
      expect(valsArr[0]).assertEqual(10)
      expect(valsArr[2]).assertEqual(30)
    })

    /**
     * @tc.name   IntByteArrayTest4900
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_4900
     * @tc.desc   Verify index access operator and element assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, -2, 127]
      let arr = new collections.Int8Array(src)
      expect(arr[0]).assertEqual(1)
      expect(arr[2]).assertEqual(127)
      arr[1] = -128
      expect(arr[1]).assertEqual(-128)
    })

    /**
     * @tc.name   IntByteArrayTest5000
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5000
     * @tc.desc   Verify Set constructor from Iterable Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let set: Set<number> = new Set<number>([1, 2, 3])
      let arr = new collections.Int8Array(set)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(2)
      expect(arr[2]).assertEqual(3)
    })

    // ==================== Concurrent Tests ====================

    /**
     * @tc.name   IntByteArrayTest5100
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5100
     * @tc.desc   Verify TaskPool passes IntByteArray and returns correct length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Int8Array(src)
      let task = new taskpool.Task(processIntByteArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   IntByteArrayTest5200
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5200
     * @tc.desc   Verify TaskPool modifies IntByteArray via reference sharing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Int8Array(src)
      let task = new taskpool.Task(modifyIntByteArrayFunc, arr)
      await taskpool.execute(task)
      expect(arr[0]).assertEqual(99)
    })

    /**
     * @tc.name   IntByteArrayTest5300
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5300
     * @tc.desc   Verify concurrent read from multiple TaskPool tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IntByteArrayTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [10, 20, 30, 40, 50]
      let arr = new collections.Int8Array(src)
      let tasks: taskpool.Task[] = []
      for (let i = 0; i < 5; i++) {
        tasks.push(new taskpool.Task(readIntByteAtFunc, arr, i))
      }
      let p0 = taskpool.execute(tasks[0])
      let p1 = taskpool.execute(tasks[1])
      let p2 = taskpool.execute(tasks[2])
      let p3 = taskpool.execute(tasks[3])
      let p4 = taskpool.execute(tasks[4])
      let results = await Promise.all([p0, p1, p2, p3, p4])
      expect(results[0] as number).assertEqual(10)
      expect(results[1] as number).assertEqual(20)
      expect(results[4] as number).assertEqual(50)
    })

    /**
     * @tc.name   IntByteArrayTest5400
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5400
     * @tc.desc   Verify TaskPool sum calculation with IntByteArray data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Int8Array(src)
      let task = new taskpool.Task(sumIntByteArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(15)
    })

    /**
     * @tc.name   IntByteArrayTest5500
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5500
     * @tc.desc   Verify IntByteArray with boundary values passed through TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IntByteArrayTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [-128, 127, 0, -1, 1]
      let arr = new collections.Int8Array(src)
      let task = new taskpool.Task(sumIntByteArrayFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(-1)
    })

    /**
     * @tc.name   IntByteArrayTest5600
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5600
     * @tc.desc   Verify concurrent boundary value truncation via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('IntByteArrayTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let src: number[] = [128, -129, 256, 255]
      let arr = new collections.Int8Array(src)
      let task = new taskpool.Task(readIntByteAtFunc, arr, 0)
      let r0 = await taskpool.execute(task)
      expect(r0 as number).assertEqual(-128)
      let task2 = new taskpool.Task(readIntByteAtFunc, arr, 1)
      let r1 = await taskpool.execute(task2)
      expect(r1 as number).assertEqual(127)
    })

    // ==================== Inheritance Tests ====================

    /**
     * @tc.name   IntByteArrayTest5700
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5700
     * @tc.desc   Verify custom subclass extends IntByteArray with sumAll method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomIntByteArray(5)
      arr[0] = 1
      arr[1] = 2
      arr[2] = 3
      arr[3] = 4
      arr[4] = 5
      expect(arr.sumAll()).assertEqual(15)
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.name   IntByteArrayTest5800
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5800
     * @tc.desc   Verify instanceof check for custom subclass and parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new CustomIntByteArray(3)
      expect(arr instanceof CustomIntByteArray).assertTrue()
      expect(arr instanceof collections.Int8Array).assertTrue()
    })

    /**
     * @tc.name   IntByteArrayTest5900
     * @tc.number SUB_INT_BYTE_ARRAY_TEST_5900
     * @tc.desc   Verify multiple IntByteArray views sharing same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('IntByteArrayTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(20)
      let arr1 = new collections.Int8Array(buffer, 0, 5)
      let arr2 = new collections.Int8Array(buffer, 5, 10)
      arr1[0] = 42
      arr1[4] = -42
      expect(arr1.length).assertEqual(5)
      expect(arr2.length).assertEqual(10)
      expect(arr2.byteOffset).assertEqual(5)
    })
  })
}
