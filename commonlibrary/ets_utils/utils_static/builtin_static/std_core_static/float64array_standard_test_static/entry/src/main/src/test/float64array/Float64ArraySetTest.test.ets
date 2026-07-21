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
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function float64ArraySetTest(): void {
  describe('Float64ArraySetTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_0100
     * @tc.name testFloat64ArraySet001
     * @tc.desc Verify set single value at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(3);
      arr.set(0, 1.0);
      const actVal1 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_0200
     * @tc.name testFloat64ArraySet002
     * @tc.desc Verify set single value at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const arr = new Float64Array(3);
      arr.set(1, 2.0);
      const actVal2 = arr.$_get(1);
      const expectVal = twoPointZero;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_0300
     * @tc.name testFloat64ArraySet003
     * @tc.desc Verify set single value at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const arr = new Float64Array(3);
      arr.set(2, 3.0);
      const actVal3 = arr.$_get(2);
      const expectVal = threePointZero;
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_0400
     * @tc.name testFloat64ArraySet004
     * @tc.desc Verify set value 0.0 at index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(3);
      arr.set(1, 0.0);
      const actVal4 = arr.$_get(1);
      const expectVal = zeroPointZero;
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_0500
     * @tc.name testFloat64ArraySet005
     * @tc.desc Verify set negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const arr = new Float64Array(3);
      arr.set(0, -1.0);
      const actVal5 = arr.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal5).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_0600
     * @tc.name testFloat64ArraySet006
     * @tc.desc Verify set Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array(3);
      arr.set(0, Infinity);
      const actVal6 = arr.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal6).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_0700
     * @tc.name testFloat64ArraySet007
     * @tc.desc Verify set -Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array(3);
      arr.set(0, -Infinity);
      const actVal7 = arr.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal7).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_0800
     * @tc.name testFloat64ArraySet008
     * @tc.desc Verify set NaN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      arr.set(0, NaN);
      const actVal8 = arr.$_get(0);
      expect(actVal8).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_0900
     * @tc.name testFloat64ArraySet009
     * @tc.desc Verify set MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array(3);
      arr.set(0, 1.7976931348623157e+308);
      const actVal9 = arr.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal9).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1000
     * @tc.name testFloat64ArraySet010
     * @tc.desc Verify set MIN_VALUE 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array(3);
      arr.set(0, 5e-324);
      const actVal10 = arr.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal10).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1100
     * @tc.name testFloat64ArraySet011
     * @tc.desc Verify set negative zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array(3);
      arr.set(0, -0.0);
      const actVal11 = arr.$_get(0);
      expect(1 / actVal11).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1200
     * @tc.name testFloat64ArraySet012
     * @tc.desc Verify set scientific notation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e100: number = 1.0e+100;
      const arr = new Float64Array(3);
      arr.set(0, 1.0e+100);
      const actVal12 = arr.$_get(0);
      const expectVal = sciValue10e100;
      expect(actVal12).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1300
     * @tc.name testFloat64ArraySet013
     * @tc.desc Verify set decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApproxValue: number = 3.14159;
      const arr = new Float64Array(3);
      arr.set(0, 3.14159);
      const actVal13 = arr.$_get(0);
      const expectVal = piApproxValue;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1400
     * @tc.name testFloat64ArraySet014
     * @tc.desc Verify set from Float64Array source with default offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const dest = new Float64Array(3);
      const src = new Float64Array([int32MinValue, -1, zeroValue]);
      dest.set(src);
      const actVal14 = dest.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal14).assertEqual(expectVal);
      const actVal15 = dest.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal15).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1500
     * @tc.name testFloat64ArraySet015
     * @tc.desc Verify set from Float64Array with offset 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const dest = new Float64Array(5);
      const src = new Float64Array([pointOne, 9007199254740991, zeroValue]);
      const offsetOne: int = 1;
      dest.set(src, offsetOne);
      const actVal16 = dest.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal16).assertEqual(expectVal);
      const actVal17 = dest.$_get(1);
      const expectVal2 = pointOne;
      expect(actVal17).assertEqual(expectVal2);
      const actVal18 = dest.$_get(3);
      const expectVal3 = zeroValue;
      expect(actVal18).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1600
     * @tc.name testFloat64ArraySet016
     * @tc.desc Verify set from Float64Array with offset copies all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const dest = new Float64Array(5);
      const src = new Float64Array([pointFive, onePointFive]);
      const offsetThree: short = 3;
      dest.set(src, offsetThree);
      const actVal19 = dest.$_get(3);
      const expectVal = pointFive;
      expect(actVal19).assertEqual(expectVal);
      const actVal20 = dest.$_get(4);
      const expectVal2 = onePointFive;
      expect(actVal20).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1700
     * @tc.name testFloat64ArraySet017
     * @tc.desc Verify set from FixedArray source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const threePointZero: number = 3.0;
      const dest = new Float64Array(3);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      dest.set(src);
      const actVal21 = dest.$_get(0);
      const expectVal = onePointZero;
      expect(actVal21).assertEqual(expectVal);
      const actVal22 = dest.$_get(2);
      const expectVal2 = threePointZero;
      expect(actVal22).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1800
     * @tc.name testFloat64ArraySet018
     * @tc.desc Verify set from FixedArray writes offset positions 2 and 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const dest = new Float64Array(5);
      const src: FixedArray<number> = [10.0, 20.0];
      const offsetTwo: short = 2;
      dest.set(src, offsetTwo);
      const actVal23 = dest.$_get(2);
      const expectVal = tenPointZero;
      expect(actVal23).assertEqual(expectVal);
      const actVal24 = dest.$_get(3);
      const expectVal2 = twentyPointZero;
      expect(actVal24).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_1900
     * @tc.name testFloat64ArraySet019
     * @tc.desc Verify set from ArrayLike source with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const sevenPointZero: number = 7.0;
      const dest = new Float64Array(5);
      const src: ArrayLike<number> = [5.0, 6.0, 7.0];
      const offsetOne: short = 1;
      dest.set(src, offsetOne);
      const actVal25 = dest.$_get(1);
      const expectVal = fivePointZero;
      expect(actVal25).assertEqual(expectVal);
      const actVal26 = dest.$_get(3);
      const expectVal2 = sevenPointZero;
      expect(actVal26).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2000
     * @tc.name testFloat64ArraySet020
     * @tc.desc Verify set with int type value variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const arr = new Float64Array(3);
      const v: int = 42;
      const indexOne: int = 1;
      arr.set(indexOne, v);
      const actVal27 = arr.$_get(indexOne);
      const expectVal = fillValue42;
      expect(actVal27).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2100
     * @tc.name testFloat64ArraySet021
     * @tc.desc Verify set with double type value variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const arr = new Float64Array(3);
      const d: double = 3.14;
      const indexTwo: short = 2;
      arr.set(indexTwo, d);
      const actVal28 = arr.$_get(indexTwo);
      const expectVal = piApprox;
      expect(actVal28).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2200
     * @tc.name testFloat64ArraySet022
     * @tc.desc Verify set with short type value variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const arr = new Float64Array(3);
      const s: short = 7;
      const indexOne: short = 1;
      arr.set(indexOne, s);
      const actVal29 = arr.$_get(indexOne);
      const expectVal = sevenPointZero;
      expect(actVal29).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2300
     * @tc.name testFloat64ArraySet023
     * @tc.desc Verify set from FixedArray with int type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const dest = new Float64Array(3);
      const a: int = 10;
      const b: int = 20;
      const src: FixedArray<number> = [a, b, 30];
      dest.set(src);
      const actVal30 = dest.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal30).assertEqual(expectVal);
      const actVal31 = dest.$_get(1);
      const expectVal2 = twentyPointZero;
      expect(actVal31).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2400
     * @tc.name testFloat64ArraySet024
     * @tc.desc Verify set from Float64Array with negative offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dest = new Float64Array(3);
      const src = new Float64Array([-32768, -128]);
      try {
        dest.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2500
     * @tc.name testFloat64ArraySet025
     * @tc.desc Verify failed set preserves target byteLength and existing element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: Float64Array = Float64Array.of(7.0);
      const src: Float64Array = Float64Array.of(1.0, 2.0);
      const beforeByteLength: int = target.byteLength;
      try {
        target.set(src);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(target.byteLength).assertEqual(beforeByteLength);
      expect(target.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2600
     * @tc.name testFloat64ArraySet026
     * @tc.desc Verify set(index, value) writes negative, hex and positive decimal values in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negOnePointFive: number = -1.5;
      const hexValue20: number = 0x20;
      const fivePointZero: number = 5.0;
      const arr = new Float64Array(5);
      arr.set(0, negOnePointFive);
      arr.set(1, hexValue20);
      arr.set(4, 5.0);
      const actVal32 = arr.$_get(0);
      const expectVal = negOnePointFive;
      expect(actVal32).assertEqual(expectVal);
      const actVal33 = arr.$_get(1);
      const expectVal2 = hexValue20;
      expect(actVal33).assertEqual(expectVal2);
      const actVal34 = arr.$_get(4);
      const expectVal3 = fivePointZero;
      expect(actVal34).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2700
     * @tc.name testFloat64ArraySet027
     * @tc.desc Verify set from empty source does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const dest = new Float64Array(3);
      const src = new Float64Array(0);
      dest.set(src);
      const actVal35 = dest.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal35).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2800
     * @tc.name testFloat64ArraySet028
     * @tc.desc Verify set with max safe integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const arr = new Float64Array(3);
      arr.set(0, 9007199254740991.0);
      const actVal36 = arr.$_get(0);
      const expectVal = maxSafeIntegerValue;
      expect(actVal36).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2900
     * @tc.name testFloat64ArraySet029
     * @tc.desc Verify set(index, value) accepts double typed negative decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negSevenPointTwoFive: number = -7.25;
      const arr = new Float64Array(3);
      const v: double = -7.25;
      arr.set(1, v);
      const actVal37 = arr.$_get(1);
      const expectVal = negSevenPointTwoFive;
      expect(actVal37).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3000
     * @tc.name testFloat64ArraySet030
     * @tc.desc Verify set(index, value) writes MIN_SAFE_INTEGER at length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const arr = new Float64Array(5);
      arr.set(4, minSafeInteger);
      const actVal38 = arr.$_get(4);
      const expectVal = minSafeInteger;
      expect(actVal38).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3100
     * @tc.name testFloat64ArraySet031
     * @tc.desc Verify set from Float64Array with offset exactly fitting at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const dest = new Float64Array(4);
      const src = new Float64Array([pointOne, maxSafeInteger]);
      dest.set(src, 2);
      const actVal39 = dest.$_get(2);
      const expectVal = pointOne;
      expect(actVal39).assertEqual(expectVal);
      const actVal40 = dest.$_get(3);
      const expectVal2 = maxSafeInteger;
      expect(actVal40).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3200
     * @tc.name testFloat64ArraySet032
     * @tc.desc Verify set from FixedArray with insertPos=0 and large source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const tenPointZero: number = 10.0;
      const dest = new Float64Array(10);
      const src: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];
      dest.set(src, 0);
      const actVal41 = dest.$_get(0);
      const expectVal = onePointZero;
      expect(actVal41).assertEqual(expectVal);
      const actVal42 = dest.$_get(9);
      const expectVal2 = tenPointZero;
      expect(actVal42).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3300
     * @tc.name testFloat64ArraySet033
     * @tc.desc Verify set from Float64Array with negative offset throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dest = new Float64Array(5);
      const src = new Float64Array([0.5]);
      try {
        dest.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3400
     * @tc.name testFloat64ArraySet034
     * @tc.desc Verify set from FixedArray negative insertPos throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dest = new Float64Array(3);
      const src: FixedArray<number> = [1.0];
      try {
        dest.set(src, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3500
     * @tc.name testFloat64ArraySet035
     * @tc.desc Verify set from Float64Array overflow offset throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dest = new Float64Array(3);
      const src = Float64Array.of(-32768, -128, 0, 127);
      try {
        dest.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3600
     * @tc.name testFloat64ArraySet036
     * @tc.desc Verify set with value -1.0e+308 negative scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue10e308: number = -1.0e+308;
      const arr = new Float64Array(3);
      arr.set(0, -1.0e+308);
      const actVal43 = arr.$_get(0);
      const expectVal = negsciValue10e308;
      expect(actVal43).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3700
     * @tc.name testFloat64ArraySet037
     * @tc.desc Verify set from ArrayLike with insertPos=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const thirtyPointZero: number = 30.0;
      const dest = new Float64Array(3);
      const src: ArrayLike<number> = [10.0, 20.0, 30.0];
      dest.set(src, 0);
      const actVal44 = dest.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = dest.$_get(2);
      const expectVal2 = thirtyPointZero;
      expect(actVal45).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3800
     * @tc.name testFloat64ArraySet038
     * @tc.desc Verify set(index, value) writes negative, hex and scientific values at valid indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negOnePointFive: number = -1.5;
      const hexValue10: number = 0x10;
      const sciSmall: number = 1.0e-308;
      const arr = new Float64Array(3);
      arr.set(0, negOnePointFive);
      arr.set(1, hexValue10);
      arr.set(2, sciSmall);
      const actVal46 = arr.$_get(0);
      const expectVal = negOnePointFive;
      expect(actVal46).assertEqual(expectVal);
      const actVal47 = arr.$_get(2);
      const expectVal2 = sciSmall;
      expect(actVal47).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_3900
     * @tc.name testFloat64ArraySet039
     * @tc.desc Verify set from Float64Array default offset 0 preserves all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const dest = new Float64Array(3);
      const src = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      dest.set(src);
      const actVal48 = dest.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal48).assertEqual(expectVal);
      const actVal49 = dest.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal49).assertEqual(expectVal2);
      const actVal50 = dest.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal50).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4000
     * @tc.name testFloat64ArraySet040
     * @tc.desc Verify set from FixedArray offset=0 then verify unchanged elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const dest = new Float64Array(5);
      const src: FixedArray<number> = [10.0, 20.0];
      dest.set(src, 2);
      const actVal51 = dest.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal51).assertEqual(expectVal);
      const actVal52 = dest.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal52).assertEqual(expectVal2);
      const actVal53 = dest.$_get(2);
      const expectVal3 = tenPointZero;
      expect(actVal53).assertEqual(expectVal3);
      const actVal54 = dest.$_get(3);
      const expectVal4 = twentyPointZero;
      expect(actVal54).assertEqual(expectVal4);
      const actVal55 = dest.$_get(4);
      const expectVal5 = zeroPointZero;
      expect(actVal55).assertEqual(expectVal5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4100
     * @tc.name testFloat64ArraySet041
     * @tc.desc Verify set from Float64Array with zero-length source does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const dest = new Float64Array([pointOne, 9007199254740991, zeroValue]);
      const src = new Float64Array(0);
      dest.set(src, 0);
      const actVal56 = dest.$_get(0);
      const expectVal = pointOne;
      expect(actVal56).assertEqual(expectVal);
      const actVal57 = dest.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal57).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4200
     * @tc.name testFloat64ArraySet042
     * @tc.desc Verify set with hex octal binary literal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenPointzero: number = 16.0;
      const fourPointZero: number = 4.0;
      const arr = new Float64Array(3);
      arr.set(0, 0x10);
      arr.set(1, 0o20);
      arr.set(2, 0b100);
      const actVal58 = arr.$_get(0);
      const expectVal = sixteenPointzero;
      expect(actVal58).assertEqual(expectVal);
      const actVal59 = arr.$_get(1);
      const expectVal2 = sixteenPointzero;
      expect(actVal59).assertEqual(expectVal2);
      const actVal60 = arr.$_get(2);
      const expectVal3 = fourPointZero;
      expect(actVal60).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4300
     * @tc.name testFloat64ArraySet043
     * @tc.desc Verify set from FixedArray with MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const dest = new Float64Array(2);
      const src: FixedArray<number> = [9007199254740991.0, -9007199254740991.0];
      dest.set(src);
      const actVal61 = dest.$_get(0);
      const expectVal = maxSafeIntegerValue;
      expect(actVal61).assertEqual(expectVal);
      const actVal62 = dest.$_get(1);
      const expectVal2 = negativeMaxSafeIntegerValue;
      expect(actVal62).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4400
     * @tc.name testFloat64ArraySet044
     * @tc.desc Verify set from Float64Array with signed integer boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const int8MaxValue: number = 127;
      const dest = new Float64Array(4);
      const src = new Float64Array([int16MinValue, int8MinValue, 0, int8MaxValue]);
      dest.set(src);
      const actVal63 = dest.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal63).assertEqual(expectVal);
      const actVal64 = dest.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal64).assertEqual(expectVal2);
      const actVal65Value = dest.$_get(2);
      const expectVal3 = 0;
      expect(actVal65Value).assertEqual(expectVal3);
      const actVal66 = dest.$_get(3);
      const expectVal4 = int8MaxValue;
      expect(actVal66).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4500
     * @tc.name testFloat64ArraySet045
     * @tc.desc Verify set writes into fixed-length array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      arr.set(Float64Array.of(onePointZero), 0);
      const actVal67 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal67).assertEqual(expectVal);
      const actVal68 = arr.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal68).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4600
     * @tc.name testFloat64ArraySet046
     * @tc.desc Verify set writes into ArrayBuffer-backed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const buffer = new ArrayBuffer(24);
      const arr = new Float64Array(buffer, 16, 1);
      arr.set(Float64Array.of(onePointZero), 0);
      const actVal69 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal69).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4700
     * @tc.name testFloat64ArraySet047
     * @tc.desc Verify set writes into subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(new ArrayBuffer(24), 0, 3);
      const sub = arr.subarray(1, 3);
      sub.set(new Float64Array([onePointZero]), 0);
      const actVal70 = sub.$_get(0);
      const expectVal = onePointZero;
      expect(actVal70).assertEqual(expectVal);
      const actVal71 = arr.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal71).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4800
     * @tc.name testFloat64ArraySet048
     * @tc.desc Verify set writes into sliced copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array(3);
      const sliced = arr.slice(1, 2);
      sliced.set(Float64Array.of(onePointZero), 0);
      const actVal72 = sliced.$_get(0);
      const expectVal = onePointZero;
      expect(actVal72).assertEqual(expectVal);
      const actVal73 = arr.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal73).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_4900
     * @tc.name testFloat64ArraySet049
     * @tc.desc Verify set(index, value) accepts double typed fractional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneEighthValue: number = 0.125;
      const values = new Float64Array(2);
      const value: double = 0.125;
      values.set(1, value);
      const expectVal = oneEighthValue;
      expect(values[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5000
     * @tc.name testFloat64ArraySet050
     * @tc.desc Verify set(index, value) accepts negative decimal number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negSevenPointFive: number = -7.5;
      const values = new Float64Array(2);
      values.set(1, negSevenPointFive);
      const expectVal = negSevenPointFive;
      expect(values[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5100
     * @tc.name testFloat64ArraySet051
     * @tc.desc Verify set(arr:FixedArray<E>) from fixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const values = new Float64Array(2);
      const source: FixedArray<double> = [1, 2];
      values.set(source);
      const expectVal = oneValue;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5200
     * @tc.name testFloat64ArraySet052
     * @tc.desc Verify set(arr:FixedArray<E>, insertPos:int) with position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const twoValue: number = 2;
      const values = new Float64Array(3);
      const source: FixedArray<double> = [1, 2];
      values.set(source, 1);
      expect(values[1]).assertEqual(oneValue);
      expect(values[2]).assertEqual(twoValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5300
     * @tc.name testFloat64ArraySet053
     * @tc.desc Verify set(arr:FixedArray<number>) numeric fixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values = new Float64Array(2);
      const source: FixedArray<number> = [1.0, 2.0];
      values.set(source);
      const expectVal = onePointZero;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5400
     * @tc.name testFloat64ArraySet054
     * @tc.desc Verify set(arr:FixedArray<number>, insertPos:int) with position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values = new Float64Array(3);
      const source: FixedArray<number> = [1.0, 2.0];
      values.set(source, 1);
      const expectVal = onePointZero;
      expect(values[1]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5500
     * @tc.name testFloat64ArraySet055
     * @tc.desc Verify set(array:Float64Array) from same type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = new Float64Array(2);
      values.set(Float64Array.of(int32MinValue, -1));
      const expectVal = int32MinValue;
      expect(values[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5600
     * @tc.name testFloat64ArraySet056
     * @tc.desc Verify set(array:Float64Array, offset:int) with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const values = new Float64Array(3);
      values.set(Float64Array.of(pointOne, maxSafeInteger), 1);
      expect(values[1]).assertEqual(pointOne);
      expect(values[2]).assertEqual(maxSafeInteger);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5700
     * @tc.name testFloat64ArraySet057
     * @tc.desc Verify set(array:ArrayLike<number>, offset:int=0) array-like default offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const twoValue: number = 2;
      const values = new Float64Array(3);
      values.set([1, 2], 1);
      expect(values[1]).assertEqual(oneValue);
      expect(values[2]).assertEqual(twoValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5800
     * @tc.name testFloat64ArraySet058
     * @tc.desc Verify set(index=-1, value=MAX_SAFE_INTEGER) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Float64Array(2);
        arr.set(-1, Number.MAX_SAFE_INTEGER);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_5900
     * @tc.name testFloat64ArraySet059
     * @tc.desc Verify set(index=length, value=-1.0e+308) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Float64Array(2);
        arr.set(2, -1.0e+308);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6000
     * @tc.name testFloat64ArraySet060
     * @tc.desc Verify set(arr, offset=-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Float64Array(3);
        arr.set(new Float64Array([0.5]), -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6100
     * @tc.name testFloat64ArraySet061
     * @tc.desc Verify set(arr, offset=length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr = new Float64Array(3);
        arr.set(Float64Array.of(-32768), 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6200
     * @tc.name testFloat64ArraySet062
     * @tc.desc Verify set copies reverse overlapping subarray into same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0);
      const src = arr.subarray(1, 4);
      arr.set(src, 0);
      expect(arr.$_get(0)).assertEqual(2.0);
      expect(arr.$_get(1)).assertEqual(3.0);
      expect(arr.$_get(2)).assertEqual(4.0);
      expect(arr.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6300
     * @tc.name testFloat64ArraySet063
     * @tc.desc Verify set with valid offset but insufficient capacity throws RangeError atomically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dest = Float64Array.of(10.0, 20.0, 30.0);
      const src = Float64Array.of(1.0, 2.0);
      try {
        dest.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
        expect(dest.$_get(0)).assertEqual(10.0);
        expect(dest.$_get(1)).assertEqual(20.0);
        expect(dest.$_get(2)).assertEqual(30.0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6400
     * @tc.name testFloat64ArraySet064
     * @tc.desc Verify set copies -0.0 from subarray preserving sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const parent = Float64Array.of(1.0, -0.0, 2.0);
      const src = parent.subarray(1, 2);
      const dest = Float64Array.of(9.0, 9.0);
      dest.set(src, 1);
      expect(dest.$_get(0)).assertEqual(9.0);
      expect(1.0 / dest.$_get(1)).assertEqual(negativeInfinity);
      expect(1.0 / parent.$_get(1)).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6500
     * @tc.name testFloat64ArraySet065
     * @tc.desc Verify view byteOffset 8 starts at buffer middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 8, 2);
      view.set(new Float64Array([1.0, 2.0]), 0);
      expect(view.byteOffset).assertEqual(eightValue);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6600
     * @tc.name testFloat64ArraySet066
     * @tc.desc Verify view byteLength less than buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 0, 2);
      view.set(new Float64Array([1.0, 2.0]), 0);
      expect(view.byteLength).assertEqual(sixteenValue);
      expect(buf.byteLength).assertEqual(twentyfourValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6700
     * @tc.name testFloat64ArraySet067
     * @tc.desc Verify view length limited by remaining buffer space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const eightValue: number = 8;
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf, 8);
      view.set(Float64Array.of(1.0), 0);
      expect(view.length).assertEqual(oneValue);
      expect(view.byteLength).assertEqual(eightValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6800
     * @tc.name testFloat64ArraySet068
     * @tc.desc Verify byteOffset undefined length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const buf = new ArrayBuffer(16);
      const view = new Float64Array(buf, undefined, 1);
      view.set(Float64Array.of(1.0), 0);
      expect(view.byteOffset).assertEqual(zeroValue);
      expect(view.length).assertEqual(oneValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_6900
     * @tc.name testFloat64ArraySet069
     * @tc.desc Verify set with 2 elements into 1-element view throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 8);
      try {
        arr.set(new Float64Array([1.0, 2.0]), 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_7000
     * @tc.name testFloat64ArraySet070
     * @tc.desc Verify set offset equal to length throws RangeError and keeps length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const beforeLength: int = arr.length;
      try {
        arr.set([1.0], beforeLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.length).assertEqual(beforeLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_7100
     * @tc.name testFloat64ArraySet071
     * @tc.desc Verify set with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = new Float64Array(3);
      arr.set(Float64Array.of(hexValueFF, hexValueAA));
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(num170Pointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_7200
     * @tc.name testFloat64ArraySet072
     * @tc.desc Verify set with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = new Float64Array(3);
      arr.set(new Float64Array([binaryValue11111111, binaryValue10101010]));
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(num170Pointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_7300
     * @tc.name testFloat64ArraySet073
     * @tc.desc Verify set with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      arr.set(new Float64Array([1.0]), 0);
      const onePointZero: number = 1.0;
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(doubleMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_7400
     * @tc.name testFloat64ArraySet074
     * @tc.desc Verify set with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      arr.set(new Float64Array([1.0]), 0);
      const onePointZero: number = 1.0;
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_7500
     * @tc.name testFloat64ArraySet075
     * @tc.desc Verify set with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      arr.set(new Float64Array([1.0]), 0);
      const onePointZero: number = 1.0;
      expect(arr[0]).assertEqual(onePointZero);
      expect(arr[1]).assertEqual(doubleMaxValue);
    });

  })
}
