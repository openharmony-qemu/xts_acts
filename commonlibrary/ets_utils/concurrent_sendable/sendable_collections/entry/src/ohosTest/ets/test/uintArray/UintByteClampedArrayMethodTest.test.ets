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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../Utils';

export default function UintByteClampedArrayMethodTest(): void {
  describe('UintByteClampedArrayMethodTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ==================== Method Tests ====================

    /**
     * @tc.name   UintByteClampedArrayMethodTest0100
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_0100
     * @tc.desc   Verify at() with positive indices returns correct element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.at(0)).assertEqual(1)
      expect(arr.at(2)).assertEqual(3)
      expect(arr.at(4)).assertEqual(5)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest0200
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_0200
     * @tc.desc   Verify at() with negative indices counts from end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.at(-1)).assertEqual(5)
      expect(arr.at(-2)).assertEqual(4)
      expect(arr.at(-5)).assertEqual(1)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest0300
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_0300
     * @tc.desc   Verify at() returns undefined for out-of-bounds index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayMethodTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [1, 2]
      let arr = new collections.Uint8ClampedArray(src)
      let result = arr.at(10)
      expect(result === undefined).assertTrue()
      let resultNeg = arr.at(-10)
      expect(resultNeg === undefined).assertTrue()
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest0400
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_0400
     * @tc.desc   Verify fill() fills entire array with value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray(5)
      arr.fill(128)
      expect(arr[0]).assertEqual(128)
      expect(arr[4]).assertEqual(128)
      arr.fill(200, 1, 4)
      expect(arr[0]).assertEqual(128)
      expect(arr[1]).assertEqual(200)
      expect(arr[3]).assertEqual(200)
      expect(arr[4]).assertEqual(128)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest0500
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_0500
     * @tc.desc   Verify fill() with start and end parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray(5)
      arr.fill(128, 1, 4)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(128)
      expect(arr[2]).assertEqual(128)
      expect(arr[3]).assertEqual(128)
      expect(arr[4]).assertEqual(0)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest0600
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_0600
     * @tc.desc   Verify fill() clamps overflow value 300 to 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray(3)
      arr.fill(300)
      expect(arr[0]).assertEqual(255)
      expect(arr[1]).assertEqual(255)
      expect(arr[2]).assertEqual(255)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest0700
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_0700
     * @tc.desc   Verify fill() clamps underflow value -10 to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray(3)
      arr.fill(128)
      arr.fill(-10)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(0)
      expect(arr[2]).assertEqual(0)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest0800
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_0800
     * @tc.desc   Verify find() returns first element matching predicate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 3, 5, 200]
      let arr = new collections.Uint8ClampedArray(src)
      let found = arr.find((v: number): boolean => v > 100)
      expect(found === undefined).assertFalse()
      expect(found as number).assertEqual(200)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest0900
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_0900
     * @tc.desc   Verify find() returns undefined when no element matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
      let notFound = arr.find((v: number): boolean => v > 100)
      expect(notFound === undefined).assertTrue()
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest1000
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1000
     * @tc.desc   Verify find() with empty array returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayMethodTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8ClampedArray(0)
      let result = arr.find((v: number): boolean => v > 0)
      expect(result === undefined).assertTrue()
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest1100
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1100
     * @tc.desc   Verify findIndex() returns correct index of first matching element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      let idx = arr.findIndex((v: number): boolean => v > 3)
      expect(idx).assertEqual(3)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest1200
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1200
     * @tc.desc   Verify findIndex() returns -1 when no element matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
      let noIdx = arr.findIndex((v: number): boolean => v > 100)
      expect(noIdx).assertEqual(-1)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest1300
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1300
     * @tc.desc   Verify forEach() iterates all elements and accumulates correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
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
     * @tc.name   UintByteClampedArrayMethodTest1400
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1400
     * @tc.desc   Verify forEach() with empty array does not invoke callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayMethodTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8ClampedArray(0)
      let count: number = 0
      arr.forEach((v: number): void => {
        count++
      })
      expect(count).assertEqual(0)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest1500
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1500
     * @tc.desc   Verify indexOf() with existing and non-existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 2, 1]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.indexOf(1)).assertEqual(0)
      expect(arr.indexOf(2)).assertEqual(1)
      expect(arr.indexOf(99)).assertEqual(-1)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest1600
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1600
     * @tc.desc   Verify indexOf() with fromIndex parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 2, 1]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.indexOf(2, 2)).assertEqual(3)
      expect(arr.indexOf(1, 1)).assertEqual(4)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest1700
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1700
     * @tc.desc   Verify indexOf() with out-of-range value 300 returns -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 128]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.indexOf(300)).assertEqual(-1)
      expect(arr.indexOf(-1)).assertEqual(-1)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest1800
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1800
     * @tc.desc   Verify lastIndexOf() finds last occurrence of value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 2, 1]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.lastIndexOf(2)).assertEqual(3)
      expect(arr.lastIndexOf(1)).assertEqual(4)
      expect(arr.lastIndexOf(99)).assertEqual(-1)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest1900
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_1900
     * @tc.desc   Verify join() with default and custom separator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.join()).assertEqual('1,2,3')
      expect(arr.join('-')).assertEqual('1-2-3')
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2000
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2000
     * @tc.desc   Verify join() with empty array returns empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayMethodTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8ClampedArray(0)
      expect(arr.join()).assertEqual('')
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2100
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2100
     * @tc.desc   Verify map() creates new array with transformed elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
      let mapped = arr.map((v: number): number => v * 2)
      expect(mapped.length).assertEqual(3)
      expect(mapped[0]).assertEqual(2)
      expect(mapped[1]).assertEqual(4)
      expect(mapped[2]).assertEqual(6)
      expect(arr[0]).assertEqual(1)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2200
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2200
     * @tc.desc   Verify map() clamps overflow results to 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
      let mapped = arr.map((v: number): number => v * 100)
      expect(mapped[0]).assertEqual(100)
      expect(mapped[1]).assertEqual(200)
      expect(mapped[2]).assertEqual(255)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2300
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2300
     * @tc.desc   Verify reduce() without and with initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4]
      let arr = new collections.Uint8ClampedArray(src)
      let sum = arr.reduce((acc: number, v: number): number => acc + v)
      expect(sum).assertEqual(10)
      let sumInit = arr.reduce((acc: number, v: number): number => acc + v, 10)
      expect(sumInit).assertEqual(20)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2400
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2400
     * @tc.desc   Verify reduceRight() processes elements from right to left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4]
      let arr = new collections.Uint8ClampedArray(src)
      let result = arr.reduceRight((acc: number, v: number): number => acc + v)
      expect(result).assertEqual(10)
      let resultInit = arr.reduceRight((acc: number, v: number): number => acc + v, 1)
      expect(resultInit).assertEqual(11)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2500
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2500
     * @tc.desc   Verify reverse() reverses array in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      arr.reverse()
      expect(arr[0]).assertEqual(5)
      expect(arr[1]).assertEqual(4)
      expect(arr[4]).assertEqual(1)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2600
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2600
     * @tc.desc   Verify slice() returns new array with selected range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      let sliced = arr.slice(1, 4)
      expect(sliced.length).assertEqual(3)
      expect(sliced[0]).assertEqual(2)
      expect(sliced[2]).assertEqual(4)
      expect(arr[1]).assertEqual(2)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2700
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2700
     * @tc.desc   Verify slice() with negative indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayMethodTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      let sliced = arr.slice(-2)
      expect(sliced.length).assertEqual(2)
      expect(sliced[0]).assertEqual(4)
      expect(sliced[1]).assertEqual(5)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2800
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2800
     * @tc.desc   Verify sort() with default ascending comparator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [3, 1, 4, 1, 5, 9, 2]
      let arr = new collections.Uint8ClampedArray(src)
      arr.sort((a: number, b: number): number => a - b)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(1)
      expect(arr[2]).assertEqual(2)
      expect(arr[6]).assertEqual(9)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest2900
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_2900
     * @tc.desc   Verify sort() with descending order and boundary values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayMethodTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [255, 0, 128, 50, 1]
      let arr = new collections.Uint8ClampedArray(src)
      arr.sort((a: number, b: number): number => b - a)
      expect(arr[0]).assertEqual(255)
      expect(arr[1]).assertEqual(128)
      expect(arr[4]).assertEqual(0)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3000
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3000
     * @tc.desc   Verify subarray() shares buffer and modification affects original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      let sub = arr.subarray(1, 4)
      expect(sub.length).assertEqual(3)
      expect(sub[0]).assertEqual(2)
      sub[0] = 10
      expect(arr[1]).assertEqual(10)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3100
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3100
     * @tc.desc   Verify subarray() assignment clamps overflow value to 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      let sub = arr.subarray(1, 4)
      sub[1] = 300
      expect(arr[2]).assertEqual(255)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3200
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3200
     * @tc.desc   Verify includes() with existing and non-existing elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 0, 255]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.includes(3)).assertTrue()
      expect(arr.includes(0)).assertTrue()
      expect(arr.includes(255)).assertTrue()
      expect(arr.includes(99)).assertFalse()
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3300
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3300
     * @tc.desc   Verify includes() with out-of-range value 300 returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 128]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.includes(300)).assertFalse()
      expect(arr.includes(-1)).assertFalse()
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3400
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3400
     * @tc.desc   Verify copyWithin() copies elements within array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      arr.copyWithin(0, 3)
      expect(arr[0]).assertEqual(4)
      expect(arr[1]).assertEqual(5)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3500
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3500
     * @tc.desc   Verify set() writes values from ArrayLike at offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray(5)
      let vals: number[] = [1, 2, 3]
      arr.set(vals, 1)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(1)
      expect(arr[2]).assertEqual(2)
      expect(arr[3]).assertEqual(3)
      expect(arr[4]).assertEqual(0)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3600
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3600
     * @tc.desc   Verify set() clamps out-of-range values to valid range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray(5)
      let vals: number[] = [300, -10, 128]
      arr.set(vals, 0)
      expect(arr[0]).assertEqual(255)
      expect(arr[1]).assertEqual(0)
      expect(arr[2]).assertEqual(128)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3700
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3700
     * @tc.desc   Verify entries() returns key-value iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [11, 22, 33]
      let arr = new collections.Uint8ClampedArray(src)
      let iter: IterableIterator<[number, number]> = arr.entries()
      let first: [number, number] = iter.next().value as [number, number]
      expect(first[0]).assertEqual(0)
      expect(first[1]).assertEqual(11)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3800
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3800
     * @tc.desc   Verify keys() returns index iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [10, 20, 30]
      let arr = new collections.Uint8ClampedArray(src)
      let keysArr: number[] = []
      for (let key of arr.keys()) {
        keysArr.push(key)
      }
      expect(keysArr.length).assertEqual(3)
      expect(keysArr[0]).assertEqual(0)
      expect(keysArr[2]).assertEqual(2)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest3900
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_3900
     * @tc.desc   Verify values() returns value iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [10, 20, 30]
      let arr = new collections.Uint8ClampedArray(src)
      let valsArr: number[] = []
      for (let val of arr.values()) {
        valsArr.push(val)
      }
      expect(valsArr.length).assertEqual(3)
      expect(valsArr[0]).assertEqual(10)
      expect(valsArr[2]).assertEqual(30)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest4000
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_4000
     * @tc.desc   Verify every() returns true when all elements match condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.every((v: number): boolean => v >= 0)).assertTrue()
      expect(arr.every((v: number): boolean => v > 2)).assertFalse()
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest4100
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_4100
     * @tc.desc   Verify some() returns true when any element matches condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.some((v: number): boolean => v > 3)).assertTrue()
      expect(arr.some((v: number): boolean => v > 100)).assertFalse()
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest4200
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_4200
     * @tc.desc   Verify filter() returns new array with matching elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3, 4, 5]
      let arr = new collections.Uint8ClampedArray(src)
      let filtered = arr.filter((v: number): boolean => v > 2)
      expect(filtered.length).assertEqual(3)
      expect(filtered[0]).assertEqual(3)
      expect(filtered[1]).assertEqual(4)
      expect(filtered[2]).assertEqual(5)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest4300
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_4300
     * @tc.desc   Verify toString() returns comma-separated string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.toString()).assertEqual('1,2,3')
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest4400
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_4400
     * @tc.desc   Verify toString() with empty array returns empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayMethodTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8ClampedArray(0)
      expect(arr.toString()).assertEqual('')
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest4500
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_4500
     * @tc.desc   Verify toLocaleString() returns string representation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayMethodTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [1, 2, 3]
      let arr = new collections.Uint8ClampedArray(src)
      let result: string = arr.toLocaleString()
      expect(result).assertContain('1,2,3')
    })

    // ==================== Boundary Value Tests ====================

    /**
     * @tc.name   UintByteClampedArrayMethodTest4600
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_4600
     * @tc.desc   Verify clamping vs truncation: overflow 256 clamps to 255 not 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('UintByteClampedArrayMethodTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let clamped: number[] = [256, -1, 300]
      let clampArr = new collections.Uint8ClampedArray(clamped)
      expect(clampArr[0]).assertEqual(255)
      expect(clampArr[1]).assertEqual(0)
      expect(clampArr[2]).assertEqual(255)
      let uint8: number[] = [256, -1, 300]
      let uint8Arr = new collections.Uint8Array(uint8)
      expect(uint8Arr[0]).assertEqual(0)
      expect(uint8Arr[1]).assertEqual(255)
      expect(uint8Arr[2]).assertEqual(44)
    })

    /**
     * @tc.name   UintByteClampedArrayMethodTest4700
     * @tc.number SUB_UINT_BYTE_CLAMPED_ARRAY_METHOD_TEST_4700
     * @tc.desc   Verify decimal value 0.5 is truncated to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('UintByteClampedArrayMethodTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let src: number[] = [0.5, 1.9, 127.5]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(2)
      expect(arr[2]).assertEqual(128)
    })
  })
}
