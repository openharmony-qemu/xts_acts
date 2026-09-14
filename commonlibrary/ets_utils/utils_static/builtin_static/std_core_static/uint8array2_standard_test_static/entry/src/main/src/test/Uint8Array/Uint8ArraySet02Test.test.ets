'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index'
import Utils from '../Util.test'

export default function Uint8ArraySet02Test(): void {
  describe('Uint8ArraySet02Test', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30)
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_0100
     * @tc.name testUint8ArraySet02_001
     * @tc.desc Verify set(FixedArray<int>) and set(FixedArray<number>) with same value [1,2,3] produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const srcI: FixedArray<int> = [1, 2, 3]
      const srcN: FixedArray<number> = [1.0, 2.0, 3.0]
      a.set(srcI)
      b.set(srcN)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_0200
     * @tc.name testUint8ArraySet02_002
     * @tc.desc Verify set(FixedArray<int>) and set(FixedArray<number>) with boundary [255,0] produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(2)
      const b: Uint8Array = new Uint8Array(2)
      const srcI: FixedArray<int> = [255, 0]
      const srcN: FixedArray<number> = [255.0, 0.0]
      a.set(srcI)
      b.set(srcN)
      expect(a[0]).assertEqual(b[0])
      expect(a[1]).assertEqual(b[1])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_0300
     * @tc.name testUint8ArraySet02_003
     * @tc.desc Verify set(FixedArray<int>) and set(FixedArray<number>) with overflow [256,-1] truncation consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const srcI: FixedArray<int> = [256, -1, 128]
      const srcN: FixedArray<number> = [256.0, -1.0, 128.0]
      a.set(srcI)
      b.set(srcN)
      expect(a[0]).assertEqual(b[0])
      expect(a[1]).assertEqual(b[1])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_0400
     * @tc.name testUint8ArraySet02_004
     * @tc.desc Verify set(FixedArray<int>,1) and set(FixedArray<number>,1) with same offset produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(4)
      const b: Uint8Array = new Uint8Array(4)
      const srcI: FixedArray<int> = [10, 20]
      const srcN: FixedArray<number> = [10.0, 20.0]
      a.set(srcI, 1)
      b.set(srcN, 1)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_0500
     * @tc.name testUint8ArraySet02_005
     * @tc.desc Verify set(Uint8Array) and set(Uint8Array,0) with default and explicit offset produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const src: Uint8Array = Uint8Array.of(5, 6, 7)
      a.set(src)
      b.set(src, 0)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_0600
     * @tc.name testUint8ArraySet02_006
     * @tc.desc Verify set(Uint8Array) and set(FixedArray<int>) with same value [9,8,7] produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const srcU: Uint8Array = Uint8Array.of(9, 8, 7)
      const srcI: FixedArray<int> = [9, 8, 7]
      a.set(srcU)
      b.set(srcI)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_0700
     * @tc.name testUint8ArraySet02_007
     * @tc.desc Verify set(Uint8Array) and set(ArrayLike<number>) with same value [11,22] produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(2)
      const b: Uint8Array = new Uint8Array(2)
      const srcU: Uint8Array = Uint8Array.of(11, 22)
      const srcA: Array<number> = [11, 22]
      a.set(srcU)
      b.set(srcA)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_0800
     * @tc.name testUint8ArraySet02_008
     * @tc.desc Verify set(Uint8Array,1) and set(ArrayLike<number>,1) with offset 1 same value produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(4)
      const b: Uint8Array = new Uint8Array(4)
      const srcU: Uint8Array = Uint8Array.of(33, 44)
      const srcA: Array<number> = [33, 44]
      a.set(srcU, 1)
      b.set(srcA, 1)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_0900
     * @tc.name testUint8ArraySet02_009
     * @tc.desc Verify set(FixedArray<int>) and set(ArrayLike<number>) with same value [55,66] produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(2)
      const b: Uint8Array = new Uint8Array(2)
      const srcI: FixedArray<int> = [55, 66]
      const srcA: Array<number> = [55, 66]
      a.set(srcI)
      b.set(srcA)
      expect(a[0]).assertEqual(b[0])
      expect(a[1]).assertEqual(b[1])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1000
     * @tc.name testUint8ArraySet02_010
     * @tc.desc Verify set(Array<number>) and set(Array<number>) with same value [1,2] produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(2)
      const b: Uint8Array = new Uint8Array(2)
      const srcB: Array<number> = [1, 2]
      const srcN: Array<number> = [1, 2]
      a.set(srcB)
      b.set(srcN)
      expect(a[0]).assertEqual(b[0])
      expect(a[1]).assertEqual(b[1])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1100
     * @tc.name testUint8ArraySet02_011
     * @tc.desc Verify set(FixedArray<int>) and set(FixedArray<int>,0) with default and explicit 0 produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const src: FixedArray<int> = [77, 88, 99]
      a.set(src)
      b.set(src, 0)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1200
     * @tc.name testUint8ArraySet02_012
     * @tc.desc Verify set(FixedArray<number>) and set(FixedArray<number>,0) with default and explicit 0 produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const src: FixedArray<number> = [77.0, 88.0, 99.0]
      a.set(src)
      b.set(src, 0)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1300
     * @tc.name testUint8ArraySet02_013
     * @tc.desc Verify set(ArrayLike<number>) and set(ArrayLike<number>,0) with default and explicit 0 produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const src: Array<number> = [10, 20, 30]
      a.set(src)
      b.set(src, 0)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1400
     * @tc.name testUint8ArraySet02_014
     * @tc.desc Verify set(FixedArray<int> [0x80,0xFF]) and set(FixedArray<number> [128,255]) with hex vs decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(2)
      const b: Uint8Array = new Uint8Array(2)
      const srcI: FixedArray<int> = [0x80, 0xFF]
      const srcN: FixedArray<number> = [128.0, 255.0]
      a.set(srcI)
      b.set(srcN)
      expect(a[0]).assertEqual(b[0])
      expect(a[1]).assertEqual(b[1])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1500
     * @tc.name testUint8ArraySet02_015
     * @tc.desc Verify set(Uint8Array) and set(FixedArray<int>) with all same boundary values [0,127,255] produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const srcU: Uint8Array = Uint8Array.of(0, 127, 255)
      const srcI: FixedArray<int> = [0, 127, 255]
      a.set(srcU)
      b.set(srcI)
      expect(a[0]).assertEqual(b[0])
      expect(a[1]).assertEqual(b[1])
      expect(a[2]).assertEqual(b[2])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1600
     * @tc.name testUint8ArraySet02_016
     * @tc.desc Verify set(Array<number>) with 0xFF and set(int,number) with 255 produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(1)
      const b: Uint8Array = new Uint8Array(1)
      const srcB: Array<number> = [0xFF]
      a.set(srcB)
      b.set(0, 255)
      expect(a[0]).assertEqual(b[0])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1700
     * @tc.name testUint8ArraySet02_017
     * @tc.desc Verify set(FixedArray<int> [3,4]) and set(FixedArray<int> [3,4],0) with multi-element default and explicit offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const src: FixedArray<int> = [3, 4]
      a.set(src)
      b.set(src, 0)
      expect(a.join(',')).assertEqual(b.join(','))
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1800
     * @tc.name testUint8ArraySet02_018
     * @tc.desc Verify set(FixedArray<int>) default offset 0 writes to first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: FixedArray<int> = [10, 20]
      arr.set(src)
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_1900
     * @tc.name testUint8ArraySet02_019
     * @tc.desc Verify set(FixedArray<number>) default offset 0 writes to first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: FixedArray<number> = [10.0, 20.0]
      arr.set(src)
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2000
     * @tc.name testUint8ArraySet02_020
     * @tc.desc Verify set(Uint8Array) default offset 0 writes to first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: Uint8Array = Uint8Array.of(30, 40)
      arr.set(src)
      expect(arr[0]).assertEqual(30)
      expect(arr[1]).assertEqual(40)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2100
     * @tc.name testUint8ArraySet02_021
     * @tc.desc Verify set(ArrayLike<number>) default offset 0 writes to first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: Array<number> = [50, 60]
      arr.set(src)
      expect(arr[0]).assertEqual(50)
      expect(arr[1]).assertEqual(60)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2200
     * @tc.name testUint8ArraySet02_022
     * @tc.desc Verify set(ArrayLike<number>) default offset 0 writes to first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: Array<number> = [70, 80]
      arr.set(src)
      expect(arr[0]).assertEqual(70)
      expect(arr[1]).assertEqual(80)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2300
     * @tc.name testUint8ArraySet02_023
     * @tc.desc Verify set(FixedArray<int>,offset=1) writes starting at second position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(4)
      const src: FixedArray<int> = [11, 22]
      arr.set(src, 1)
      expect(arr[1]).assertEqual(11)
      expect(arr[2]).assertEqual(22)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2400
     * @tc.name testUint8ArraySet02_024
     * @tc.desc Verify set(FixedArray<number>,offset=1) writes starting at second position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(4)
      const src: FixedArray<number> = [11.0, 22.0]
      arr.set(src, 1)
      expect(arr[1]).assertEqual(11)
      expect(arr[2]).assertEqual(22)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2500
     * @tc.name testUint8ArraySet02_025
     * @tc.desc Verify set(Uint8Array,offset=1) writes starting at second position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(4)
      const src: Uint8Array = Uint8Array.of(33, 44)
      arr.set(src, 1)
      expect(arr[1]).assertEqual(33)
      expect(arr[2]).assertEqual(44)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2600
     * @tc.name testUint8ArraySet02_026
     * @tc.desc Verify set(ArrayLike<number>,offset=1) writes starting at second position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(4)
      const src: Array<number> = [55, 66]
      arr.set(src, 1)
      expect(arr[1]).assertEqual(55)
      expect(arr[2]).assertEqual(66)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2700
     * @tc.name testUint8ArraySet02_027
     * @tc.desc Verify set(ArrayLike<number>,offset=1) writes starting at second position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(4)
      const src: Array<number> = [77, 88]
      arr.set(src, 1)
      expect(arr[1]).assertEqual(77)
      expect(arr[2]).assertEqual(88)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2800
     * @tc.name testUint8ArraySet02_028
     * @tc.desc Verify set(FixedArray<int>) after exception instance identity remains same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: FixedArray<int> = [1, 2, 3]
      try {
        arr.set(src, 100)
        expect().assertFail()
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError')
      }
      expect(arr.length).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_2900
     * @tc.name testUint8ArraySet02_029
     * @tc.desc Verify set(FixedArray<number>) after exception instance identity remains same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: FixedArray<number> = [1.0, 2.0, 3.0]
      try {
        arr.set(src, 100)
        expect().assertFail()
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError')
      }
      expect(arr.length).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3000
     * @tc.name testUint8ArraySet02_030
     * @tc.desc Verify set(Uint8Array) after exception instance identity remains same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: Uint8Array = Uint8Array.of(1, 2, 3)
      try {
        arr.set(src, 100)
        expect().assertFail()
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError')
      }
      expect(arr.length).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3100
     * @tc.name testUint8ArraySet02_031
     * @tc.desc Verify set(ArrayLike<number>) after exception instance identity remains same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: Array<number> = [1, 2, 3]
      try {
        arr.set(src, 100)
        expect().assertFail()
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError')
      }
      expect(arr.length).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3200
     * @tc.name testUint8ArraySet02_032
     * @tc.desc Verify set(FixedArray<int>) after exception byteLength field remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const bl: int = arr.byteLength
      const src: FixedArray<int> = [1, 2, 3]
      try {
        arr.set(src, 100)
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError')
      }
      expect(arr.byteLength).assertEqual(bl)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3300
     * @tc.name testUint8ArraySet02_033
     * @tc.desc Verify set(FixedArray<number>) after exception byteLength field remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const bl: int = arr.byteLength
      const src: FixedArray<number> = [1.0, 2.0, 3.0]
      try {
        arr.set(src, 100)
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError')
      }
      expect(arr.byteLength).assertEqual(bl)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3400
     * @tc.name testUint8ArraySet02_034
     * @tc.desc Verify set(Uint8Array) after exception byteLength field remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const bl: int = arr.byteLength
      const src: Uint8Array = Uint8Array.of(1, 2, 3)
      try {
        arr.set(src, 100)
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError')
      }
      expect(arr.byteLength).assertEqual(bl)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3500
     * @tc.name testUint8ArraySet02_035
     * @tc.desc Verify set(ArrayLike<number>) after exception byteLength field remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const bl: int = arr.byteLength
      const src: Array<number> = [1, 2, 3]
      try {
        arr.set(src, 100)
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError')
      }
      expect(arr.byteLength).assertEqual(bl)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3600
     * @tc.name testUint8ArraySet02_036
     * @tc.desc Verify set(FixedArray<int>) returns void via successful execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: FixedArray<int> = [1, 2, 3]
      arr.set(src)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(2)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3700
     * @tc.name testUint8ArraySet02_037
     * @tc.desc Verify set(FixedArray<number>) returns void via successful execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: FixedArray<number> = [1.0, 2.0, 3.0]
      arr.set(src)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(2)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3800
     * @tc.name testUint8ArraySet02_038
     * @tc.desc Verify set(Uint8Array) returns void via successful execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: Uint8Array = Uint8Array.of(4, 5, 6)
      arr.set(src)
      expect(arr[0]).assertEqual(4)
      expect(arr[1]).assertEqual(5)
      expect(arr[2]).assertEqual(6)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_3900
     * @tc.name testUint8ArraySet02_039
     * @tc.desc Verify set(ArrayLike<number>) returns void via successful execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: Array<number> = [7, 8, 9]
      arr.set(src)
      expect(arr[0]).assertEqual(7)
      expect(arr[1]).assertEqual(8)
      expect(arr[2]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4000
     * @tc.name testUint8ArraySet02_040
     * @tc.desc Verify set(ArrayLike<number>) returns void via successful execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: Array<number> = [10, 11, 12]
      arr.set(src)
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(11)
      expect(arr[2]).assertEqual(12)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4100
     * @tc.name testUint8ArraySet02_041
     * @tc.desc Verify set(FixedArray<int>,offset) returns void via successful execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const src: FixedArray<int> = [1, 2]
      arr.set(src, 2)
      expect(arr[2]).assertEqual(1)
      expect(arr[3]).assertEqual(2)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4200
     * @tc.name testUint8ArraySet02_042
     * @tc.desc Verify set(Uint8Array,offset) returns void via successful execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const src: Uint8Array = Uint8Array.of(3, 4)
      arr.set(src, 1)
      expect(arr[1]).assertEqual(3)
      expect(arr[2]).assertEqual(4)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4300
     * @tc.name testUint8ArraySet02_043
     * @tc.desc Verify set(ArrayLike<number>,offset) returns void via successful execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const src: Array<number> = [5, 6]
      arr.set(src, 3)
      expect(arr[3]).assertEqual(5)
      expect(arr[4]).assertEqual(6)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4400
     * @tc.name testUint8ArraySet02_044
     * @tc.desc Verify set(FixedArray<number>,offset) returns void via successful execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const src: FixedArray<number> = [7.0, 8.0]
      arr.set(src, 2)
      expect(arr[2]).assertEqual(7)
      expect(arr[3]).assertEqual(8)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4500
     * @tc.name testUint8ArraySet02_045
     * @tc.desc Verify set(FixedArray<int>) modifies target in place (same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const ref: Uint8Array = arr
      const src: FixedArray<int> = [10, 20, 30]
      arr.set(src)
      expect(ref[0]).assertEqual(10)
      expect(ref[1]).assertEqual(20)
      expect(ref[2]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4600
     * @tc.name testUint8ArraySet02_046
     * @tc.desc Verify set(FixedArray<number>) modifies target in place (same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const ref: Uint8Array = arr
      const src: FixedArray<number> = [10.0, 20.0, 30.0]
      arr.set(src)
      expect(ref[0]).assertEqual(10)
      expect(ref[1]).assertEqual(20)
      expect(ref[2]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4700
     * @tc.name testUint8ArraySet02_047
     * @tc.desc Verify set(Uint8Array) modifies target in place (same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const ref: Uint8Array = arr
      const src: Uint8Array = Uint8Array.of(40, 50, 60)
      arr.set(src)
      expect(ref[0]).assertEqual(40)
      expect(ref[1]).assertEqual(50)
      expect(ref[2]).assertEqual(60)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4800
     * @tc.name testUint8ArraySet02_048
     * @tc.desc Verify set(ArrayLike<number>) modifies target in place (same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const ref: Uint8Array = arr
      const src: Array<number> = [70, 80, 90]
      arr.set(src)
      expect(ref[0]).assertEqual(70)
      expect(ref[1]).assertEqual(80)
      expect(ref[2]).assertEqual(90)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_4900
     * @tc.name testUint8ArraySet02_049
     * @tc.desc Verify set(ArrayLike<number>) modifies target in place (same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const ref: Uint8Array = arr
      const src: Array<number> = [100, 110, 120]
      arr.set(src)
      expect(ref[0]).assertEqual(100)
      expect(ref[1]).assertEqual(110)
      expect(ref[2]).assertEqual(120)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5000
     * @tc.name testUint8ArraySet02_050
     * @tc.desc Verify set(FixedArray) does not modify source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [1, 2, 3]
      const arr: Uint8Array = new Uint8Array(3)
      const srcCopy: FixedArray<int> = [src[0], src[1], src[2]]
      arr.set(src)
      expect(src[0]).assertEqual(srcCopy[0])
      expect(src[1]).assertEqual(srcCopy[1])
      expect(src[2]).assertEqual(srcCopy[2])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5100
     * @tc.name testUint8ArraySet02_051
     * @tc.desc Verify set(Uint8Array) does not modify source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint8Array = Uint8Array.of(4, 5, 6)
      const arr: Uint8Array = new Uint8Array(3)
      const srcCopy: Uint8Array = Uint8Array.of(src[0], src[1], src[2])
      arr.set(src)
      expect(src[0]).assertEqual(srcCopy[0])
      expect(src[1]).assertEqual(srcCopy[1])
      expect(src[2]).assertEqual(srcCopy[2])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5200
     * @tc.name testUint8ArraySet02_052
     * @tc.desc Verify set(ArrayLike) does not modify source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [7, 8, 9]
      const arr: Uint8Array = new Uint8Array(3)
      const srcCopy: Array<number> = [src[0], src[1], src[2]]
      arr.set(src)
      expect(src[0]).assertEqual(srcCopy[0])
      expect(src[1]).assertEqual(srcCopy[1])
      expect(src[2]).assertEqual(srcCopy[2])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5300
     * @tc.name testUint8ArraySet02_053
     * @tc.desc Verify set(FixedArray<int>) does not affect unrelated indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      arr[0] = 99
      arr[4] = 88
      const src: FixedArray<int> = [10, 20]
      arr.set(src, 1)
      expect(arr[0]).assertEqual(99)
      expect(arr[1]).assertEqual(10)
      expect(arr[2]).assertEqual(20)
      expect(arr[4]).assertEqual(88)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5400
     * @tc.name testUint8ArraySet02_054
     * @tc.desc Verify set(Uint8Array) does not affect unrelated indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      arr[0] = 77
      arr[4] = 66
      const src: Uint8Array = Uint8Array.of(30, 40)
      arr.set(src, 1)
      expect(arr[0]).assertEqual(77)
      expect(arr[1]).assertEqual(30)
      expect(arr[2]).assertEqual(40)
      expect(arr[4]).assertEqual(66)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5500
     * @tc.name testUint8ArraySet02_055
     * @tc.desc Verify set(ArrayLike<number>) does not affect unrelated indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      arr[0] = 55
      arr[4] = 44
      const src: Array<number> = [50, 60]
      arr.set(src, 1)
      expect(arr[0]).assertEqual(55)
      expect(arr[1]).assertEqual(50)
      expect(arr[2]).assertEqual(60)
      expect(arr[4]).assertEqual(44)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5600
     * @tc.name testUint8ArraySet02_056
     * @tc.desc Verify set([-1, 256]) batch truncates to [255, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(2)
      const src: FixedArray<int> = [-1, 256]
      arr.set(src)
      expect(arr[0]).assertEqual(255)
      expect(arr[1]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5700
     * @tc.name testUint8ArraySet02_057
     * @tc.desc Verify set(FixedArray<int>) writes multiple boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: FixedArray<int> = [0, 127, 255]
      arr.set(src)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(127)
      expect(arr[2]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5800
     * @tc.name testUint8ArraySet02_058
     * @tc.desc Verify set(FixedArray<number>) writes float boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: FixedArray<number> = [0.0, 127.9, 255.0]
      arr.set(src)
      expect(arr[0]).assertEqual(0)
      expect(arr[1]).assertEqual(127)
      expect(arr[2]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_5900
     * @tc.name testUint8ArraySet02_059
     * @tc.desc Verify set(FixedArray) then set(Uint8Array) overwrites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src1: FixedArray<int> = [10, 20, 30]
      arr.set(src1)
      const src2: Uint8Array = Uint8Array.of(40, 50, 60)
      arr.set(src2)
      expect(arr[0]).assertEqual(40)
      expect(arr[1]).assertEqual(50)
      expect(arr[2]).assertEqual(60)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6000
     * @tc.name testUint8ArraySet02_060
     * @tc.desc Verify empty FixedArray then set with values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      arr[0] = 42
      arr[1] = 43
      arr[2] = 44
      const emptySrc: Array<number> = []
      arr.set(emptySrc, 0)
      expect(arr[0]).assertEqual(42)
      expect(arr[1]).assertEqual(43)
      expect(arr[2]).assertEqual(44)
      const src: FixedArray<int> = [7, 8, 9]
      arr.set(src)
      expect(arr[0]).assertEqual(7)
      expect(arr[1]).assertEqual(8)
      expect(arr[2]).assertEqual(9)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6100
     * @tc.name testUint8ArraySet02_061
     * @tc.desc Verify BigInt source converted via doubleValue() and FixedArray<int> write element-wise consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const bigSrc: Array<BigInt> = [BigInt(10), BigInt(20), BigInt(30)]
      const intSrc: FixedArray<int> = [10, 20, 30]
      a.set([bigSrc[0].doubleValue(), bigSrc[1].doubleValue(), bigSrc[2].doubleValue()])
      b.set(intSrc)
      expect(a[0]).assertEqual(b[0])
      expect(a[1]).assertEqual(b[1])
      expect(a[2]).assertEqual(b[2])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6200
     * @tc.name testUint8ArraySet02_062
     * @tc.desc Verify set large array overflow truncation consistency: (i+256) % 256 == i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(200)
      const src: FixedArray<int> = new FixedArray<int>(200, 0)
      for (let i: int = 0; i < 200; i++) {
        src[i] = i + 256
      }
      arr.set(src)
      for (let i: int = 0; i < 200; i++) {
        expect(arr[i]).assertEqual(i)
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6300
     * @tc.name testUint8ArraySet02_063
     * @tc.desc Verify five source types write element-wise consistent across types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t1: Uint8Array = new Uint8Array(3)
      const t2: Uint8Array = new Uint8Array(3)
      const t3: Uint8Array = new Uint8Array(3)
      const t4: Uint8Array = new Uint8Array(3)
      const t5: Uint8Array = new Uint8Array(3)
      t1.set([255, 0, 128] as FixedArray<int>)
      t2.set([255, 0, 128] as Array<number>)
      t3.set([255.0, 0.0, 128.0] as FixedArray<number>)
      t4.set(Uint8Array.of(255, 0, 128))
      t5.set([255, 0, 128] as Array<number>)
      for (let i: int = 0; i < 3; i++) {
        expect(t1[i]).assertEqual(t2[i])
        expect(t2[i]).assertEqual(t3[i])
        expect(t3[i]).assertEqual(t4[i])
        expect(t4[i]).assertEqual(t5[i])
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6400
     * @tc.name testUint8ArraySet02_064
     * @tc.desc Verify BigInt source converted via doubleValue() negative boundary truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(3)
      target.set([BigInt(300).doubleValue(), BigInt(-5).doubleValue(), BigInt(128).doubleValue()])
      expect(target[0]).assertEqual(44)
      expect(target[1]).assertEqual(251)
      expect(target[2]).assertEqual(128)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6500
     * @tc.name testUint8ArraySet02_065
     * @tc.desc Verify byteOffset unchanged after set across all overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5)
      const bo: int = target.byteOffset
      target.set(0, 1)
      expect(target.byteOffset).assertEqual(bo)
      const src1: FixedArray<int> = [2, 3]
      target.set(src1)
      expect(target.byteOffset).assertEqual(bo)
      target.set(Uint8Array.of(4))
      expect(target.byteOffset).assertEqual(bo)
      const src2: Array<number> = [5]
      target.set(src2)
      expect(target.byteOffset).assertEqual(bo)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6600
     * @tc.name testUint8ArraySet02_066
     * @tc.desc Verify set(FixedArray<int>,0) and set(ArrayLike<number>,0) same data byteLength consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(4)
      const b: Uint8Array = new Uint8Array(4)
      const src1: FixedArray<int> = [1, 2, 3, 4]
      a.set(src1, 0)
      const src2: Array<number> = [1, 2, 3, 4]
      b.set(src2, 0)
      expect(a.byteLength).assertEqual(b.byteLength)
      expect(a.length).assertEqual(b.length)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6700
     * @tc.name testUint8ArraySet02_067
     * @tc.desc Verify set(int,byte) and set(int,number) dispatch with value 7 produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const v: byte = 7
      a.set(0, v)
      b.set(0, 7)
      expect(a.toString()).assertEqual(b.toString())
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6800
     * @tc.name testUint8ArraySet02_068
     * @tc.desc Verify set(int,byte) and set(int,number) dispatch with value 255 produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const v: short = 255
      a.set(0, v)
      b.set(0, 255)
      expect(a[0]).assertEqual(b[0])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_6900
     * @tc.name testUint8ArraySet02_069
     * @tc.desc Verify set(int,byte) and set(int,number) dispatch with value 0 produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const v: byte = 0
      a.set(0, v)
      b.set(0, 0)
      expect(a[0]).assertEqual(b[0])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7000
     * @tc.name testUint8ArraySet02_070
     * @tc.desc Verify set(int,byte) and set(int,number) dispatch with value 128 produces consistent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const v: short = 128
      a.set(0, v)
      b.set(0, 128)
      expect(a[0]).assertEqual(b[0])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7100
     * @tc.name testUint8ArraySet02_071
     * @tc.desc Verify set(int,byte) and set(int,number) dispatch with overflow value 256 truncation consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3)
      const b: Uint8Array = new Uint8Array(3)
      const v: byte = 0
      a.set(0, 256)
      b.set(0, v)
      expect(a[0]).assertEqual(b[0])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7200
     * @tc.name testUint8ArraySet02_072
     * @tc.desc Verify set(int,byte=0x80) and set(int,number=128) with hex and decimal same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(1)
      const b: Uint8Array = new Uint8Array(1)
      const v: short = 128
      a.set(0, v)
      b.set(0, 0x80)
      expect(a[0]).assertEqual(b[0])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7300
     * @tc.name testUint8ArraySet02_073
     * @tc.desc Verify set(int,byte=0xFF) and set(int,number=255) with hex max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(1)
      const b: Uint8Array = new Uint8Array(1)
      const v: short = 255
      a.set(0, v)
      b.set(0, 0xFF)
      expect(a[0]).assertEqual(b[0])
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7400
     * @tc.name testUint8ArraySet02_074
     * @tc.desc Verify set(int,byte) default offset 0 writes to first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const v: byte = 42
      arr.set(0, v)
      expect(arr[0]).assertEqual(42)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7500
     * @tc.name testUint8ArraySet02_075
     * @tc.desc Verify set(int,byte,offset=1) writes to second position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const v: byte = 99
      arr.set(1, v)
      expect(arr[1]).assertEqual(99)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7600
     * @tc.name testUint8ArraySet02_076
     * @tc.desc Verify set(int,byte,offset=2) writes to third position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(4)
      const v: byte = 111
      arr.set(2, v)
      expect(arr[2]).assertEqual(111)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7700
     * @tc.name testUint8ArraySet02_077
     * @tc.desc Verify set(int,byte) after exception byteLength field remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const bl: int = arr.byteLength
      const v: byte = 99
      try {
        arr.set(100, v)
      } catch (e) {
        expect((e as Error).name).assertEqual('RangeError')
      }
      expect(arr.byteLength).assertEqual(bl)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7800
     * @tc.name testUint8ArraySet02_078
     * @tc.desc Verify set(int,byte) modifies target (same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const ref: Uint8Array = arr
      const v: short = 130
      arr.set(1, v)
      expect(ref[1]).assertEqual(130)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_7900
     * @tc.name testUint8ArraySet02_079
     * @tc.desc Verify set(int,byte) does not affect unrelated indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      arr[0] = 11
      arr[2] = 22
      arr[4] = 33
      const v: byte = 99
      arr.set(1, v)
      expect(arr[0]).assertEqual(11)
      expect(arr[1]).assertEqual(99)
      expect(arr[2]).assertEqual(22)
      expect(arr[4]).assertEqual(33)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8000
     * @tc.name testUint8ArraySet02_080
     * @tc.desc Verify set(int,number) does not affect unrelated indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      arr[0] = 11
      arr[2] = 22
      arr[4] = 33
      arr.set(3, 88)
      expect(arr[0]).assertEqual(11)
      expect(arr[2]).assertEqual(22)
      expect(arr[3]).assertEqual(88)
      expect(arr[4]).assertEqual(33)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8100
     * @tc.name testUint8ArraySet02_081
     * @tc.desc Verify set(0, 257) overflow truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 257)
      expect(arr[0]).assertEqual(1)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8200
     * @tc.name testUint8ArraySet02_082
     * @tc.desc Verify set(0, -2) negative value wraps to 254
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, -2)
      expect(arr[0]).assertEqual(254)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8300
     * @tc.name testUint8ArraySet02_083
     * @tc.desc Verify set(0, 0x100) hex 256 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 0x100)
      expect(arr[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8400
     * @tc.name testUint8ArraySet02_084
     * @tc.desc Verify set(0, 0x1FF) hex 511 truncates to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 0x1FF)
      expect(arr[0]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8500
     * @tc.name testUint8ArraySet02_085
     * @tc.desc Verify set(0, 3.5) float truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 3.5)
      expect(arr[0]).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8600
     * @tc.name testUint8ArraySet02_086
     * @tc.desc Verify set(0, 255.9) float truncates to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 255.9)
      expect(arr[0]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8700
     * @tc.name testUint8ArraySet02_087
     * @tc.desc Verify set(0, -1.5) truncates and wraps to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, -1.5)
      expect(arr[0]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8800
     * @tc.name testUint8ArraySet02_088
     * @tc.desc Verify set(0, 0) minimum value writes as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 0)
      expect(arr[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_8900
     * @tc.name testUint8ArraySet02_089
     * @tc.desc Verify set(0, 128) mid value writes as 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 128)
      expect(arr[0]).assertEqual(128)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_9000
     * @tc.name testUint8ArraySet02_090
     * @tc.desc Verify set(0, 0xFF) hex 255 writes as 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 0xFF)
      expect(arr[0]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_9100
     * @tc.name testUint8ArraySet02_091
     * @tc.desc Verify set(0, 0b11111111) binary 255 writes as 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 0b11111111)
      expect(arr[0]).assertEqual(255)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_9200
     * @tc.name testUint8ArraySet02_092
     * @tc.desc Verify set(0, 1e2) scientific notation writes as 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, 1e2)
      expect(arr[0]).assertEqual(100)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_9300
     * @tc.name testUint8ArraySet02_093
     * @tc.desc Verify set(0, -0) negative zero writes as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1)
      arr.set(0, -0)
      expect(arr[0]).assertEqual(0)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_9400
     * @tc.name testUint8ArraySet02_094
     * @tc.desc Verify set(int) then set(FixedArray) accumulates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      arr.set(0, 10)
      const src: FixedArray<int> = [20, 30]
      arr.set(src, 1)
      expect(arr[0]).assertEqual(10)
      expect(arr[1]).assertEqual(20)
      expect(arr[2]).assertEqual(30)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_9500
     * @tc.name testUint8ArraySet02_095
     * @tc.desc Verify set(FixedArray) then set(int) overwrites same position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(3)
      const src: FixedArray<number> = [1.0, 2.0, 3.0]
      arr.set(src)
      arr.set(1, 99)
      expect(arr[0]).assertEqual(1)
      expect(arr[1]).assertEqual(99)
      expect(arr[2]).assertEqual(3)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_9600
     * @tc.name testUint8ArraySet02_096
     * @tc.desc Verify set(ArrayLike) with offset before and after position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5)
      const src: Array<number> = [50, 60]
      arr.set(src, 1)
      arr.set(0, 11)
      arr.set(4, 44)
      expect(arr[0]).assertEqual(11)
      expect(arr[1]).assertEqual(50)
      expect(arr[2]).assertEqual(60)
      expect(arr[4]).assertEqual(44)
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_SET_02_9700
     * @tc.name testUint8ArraySet02_097
     * @tc.desc Verify boundary position non-int set combined with array set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ArraySet02_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Uint8Array = new Uint8Array(5)
      target.set(0, 11)
      target.set(4, 55)
      const src: FixedArray<int> = [22, 33]
      target.set(src, 1)
      target.set(3, 44)
      expect(target[0]).assertEqual(11)
      expect(target[1]).assertEqual(22)
      expect(target[2]).assertEqual(33)
      expect(target[3]).assertEqual(44)
      expect(target[4]).assertEqual(55)
    })
  })
}
