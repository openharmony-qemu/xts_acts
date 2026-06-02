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

export default function Uint8ClampedArrayCtorTest(): void {
  describe('Uint8ClampedArrayCtorTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ==================== Constructor Tests ====================

    /**
     * @tc.name   Uint8ClampedArrayCtorTest0100
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_0100
     * @tc.desc   Verify empty constructor creates array with length 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray()
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
      expect(arr.byteOffset).assertEqual(0)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest0200
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_0200
     * @tc.desc   Verify length constructor with positive integer values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr1 = new collections.Uint8ClampedArray(5)
      expect(arr1.length).assertEqual(5)
      expect(arr1.byteLength).assertEqual(5)
      expect(arr1[0]).assertEqual(0)
      let arr2 = new collections.Uint8ClampedArray(100)
      expect(arr2.length).assertEqual(100)
      expect(arr2.byteLength).assertEqual(100)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest0300
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_0300
     * @tc.desc   Verify length constructor with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint8ClampedArrayCtorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8ClampedArray(0)
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest0400
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_0400
     * @tc.desc   Verify length constructor with negative value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        let arr = new collections.Uint8ClampedArray(-1)
        expect().assertFail()
      } catch (e) {
        expect(e.message).assertContain('integerIndex')
      }
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest0500
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_0500
     * @tc.desc   Verify length constructor with decimal value truncates to integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint8ClampedArrayCtorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = new collections.Uint8ClampedArray(5.7)
      expect(arr.length).assertEqual(5)
      expect(arr.byteLength).assertEqual(5)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest0600
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_0600
     * @tc.desc   Verify ArrayLike constructor with normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 128, 255]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(128)
      expect(arr[2]).assertEqual(255)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest0700
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_0700
     * @tc.desc   Verify ArrayLike constructor with boundary values 0 and 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [0, 255, 128, 1]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(255)
      expect(arr[2]).assertEqual(128)
      expect(arr[3]).assertEqual(1)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest0800
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_0800
     * @tc.desc   Verify ArrayLike constructor clamps out-of-range values instead of truncating
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [256, -1, 300]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(255)
      expect(arr[1]).assertEqual(0)
      expect(arr[2]).assertEqual(255)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest0900
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_0900
     * @tc.desc   Verify ArrayLike constructor clamps extreme negative values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [-100, 300, 0, 128]
      let arr = new collections.Uint8ClampedArray(src)
      expect(arr.length).assertEqual(4)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(255)
      expect(arr[2]).assertEqual(0)
      expect(arr[3]).assertEqual(128)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1000
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1000
     * @tc.desc   Verify constructor from another Uint8ClampedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 255, 0]
      let arr1 = new collections.Uint8ClampedArray(src)
      let arr2 = new collections.Uint8ClampedArray(arr1)
      expect(arr2.length).assertEqual(4)
      expect(arr2[0]).assertEqual(1)
      expect(arr2[1]).assertEqual(2)
      expect(arr2[2]).assertEqual(255)
      expect(arr2[3]).assertEqual(0)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1100
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1100
     * @tc.desc   Verify ArrayBuffer constructor with byteOffset and length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(10)
      let arr = new collections.Uint8ClampedArray(buffer, 2, 5)
      expect(arr.length).assertEqual(5)
      expect(arr.byteOffset).assertEqual(2)
      expect(arr.byteLength).assertEqual(5)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1200
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1200
     * @tc.desc   Verify ArrayBuffer constructor with offset exceeding buffer size throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      try {
        let buffer = new collections.ArrayBuffer(5)
        let arr = new collections.Uint8ClampedArray(buffer, 10, 3)
        expect().assertFail()
      } catch (e) {
        expect(e.message).assertContain('out of range')
      }
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1300
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1300
     * @tc.desc   Verify static from method with ArrayLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 3]
      let arr = collections.Uint8ClampedArray.from(src)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(2)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1400
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1400
     * @tc.desc   Verify static from method clamps out-of-range values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [1, 2, 300]
      let arr = collections.Uint8ClampedArray.from(src)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(2)
      expect(arr[2]).assertEqual(255)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1500
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1500
     * @tc.desc   Verify static from method with mapFn transform and clamping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let src: number[] = [-10, 100, 500]
      let arr = collections.Uint8ClampedArray.from<number>(src, (v: number, k: number): number => v)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(100)
      expect(arr[2]).assertEqual(255)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1600
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1600
     * @tc.desc   Verify static of method with normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = collections.Uint8ClampedArray.of(1, 128, 255)
      expect(arr.length).assertEqual(3)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(128)
      expect(arr[2]).assertEqual(255)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1700
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1700
     * @tc.desc   Verify static of method with empty arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint8ClampedArrayCtorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let arr = collections.Uint8ClampedArray.of()
      expect(arr.length).assertEqual(0)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1800
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1800
     * @tc.desc   Verify static of method clamps boundary and out-of-range values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = collections.Uint8ClampedArray.of(0, 128, 255, 300, -5)
      expect(arr.length).assertEqual(5)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(128)
      expect(arr[2]).assertEqual(255)
      expect(arr[3]).assertEqual(255)
      expect(arr[4]).assertEqual(0)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest1900
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_1900
     * @tc.desc   Verify ArrayBuffer constructor with only buffer parameter uses entire buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(10)
      let arr = new collections.Uint8ClampedArray(buffer)
      expect(arr.length).assertEqual(10)
      expect(arr.byteOffset).assertEqual(0)
      expect(arr.byteLength).assertEqual(10)
    })

    // ==================== Property Tests ====================

    /**
     * @tc.name   Uint8ClampedArrayCtorTest2000
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_2000
     * @tc.desc   Verify length and byteLength relationship (byteLength = length * 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray(10)
      expect(arr.length).assertEqual(10)
      expect(arr.byteLength).assertEqual(10)
      expect(arr.byteLength).assertEqual(arr.length * 1)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest2100
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_2100
     * @tc.desc   Verify empty array has length 0 and byteLength 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray()
      expect(arr.length).assertEqual(0)
      expect(arr.byteLength).assertEqual(0)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest2200
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_2200
     * @tc.desc   Verify BYTES_PER_ELEMENT static property is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      expect(collections.Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest2300
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_2300
     * @tc.desc   Verify BYTES_PER_ELEMENT instance property is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray(10)
      expect(arr.length).assertEqual(10)
      expect(collections.Uint8ClampedArray.BYTES_PER_ELEMENT).assertEqual(1)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest2400
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_2400
     * @tc.desc   Verify byteOffset is 0 for direct construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let arr = new collections.Uint8ClampedArray(5)
      expect(arr.byteOffset).assertEqual(0)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest2500
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_2500
     * @tc.desc   Verify byteOffset with ArrayBuffer constructor offset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(20)
      let arr = new collections.Uint8ClampedArray(buffer, 5)
      expect(arr.byteOffset).assertEqual(5)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest2600
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_2600
     * @tc.desc   Verify buffer property returns underlying ArrayBuffer with correct size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Uint8ClampedArrayCtorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let buffer = new collections.ArrayBuffer(10)
      let arr = new collections.Uint8ClampedArray(buffer)
      expect(arr.buffer.byteLength).assertEqual(10)
    })

    /**
     * @tc.name   Uint8ClampedArrayCtorTest2700
     * @tc.number SUB_UINT8CLAMPEDARRAY_CTOR_TEST_2700
     * @tc.desc   Verify multiple views sharing the same ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Uint8ClampedArrayCtorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let buffer = new collections.ArrayBuffer(20)
      let arr1 = new collections.Uint8ClampedArray(buffer, 0, 5)
      let arr2 = new collections.Uint8ClampedArray(buffer, 5, 10)
      arr1[0] = 42
      arr1[4] = 200
      expect(arr1.length).assertEqual(5)
      expect(arr2.length).assertEqual(10)
      expect(arr2.byteOffset).assertEqual(5)
    })
  })
}
