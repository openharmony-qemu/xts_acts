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

export default function uint8ClampedArraySetThreeTest(): void {
  describe('Uint8ClampedArraySetThreeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_0100
     * @tc.name testUint8ClampedArraySetThree001
     * @tc.desc Verify Array<number> 2.5 half-even 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [2.5];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_0200
     * @tc.name testUint8ClampedArraySetThree002
     * @tc.desc Verify Array<number> 127.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [127.5];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_0300
     * @tc.name testUint8ClampedArraySetThree003
     * @tc.desc Verify Array<number> 128.5 half-even 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [128.5];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_0400
     * @tc.name testUint8ClampedArraySetThree004
     * @tc.desc Verify set(Array<number> [0.9], 0) on [0,0] rounds 0.9 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [0.9];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_0500
     * @tc.name testUint8ClampedArraySetThree005
     * @tc.desc Verify set(Array<number> [255], 0) on [0,0] writes 255 at index 0, arr[1]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [255.0];
      arr.set(src, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_0600
     * @tc.name testUint8ClampedArraySetThree006
     * @tc.desc Verify set(Array<number> [], 1) on [1,2,3] keeps target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const src: Array<number> = [];
      arr.set(src, 1);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_0700
     * @tc.name testUint8ClampedArraySetThree007
     * @tc.desc Verify set(Array<number> [], 5) on length-2 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      const src: Array<number> = [];
      try {
        arr.set(src, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_0800
     * @tc.name testUint8ClampedArraySetThree008
     * @tc.desc Verify set(ArrayLike<number> [], 0) on [1,2,3] keeps target unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const al: ArrayLike<number> = [];
      arr.set(al);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_0900
     * @tc.name testUint8ClampedArraySetThree009
     * @tc.desc Verify set(ArrayLike<number> [42], 0) on [0,0,0] writes 42 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const al: ArrayLike<number> = [42.0];
      arr.set(al);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(42);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1000
     * @tc.name testUint8ClampedArraySetThree010
     * @tc.desc Verify set(ArrayLike<number> [99], 2) on [0,0,0] writes 99 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const al: ArrayLike<number> = [99.0];
      arr.set(al, 2);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(99);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1100
     * @tc.name testUint8ClampedArraySetThree011
     * @tc.desc Verify ArrayLike<number> offset=-1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [1.0];
      try {
        arr.set(al, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1200
     * @tc.name testUint8ClampedArraySetThree012
     * @tc.desc Verify ArrayLike<number> offset=length RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [1.0];
      try {
        arr.set(al, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1300
     * @tc.name testUint8ClampedArraySetThree013
     * @tc.desc Verify ArrayLike<number> offset=0 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [1.0, 2.0, 3.0];
      try {
        arr.set(al, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1400
     * @tc.name testUint8ClampedArraySetThree014
     * @tc.desc Verify ArrayLike<number> -5 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9]);
      const al: ArrayLike<number> = [-5.0];
      arr.set(al, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1500
     * @tc.name testUint8ClampedArraySetThree015
     * @tc.desc Verify ArrayLike<number> 1e10 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [1e10];
      arr.set(al, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1600
     * @tc.name testUint8ClampedArraySetThree016
     * @tc.desc Verify set(ArrayLike<number> [0], 0) on [9,9] writes 0 at index 0, arr[1]=9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9]);
      const al: ArrayLike<number> = [0.0];
      arr.set(al, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1700
     * @tc.name testUint8ClampedArraySetThree017
     * @tc.desc Verify set(ArrayLike<number> [1,2,3], 0) on [0,0,0] copies all three values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const al: ArrayLike<number> = [1.0, 2.0, 3.0];
      arr.set(al, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1800
     * @tc.name testUint8ClampedArraySetThree018
     * @tc.desc Verify set(ArrayLike<number> [256,-1,NaN,100], 0) clamps 256 to 255, -1 to 0, NaN to 0, keeps 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const al: ArrayLike<number> = [256.0, -1.0, Number.NaN, 100.0];
      arr.set(al, 0);
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(0);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[3]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_1900
     * @tc.name testUint8ClampedArraySetThree019
     * @tc.desc Verify set(ArrayLike<number> [127], 0) on [0,0] writes 127 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [127];
      arr.set(al, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(127);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2000
     * @tc.name testUint8ClampedArraySetThree020
     * @tc.desc Verify set(ArrayLike<number> [128], 0) on [0,0] writes 128 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [128];
      arr.set(al, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2100
     * @tc.name testUint8ClampedArraySetThree021
     * @tc.desc Verify set(ArrayLike<number> [256,-1,0,200], 0) clamps 256 to 255, -1 to 0, keeps 0 and 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const al: ArrayLike<number> = [256, -1, 0, 200];
      arr.set(al, 0);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(200);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2200
     * @tc.name testUint8ClampedArraySetThree022
     * @tc.desc Verify set(ArrayLike<number> [5,6], 2) on [0,0,0,0] writes 5 at index 2 and 6 at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      const al: ArrayLike<number> = [5, 6];
      arr.set(al, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(6);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2300
     * @tc.name testUint8ClampedArraySetThree023
     * @tc.desc Verify set(ArrayLike,0) on [1,2,3,4] does not change arr[3]=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3, 4]);
      const al: ArrayLike<number> = [99.0];
      arr.set(al, 0);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(4);
      expect(arr[0]).assertEqual(99);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2400
     * @tc.name testUint8ClampedArraySetThree024
     * @tc.desc Verify ArrayLike<number> offset INT_MAX IndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [1];
      try {
        arr.set(al, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2500
     * @tc.name testUint8ClampedArraySetThree025
     * @tc.desc Verify ArrayLike<number> offset INT_MIN RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [1];
      try {
        arr.set(al, -2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2600
     * @tc.name testUint8ClampedArraySetThree026
     * @tc.desc Verify set(Array<number> [byte -128]) on [5] clamps negative byte to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5]);
      const v: byte = -128;
      const src: Array<number> = [v];
      arr.set(src);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2700
     * @tc.name testUint8ClampedArraySetThree027
     * @tc.desc Verify set(Array<number> [byte 127]) on [0] writes 127 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const v: byte = 127;
      const src: Array<number> = [v];
      arr.set(src);
      expect(arr[0]).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2800
     * @tc.name testUint8ClampedArraySetThree028
     * @tc.desc Verify Array<number> 256 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const src: Array<number> = [256.0];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_2900
     * @tc.name testUint8ClampedArraySetThree029
     * @tc.desc Verify Array<number> -2 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9]);
      const src: Array<number> = [-2.0];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3000
     * @tc.name testUint8ClampedArraySetThree030
     * @tc.desc Verify ArrayLike<number> 300 clamp 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const al: ArrayLike<number> = [300.0];
      arr.set(al, 0);
      expect(arr[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3100
     * @tc.name testUint8ClampedArraySetThree031
     * @tc.desc Verify ArrayLike<number> -100 clamp 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9]);
      const al: ArrayLike<number> = [-100.0];
      arr.set(al, 0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3200
     * @tc.name testUint8ClampedArraySetThree032
     * @tc.desc Verify set(ArrayLike<number> [1.5,2.5], 0) on [0,0] half-even rounds both to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [1.5, 2.5];
      arr.set(al, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3300
     * @tc.name testUint8ClampedArraySetThree033
     * @tc.desc Verify set(ArrayLike<number> [127.5,128.5], 0) on [0,0] half-even rounds both to 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const al: ArrayLike<number> = [127.5, 128.5];
      arr.set(al, 0);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(128);
      expect(arr[1]).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3400
     * @tc.name testUint8ClampedArraySetThree034
     * @tc.desc Verify set(Array<number>) clamps 256 to 255 and -1 to 0 on [0,0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [10.0, 256.0, -1.0];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(255);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3500
     * @tc.name testUint8ClampedArraySetThree035
     * @tc.desc Verify set(Uint8ClampedArray) on [0,0] sets arr[1]=200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src = new Uint8ClampedArray([100, 200]);
      arr.set(src);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(200);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3600
     * @tc.name testUint8ClampedArraySetThree036
     * @tc.desc Verify set(1, 77) on [0,0] writes 77 at index 1, arr[0] stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      arr.set(1, 77);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(77);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3700
     * @tc.name testUint8ClampedArraySetThree037
     * @tc.desc Verify set(Array<number> [9,8], 1) on [0,0,0] writes 9 at index 1 and 8 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [9.0, 8.0];
      arr.set(src, 1);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(9);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3800
     * @tc.name testUint8ClampedArraySetThree038
     * @tc.desc Verify set(Uint8ClampedArray [5,6], 1) on [0,0,0] writes 5 at index 1 and 6 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src = new Uint8ClampedArray([5, 6]);
      arr.set(src, 1);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(6);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_3900
     * @tc.name testUint8ClampedArraySetThree039
     * @tc.desc Verify sequential set(0,11) then set(Array<number> [22], 1) on [0,0,0] yields [11,22,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(0, 11);
      const src: Array<number> = [22.0];
      arr.set(src, 1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(22);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4000
     * @tc.name testUint8ClampedArraySetThree040
     * @tc.desc Verify set(Array<number> [10,20], 2) on length-3 target throws RangeError and array reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      const ref = arr;
      try {
        const src: Array<number> = [10.0, 20.0];
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr).assertEqual(ref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4100
     * @tc.name testUint8ClampedArraySetThree041
     * @tc.desc Verify set(Uint8ClampedArray [5,6,7], 0) on length-2 target throws RangeError and length stays 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2]);
      try {
        arr.set(new Uint8ClampedArray([5, 6, 7]), 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4200
     * @tc.name testUint8ClampedArraySetThree042
     * @tc.desc Verify set(Uint8ClampedArray [1,2,3], 0) on length-2 throws RangeError, arr[1]=20 preserved after retry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 20]);
      for (let i = 0; i < 2; i++) {
        try {
          arr.set(new Uint8ClampedArray([1, 2, 3]), 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('RangeError');
        }
      }
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4300
     * @tc.name testUint8ClampedArraySetThree043
     * @tc.desc Verify chained set(0,1) then set(Uint8ClampedArray [2], 1) on [0,0] yields toString '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      arr.set(0, 1);
      arr.set(new Uint8ClampedArray([2]), 1);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4400
     * @tc.name testUint8ClampedArraySetThree044
     * @tc.desc Verify set(0, 77) on shared ArrayBuffer, view2[0] of same buffer also reads 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view1 = new Uint8ClampedArray(buf, 0, 4);
      const view2 = new Uint8ClampedArray(buf, 0, 4);
      view1.set(0, 77);
      expect(view1.length).assertEqual(4);
      expect(view2[0]).assertEqual(77);
      expect(view1[1]).assertEqual(0);
      expect(view1[2]).assertEqual(0);
      expect(view1[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4500
     * @tc.name testUint8ClampedArraySetThree045
     * @tc.desc Verify parent.set(1,50) on [0,0,0,0] visible through subarray(1,3) with child[0]=50 child[1]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([0, 0, 0, 0]);
      const child = parent.subarray(1, 3);
      parent.set(1, 50);
      expect(child.length).assertEqual(2);
      expect(child[0]).assertEqual(50);
      expect(child[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4600
     * @tc.name testUint8ClampedArraySetThree046
     * @tc.desc Verify child.set(0,60) on subarray(1,3) writes 60 at child[0], child[1] stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([0, 0, 0, 0]);
      const child = parent.subarray(1, 3);
      child.set(0, 60);
      expect(child.length).assertEqual(2);
      expect(child[0]).assertEqual(60);
      expect(child[1]).assertEqual(0);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4700
     * @tc.name testUint8ClampedArraySetThree047
     * @tc.desc Verify parent.set(Array<number> [11,22], 1) visible through subarray(1,4) child[0]=11 child[1]=22 child[2]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([0, 0, 0, 0]);
      const child = parent.subarray(1, 4);
      const src: Array<number> = [11.0, 22.0];
      parent.set(src, 1);
      expect(child.length).assertEqual(3);
      expect(child[0]).assertEqual(11);
      expect(child[1]).assertEqual(22);
      expect(child[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4800
     * @tc.name testUint8ClampedArraySetThree048
     * @tc.desc Verify child.set(Array<number> [33,44]) on subarray(1,4) writes 33 at child[0] and 44 at child[1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([0, 0, 0, 0]);
      const child = parent.subarray(1, 4);
      const src: Array<number> = [33.0, 44.0];
      child.set(src);
      expect(child.length).assertEqual(3);
      expect(child[0]).assertEqual(33);
      expect(child[1]).assertEqual(44);
      expect(child[2]).assertEqual(0);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_4900
     * @tc.name testUint8ClampedArraySetThree049
     * @tc.desc Verify sequential set(Array<number> [1,2,3]) then set(Uint8ClampedArray [9], 0) yields [9,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src1: Array<number> = [1.0, 2.0, 3.0];
      arr.set(src1);
      arr.set(new Uint8ClampedArray([9]), 0);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(9);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5000
     * @tc.name testUint8ClampedArraySetThree050
     * @tc.desc Verify sequential set(Uint8ClampedArray [7,8,9]) then set(Array<number> [1], 2) yields [7,8,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      arr.set(new Uint8ClampedArray([7, 8, 9]));
      const src: Array<number> = [1.0];
      arr.set(src, 2);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(1);
      expect(arr[0]).assertEqual(7);
      expect(arr[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5100
     * @tc.name testUint8ClampedArraySetThree051
     * @tc.desc Verify chained set(0,1) set(Array<number> [2,3], 1) set(Uint8ClampedArray [4], 3) on [0,0,0,0] yields [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0, 0]);
      arr.set(0, 1);
      const src: Array<number> = [2.0, 3.0];
      arr.set(src, 1);
      arr.set(new Uint8ClampedArray([4]), 3);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5200
     * @tc.name testUint8ClampedArraySetThree052
     * @tc.desc Verify set(5, 99) on length-2 target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      try {
        arr.set(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5300
     * @tc.name testUint8ClampedArraySetThree053
     * @tc.desc Verify self-set of subarray(2,4) to offset 0 on [1,2,3,4] keeps tail[0]=3 tail[1]=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const tail = parent.subarray(2, 4);
      parent.set(tail, 0);
      expect(tail.length).assertEqual(2);
      expect(tail[0]).assertEqual(3);
      expect(tail[1]).assertEqual(4);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5400
     * @tc.name testUint8ClampedArraySetThree054
     * @tc.desc Verify self-set of subarray(0,2) to offset 2 on [10,20,30,40] keeps head[0]=10 head[1]=20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([10, 20, 30, 40]);
      const head = parent.subarray(0, 2);
      parent.set(head, 2);
      expect(head.length).assertEqual(2);
      expect(head[0]).assertEqual(10);
      expect(head[1]).assertEqual(20);
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5500
     * @tc.name testUint8ClampedArraySetThree055
     * @tc.desc Verify set(mid.subarray(1,3), 0) self-set on [1,2,3,4] yields parent=[2,3,3,4] length stays 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3, 4]);
      const mid = parent.subarray(1, 3);
      parent.set(mid, 0);
      expect(parent.length).assertEqual(4);
      expect(parent[0]).assertEqual(2);
      expect(parent[1]).assertEqual(3);
      expect(parent[2]).assertEqual(3);
      expect(parent[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5600
     * @tc.name testUint8ClampedArraySetThree056
     * @tc.desc Verify set(parent, 0) self-set on [1,2,3] keeps array unchanged [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Uint8ClampedArray([1, 2, 3]);
      parent.set(parent, 0);
      expect(parent.length).assertEqual(3);
      expect(parent[1]).assertEqual(2);
      expect(parent[0]).assertEqual(1);
      expect(parent[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5700
     * @tc.name testUint8ClampedArraySetThree057
     * @tc.desc Verify set(0x0, val:byte 33) writes 33 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 33;
      arr.set(0x0, v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(33);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5800
     * @tc.name testUint8ClampedArraySetThree058
     * @tc.desc Verify set(0o1, val:byte 44) writes 44 at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 44;
      arr.set(0o1, v);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(44);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_5900
     * @tc.name testUint8ClampedArraySetThree059
     * @tc.desc Verify set(0b10, val:byte 55) writes 55 at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 55;
      arr.set(0b10, v);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(55);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6000
     * @tc.name testUint8ClampedArraySetThree060
     * @tc.desc Verify set(0, byte -128) on [10,10,10] clamps negative byte to 0, arr[1]=10 arr[2]=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([10, 10, 10]);
      const v: byte = -128;
      arr.set(0, v);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6100
     * @tc.name testUint8ClampedArraySetThree061
     * @tc.desc Verify set(1, byte -64) on [5,5,5] clamps negative byte to 0 at index 1, arr[0]=5 arr[2]=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([5, 5, 5]);
      const v: byte = -64;
      arr.set(1, v);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(0);
      expect(arr[0]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6200
     * @tc.name testUint8ClampedArraySetThree062
     * @tc.desc Verify set(2, byte 100) on [0,0,0] writes 100 at index 2, arr[0]=0 arr[1]=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const v: byte = 100;
      arr.set(2, v);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6300
     * @tc.name testUint8ClampedArraySetThree063
     * @tc.desc Verify set(0, byte 126) on [0] writes 126 at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const v: byte = 126;
      arr.set(0, v);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(126);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6400
     * @tc.name testUint8ClampedArraySetThree064
     * @tc.desc Verify set(0, byte -2) on [99] clamps negative byte to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const v: byte = -2;
      arr.set(0, v);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6500
     * @tc.name testUint8ClampedArraySetThree065
     * @tc.desc Verify set(0, byte -127) on [99] clamps negative byte to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([99]);
      const v: byte = -127;
      arr.set(0, v);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6600
     * @tc.name testUint8ClampedArraySetThree066
     * @tc.desc Verify set(Array<number>, 0x2) writes at hex offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [9, 8];
      dst.set(src, 0x2);
      expect(dst.length).assertEqual(4);
      expect(dst[2]).assertEqual(9);
      expect(dst[3]).assertEqual(8);
      expect(dst[0]).assertEqual(0);
      expect(dst[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6700
     * @tc.name testUint8ClampedArraySetThree067
     * @tc.desc Verify set(Array<number>, 0o2) writes at octal offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [9, 8];
      dst.set(src, 0o2);
      expect(dst.length).assertEqual(4);
      expect(dst[2]).assertEqual(9);
      expect(dst[3]).assertEqual(8);
      expect(dst[0]).assertEqual(0);
      expect(dst[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6800
     * @tc.name testUint8ClampedArraySetThree068
     * @tc.desc Verify set(Array<number>, 0b10) writes at binary offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [9, 8];
      dst.set(src, 0b10);
      expect(dst.length).assertEqual(4);
      expect(dst[2]).assertEqual(9);
      expect(dst[3]).assertEqual(8);
      expect(dst[0]).assertEqual(0);
      expect(dst[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_6900
     * @tc.name testUint8ClampedArraySetThree069
     * @tc.desc Verify set(Array<number>) source much larger than target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0]);
      const src: Array<number> = [1, 2, 3, 4, 5];
      try {
        dst.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7000
     * @tc.name testUint8ClampedArraySetThree070
     * @tc.desc Verify set(Array<number>, 0) keeps length unchanged on len4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0, 0]);
      const src: Array<number> = [1, 2];
      dst.set(src, 0);
      expect(dst.length).assertEqual(4);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(0);
      expect(dst[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7100
     * @tc.name testUint8ClampedArraySetThree071
     * @tc.desc Verify set(Array<number>, 0) keeps byteLength unchanged on len3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1, 2];
      dst.set(src, 0);
      expect(dst.byteLength).assertEqual(3);
      expect(dst[0]).assertEqual(1);
      expect(dst[1]).assertEqual(2);
      expect(dst[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7200
     * @tc.name testUint8ClampedArraySetThree072
     * @tc.desc Verify set(Array<number>, 1) source too long on len3 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1, 2, 3];
      try {
        dst.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7300
     * @tc.name testUint8ClampedArraySetThree073
     * @tc.desc Verify set(Array<number>, 4) offset length plus one on len3 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dst = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [1];
      try {
        dst.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7400
     * @tc.name testUint8ClampedArraySetThree074
     * @tc.desc Verify set(Array<number> [0o377,0o100]) clamps octal 0o377 to 255 and keeps octal 0o100 as 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [0o377, 0o100];
      arr.set(src);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7500
     * @tc.name testUint8ClampedArraySetThree075
     * @tc.desc Verify set(Array<number> [0b11111111,0b00000001]) clamps binary 0b11111111 to 255 and keeps 0b00000001 as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0]);
      const src: Array<number> = [0b11111111, 0b00000001];
      arr.set(src);
      expect(arr[0]).assertEqual(255);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7600
     * @tc.name testUint8ClampedArraySetThree076
     * @tc.desc Verify set(Array<number>) keeps buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const beforeBuf = arr.buffer;
      const src: Array<number> = [1.0, 2.0, 3.0];
      arr.set(src);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr.buffer).assertEqual(beforeBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7700
     * @tc.name testUint8ClampedArraySetThree077
     * @tc.desc Verify set(Uint8ClampedArray(0), 1) on empty target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray(0);
      const src = new Uint8ClampedArray(0);
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7800
     * @tc.name testUint8ClampedArraySetThree078
     * @tc.desc Verify set(Array<number>) 3.5 half-even rounds to 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0]);
      const src: Array<number> = [3.5];
      arr.set(src);
      expect(arr[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_7900
     * @tc.name testUint8ClampedArraySetThree079
     * @tc.desc Verify set(Array<number>) 0.4 rounds to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([9, 9]);
      const src: Array<number> = [0.4];
      arr.set(src);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_8000
     * @tc.name testUint8ClampedArraySetThree080
     * @tc.desc Verify default offset equals offset 0 for Array<number> source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([0, 0, 0]);
      const a2 = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [10.0, 20.0, 30.0];
      a1.set(src);
      a2.set(src, 0);
      expect(a1.length).assertEqual(3);
      expect(a2.length).assertEqual(3);
      expect(a1[0]).assertEqual(a2[0]);
      expect(a1[1]).assertEqual(20);
      expect(a1[2]).assertEqual(30);
      expect(a2[1]).assertEqual(20);
      expect(a2[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_8100
     * @tc.name testUint8ClampedArraySetThree081
     * @tc.desc Verify length byteLength buffer byteOffset unchanged after out-of-bounds set throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint8ClampedArray(buf, 2, 3);
      arr[0] = 1; arr[1] = 2; arr[2] = 3;
      const beforeBuf = arr.buffer;
      try {
        const src: Array<number> = [10.0, 20.0];
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr.byteLength).assertEqual(3);
      expect(arr.byteOffset).assertEqual(2);
      expect(arr.buffer).assertEqual(beforeBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_8200
     * @tc.name testUint8ClampedArraySetThree082
     * @tc.desc Verify elements not partially written after out-of-bounds set throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([1, 2, 3]);
      try {
        const src: Array<number> = [88.0, 99.0];
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_8300
     * @tc.name testUint8ClampedArraySetThree083
     * @tc.desc Verify set(0, 100) and set(Array<number> [100], 0) on [0] produce same result [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([0]);
      const a2 = new Uint8ClampedArray([0]);
      a1.set(0, 100);
      const src: Array<number> = [100.0];
      a2.set(src, 0);
      expect(a1.length).assertEqual(1);
      expect(a1[0]).assertEqual(a2[0]);
      expect(a1[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_8400
     * @tc.name testUint8ClampedArraySetThree084
     * @tc.desc Verify set(Array<number> [10,20] with byte cast) and set(Array<number> [10,20] with number literal) produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([0, 0]);
      const a2 = new Uint8ClampedArray([0, 0]);
      const src1: Array<number> = [10 as byte, 20 as byte];
      const src2: Array<number> = [10.0, 20.0];
      a1.set(src1);
      a2.set(src2);
      expect(a1.length).assertEqual(2);
      expect(a2.length).assertEqual(2);
      expect(a1[1]).assertEqual(a2[1]);
      expect(a1[0]).assertEqual(10);
      expect(a2[0]).assertEqual(10);
      expect(a1[1]).assertEqual(20);
      expect(a2[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_8500
     * @tc.name testUint8ClampedArraySetThree085
     * @tc.desc Verify set(Array<number>) source modification after set does not affect target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8ClampedArray([0, 0, 0]);
      const src: Array<number> = [3.0];
      arr.set(src);
      src[0] = 99;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_8600
     * @tc.name testUint8ClampedArraySetThree086
     * @tc.desc Verify set(0, 256) and set(Array<number> [256], 0) on [0] produce same clamped result [255]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([0]);
      const a2 = new Uint8ClampedArray([0]);
      a1.set(0, 256);
      const src: Array<number> = [256.0];
      a2.set(src, 0);
      expect(a1.length).assertEqual(1);
      expect(a1[0]).assertEqual(a2[0]);
      expect(a1[0]).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_8700
     * @tc.name testUint8ClampedArraySetThree087
     * @tc.desc Verify set(0, -1) and set(Array<number> [-1], 0) on [99] produce same clamped result [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([99]);
      const a2 = new Uint8ClampedArray([99]);
      a1.set(0, -1);
      const src: Array<number> = [-1.0];
      a2.set(src, 0);
      expect(a1.length).assertEqual(1);
      expect(a1[0]).assertEqual(a2[0]);
      expect(a1[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8CLAMPEDARRAY_SET_THREE_8800
     * @tc.name testUint8ClampedArraySetThree088
     * @tc.desc Verify single-point set NaN and batch set NaN produce same clamp result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUint8ClampedArraySetThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Uint8ClampedArray([99]);
      const a2 = new Uint8ClampedArray([99]);
      a1.set(0, Number.NaN);
      const src: Array<number> = [Number.NaN];
      a2.set(src, 0);
      expect(a1[0]).assertEqual(a2[0]);
    });
  });
}
