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

export default function uint8ClampedArraySetTwoTest(): void {
  describe('Uint8ClampedArraySetTwoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_0100
     * @tc.name testUint8ClampedArraySetTwo001
     * @tc.desc Verify val=128.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 128.5);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_0200
     * @tc.name testUint8ClampedArraySetTwo002
     * @tc.desc Verify set(0, -0) on [99,99,99] writes 0 at index 0, arr[1]=99 arr[2]=99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, -0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_0300
     * @tc.name testUint8ClampedArraySetTwo003
     * @tc.desc Verify val=Number.MIN_VALUE clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      arr.set(0, Number.MIN_VALUE);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_0400
     * @tc.name testUint8ClampedArraySetTwo004
     * @tc.desc Verify set(Array<number>) with empty source keeps target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const src: Array<number> = [];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_0500
     * @tc.name testUint8ClampedArraySetTwo005
     * @tc.desc Verify set(Array<number>) copies single 99.0 value at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [99.0];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_0600
     * @tc.name testUint8ClampedArraySetTwo006
     * @tc.desc Verify set(Array<number> [10,20,30]) on [0,0,0] copies 10,20,30 to indices 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [10.0, 20.0, 30.0];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(30);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_0700
     * @tc.name testUint8ClampedArraySetTwo007
     * @tc.desc Verify set(Array<number> [0.0]) copies value 0 to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      const src: Array<number> = [0.0];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_0800
     * @tc.name testUint8ClampedArraySetTwo008
     * @tc.desc Verify set(Array<number> [255.0]) copies value 255 to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [255.0];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_0900
     * @tc.name testUint8ClampedArraySetTwo009
     * @tc.desc Verify Array<number> 256.0 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [256.0];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1000
     * @tc.name testUint8ClampedArraySetTwo010
     * @tc.desc Verify Array<number> -1.0 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      const src: Array<number> = [-1.0];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1100
     * @tc.name testUint8ClampedArraySetTwo011
     * @tc.desc Verify Array<number> NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      const src: Array<number> = [Number.NaN];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1200
     * @tc.name testUint8ClampedArraySetTwo012
     * @tc.desc Verify Array<number> Infinity clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [Number.POSITIVE_INFINITY];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1300
     * @tc.name testUint8ClampedArraySetTwo013
     * @tc.desc Verify Array<number> -Infinity clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      const src: Array<number> = [-Number.POSITIVE_INFINITY];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1400
     * @tc.name testUint8ClampedArraySetTwo014
     * @tc.desc Verify Array<number> 0.5 half-even 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      const src: Array<number> = [0.5];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1500
     * @tc.name testUint8ClampedArraySetTwo015
     * @tc.desc Verify Array<number> 1.5 half-even 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1.5];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1600
     * @tc.name testUint8ClampedArraySetTwo016
     * @tc.desc Verify Array<number> 127.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [127.5];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1700
     * @tc.name testUint8ClampedArraySetTwo017
     * @tc.desc Verify Array<number> 128.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [128.5];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1800
     * @tc.name testUint8ClampedArraySetTwo018
     * @tc.desc Verify set(Array<number> [0.9]) rounds 0.9 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [0.9];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_1900
     * @tc.name testUint8ClampedArraySetTwo019
     * @tc.desc Verify Array<number> 1e9 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1e9];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2000
     * @tc.name testUint8ClampedArraySetTwo020
     * @tc.desc Verify Array<number> -1e9 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      const src: Array<number> = [-1e9];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2100
     * @tc.name testUint8ClampedArraySetTwo021
     * @tc.desc Verify Array<number> Number.MAX_VALUE clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [Number.MAX_VALUE];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2200
     * @tc.name testUint8ClampedArraySetTwo022
     * @tc.desc Verify Array<number> Number.MIN_VALUE clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      const src: Array<number> = [Number.MIN_VALUE];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(99);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2300
     * @tc.name testUint8ClampedArraySetTwo023
     * @tc.desc Verify set(Array<number> [256,-1,NaN,100]) clamps 256, -1, NaN and keeps 100 at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [256.0, -1.0, Number.NaN, 100.0];
      arr.set(src);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(100);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2400
     * @tc.name testUint8ClampedArraySetTwo024
     * @tc.desc Verify set(Array<number>) RangeError when source length exceeds target length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1.0, 2.0, 3.0, 4.0];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2500
     * @tc.name testUint8ClampedArraySetTwo025
     * @tc.desc Verify set(Array<number>) accepts empty source for empty target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const src: Array<number> = [];
      arr.set(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2600
     * @tc.name testUint8ClampedArraySetTwo026
     * @tc.desc Verify set(Array<number>) RangeError when non-empty source targets an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const src: Array<number> = [1.0];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2700
     * @tc.name testUint8ClampedArraySetTwo027
     * @tc.desc Verify set(Array<number> [0xFF,0x7F]) copies hex 0xFF as 255 to index 0 and 0x7F as 127 to index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [0xFF, 0x7F];
      arr.set(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2800
     * @tc.name testUint8ClampedArraySetTwo028
     * @tc.desc Verify set(Uint8ClampedArray, offset=0) copies two source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src = new Uint8ClampedArray([10, 20]);
      arr.set(src, 0);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(20);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_2900
     * @tc.name testUint8ClampedArraySetTwo029
     * @tc.desc Verify set(empty Uint8ClampedArray, offset=0) on [1,2,3] keeps target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const src = new Uint8ClampedArray(0);
      arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3000
     * @tc.name testUint8ClampedArraySetTwo030
     * @tc.desc Verify set(empty Uint8ClampedArray, offset=3) on [1,2,3] keeps target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const src = new Uint8ClampedArray(0);
      arr.set(src, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3100
     * @tc.name testUint8ClampedArraySetTwo031
     * @tc.desc Verify set(Uint8ClampedArray, offset=0) copies value 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([200]);
      arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(200);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3200
     * @tc.name testUint8ClampedArraySetTwo032
     * @tc.desc Verify set(Uint8ClampedArray, offset=0) copies source with the same length as target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([10, 20, 30]);
      arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(30);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3300
     * @tc.name testUint8ClampedArraySetTwo033
     * @tc.desc Verify set(Uint8ClampedArray, offset=0) copies zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99, 99, 99]);
      const src = new Uint8ClampedArray([0, 0]);
      arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3400
     * @tc.name testUint8ClampedArraySetTwo034
     * @tc.desc Verify set(Uint8ClampedArray, offset=0) copies 255 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([255, 255]);
      arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3500
     * @tc.name testUint8ClampedArraySetTwo035
     * @tc.desc Verify set(Uint8ClampedArray from ArrayBuffer, offset=1) copies buffer-backed source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const src = new Uint8ClampedArray(buf);
      src[0] = 11;
      src[1] = 22;
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(src, 1);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(11);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3600
     * @tc.name testUint8ClampedArraySetTwo036
     * @tc.desc Verify set(subarray(1,3), 0) on new [0,0,0,0] copies [2,3] to arr[0..1], parent unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = parent.subarray(1, 3);
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.set(sub, 0);
      expect(parent.length).assertEqual(4);
      expect(sub.length).assertEqual(2);
      expect(arr.length).assertEqual(4);
      expect(parent[0]).assertEqual(1);
      expect(parent[1]).assertEqual(2);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
      expect(sub[0]).assertEqual(2);
      expect(sub[1]).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3700
     * @tc.name testUint8ClampedArraySetTwo037
     * @tc.desc Verify set(Uint8ClampedArray [5,6], 1) on [0,0,0,0] writes 5 at index 1 and 6 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src = new Uint8ClampedArray([5, 6]);
      arr.set(src, 1);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(6);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3800
     * @tc.name testUint8ClampedArraySetTwo038
     * @tc.desc Verify set(Uint8ClampedArray [5,6], 2) on [0,0,0,0] writes 5 at index 2 and 6 at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src = new Uint8ClampedArray([5, 6]);
      arr.set(src, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(6);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_3900
     * @tc.name testUint8ClampedArraySetTwo039
     * @tc.desc Verify offset=length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([5]);
      try {
        arr.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4000
     * @tc.name testUint8ClampedArraySetTwo040
     * @tc.desc Verify offset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([5]);
      try {
        arr.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4100
     * @tc.name testUint8ClampedArraySetTwo041
     * @tc.desc Verify offset=INT_MIN RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([5]);
      try {
        arr.set(src, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4200
     * @tc.name testUint8ClampedArraySetTwo042
     * @tc.desc Verify set(Uint8ClampedArray [5,6], offset=2) on length-3 target throws RangeError (offset+srcLen > length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([5, 6]);
      try {
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4300
     * @tc.name testUint8ClampedArraySetTwo043
     * @tc.desc Verify set(0, 1) on [0,0,0] writes 1 at index 0 and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const ret = arr.set(0, 1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(ret).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4400
     * @tc.name testUint8ClampedArraySetTwo044
     * @tc.desc Verify set(Array<number> [1.0]) on [0,0,0] writes 1 at index 0 and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1.0];
      const ret = arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(ret).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4500
     * @tc.name testUint8ClampedArraySetTwo045
     * @tc.desc Verify set(Uint8ClampedArray [1], 0) on [0,0,0] writes 1 at index 0 and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([1]);
      const ret = arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(ret).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4600
     * @tc.name testUint8ClampedArraySetTwo046
     * @tc.desc Verify set(Uint8ClampedArray [1], 0) on [0,0,0] writes 1 at index 0 and buffer byteLength stays unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const beforeByteLength: int = arr.buffer.byteLength;
      const src = new Uint8ClampedArray([1]);
      arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr.buffer.byteLength).assertEqual(beforeByteLength);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4700
     * @tc.name testUint8ClampedArraySetTwo047
     * @tc.desc Verify set(10, 99) on [1,2,3] throws RangeError and array stays [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        arr.set(10, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4800
     * @tc.name testUint8ClampedArraySetTwo048
     * @tc.desc Verify set(Array<number> [99,88,77]) on length-2 target throws RangeError and arr[0] stays 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const src: Array<number> = [99.0, 88.0, 77.0];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_4900
     * @tc.name testUint8ClampedArraySetTwo049
     * @tc.desc Verify set(Uint8ClampedArray [99,88], 2) on length-3 target throws RangeError and arr[0] stays 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const src = new Uint8ClampedArray([99, 88]);
      try {
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5000
     * @tc.name testUint8ClampedArraySetTwo050
     * @tc.desc Verify set(empty Uint8ClampedArray, offset=0) on empty target succeeds with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const src = new Uint8ClampedArray(0);
      arr.set(src, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5100
     * @tc.name testUint8ClampedArraySetTwo051
     * @tc.desc Verify set(0, 256) on [0] clamps 256 to 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      arr.set(0, 256);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5200
     * @tc.name testUint8ClampedArraySetTwo052
     * @tc.desc Verify set(0, NaN) clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      arr.set(0, Number.NaN);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5300
     * @tc.name testUint8ClampedArraySetTwo053
     * @tc.desc Verify set(Array<number> [256,100]) on [0,0] clamps 256 to 255 and keeps 100 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [256.0, 100.0];
      arr.set(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5400
     * @tc.name testUint8ClampedArraySetTwo054
     * @tc.desc Verify Array<number> 0.5 half-even 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const src: Array<number> = [0.5];
      arr.set(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5500
     * @tc.name testUint8ClampedArraySetTwo055
     * @tc.desc Verify Array<number> 2.5 half-even 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const src: Array<number> = [2.5];
      arr.set(src);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5600
     * @tc.name testUint8ClampedArraySetTwo056
     * @tc.desc Verify set(Uint8ClampedArray [0], offset=0) copies value 0 to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const src = new Uint8ClampedArray([0]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5700
     * @tc.name testUint8ClampedArraySetTwo057
     * @tc.desc Verify set(subarray(0,3), 1) on [1,2,3,4,5] self-set makes sub[0]=1 sub[1]=1 sub[2]=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4, 5]);
      const sub = arr.subarray(0, 3);
      arr.set(sub, 1);
      expect(sub.length).assertEqual(3);
      expect(sub[0]).assertEqual(1);
      expect(sub[1]).assertEqual(1);
      expect(sub[2]).assertEqual(2);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5800
     * @tc.name testUint8ClampedArraySetTwo058
     * @tc.desc Verify set(Uint8ClampedArray from ArrayBuffer [7,8], 0) on [0,0,0] copies 7 to index 0 and 8 to index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray(new ArrayBuffer(2));
      src[0] = 7;
      src[1] = 8;
      arr.set(src, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(7);
      expect(arr[1]).assertEqual(8);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_5900
     * @tc.name testUint8ClampedArraySetTwo059
     * @tc.desc Verify set(Uint8ClampedArray [10,20], 0) copies values, later modifying src[0] to 99 does not affect arr[0]=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([10, 20]);
      arr.set(src, 0);
      src[0] = 99;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6000
     * @tc.name testUint8ClampedArraySetTwo060
     * @tc.desc Verify set(Uint8ClampedArray [1,2], 0) copies values, later modifying src[1] to 99 does not affect arr[1]=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src = new Uint8ClampedArray([1, 2]);
      arr.set(src, 0);
      src[1] = 99;
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6100
     * @tc.name testUint8ClampedArraySetTwo061
     * @tc.desc Verify self-set of subarray(1,3) to offset 0 on [1,2,3,4] makes sub[0]=3 sub[1]=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const sub = arr.subarray(1, 3);
      arr.set(sub, 0);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(3);
      expect(sub[1]).assertEqual(3);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6200
     * @tc.name testUint8ClampedArraySetTwo062
     * @tc.desc Verify set(Array<number> [1,2]) on [0,0,0,0] writes 1 at index 0 and 2 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [1, 2];
      arr.set(src);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6300
     * @tc.name testUint8ClampedArraySetTwo063
     * @tc.desc Verify set(Array<number> [10,20], 1) on [0,0,0,0] writes 10 at index 1 and 20 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [10.0, 20.0];
      arr.set(src, 1);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(10);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6400
     * @tc.name testUint8ClampedArraySetTwo064
     * @tc.desc Verify set(ArrayLike<number> [1,2]) on [9,9,9] writes 1 at index 0 and 2 at index 1, arr[2]=9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9, 9]);
      const al: ArrayLike<number> = [1.0, 2.0];
      arr.set(al);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6500
     * @tc.name testUint8ClampedArraySetTwo065
     * @tc.desc Verify set(ArrayLike<number> [5.0], offset=2) writes single element at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9, 9]);
      const al: ArrayLike<number> = [5.0];
      arr.set(al, 2);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(5);
      expect(arr[0]).assertEqual(9);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6600
     * @tc.name testUint8ClampedArraySetTwo066
     * @tc.desc Verify set(Array<number> [byte 42]) copies byte variable value to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 42;
      const src: Array<number> = [v];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6700
     * @tc.name testUint8ClampedArraySetTwo067
     * @tc.desc Verify set(Array<number> [byte 0]) copies zero byte variable to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9]);
      const v: byte = 0;
      const src: Array<number> = [v];
      arr.set(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6800
     * @tc.name testUint8ClampedArraySetTwo068
     * @tc.desc Verify set(Array<number> [byte 127]) copies byte variable value to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const v: byte = 127;
      const src: Array<number> = [v];
      arr.set(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(127);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_6900
     * @tc.name testUint8ClampedArraySetTwo069
     * @tc.desc Verify set(Array<number> [byte -128]) negative byte variable clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5]);
      const v: byte = -128;
      const src: Array<number> = [v];
      arr.set(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7000
     * @tc.name testUint8ClampedArraySetTwo070
     * @tc.desc Verify set(Array<number> [byte 1,2,3]) on [9,9,9,9] copies 1,2,3 to indices 0,1,2, arr[3]=9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9, 9, 9]);
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const src: Array<number> = [a, b, c];
      arr.set(src);
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[3]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7100
     * @tc.name testUint8ClampedArraySetTwo071
     * @tc.desc Verify set(Array<number> [byte 1,2,3]) on length-2 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const a: byte = 1;
      const b: byte = 2;
      const c: byte = 3;
      const src: Array<number> = [a, b, c];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7200
     * @tc.name testUint8ClampedArraySetTwo072
     * @tc.desc Verify set(Array<number> []) on empty target succeeds with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const src: Array<number> = [];
      arr.set(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7300
     * @tc.name testUint8ClampedArraySetTwo073
     * @tc.desc Verify set(Array<number> [byte 1]) on empty target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([]);
      const v: byte = 1;
      const src: Array<number> = [v];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7400
     * @tc.name testUint8ClampedArraySetTwo074
     * @tc.desc Verify set(Array<number> [byte 100]) copies byte variable value to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const v: byte = 100;
      const src: Array<number> = [v];
      arr.set(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7500
     * @tc.name testUint8ClampedArraySetTwo075
     * @tc.desc Verify set(Array<number> [byte 5]) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const v: byte = 5;
      const src: Array<number> = [v];
      const r = arr.set(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(0);
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7600
     * @tc.name testUint8ClampedArraySetTwo076
     * @tc.desc Verify set(Array<number> [1,2], 0) on [0,0,0,0] writes 1 at index 0 and 2 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [1.0, 2.0];
      arr.set(src, 0);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7700
     * @tc.name testUint8ClampedArraySetTwo077
     * @tc.desc Verify set(Array<number> [7,8], 2) on [0,0,0,0] writes 7 at index 2 and 8 at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [7.0, 8.0];
      arr.set(src, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(8);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7800
     * @tc.name testUint8ClampedArraySetTwo078
     * @tc.desc Verify Array<number> insertPos=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1.0];
      try {
        arr.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_7900
     * @tc.name testUint8ClampedArraySetTwo079
     * @tc.desc Verify Array<number> insertPos=length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1.0];
      try {
        arr.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8000
     * @tc.name testUint8ClampedArraySetTwo080
     * @tc.desc Verify set(Array<number> [1.0,2.0], offset=2) on length-3 target throws RangeError (offset+srcLen > length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1.0, 2.0];
      try {
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8100
     * @tc.name testUint8ClampedArraySetTwo081
     * @tc.desc Verify Array<number> insertPos=INT_MAX IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [1.0];
      try {
        arr.set(src, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8200
     * @tc.name testUint8ClampedArraySetTwo082
     * @tc.desc Verify Array<number> insertPos=INT_MIN RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [1.0];
      try {
        arr.set(src, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8300
     * @tc.name testUint8ClampedArraySetTwo083
     * @tc.desc Verify Array<number> 256 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [256.0];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8400
     * @tc.name testUint8ClampedArraySetTwo084
     * @tc.desc Verify Array<number> -1 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9]);
      const src: Array<number> = [-1.0];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8500
     * @tc.name testUint8ClampedArraySetTwo085
     * @tc.desc Verify Array<number> NaN clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9]);
      const src: Array<number> = [Number.NaN];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8600
     * @tc.name testUint8ClampedArraySetTwo086
     * @tc.desc Verify Array<number> Infinity clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [Number.POSITIVE_INFINITY];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8700
     * @tc.name testUint8ClampedArraySetTwo087
     * @tc.desc Verify Array<number> -Infinity clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9]);
      const src: Array<number> = [-Number.POSITIVE_INFINITY];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8800
     * @tc.name testUint8ClampedArraySetTwo088
     * @tc.desc Verify Array<number> 0.5 half-even 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9]);
      const src: Array<number> = [0.5];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_TWO_8900
     * @tc.name testUint8ClampedArraySetTwo089
     * @tc.desc Verify Array<number> 1.5 half-even 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [1.5];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(0);
    });
  });
}
