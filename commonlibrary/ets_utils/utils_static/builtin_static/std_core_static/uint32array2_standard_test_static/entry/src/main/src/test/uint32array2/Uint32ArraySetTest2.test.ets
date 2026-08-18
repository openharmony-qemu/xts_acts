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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArraySetTwoTest(): void {
  describe('Uint32ArraySetTwoTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_0100
     * @tc.name testUint32ArraySetTwo001
     * @tc.desc Verify set(insertPos, val) with length=3 and insertPos=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(1, 7);
      expect(arr.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_0200
     * @tc.name testUint32ArraySetTwo002
     * @tc.desc Verify set() with length=1 at insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      arr.set(0, 42);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_0300
     * @tc.name testUint32ArraySetTwo003
     * @tc.desc Verify set() with length=2 at insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 9);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_0400
     * @tc.name testUint32ArraySetTwo004
     * @tc.desc Verify set() at insertPos=0 writes value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(0, 100);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_0500
     * @tc.name testUint32ArraySetTwo005
     * @tc.desc Verify set() at insertPos=length-1 writes value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      arr.set(2, 200);
      expect(arr.$_get(2)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_0600
     * @tc.name testUint32ArraySetTwo006
     * @tc.desc Verify set() with insertPos=length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.set(3, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_0700
     * @tc.name testUint32ArraySetTwo007
     * @tc.desc Verify set() with insertPos=-1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.set(-1, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_0800
     * @tc.name testUint32ArraySetTwo008
     * @tc.desc Verify set() writes val=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(9, 9);
      arr.set(0, 0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_0900
     * @tc.name testUint32ArraySetTwo009
     * @tc.desc Verify set() writes val=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 1);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1000
     * @tc.name testUint32ArraySetTwo010
     * @tc.desc Verify set() writes val=4294967295 uint32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 4294967295);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1100
     * @tc.name testUint32ArraySetTwo011
     * @tc.desc Verify set() writes val=4294967297 wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 4294967297);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1200
     * @tc.name testUint32ArraySetTwo012
     * @tc.desc Verify set() writes val=4294967396 wraps to 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 4294967396);
      expect(arr.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1300
     * @tc.name testUint32ArraySetTwo013
     * @tc.desc Verify set() writes val=2147483647 int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 2147483647);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1400
     * @tc.name testUint32ArraySetTwo014
     * @tc.desc Verify set() writes val=-1 wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, -1);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1500
     * @tc.name testUint32ArraySetTwo015
     * @tc.desc Verify set() writes val=-2147483648 wraps to 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, -2147483648);
      expect(arr.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1600
     * @tc.name testUint32ArraySetTwo016
     * @tc.desc Verify set() writes val=-4294967296 wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, -4294967296);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1700
     * @tc.name testUint32ArraySetTwo017
     * @tc.desc Verify set() writes val=3.14 truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 3.14);
      expect(arr.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1800
     * @tc.name testUint32ArraySetTwo018
     * @tc.desc Verify set() writes val=-3.14 wraps to 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, -3.14);
      expect(arr.$_get(0)).assertEqual(4294967293);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_1900
     * @tc.name testUint32ArraySetTwo019
     * @tc.desc Verify set() writes val=1.999 truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 1.999);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2000
     * @tc.name testUint32ArraySetTwo020
     * @tc.desc Verify set() writes val=0.5 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 0.5);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2100
     * @tc.name testUint32ArraySetTwo021
     * @tc.desc Verify set() writes val=NaN as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, Number.NaN);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2200
     * @tc.name testUint32ArraySetTwo022
     * @tc.desc Verify set() writes val=Infinity as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, Number.POSITIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2300
     * @tc.name testUint32ArraySetTwo023
     * @tc.desc Verify set() writes val=-Infinity as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, Number.NEGATIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2400
     * @tc.name testUint32ArraySetTwo024
     * @tc.desc Verify set() writes val=9007199254740991 wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 9007199254740991);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2500
     * @tc.name testUint32ArraySetTwo025
     * @tc.desc Verify set() writes val=1e10 wraps to 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 1e10);
      expect(arr.$_get(0)).assertEqual(1410065408);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2600
     * @tc.name testUint32ArraySetTwo026
     * @tc.desc Verify set() writes val=0o377 as 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 0o377);
      expect(arr.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2700
     * @tc.name testUint32ArraySetTwo027
     * @tc.desc Verify two consecutive set() calls with overflow then normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      arr.set(0, 4294967296);
      arr.set(1, 12345);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2800
     * @tc.name testUint32ArraySetTwo028
     * @tc.desc Verify set(index, val) returns undefined void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      let src: FixedArray<number> = [5];
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_2900
     * @tc.name testUint32ArraySetTwo029
     * @tc.desc Verify set() with out-of-range insertPos throws RangeError leaves array intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.set(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3000
     * @tc.name testUint32ArraySetTwo030
     * @tc.desc Verify set() throws RangeError then subsequent set() still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      try {
        arr.set(5, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      arr.set(1, 55);
      expect(arr.$_get(1)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3100
     * @tc.name testUint32ArraySetTwo031
     * @tc.desc Verify set(FixedArray<number>) with length=4 target keeps tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 9);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3200
     * @tc.name testUint32ArraySetTwo032
     * @tc.desc Verify set() with empty FixedArray leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(7, 7);
      const src: FixedArray<number> = [];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3300
     * @tc.name testUint32ArraySetTwo033
     * @tc.desc Verify set() with FixedArray<number>=[42.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      const src: FixedArray<number> = [42.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3400
     * @tc.name testUint32ArraySetTwo034
     * @tc.desc Verify set() with FixedArray<number>=[uint32.MAX]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      const src: FixedArray<number> = [4294967295.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3500
     * @tc.name testUint32ArraySetTwo035
     * @tc.desc Verify set() with FixedArray<number>=[4294967296.0] wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      const src: FixedArray<number> = [4294967296.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3600
     * @tc.name testUint32ArraySetTwo036
     * @tc.desc Verify set() with FixedArray<number>=[-1.0] wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      const src: FixedArray<number> = [-1.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3700
     * @tc.name testUint32ArraySetTwo037
     * @tc.desc Verify set() with FixedArray<number>=[3.14] truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      const src: FixedArray<number> = [3.14];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3800
     * @tc.name testUint32ArraySetTwo038
     * @tc.desc Verify set() with FixedArray<number>=[0x80000000]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      const src: FixedArray<number> = [0x80000000];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_3900
     * @tc.name testUint32ArraySetTwo039
     * @tc.desc Verify set() with FixedArray<number>=[1.999] truncates to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      const src: FixedArray<number> = [1.999];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4000
     * @tc.name testUint32ArraySetTwo040
     * @tc.desc Verify set() with FixedArray<number>=[0.5] truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      const src: FixedArray<number> = [0.5];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4100
     * @tc.name testUint32ArraySetTwo041
     * @tc.desc Verify set() with FixedArray<number> mixed boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      const src: FixedArray<number> = [1.0, 4294967295.0, -1.0, 3.14];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(4294967295);
      expect(arr.$_get(2)).assertEqual(4294967295);
      expect(arr.$_get(3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4200
     * @tc.name testUint32ArraySetTwo042
     * @tc.desc Verify set() with FixedArray<number> of length=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(100);
      let src: Uint32Array = new Uint32Array(100);
      for (let i: int = 0; i < 100; i++) {
        src.$_set(i, 5);
      }
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(99)).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4300
     * @tc.name testUint32ArraySetTwo043
     * @tc.desc Verify set() with FixedArray<number> preserves source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      const src: FixedArray<number> = [10.0, 20.0];
      arr.set(src);
      expect(src[0]).assertEqual(10);
      expect(src[1]).assertEqual(20);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4400
     * @tc.name testUint32ArraySetTwo044
     * @tc.desc Verify set() with FixedArray longer than target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4500
     * @tc.name testUint32ArraySetTwo045
     * @tc.desc Verify set() with FixedArray on empty target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(0);
      const src: FixedArray<number> = [1.0];
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4600
     * @tc.name testUint32ArraySetTwo046
     * @tc.desc Verify set() copies source array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const src: FixedArray<number> = [7.0, 8.0, 9.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4700
     * @tc.name testUint32ArraySetTwo047
     * @tc.desc Verify set() with Uint32Array of length 65535 on small target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(2);
      let src: Uint32Array = new Uint32Array(65535);
      for (let i: int = 0; i < 65535; i++) {
        src.$_set(i, 1);
      }
      try {
        arr.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4800
     * @tc.name testUint32ArraySetTwo048
     * @tc.desc Verify set() with FixedArray<number>=[4294967296.0, 4294967297.0] wraps to [0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      const src: FixedArray<number> = [4294967296.0, 4294967297.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_4900
     * @tc.name testUint32ArraySetTwo049
     * @tc.desc Verify set() with FixedArray<number>=[-1.0,-2.0] wraps to [4294967295,4294967294]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      const src: FixedArray<number> = [-1.0, -2.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(4294967295);
      expect(arr.$_get(1)).assertEqual(4294967294);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5000
     * @tc.name testUint32ArraySetTwo050
     * @tc.desc Verify set() with FixedArray<number>=[NaN,Infinity,-Infinity] all write 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      const src: FixedArray<number> = [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5100
     * @tc.name testUint32ArraySetTwo051
     * @tc.desc Verify set() with FixedArray<number>=[2^53-1] wraps to 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      const src: FixedArray<number> = [9007199254740991.0];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5200
     * @tc.name testUint32ArraySetTwo052
     * @tc.desc Verify set(array, offset) writes at offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(10, 20);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5300
     * @tc.name testUint32ArraySetTwo053
     * @tc.desc Verify set() with Uint32Array at offset=1 writes shifted elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(9, 0, 0);
      let src: Uint32Array = Uint32Array.of(10, 20);
      arr.set(src, 1);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5400
     * @tc.name testUint32ArraySetTwo054
     * @tc.desc Verify set() with empty Uint32Array at offset=0 leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(7, 7);
      let src: Uint32Array = new Uint32Array(0);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5500
     * @tc.name testUint32ArraySetTwo055
     * @tc.desc Verify set() with Uint32Array.of(42) writes single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      let src: Uint32Array = Uint32Array.of(42);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5600
     * @tc.name testUint32ArraySetTwo056
     * @tc.desc Verify set() with Uint32Array.of(uint32.MAX) writes MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      let src: Uint32Array = Uint32Array.of(4294967295);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5700
     * @tc.name testUint32ArraySetTwo057
     * @tc.desc Verify set() with Uint32Array.of(0) writes zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(9, 9);
      let src: Uint32Array = Uint32Array.of(0);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5800
     * @tc.name testUint32ArraySetTwo058
     * @tc.desc Verify set() with Uint32Array.of(int32.MAX) writes int32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0);
      let src: Uint32Array = Uint32Array.of(2147483647);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_5900
     * @tc.name testUint32ArraySetTwo059
     * @tc.desc Verify set() with Uint32Array.of(1,2,3,4) writes all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      let src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6000
     * @tc.name testUint32ArraySetTwo060
     * @tc.desc Verify set() with Uint32Array.of(5,5,5) writes repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(5, 5, 5);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6100
     * @tc.name testUint32ArraySetTwo061
     * @tc.desc Verify set() with Uint32Array of length=100 at offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(100);
      let src: Uint32Array = new Uint32Array(100);
      for (let i: int = 0; i < 100; i++) {
        src.$_set(i, 5);
      }
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(99)).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6200
     * @tc.name testUint32ArraySetTwo062
     * @tc.desc Verify set() with offset=length-source.length writes at tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      let src: Uint32Array = Uint32Array.of(10, 20);
      arr.set(src, 2);
      expect(arr.$_get(2)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6300
     * @tc.name testUint32ArraySetTwo063
     * @tc.desc Verify set() with offset=length-source.length+1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      let src: Uint32Array = Uint32Array.of(10, 20);
      try {
        arr.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6400
     * @tc.name testUint32ArraySetTwo064
     * @tc.desc Verify set() with offset=length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(10, 20);
      try {
        arr.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6500
     * @tc.name testUint32ArraySetTwo065
     * @tc.desc Verify set() with offset=length+1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(10, 20);
      try {
        arr.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6600
     * @tc.name testUint32ArraySetTwo066
     * @tc.desc Verify set() with empty source at offset=length leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(7, 7, 7);
      let src: Uint32Array = new Uint32Array(0);
      arr.set(src, 3);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6700
     * @tc.name testUint32ArraySetTwo067
     * @tc.desc Verify set(Uint32Array, offset) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      let src: Uint32Array = Uint32Array.of(1, 2);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6800
     * @tc.name testUint32ArraySetTwo068
     * @tc.desc Verify set() with Uint32Array source preserves source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      let src: Uint32Array = Uint32Array.of(10, 20);
      arr.set(src, 0);
      expect(src.$_get(0)).assertEqual(10);
      expect(src.$_get(1)).assertEqual(20);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_6900
     * @tc.name testUint32ArraySetTwo069
     * @tc.desc Verify set() when offset+source.length exceeds target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(1, 2, 3);
      try {
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7000
     * @tc.name testUint32ArraySetTwo070
     * @tc.desc Verify set() with offset=length-1 and 2-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(1, 2);
      try {
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7100
     * @tc.name testUint32ArraySetTwo071
     * @tc.desc Verify set() with Uint32Array on empty target throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = new Uint32Array(0);
      let src: Uint32Array = Uint32Array.of(1);
      try {
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7200
     * @tc.name testUint32ArraySetTwo072
     * @tc.desc Verify set() with out-of-range offset throws RangeError leaves array intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let src: Uint32Array = Uint32Array.of(9, 9);
      try {
        arr.set(src, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7300
     * @tc.name testUint32ArraySetTwo073
     * @tc.desc Verify set() with Uint32Array of uint32.MAX values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0);
      let src: Uint32Array = Uint32Array.of(4294967295, 4294967295);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(4294967295);
      expect(arr.$_get(1)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7400
     * @tc.name testUint32ArraySetTwo074
     * @tc.desc Verify set() between views over the same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let target: Uint32Array = new Uint32Array(buf, 0, 2);
      let src: Uint32Array = new Uint32Array(buf, 8, 2);
      src.$_set(0, 100);
      src.$_set(1, 200);
      target.set(src, 0);
      expect(target.$_get(0)).assertEqual(100);
      expect(target.$_get(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7500
     * @tc.name testUint32ArraySetTwo075
     * @tc.desc Verify set() with Uint32Array does not alias source after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(10, 20);
      arr.set(src, 0);
      src.$_set(0, 999);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7600
     * @tc.name testUint32ArraySetTwo076
     * @tc.desc Verify set() with Uint32Array target mutation does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0);
      let src: Uint32Array = Uint32Array.of(10, 20);
      arr.set(src, 0);
      arr.$_set(0, 777);
      expect(src.$_get(0)).assertEqual(10);
      expect(src.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7700
     * @tc.name testUint32ArraySetTwo077
     * @tc.desc Verify set() with subarray source over shared buffer overlaps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      let src: Uint32Array = target.subarray(2, 4);
      src.$_set(0, 50);
      src.$_set(1, 60);
      target.set(src, 0);
      expect(target.$_get(0)).assertEqual(50);
      expect(target.$_get(1)).assertEqual(60);
      expect(target.$_get(2)).assertEqual(50);
      expect(target.$_get(3)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7800
     * @tc.name testUint32ArraySetTwo078
     * @tc.desc Verify set() with two Uint32Array sources at different offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint32Array = Uint32Array.of(0, 0, 0, 0);
      let s1: Uint32Array = Uint32Array.of(1, 2);
      let s2: Uint32Array = Uint32Array.of(3, 4);
      arr.set(s1, 0);
      arr.set(s2, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_7900
     * @tc.name testUint32ArraySetTwo079
     * @tc.desc Verify set() with subarray of same target at overlapping offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: Uint32Array = Uint32Array.of(1, 2, 0, 0);
      let src: Uint32Array = target.subarray(0, 2);
      target.set(src, 2);
      expect(target.$_get(2)).assertEqual(1);
      expect(target.$_get(3)).assertEqual(2);
      expect(target.$_get(0)).assertEqual(1);
      expect(target.$_get(1)).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_SET_TWO_8000
     * @tc.name testUint32ArraySetTwo080
     * @tc.desc Verify set() converts elements from FixedArray<number> source negative to uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArraySetTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(2);
      const src: FixedArray<number> = [-1, 5];
      arr.set(src);
      expect(arr.$_get(0)).assertEqual(4294967295);
      expect(arr.$_get(1)).assertEqual(5);
    });

  });
}
