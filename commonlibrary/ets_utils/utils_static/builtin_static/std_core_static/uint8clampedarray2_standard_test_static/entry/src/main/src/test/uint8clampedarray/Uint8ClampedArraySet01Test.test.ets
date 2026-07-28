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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint8ClampedArraySetOneTest(): void {
  describe('Uint8ClampedArraySetOneTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_0100
     * @tc.name testUint8ClampedArraySetOne001
     * @tc.desc Verify set(0, 10) on [0,0,0] writes 10 at index 0, returns [10,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 10;
      arr.set(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_0200
     * @tc.name testUint8ClampedArraySetOne002
     * @tc.desc Verify set(src: Array<number>, insertPos=1) writes [1,2] at indices 1-2 in length-4 target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [1 as byte, 2 as byte];
      arr.set(src, 1);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_0300
     * @tc.name testUint8ClampedArraySetOne003
     * @tc.desc Verify set(src: Uint8ClampedArray) without offset writes [5,6,7] into length-3 target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([5, 6, 7]);
      dst.set(src);
      expect(dst[0]).assertEqual(5);
      expect(dst[1]).assertEqual(6);
      expect(dst[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_0400
     * @tc.name testUint8ClampedArraySetOne004
     * @tc.desc Verify set(2, 99) on [0,0,0] writes 99 at index 2, returns [0,0,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 99;
      arr.set(2, v);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(99);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_0500
     * @tc.name testUint8ClampedArraySetOne005
     * @tc.desc Verify set(1, 50) on [0,0,0] writes 50 at index 1, returns [0,50,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 50;
      arr.set(1, v);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(50);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_0600
     * @tc.name testUint8ClampedArraySetOne006
     * @tc.desc Verify set(3, v:byte) on length-3 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 77;
      try {
        arr.set(3, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_0700
     * @tc.name testUint8ClampedArraySetOne007
     * @tc.desc Verify set(-1, v:byte) on length-3 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 88;
      try {
        arr.set(-1, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_0800
     * @tc.name testUint8ClampedArraySetOne008
     * @tc.desc Verify set(INT_MAX, v:byte) on length-3 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 5;
      try {
        arr.set(2147483647, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_0900
     * @tc.name testUint8ClampedArraySetOne009
     * @tc.desc Verify set(INT_MIN, v:byte) on length-3 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const v: byte = 5;
      try {
        arr.set(-2147483648, v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1000
     * @tc.name testUint8ClampedArraySetOne010
     * @tc.desc Verify set(0, 0) on [100,100,100] writes 0 at index 0, returns [0,100,100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([100, 100, 100]);
      const v: byte = 0;
      arr.set(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1100
     * @tc.name testUint8ClampedArraySetOne011
     * @tc.desc Verify set(0, 127) on [0,0,0] writes 127 at index 0, returns [127,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 127;
      arr.set(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(127);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1200
     * @tc.name testUint8ClampedArraySetOne012
     * @tc.desc Verify set(0, -1) on [10,10,10] clamps -1 to 0 at index 0, returns [0,10,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 10, 10]);
      const v: byte = -1;
      arr.set(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1300
     * @tc.name testUint8ClampedArraySetOne013
     * @tc.desc Verify set(src: Array<number> empty, insertPos=0) on [1,2,3] keeps all elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([1, 2, 3]);
      const src: Array<number> = [];
      dst.set(src, 0);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1400
     * @tc.name testUint8ClampedArraySetOne014
     * @tc.desc Verify set(src: Array<number> [42], insertPos=0) writes 42 at index 0 of length-3 target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [42 as byte];
      dst.set(src, 0);
      expect(dst.length).assertEqual(3);
      expect(dst[0]).assertEqual(42);
      expect(dst[1]).assertEqual(0);
      expect(dst[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1500
     * @tc.name testUint8ClampedArraySetOne015
     * @tc.desc Verify set(src: Array<number> [10,20,30,40], insertPos=0) writes all four values into length-4 target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [10 as byte, 20 as byte, 30 as byte, 40 as byte];
      dst.set(src, 0);
      expect(dst[0]).assertEqual(10);
      expect(dst[1]).assertEqual(20);
      expect(dst[2]).assertEqual(30);
      expect(dst[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1600
     * @tc.name testUint8ClampedArraySetOne016
     * @tc.desc Verify set(Array<number> negative bytes [-1,-50,-128]) clamp all to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([99, 99, 99]);
      const src: Array<number> = [-1 as byte, -50 as byte, -128 as byte];
      dst.set(src, 0);
      expect(dst[0]).assertEqual(0);
      expect(dst[1]).assertEqual(0);
      expect(dst[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1700
     * @tc.name testUint8ClampedArraySetOne017
     * @tc.desc Verify set(src: Array<number> [127,127], insertPos=0) on [99,99,99] writes [127,127] at indices 0-1, leaves [2]=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([99, 99, 99]);
      const src: Array<number> = [127 as byte, 127 as byte];
      dst.set(src, 0);
      expect(dst.length).assertEqual(3);
      expect(dst[0]).assertEqual(127);
      expect(dst[1]).assertEqual(127);
      expect(dst[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1800
     * @tc.name testUint8ClampedArraySetOne018
     * @tc.desc Verify set(Array<number> mixed bytes [10,-5,100,-1]) clamp negatives to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [10 as byte, -5 as byte, 100 as byte, -1 as byte];
      dst.set(src, 0);
      expect(dst[0]).assertEqual(10);
      expect(dst[1]).assertEqual(0);
      expect(dst[2]).assertEqual(100);
      expect(dst[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_1900
     * @tc.name testUint8ClampedArraySetOne019
     * @tc.desc Verify set(src: Array<number> [1,2], insertPos=0) on [0,0,0,0] writes [1,2] at indices 0-1, leaves [0,0] at indices 2-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [1 as byte, 2 as byte];
      dst.set(src, 0);
      expect(dst.length).assertEqual(4);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(0);
      expect(dst[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2000
     * @tc.name testUint8ClampedArraySetOne020
     * @tc.desc Verify set(src: Array<number> [11,22], insertPos=1) on [0,0,0,0] writes [11,22] at indices 1-2, leaves [0] at indices 0,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [11 as byte, 22 as byte];
      dst.set(src, 1);
      expect(dst[0]).assertEqual(0);
      expect(dst[1]).assertEqual(11);
      expect(dst[2]).assertEqual(22);
      expect(dst[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2100
     * @tc.name testUint8ClampedArraySetOne021
     * @tc.desc Verify set(src: Array<number> [1,2], insertPos=2) on length-3 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1 as byte, 2 as byte];
      try {
        dst.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2200
     * @tc.name testUint8ClampedArraySetOne022
     * @tc.desc Verify set(src: Array<number> [1], insertPos=3) on length-3 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1 as byte];
      try {
        dst.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2300
     * @tc.name testUint8ClampedArraySetOne023
     * @tc.desc Verify set(src: Array<number> [1], insertPos=-1) on length-3 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1 as byte];
      try {
        dst.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2400
     * @tc.name testUint8ClampedArraySetOne024
     * @tc.desc Verify set(src: Array<number> [1], insertPos=INT_MAX) throws IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1 as byte];
      try {
        dst.set(src, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2500
     * @tc.name testUint8ClampedArraySetOne025
     * @tc.desc Verify set(src: Array<number> [1], insertPos=INT_MIN) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1 as byte];
      try {
        dst.set(src, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2600
     * @tc.name testUint8ClampedArraySetOne026
     * @tc.desc Verify set(src: Uint8ClampedArray empty size-0) on [1,2,3] keeps all elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([1, 2, 3]);
      const src = new Uint8ClampedArray(0);
      dst.set(src);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2700
     * @tc.name testUint8ClampedArraySetOne027
     * @tc.desc Verify set(src: Uint8ClampedArray [77]) writes 77 at index 0, leaves [1],[2] unchanged at 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 99, 99]);
      const src = new Uint8ClampedArray([77]);
      dst.set(src);
      expect(dst[0]).assertEqual(77);
      expect(dst[1]).assertEqual(99);
      expect(dst[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2800
     * @tc.name testUint8ClampedArraySetOne028
     * @tc.desc Verify set(src: Uint8ClampedArray [10,20,30]) writes all three values into length-3 target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([10, 20, 30]);
      dst.set(src);
      expect(dst[0]).assertEqual(10);
      expect(dst[1]).assertEqual(20);
      expect(dst[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_2900
     * @tc.name testUint8ClampedArraySetOne029
     * @tc.desc Verify set(src: Uint8ClampedArray [0,0,0]) overwrites [100,100,100] all to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([100, 100, 100]);
      const src = new Uint8ClampedArray([0, 0, 0]);
      dst.set(src);
      expect(dst[0]).assertEqual(0);
      expect(dst[1]).assertEqual(0);
      expect(dst[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3000
     * @tc.name testUint8ClampedArraySetOne030
     * @tc.desc Verify set(src: Uint8ClampedArray [255,255,255]) writes all max-boundary values into length-3 target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([255, 255, 255]);
      dst.set(src);
      expect(dst[0]).assertEqual(255);
      expect(dst[1]).assertEqual(255);
      expect(dst[2]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3100
     * @tc.name testUint8ClampedArraySetOne031
     * @tc.desc Verify set(src: Uint8ClampedArray [0,255,0,255]) writes alternating boundary values into length-4 target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([1, 1, 1, 1]);
      const src = new Uint8ClampedArray([0, 255, 0, 255]);
      dst.set(src);
      expect(dst[0]).assertEqual(0);
      expect(dst[1]).assertEqual(255);
      expect(dst[2]).assertEqual(0);
      expect(dst[3]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3200
     * @tc.name testUint8ClampedArraySetOne032
     * @tc.desc Verify set(src: Uint8ClampedArray [1,2,3,4]) copies full source to destination, verifies length and last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0, 0]);
      const src = new Uint8ClampedArray([1, 2, 3, 4]);
      dst.set(src);
      expect(dst.length).assertEqual(4);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(3);
      expect(dst[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3300
     * @tc.name testUint8ClampedArraySetOne033
     * @tc.desc Verify set(src: Uint8ClampedArray [1,2]) on [9,9,9,9,9] writes [1,2] at indices 0-1, leaves [9,9,9] at indices 2-4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([9, 9, 9, 9, 9]);
      const src = new Uint8ClampedArray([1, 2]);
      dst.set(src);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(9);
      expect(dst[3]).assertEqual(9);
      expect(dst[4]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3400
     * @tc.name testUint8ClampedArraySetOne034
     * @tc.desc Verify set(src: Uint8ClampedArray larger than target) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0]);
      const src = new Uint8ClampedArray([1, 2, 3]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3500
     * @tc.name testUint8ClampedArraySetOne035
     * @tc.desc Verify set(src: Uint8ClampedArray.of(11,22,33)) on [0,0,0] writes [11,22,33]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src = Uint8ClampedArray.of(11, 22, 33);
      dst.set(src);
      expect(dst.length).assertEqual(3);
      expect(dst[0]).assertEqual(11);
      expect(dst[1]).assertEqual(22);
      expect(dst[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3600
     * @tc.name testUint8ClampedArraySetOne036
     * @tc.desc Verify parent.set(sub: Uint8ClampedArray) where sub=parent.subarray(0,2), sub retains view of [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(0, 2);
      parent.set(sub);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(2);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3700
     * @tc.name testUint8ClampedArraySetOne037
     * @tc.desc Verify parent.set(sub) copies sub[0]=6 to parent[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([5, 6, 7]);
      const sub = parent.subarray(1, 2);
      parent.set(sub);
      expect(sub.length).assertEqual(1);
      expect(sub[0]).assertEqual(6);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3800
     * @tc.name testUint8ClampedArraySetOne038
     * @tc.desc Verify parent.set(sub: Uint8ClampedArray) where sub=parent.subarray() self-copies, parent stays [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30]);
      const sub = parent.subarray();
      parent.set(sub);
      expect(parent.length).assertEqual(3);
      expect(parent[0]).assertEqual(10);
      expect(parent[1]).assertEqual(20);
      expect(parent[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_3900
     * @tc.name testUint8ClampedArraySetOne039
     * @tc.desc Verify set(src: Uint8ClampedArray) from shared ArrayBuffer writes overlapping-view values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const a = new Uint8ClampedArray(buf, 0, 4);
      const b = new Uint8ClampedArray(buf, 0, 2);
      b[0] = 77;
      b[1] = 88;
      a.set(b);
      expect(a.length).assertEqual(4);
      expect(a[0]).assertEqual(77);
      expect(a[1]).assertEqual(88);
      expect(a[2]).assertEqual(0);
      expect(a[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4000
     * @tc.name testUint8ClampedArraySetOne040
     * @tc.desc Verify set(0, 5) on [0,0,0] writes 5 at index 0 and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 5;
      const ret = arr.set(0, v);
      expect(arr.length).assertEqual(3);
      expect(ret).assertEqual(undefined);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4100
     * @tc.name testUint8ClampedArraySetOne041
     * @tc.desc Verify set(src: Array<number> [1], insertPos=0) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1 as byte];
      const ret = dst.set(src, 0);
      expect(dst.length).assertEqual(3);
      expect(ret).assertEqual(undefined);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(0);
      expect(dst[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4200
     * @tc.name testUint8ClampedArraySetOne042
     * @tc.desc Verify set(src: Uint8ClampedArray [1,2,3]) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([1, 2, 3]);
      const ret = dst.set(src);
      expect(dst.length).assertEqual(3);
      expect(ret).assertEqual(undefined);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4300
     * @tc.name testUint8ClampedArraySetOne043
     * @tc.desc Verify set(0, 5) on [0,0,0] writes 5 at index 0, length stays 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 5;
      arr.set(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4400
     * @tc.name testUint8ClampedArraySetOne044
     * @tc.desc Verify set(0, 5) on [0,0,0] writes 5 at index 0 and preserves buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const origBuf = arr.buffer;
      const v: byte = 5;
      arr.set(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr.buffer).assertEqual(origBuf);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4500
     * @tc.name testUint8ClampedArraySetOne045
     * @tc.desc Verify set(src: Uint8ClampedArray) on offset view preserves byteOffset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const dst = new Uint8ClampedArray(buf, 2, 4);
      const src = new Uint8ClampedArray([1, 2]);
      dst.set(src);
      expect(dst.length).assertEqual(4);
      expect(dst.byteOffset).assertEqual(2);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(0);
      expect(dst[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4600
     * @tc.name testUint8ClampedArraySetOne046
     * @tc.desc Verify set(src: Array<number> length=3, insertPos=0) on length-2 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [1 as byte, 2 as byte, 3 as byte];
      try {
        dst.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4700
     * @tc.name testUint8ClampedArraySetOne047
     * @tc.desc Verify set(src: Uint8ClampedArray) on zero-length target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray(0);
      const src = new Uint8ClampedArray([1]);
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4800
     * @tc.name testUint8ClampedArraySetOne048
     * @tc.desc Verify set(src: Array<number>, insertPos=0) on zero-length target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray(0);
      const src: Array<number> = [1 as byte];
      try {
        dst.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_4900
     * @tc.name testUint8ClampedArraySetOne049
     * @tc.desc Verify set(src: Uint8ClampedArray empty) on zero-length target succeeds with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray(0);
      const src = new Uint8ClampedArray(0);
      dst.set(src);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5000
     * @tc.name testUint8ClampedArraySetOne050
     * @tc.desc Verify set(src: Array<number> empty, insertPos=0) on zero-length target succeeds with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray(0);
      const src: Array<number> = [];
      dst.set(src, 0);
      expect(dst.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5100
     * @tc.name testUint8ClampedArraySetOne051
     * @tc.desc Verify set(src: Array<number> empty, insertPos=3) on [7,8,9] keeps all elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([7, 8, 9]);
      const src: Array<number> = [];
      dst.set(src, 3);
      expect(dst.length).assertEqual(3);
      expect(dst[0]).assertEqual(7);
      expect(dst[1]).assertEqual(8);
      expect(dst[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5200
     * @tc.name testUint8ClampedArraySetOne052
     * @tc.desc Verify set(1, 99) on [10,20,30,40] writes 99 at index 1, returns [10,99,30,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20, 30, 40]);
      const v: byte = 99;
      arr.set(1, v);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5300
     * @tc.name testUint8ClampedArraySetOne053
     * @tc.desc Verify set(src: Array<number> [1,2], insertPos=1) writes two values at offset 1, leaves others unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const src: Array<number> = [1 as byte, 2 as byte];
      dst.set(src, 1);
      expect(dst[0]).assertEqual(10);
      expect(dst[1]).assertEqual(1);
      expect(dst[2]).assertEqual(2);
      expect(dst[3]).assertEqual(40);
      expect(dst[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5400
     * @tc.name testUint8ClampedArraySetOne054
     * @tc.desc Verify set(src: Uint8ClampedArray [7,8]) writes first two elements, leaves trailing unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([10, 20, 30, 40, 50]);
      const src = new Uint8ClampedArray([7, 8]);
      dst.set(src);
      expect(dst[0]).assertEqual(7);
      expect(dst[1]).assertEqual(8);
      expect(dst[2]).assertEqual(30);
      expect(dst[3]).assertEqual(40);
      expect(dst[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5500
     * @tc.name testUint8ClampedArraySetOne055
     * @tc.desc Verify set(0,10)+set(1,20)+set(2,30) on [0,0,0] writes [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const setValue1: byte = 10;
      const setValue2: byte = 20;
      const setValue3: byte = 30;
      arr.set(0, setValue1);
      arr.set(1, setValue2);
      arr.set(2, setValue3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5600
     * @tc.name testUint8ClampedArraySetOne056
     * @tc.desc Verify set(0,10) then set(0,20) on [0,0,0], later write overwrites index 0, returns [20,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const setValue1: byte = 10;
      const setValue2: byte = 20;
      arr.set(0, setValue1);
      arr.set(0, setValue2);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5700
     * @tc.name testUint8ClampedArraySetOne057
     * @tc.desc Verify set(src: Array<number> [1,2], insertPos=0) changes visible through new view on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1 as byte, 2 as byte];
      dst.set(src, 0);
      const view = new Uint8ClampedArray(dst.buffer);
      expect(dst.length).assertEqual(3);
      expect(view[0]).assertEqual(1);
      expect(view[1]).assertEqual(2);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5800
     * @tc.name testUint8ClampedArraySetOne058
     * @tc.desc Verify modifying source Uint8ClampedArray after set does not affect destination (copy semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([1, 2, 3]);
      dst.set(src);
      src[0] = 99;
      expect(dst.length).assertEqual(3);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_5900
     * @tc.name testUint8ClampedArraySetOne059
     * @tc.desc Verify set(src: Uint8ClampedArray [1,2,3]) copies by value, modifying dst[0] to 99 after set does not affect src[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([1, 2, 3]);
      dst.set(src);
      dst[0] = 99;
      expect(dst.length).assertEqual(3);
      expect(src[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6000
     * @tc.name testUint8ClampedArraySetOne060
     * @tc.desc Verify two sequential set(Array<number>) calls at offset 0: second write overwrites first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src1: Array<number> = [1 as byte, 2 as byte];
      const src2: Array<number> = [11 as byte, 22 as byte];
      dst.set(src1, 0);
      dst.set(src2, 0);
      expect(dst.length).assertEqual(3);
      expect(dst[0]).assertEqual(11);
      expect(dst[1]).assertEqual(22);
      expect(dst[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6100
     * @tc.name testUint8ClampedArraySetOne061
     * @tc.desc Verify set(src: Uint8ClampedArray of 256 elements 0..255) copies all values, checks dst[0]=0, dst[127]=127, dst[255]=255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray(256);
      const src = new Uint8ClampedArray(256);
      let i = 0;
      for (i = 0; i < 256; i++) {
        src[i] = i;
      }
      dst.set(src);
      expect(dst.length).assertEqual(256);
      expect(dst[0]).assertEqual(0);
      expect(dst[127]).assertEqual(127);
      expect(dst[255]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6200
     * @tc.name testUint8ClampedArraySetOne062
     * @tc.desc Verify set(0, 100) on [0,0,0] writes 100 at index 0, returns [100,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 100);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6300
     * @tc.name testUint8ClampedArraySetOne063
     * @tc.desc Verify set(src: Array<number> [10.0,20.0,30.0]) writes float values truncated to integers, asserts first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [10.0, 20.0, 30.0];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6400
     * @tc.name testUint8ClampedArraySetOne064
     * @tc.desc Verify set(src: Uint8ClampedArray [1,2], insertPos=1) writes first element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src = new Uint8ClampedArray([1, 2]);
      arr.set(src, 1);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6500
     * @tc.name testUint8ClampedArraySetOne065
     * @tc.desc Verify set(1, 77) on [0,0,0] writes 77 at index 1, returns [0,77,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(1, 77);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(77);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6600
     * @tc.name testUint8ClampedArraySetOne066
     * @tc.desc Verify set(2, 88) on [0,0,0] writes 88 at index 2, returns [0,0,88]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(2, 88);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(88);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });





    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6700
     * @tc.name testUint8ClampedArraySetOne067
     * @tc.desc Verify set(0, 50) on zero-length target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      try {
        arr.set(0, 50);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6800
     * @tc.name testUint8ClampedArraySetOne068
     * @tc.desc Verify set(0, 0) on [99,99,99] writes 0 at index 0, returns [0,99,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_6900
     * @tc.name testUint8ClampedArraySetOne069
     * @tc.desc Verify set(0, 255) on [0,0,0] writes 255 at index 0, returns [255,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 255);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7000
     * @tc.name testUint8ClampedArraySetOne070
     * @tc.desc Verify set(0, 128) on [0,0,0] writes 128 at index 0, returns [128,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 128);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7100
     * @tc.name testUint8ClampedArraySetOne071
     * @tc.desc Verify set(0, 256) on [0,0,0] clamps 256 to 255 at index 0, returns [255,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 256);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7200
     * @tc.name testUint8ClampedArraySetOne072
     * @tc.desc Verify set(0, -1) on [99,99,99] clamps -1 to 0 at index 0, returns [0,99,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, -1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7300
     * @tc.name testUint8ClampedArraySetOne073
     * @tc.desc Verify set(0, NaN) on [99,99,99] clamps NaN to 0 at index 0, returns [0,99,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, Number.NaN);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7400
     * @tc.name testUint8ClampedArraySetOne074
     * @tc.desc Verify set(0, +Infinity) on [0,0,0] clamps to 255 at index 0, returns [255,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, Number.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7500
     * @tc.name testUint8ClampedArraySetOne075
     * @tc.desc Verify set(0, -Infinity) on [99,99,99] clamps to 0 at index 0, returns [0,99,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, -Number.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7600
     * @tc.name testUint8ClampedArraySetOne076
     * @tc.desc Verify set(0, 0.4) on [99,99,99] rounds to 0, returns [0,99,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, 0.4);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7700
     * @tc.name testUint8ClampedArraySetOne077
     * @tc.desc Verify set(0, 0.5) on [99,99,99] rounds via half-even to 0, returns [0,99,99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, 0.5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7800
     * @tc.name testUint8ClampedArraySetOne078
     * @tc.desc Verify set(0, 0.9) on [0,0,0] rounds to 1 at index 0, returns [1,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 0.9);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_7900
     * @tc.name testUint8ClampedArraySetOne079
     * @tc.desc Verify set(0, 1.5) on [0,0,0] rounds via half-even to 2, returns [2,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 1.5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_8000
     * @tc.name testUint8ClampedArraySetOne080
     * @tc.desc Verify set(0, 2.5) on [0,0,0] rounds via half-even to 2, returns [2,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 2.5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_ONE_8100
     * @tc.name testUint8ClampedArraySetOne081
     * @tc.desc Verify set(0, 127.5) on [0,0,0] rounds via half-even to 128, returns [128,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 127.5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });
  });
}
