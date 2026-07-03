'use static'
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

export default function float64ArrayValueOfTest(): void {
  describe('Float64ArrayValueOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_0100
     * @tc.name testFloat64ArrayValueOf001
     * @tc.desc Verify valueOf on empty array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.valueOf();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_0200
     * @tc.name testFloat64ArrayValueOf002
     * @tc.desc Verify valueOf on single-element array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      const result = arr.valueOf();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_0300
     * @tc.name testFloat64ArrayValueOf003
     * @tc.desc Verify valueOf on multi-element array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const actVal1 = arr.valueOf();
      const expectVal = arr;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_0400
     * @tc.name testFloat64ArrayValueOf004
     * @tc.desc Verify valueOf on sized zero-initialized array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(5);
      const actVal2 = arr.valueOf();
      const expectVal = arr;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_0500
     * @tc.name testFloat64ArrayValueOf005
     * @tc.desc Verify valueOf on large array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(1000);
      const actVal3 = arr.valueOf();
      const expectVal = arr;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_0600
     * @tc.name testFloat64ArrayValueOf006
     * @tc.desc Verify valueOf on array with special float values (+0, -0, Infinity, -Infinity) returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const negativeZero: number = -0.0;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(zeroPointZero, negativeZero, positiveInfinity, negativeInfinity);
      const actVal4 = arr.valueOf();
      const expectVal = arr;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_0700
     * @tc.name testFloat64ArrayValueOf007
     * @tc.desc Verify valueOf on array with NaN returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const onePointZero: number = 1.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(nanValue, onePointZero, threePointZero);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      const actVal5 = Number.isNaN(ret[0]);
      const expectVal2 = true;
      expect(actVal5).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_0800
     * @tc.name testFloat64ArrayValueOf008
     * @tc.desc Verify valueOf on ArrayBuffer view returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Float64Array(buf, 0, 3);
      const actVal6 = view.valueOf();
      const expectVal = view;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_0900
     * @tc.name testFloat64ArrayValueOf009
     * @tc.desc Verify valueOf on non-zero offset view returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float64Array(buf, 8, 3);
      const actVal7 = view.valueOf();
      const expectVal = view;
      expect(actVal7).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1000
     * @tc.name testFloat64ArrayValueOf010
     * @tc.desc Verify valueOf on copy-constructed array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const original = Float64Array.of(pointFive, onePointFive);
      const copy = new Float64Array(original);
      const actVal8 = copy.valueOf();
      const expectVal = copy;
      expect(actVal8).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1100
     * @tc.name testFloat64ArrayValueOf011
     * @tc.desc Verify valueOf on FixedArray-constructed array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<number> = [10.0, 20.0, 30.0];
      const arr = new Float64Array(fa);
      const actVal9 = arr.valueOf();
      const expectVal = arr;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1200
     * @tc.name testFloat64ArrayValueOf012
     * @tc.desc Verify valueOf return has same buffer as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float64Array(buf, 0, 2);
      const actVal10 = arr.valueOf().buffer;
      const expectVal = arr.buffer;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1300
     * @tc.name testFloat64ArrayValueOf013
     * @tc.desc Verify valueOf does not modify original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const ret = arr.valueOf();
      const actVal11 = ret.$_get(0);
      const expectVal = pointOne;
      expect(actVal11).assertEqual(expectVal);
      const actVal12 = ret.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal12).assertEqual(expectVal2);
      const actVal13 = ret.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal13).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1400
     * @tc.name testFloat64ArrayValueOf014
     * @tc.desc Verify valueOf return shares buffer - writing via return affects original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const ret = arr.valueOf();
      ret.$_set(0, num999Pointzero);
      const actVal14 = arr.$_get(0);
      const expectVal = num999Pointzero;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1500
     * @tc.name testFloat64ArrayValueOf015
     * @tc.desc Verify valueOf consecutive calls all return same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const r1 = arr.valueOf();
      const r2 = arr.valueOf();
      const r3 = arr.valueOf();
      const expectVal = r2;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = r3;
      expect(r2).assertEqual(expectVal2);
      const expectVal3 = arr;
      expect(r1).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1600
     * @tc.name testFloat64ArrayValueOf016
     * @tc.desc Verify valueOf return can call $_get correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const ret = arr.valueOf();
      const actVal15 = ret.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = ret.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal16).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1700
     * @tc.name testFloat64ArrayValueOf017
     * @tc.desc Verify valueOf return can call $_set and original reflects change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointzero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const arr = new Float64Array(2);
      const ret = arr.valueOf();
      ret.$_set(0, hundredPointzero);
      ret.$_set(1, num200Pointzero);
      const actVal17 = arr.$_get(0);
      const expectVal = hundredPointzero;
      expect(actVal17).assertEqual(expectVal);
      const actVal18 = arr.$_get(1);
      const expectVal2 = num200Pointzero;
      expect(actVal18).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1800
     * @tc.name testFloat64ArrayValueOf018
     * @tc.desc Verify valueOf return preserves first and last values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(pointOne);
      expect(ret[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_1900
     * @tc.name testFloat64ArrayValueOf019
     * @tc.desc Verify valueOf result used to construct copy creates independent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const original = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const ret = original.valueOf();
      const copy = new Float64Array(ret);
      expect(copy.length).assertEqual(threeValue);
      expect(copy === original).assertEqual(false);
      const actVal19 = copy.$_get(0);
      const expectVal = pointFive;
      expect(actVal19).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2000
     * @tc.name testFloat64ArrayValueOf020
     * @tc.desc Verify Float64Array.from(valueOf result) creates copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const ret = arr.valueOf();
      const fromRet = Float64Array.from(ret);
      expect(fromRet.length).assertEqual(arr.length);
      const actVal20 = fromRet.$_get(0);
      const expectVal = arr.$_get(0);
      expect(actVal20).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2100
     * @tc.name testFloat64ArrayValueOf021
     * @tc.desc Verify valueOf result used as set target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const source = Float64Array.of(int32MinValue, negativeOne);
      const target = new Float64Array(2);
      const ret = target.valueOf();
      ret.set(source);
      const actVal21 = target.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal21).assertEqual(expectVal);
      const actVal22 = target.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal22).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2200
     * @tc.name testFloat64ArrayValueOf022
     * @tc.desc Verify valueOf on all-zero array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(10);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      const actVal23 = ret.$_get(5);
      const expectVal2 = zeroPointZero;
      expect(actVal23).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2300
     * @tc.name testFloat64ArrayValueOf023
     * @tc.desc Verify valueOf on all-same array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(piValue, piValue, piValue, piValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      const actVal24 = ret.$_get(2);
      const expectVal2 = piValue;
      expect(actVal24).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2400
     * @tc.name testFloat64ArrayValueOf024
     * @tc.desc Verify valueOf on ascending array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const actVal25 = arr.valueOf();
      const expectVal = arr;
      expect(actVal25).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2500
     * @tc.name testFloat64ArrayValueOf025
     * @tc.desc Verify valueOf on descending array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const actVal26 = arr.valueOf();
      const expectVal = arr;
      expect(actVal26).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2600
     * @tc.name testFloat64ArrayValueOf026
     * @tc.desc Verify valueOf on negative values array returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const actVal27 = arr.valueOf();
      const expectVal = arr;
      expect(actVal27).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2700
     * @tc.name testFloat64ArrayValueOf027
     * @tc.desc Verify valueOf on array with MAX_VALUE returns same reference and preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(doubleMaxValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(doubleMaxValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2800
     * @tc.name testFloat64ArrayValueOf028
     * @tc.desc Verify valueOf on array with MIN_VALUE returns same reference and preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMinValue2: number = 5e-324;
      const arr = Float64Array.of(doubleMinValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(doubleMinValue2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_2900
     * @tc.name testFloat64ArrayValueOf029
     * @tc.desc Verify valueOf on array with +0/-0 returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(zeroPointZero, negativeZero);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3000
     * @tc.name testFloat64ArrayValueOf030
     * @tc.desc Verify valueOf on array with NaN element returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const arr = Float64Array.of(nanValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      const actVal28 = Number.isNaN(ret[0]);
      const expectVal2 = true;
      expect(actVal28).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3100
     * @tc.name testFloat64ArrayValueOf031
     * @tc.desc Verify valueOf on array with MAX_SAFE_INTEGER returns same reference and preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(maxSafeInteger);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(maxSafeInteger);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3200
     * @tc.name testFloat64ArrayValueOf032
     * @tc.desc Verify valueOf on array with MIN_SAFE_INTEGER returns same reference and preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = -9007199254740991;
      const arr = Float64Array.of(minSafeInteger);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(minSafeInteger);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3300
     * @tc.name testFloat64ArrayValueOf033
     * @tc.desc Verify valueOf on array with scientific notation values returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const sciValue10e3082: number = 1.0e+308;
      const negsciValue25e100: number = -2.5e+100;
      const arr = Float64Array.of(sciValue10e308, sciValue10e3082, negsciValue25e100);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3400
     * @tc.name testFloat64ArrayValueOf034
     * @tc.desc Verify valueOf on array with 0.1+0.2 floating point precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const precisionSumValue: number =
        0.30000000000000004;
      const arr = Float64Array.of(pointOne, pointTwo);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0] + ret[1])
        .assertEqual(precisionSumValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3500
     * @tc.name testFloat64ArrayValueOf035
     * @tc.desc Verify different views on same buffer valueOf each returns themselves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const v1 = new Float64Array(buf, 0, 3);
      const v2 = new Float64Array(buf, 8, 2);
      const r1 = v1.valueOf();
      const r2 = v2.valueOf();
      const expectVal = v1;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = v2;
      expect(r2).assertEqual(expectVal2);
      expect(r1 === r2).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3600
     * @tc.name testFloat64ArrayValueOf036
     * @tc.desc Verify child view valueOf write affects parent view on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num777Pointzero: number = 777.0;
      const buf = new ArrayBuffer(16);
      const parent = new Float64Array(buf);
      const child = new Float64Array(buf, 0, 2);
      const ret = child.valueOf();
      ret.$_set(0, num777Pointzero);
      const actVal29 = parent.$_get(0);
      const expectVal = num777Pointzero;
      expect(actVal29).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3700
     * @tc.name testFloat64ArrayValueOf037
     * @tc.desc Verify parent view valueOf write affects child view on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num888Pointzero: number = 888.0;
      const buf = new ArrayBuffer(16);
      const parent = new Float64Array(buf);
      const child = new Float64Array(buf, 0, 2);
      const ret = parent.valueOf();
      ret.$_set(1, num888Pointzero);
      const actVal30 = child.$_get(1);
      const expectVal = num888Pointzero;
      expect(actVal30).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3800
     * @tc.name testFloat64ArrayValueOf038
     * @tc.desc Verify valueOf return $_set out-of-bounds does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const twoValue: number = 2;
      const arr = new Float64Array(2);
      const ret = arr.valueOf();
      try {
        ret.$_set(100, num999Pointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
        expect(arr.length).assertEqual(twoValue);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_3900
     * @tc.name testFloat64ArrayValueOf039
     * @tc.desc Verify valueOf return length on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointOne);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret.length).assertEqual(oneValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4000
     * @tc.name testFloat64ArrayValueOf040
     * @tc.desc Verify valueOf on array with mixed +0/-0/positive/negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const fourValue: number = 4;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      const actVal31 = arr.valueOf();
      const expectVal = arr;
      expect(actVal31).assertEqual(expectVal);
      const actVal32 = arr.valueOf().length;
      const expectVal2 = fourValue;
      expect(actVal32).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4100
     * @tc.name testFloat64ArrayValueOf041
     * @tc.desc Verify valueOf on array with overflow bound value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      const actVal33 = arr.valueOf();
      const expectVal = arr;
      expect(actVal33).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4200
     * @tc.name testFloat64ArrayValueOf042
     * @tc.desc Verify valueOf return preserves first and last integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(int32MinValue);
      expect(ret[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4300
     * @tc.name testFloat64ArrayValueOf043
     * @tc.desc Verify valueOf return preserves decimal and large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(pointOne);
      expect(ret[1]).assertEqual(maxSafeInteger);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4400
     * @tc.name testFloat64ArrayValueOf044
     * @tc.desc Verify valueOf return preserves length for fractional array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const fourValue: number = 4;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret.length).assertEqual(fourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4500
     * @tc.name testFloat64ArrayValueOf045
     * @tc.desc Verify valueOf return preserves non-positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(int16MinValue);
      expect(ret[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4600
     * @tc.name testFloat64ArrayValueOf046
     * @tc.desc Verify valueOf return preserves negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(int32MinValue);
      expect(ret[1]).assertEqual(negativeOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4700
     * @tc.name testFloat64ArrayValueOf047
     * @tc.desc Verify valueOf return preserves large middle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[1]).assertEqual(maxSafeInteger);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4800
     * @tc.name testFloat64ArrayValueOf048
     * @tc.desc Verify valueOf return preserves fractional elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0]).assertEqual(pointFive);
      expect(ret[1]).assertEqual(onePointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_4900
     * @tc.name testFloat64ArrayValueOf049
     * @tc.desc Verify valueOf return preserves integer array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const twentyFourValue: number = 24;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret.byteLength).assertEqual(twentyFourValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5000
     * @tc.name testFloat64ArrayValueOf050
     * @tc.desc Verify valueOf return works with for-of iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const negnum2147483649Value: number = -2147483649;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      let sum: number = 0.0;
      for (const val of arr.valueOf()) {
        sum = sum + val;
      }
      const expectVal = negnum2147483649Value;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5100
     * @tc.name testFloat64ArrayValueOf051
     * @tc.desc Verify valueOf with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const v = arr.valueOf();
      expect(v[0]).assertEqual(num255Value);
      expect(v[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5200
     * @tc.name testFloat64ArrayValueOf052
     * @tc.desc Verify valueOf with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      const v = arr.valueOf();
      expect(v[0]).assertEqual(num255Value);
      expect(v[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5300
     * @tc.name testFloat64ArrayValueOf053
     * @tc.desc Verify valueOf on array with Double.NaN and Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      const actVal34 = Number.isNaN(ret[0]);
      const expectVal2 = true;
      expect(actVal34).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5400
     * @tc.name testFloat64ArrayValueOf054
     * @tc.desc Verify valueOf on array with POSITIVE_INFINITY and NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0] > 0.0).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5500
     * @tc.name testFloat64ArrayValueOf055
     * @tc.desc Verify valueOf on array with Double.MIN_VALUE and Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const ret = arr.valueOf();
      const expectVal = arr;
      expect(ret).assertEqual(expectVal);
      expect(ret[0] > 0.0).assertEqual(true);
      expect(ret[1] > 0.0).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5600
     * @tc.name testFloat64ArrayValueOf056
     * @tc.desc Verify valueOf alias write updates original element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.0, 2.0, 3.0);
      const alias = a.valueOf();
      alias.$_set(1, 9.5);
      const actVal35 = a.$_get(1);
      const expectVal = 9.5;
      expect(actVal35).assertEqual(expectVal);
      const expectVal2 = a;
      expect(alias).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5700
     * @tc.name testFloat64ArrayValueOf057
     * @tc.desc Verify valueOf alias observes original set mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(4.0, 5.0, 6.0);
      const alias = a.valueOf();
      a.$_set(2, 60.0);
      const actVal36 = alias.$_get(2);
      const expectVal = 60.0;
      expect(actVal36).assertEqual(expectVal);
      expect(alias.length).assertEqual(3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5800
     * @tc.name testFloat64ArrayValueOf058
     * @tc.desc Verify valueOf preserves nonzero byteOffset view metadata
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(32);
      const v = new Float64Array(b, 8, 2);
      v.$_set(0, 11.0);
      const alias = v.valueOf();
      expect(alias.byteOffset).assertEqual(8);
      const actVal37 = alias.$_get(0);
      const expectVal = 11.0;
      expect(actVal37).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_5900
     * @tc.name testFloat64ArrayValueOf059
     * @tc.desc Verify valueOf on subarray keeps local length and first value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(7.0, 8.0, 9.0, 10.0);
      const v = a.subarray(1, 3).valueOf();
      expect(v.length).assertEqual(2);
      const actVal38 = v.$_get(0);
      const expectVal = 8.0;
      expect(actVal38).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_6000
     * @tc.name testFloat64ArrayValueOf060
     * @tc.desc Verify repeated valueOf calls share one mutable reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.25, 2.25);
      const first = a.valueOf();
      const second = a.valueOf();
      first.$_set(0, 12.5);
      const actVal39 = second.$_get(0);
      const expectVal = 12.5;
      expect(actVal39).assertEqual(expectVal);
      const expectVal2 = second;
      expect(first).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_6100
     * @tc.name testFloat64ArrayValueOf061
     * @tc.desc Verify valueOf preserves NaN element through alias reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(NaN, 1.0);
      const alias = a.valueOf();
      const actVal40 = Number.isNaN(alias.$_get(0));
      const expectVal = true;
      expect(actVal40).assertEqual(expectVal);
      const actVal41 = alias.$_get(1);
      const expectVal2 = 1.0;
      expect(actVal41).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_6200
     * @tc.name testFloat64ArrayValueOf062
     * @tc.desc Verify valueOf alias fill mutates source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(2.0, 4.0, 6.0);
      const alias = a.valueOf();
      alias.fill(8.0);
      const actVal42 = a.$_get(0);
      const expectVal = 8.0;
      expect(actVal42).assertEqual(expectVal);
      const actVal43 = a.$_get(2);
      const expectVal2 = 8.0;
      expect(actVal43).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_VALUEOF_6300
     * @tc.name testFloat64ArrayValueOf063
     * @tc.desc Verify valueOf alias reverse mutates the same source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayValueOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.0, 2.0, 3.0);
      const alias = a.valueOf();
      alias.reverse();
      const actVal44 = a.$_get(0);
      const expectVal = 3.0;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = a.$_get(2);
      const expectVal2 = 1.0;
      expect(actVal45).assertEqual(expectVal2);
    })

  })
}
