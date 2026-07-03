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
import Utils from '../Util.test';

export default function Float64ArrayReduce2Test(): void {
  describe('Float64ArrayReduce2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_0100
     * @tc.name testFloat64ArrayReduce2001
     * @tc.desc Verify reduce with callback + initialValue returns correct sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = maxSafeInteger;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_0200
     * @tc.name testFloat64ArrayReduce2002
     * @tc.desc Verify reduce with 0 parameters throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const twoValue: number = 2;
      const arr = Float64Array.of(int16MinValue, -128);
      try {
        arr.reduce((sum: number, v: number): number => {
          throw new Error("test error");
        });
        expect().assertFail();
      } catch (e) {
        expect(arr.length).assertEqual(twoValue);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_0300
     * @tc.name testFloat64ArrayReduce2003
     * @tc.desc Verify reduce generic U is number by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negnum2147483649Value: number = -2147483649;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = negnum2147483649Value;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_0400
     * @tc.name testFloat64ArrayReduce2004
     * @tc.desc Verify reduce with NaN element returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(nanValue, onePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const actVal1 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_0500
     * @tc.name testFloat64ArrayReduce2005
     * @tc.desc Verify reduce with INF and -INF returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(positiveInfinity, -positiveInfinity);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const actVal2 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_0600
     * @tc.name testFloat64ArrayReduce2006
     * @tc.desc Verify reduce with MIN_VALUE and MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const numberMaxValue: number = Number.MAX_VALUE;
      const arr = Float64Array.of(numberMinValue, numberMaxValue);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = numberMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_0700
     * @tc.name testFloat64ArrayReduce2007
     * @tc.desc Verify reduce callbackfn returns string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<string>((res, value) => res + value, "");
      const expectVal = "123";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_0800
     * @tc.name testFloat64ArrayReduce2008
     * @tc.desc Verify reduce callbackfn returns boolean (all positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<boolean>((acc, val) => acc && val > 0, true);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_0900
     * @tc.name testFloat64ArrayReduce2009
     * @tc.desc Verify reduce callbackfn returns boolean (has negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, -2.0, threePointZero);
      const result = arr.reduce<boolean>((acc, val) => acc && val > 0, true);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1000
     * @tc.name testFloat64ArrayReduce2010
     * @tc.desc Verify reduce callbackfn uses currentIndex parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const thirtyPointzero: number = 30.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(tenPointZero, twentyPointzero, thirtyPointzero);
      const result = arr.reduce<number>((sum, val, idx) => sum + idx, 0.0);
      const expectVal = threePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1100
     * @tc.name testFloat64ArrayReduce2011
     * @tc.desc Verify reduce callbackfn uses array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const sixPointZero: number = 6.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val, idx, ary) => sum + ary[idx], 0.0);
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1200
     * @tc.name testFloat64ArrayReduce2012
     * @tc.desc Verify reduce callbackfn returns currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val) => val, 999.0);
      const expectVal = threePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1300
     * @tc.name testFloat64ArrayReduce2013
     * @tc.desc Verify reduce callbackfn returns initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fillValue42: number = 42.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val) => sum, 42.0);
      const expectVal = fillValue42;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1400
     * @tc.name testFloat64ArrayReduce2014
     * @tc.desc Verify reduce callbackfn ignores currentValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val) => sum + 1.0, 0.0);
      const expectVal = threePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1500
     * @tc.name testFloat64ArrayReduce2015
     * @tc.desc Verify reduce callbackfn ignores previousValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val) => val, 0.0);
      const expectVal = threePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1600
     * @tc.name testFloat64ArrayReduce2016
     * @tc.desc Verify reduce callbackfn uses all four parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const eighteenPointzero: number = 18.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val, idx, ary) => sum + val + idx + ary.length, 0.0);
      const expectVal = eighteenPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1700
     * @tc.name testFloat64ArrayReduce2017
     * @tc.desc Verify reduce initialValue is 0 (integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const sixPointZero: number = 6.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1800
     * @tc.name testFloat64ArrayReduce2018
     * @tc.desc Verify reduce initialValue is -1 (negative integer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, -1.0);
      const expectVal = fivePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_1900
     * @tc.name testFloat64ArrayReduce2019
     * @tc.desc Verify reduce initialValue is 0.5 (decimal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const sixPointfive: number = 6.5;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.5);
      const expectVal = sixPointfive;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2000
     * @tc.name testFloat64ArrayReduce2020
     * @tc.desc Verify reduce initialValue is NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, NaN);
      const actVal3 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2100
     * @tc.name testFloat64ArrayReduce2021
     * @tc.desc Verify reduce initialValue is Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, Infinity);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2200
     * @tc.name testFloat64ArrayReduce2022
     * @tc.desc Verify reduce initialValue is -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, -Infinity);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2300
     * @tc.name testFloat64ArrayReduce2023
     * @tc.desc Verify reduce initialValue is 0x10 (hex literal 16)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const twentytwoPointzero: number = 22.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 16.0);
      const expectVal = twentytwoPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2400
     * @tc.name testFloat64ArrayReduce2024
     * @tc.desc Verify reduce initialValue is 0o10 (octal literal 8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourteenPointzero: number = 14.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 8.0);
      const expectVal = fourteenPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2500
     * @tc.name testFloat64ArrayReduce2025
     * @tc.desc Verify reduce initialValue is 0b10 (binary literal 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const eightPointZero: number = 8.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 2.0);
      const expectVal = eightPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2600
     * @tc.name testFloat64ArrayReduce2026
     * @tc.desc Verify reduce initialValue is 1e2 (scientific notation 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const num106Pointzero: number = 106.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 1e2);
      const expectVal = num106Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2700
     * @tc.name testFloat64ArrayReduce2027
     * @tc.desc Verify reduce initialValue is 1.5e1 (scientific notation 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const twentyonePointzero: number = 21.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 1.5e1);
      const expectVal = twentyonePointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2800
     * @tc.name testFloat64ArrayReduce2028
     * @tc.desc Verify reduce initialValue is 1.0e-308 (min scientific)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 1.0e-308);
      const expectVal = true;
      expect(result >= 6.0).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_2900
     * @tc.name testFloat64ArrayReduce2029
     * @tc.desc Verify reduce initialValue is Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const numberMaxValue: number = Number.MAX_VALUE;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, Number.MAX_VALUE);
      const expectVal = numberMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3000
     * @tc.name testFloat64ArrayReduce2030
     * @tc.desc Verify reduce initialValue is 5e-324 (MIN_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const sixPointZero: number = 6.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 5e-324);
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3100
     * @tc.name testFloat64ArrayReduce2031
     * @tc.desc Verify reduce initialValue is -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const sixPointZero: number = 6.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, -0.0);
      const expectVal = sixPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3200
     * @tc.name testFloat64ArrayReduce2032
     * @tc.desc Verify reduce initialValue is Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const sixPointZero: number = 6.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, Number.MAX_SAFE_INTEGER);
      const expectVal = maxSafeInteger + sixPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3300
     * @tc.name testFloat64ArrayReduce2033
     * @tc.desc Verify reduce initialValue is Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const negsciValue9007199254740985e15: number = -9.007199254740985e+15;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, Number.MIN_SAFE_INTEGER);
      const expectVal = negsciValue9007199254740985e15;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3400
     * @tc.name testFloat64ArrayReduce2034
     * @tc.desc Verify reduce initialValue is 0x20 (hex literal 32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const thirtyeightPointzero: number = 38.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 32.0);
      const expectVal = thirtyeightPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3500
     * @tc.name testFloat64ArrayReduce2035
     * @tc.desc Verify reduce initialValue is 0b1111 (binary literal 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const twentyonePointzero: number = 21.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 15.0);
      const expectVal = twentyonePointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3600
     * @tc.name testFloat64ArrayReduce2036
     * @tc.desc Verify reduce initialValue is 1e3 (scientific notation 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const num1006Pointzero: number = 1006.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 1e3);
      const expectVal = num1006Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3700
     * @tc.name testFloat64ArrayReduce2037
     * @tc.desc Verify reduce initialValue is 2.5e2 (scientific notation 250)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const num256Pointzero: number = 256.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 2.5e2);
      const expectVal = num256Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3800
     * @tc.name testFloat64ArrayReduce2038
     * @tc.desc Verify reduce initialValue is 1.0e+308 (max scientific)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const sciValue10e308: number = 1.0e+308;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 1.0e+308);
      const expectVal = sciValue10e308;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_3900
     * @tc.name testFloat64ArrayReduce2039
     * @tc.desc Verify reduce does not change array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = onePointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4000
     * @tc.name testFloat64ArrayReduce2040
     * @tc.desc Verify reduce does not change array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const buf = arr.buffer;
      arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = buf;
      expect(arr.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4100
     * @tc.name testFloat64ArrayReduce2041
     * @tc.desc Verify reduce returns expected computed result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const thirtyPointzero: number = 30.0;
      const num160Pointzero: number = 160.0;
      const arr = Float64Array.of(tenPointZero, twentyPointzero, thirtyPointzero);
      const result = arr.reduce((sum, val) => sum + val, 100.0);
      const expectVal = num160Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4200
     * @tc.name testFloat64ArrayReduce2042
     * @tc.desc Verify reduce callback throws RangeError at middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      try {
        arr.reduce<number>((sum, val, idx) => {
          if (idx === 1) {
            throw new RangeError("test");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4300
     * @tc.name testFloat64ArrayReduce2043
     * @tc.desc Verify reduce callback throws TypeError at middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      try {
        arr.reduce<number>((sum, val, idx) => {
          if (idx === 1) {
            throw new TypeError("test");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4400
     * @tc.name testFloat64ArrayReduce2044
     * @tc.desc Verify reduce callback throws Error at middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      try {
        arr.reduce<number>((sum, val, idx) => {
          if (idx === 1) {
            throw new Error("test");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4500
     * @tc.name testFloat64ArrayReduce2045
     * @tc.desc Verify reduce callback throws at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      try {
        arr.reduce<number>((sum, val, idx) => {
          throw new Error("first");
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4600
     * @tc.name testFloat64ArrayReduce2046
     * @tc.desc Verify reduce callback throws at middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      try {
        arr.reduce<number>((sum, val, idx) => {
          if (idx === 1) {
            throw new Error("middle");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4700
     * @tc.name testFloat64ArrayReduce2047
     * @tc.desc Verify reduce callback throws at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      try {
        arr.reduce<number>((sum, val, idx) => {
          if (idx === 2) {
            throw new Error("last");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4800
     * @tc.name testFloat64ArrayReduce2048
     * @tc.desc Verify reduce callback throws immediately and propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      try {
        arr.reduce<number>((sum, val) => {
          throw new Error("test");
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_4900
     * @tc.name testFloat64ArrayReduce2049
     * @tc.desc Verify reduce callback throws SyntaxError at middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      try {
        arr.reduce<number>((sum, val, idx) => {
          if (idx === 1) {
            throw new SyntaxError("test");
          }
          return sum + val;
        }, 0.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("SyntaxError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5000
     * @tc.name testFloat64ArrayReduce2050
     * @tc.desc Verify reduce empty array returns string initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.reduce<string>((res, value) => res + value, "init");
      const expectVal = "init";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5100
     * @tc.name testFloat64ArrayReduce2051
     * @tc.desc Verify reduce single element 100.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(hundredPointzero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = hundredPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5200
     * @tc.name testFloat64ArrayReduce2052
     * @tc.desc Verify reduce single element with negative initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointzero: number = 100.0;
      const fiftyPointzero: number = 50.0;
      const arr = Float64Array.of(hundredPointzero);
      const result = arr.reduce((sum, val) => sum + val, -50.0);
      const expectVal = fiftyPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5300
     * @tc.name testFloat64ArrayReduce2053
     * @tc.desc Verify reduce single element with MAX_VALUE initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const numberMaxValue: number = Number.MAX_VALUE;
      const arr = Float64Array.of(onePointZero);
      const result = arr.reduce((sum, val) => sum + val, Number.MAX_VALUE);
      const expectVal = numberMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5400
     * @tc.name testFloat64ArrayReduce2054
     * @tc.desc Verify reduce single element with MIN_VALUE initialValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(onePointZero);
      const result = arr.reduce((sum, val) => sum + val, 5e-324);
      const expectVal = onePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5500
     * @tc.name testFloat64ArrayReduce2055
     * @tc.desc Verify reduce single zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(zeroPointZero);
      const result = arr.reduce((sum, val) => sum + val, 999.0);
      const expectVal = num999Pointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5600
     * @tc.name testFloat64ArrayReduce2056
     * @tc.desc Verify reduce single NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const actVal4 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5700
     * @tc.name testFloat64ArrayReduce2057
     * @tc.desc Verify reduce single Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(positiveInfinity);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5800
     * @tc.name testFloat64ArrayReduce2058
     * @tc.desc Verify reduce single -Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(negativeInfinity);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_5900
     * @tc.name testFloat64ArrayReduce2059
     * @tc.desc Verify reduce single -0.0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(negativeZero);
      const result = arr.reduce((sum, val) => sum + val, 1.0);
      const expectVal = onePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6000
     * @tc.name testFloat64ArrayReduce2060
     * @tc.desc Verify reduce two elements 10.0 and 20.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const thirtyPointzero: number = 30.0;
      const arr = Float64Array.of(tenPointZero, twentyPointzero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = thirtyPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6100
     * @tc.name testFloat64ArrayReduce2061
     * @tc.desc Verify reduce three elements 10.0 20.0 30.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const thirtyPointzero: number = 30.0;
      const sixtyPointzero: number = 60.0;
      const arr = Float64Array.of(tenPointZero, twentyPointzero, thirtyPointzero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = sixtyPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6200
     * @tc.name testFloat64ArrayReduce2062
     * @tc.desc Verify reduce ten elements 1..10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fivePointZero: number = 5.0;
      const sixPointZero: number = 6.0;
      const sevenPointZero: number = 7.0;
      const eightPointZero: number = 8.0;
      const ninePointZero: number = 9.0;
      const tenPointZero: number = 10.0;
      const fillValue55: number = 55.0;
      const arr =
        Float64Array.of(onePointZero, twoPointZero, threePointZero, fourPointZero, fivePointZero, sixPointZero,
          sevenPointZero, eightPointZero, ninePointZero, tenPointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = fillValue55;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6300
     * @tc.name testFloat64ArrayReduce2063
     * @tc.desc Verify reduce all same elements 7.0 (5 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const thirtyfivePointzero: number = 35.0;
      const arr = Float64Array.of(sevenPointZero, sevenPointZero, sevenPointZero, sevenPointZero, sevenPointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = thirtyfivePointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6400
     * @tc.name testFloat64ArrayReduce2064
     * @tc.desc Verify reduce all same elements 3.0 (10 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const thirtyPointzero: number = 30.0;
      const arr =
        Float64Array.of(threePointZero, threePointZero, threePointZero, threePointZero, threePointZero, threePointZero,
          threePointZero, threePointZero, threePointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = thirtyPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6500
     * @tc.name testFloat64ArrayReduce2065
     * @tc.desc Verify reduce decreasing sequence 10..1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const ninePointZero: number = 9.0;
      const eightPointZero: number = 8.0;
      const sevenPointZero: number = 7.0;
      const sixPointZero: number = 6.0;
      const fivePointZero: number = 5.0;
      const fourPointZero: number = 4.0;
      const threePointZero: number = 3.0;
      const twoPointZero: number = 2.0;
      const onePointZero: number = 1.0;
      const fillValue55: number = 55.0;
      const arr =
        Float64Array.of(tenPointZero, ninePointZero, eightPointZero, sevenPointZero, sixPointZero, fivePointZero,
          fourPointZero, threePointZero, twoPointZero, onePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = fillValue55;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6600
     * @tc.name testFloat64ArrayReduce2066
     * @tc.desc Verify reduce alternating positive and negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(onePointZero, -1.0, onePointZero, -1.0);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6700
     * @tc.name testFloat64ArrayReduce2067
     * @tc.desc Verify reduce with -1.0 0.0 1.0 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(negonePointzero, zeroPointZero, onePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = zeroPointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6800
     * @tc.name testFloat64ArrayReduce2068
     * @tc.desc Verify reduce with multiple zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(zeroPointZero, zeroPointZero, zeroPointZero, zeroPointZero, zeroPointZero);
      const result = arr.reduce((sum, val) => sum + val, 5.0);
      const expectVal = fivePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_6900
     * @tc.name testFloat64ArrayReduce2069
     * @tc.desc Verify reduce with MAX_VALUE and 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(numberMaxValue, onePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = numberMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7000
     * @tc.name testFloat64ArrayReduce2070
     * @tc.desc Verify reduce with 5e-324 (MIN_VALUE) and 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(doubleMinValue, onePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = onePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7100
     * @tc.name testFloat64ArrayReduce2071
     * @tc.desc Verify reduce with NaN in middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const nanValue: number = NaN;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, nanValue, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const actVal5 = Number.isNaN(result);
      const expectVal = true;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7200
     * @tc.name testFloat64ArrayReduce2072
     * @tc.desc Verify reduce with Infinity in middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const positiveInfinity: number = Infinity;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, positiveInfinity, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = positiveInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7300
     * @tc.name testFloat64ArrayReduce2073
     * @tc.desc Verify reduce with -Infinity in middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const positiveInfinity: number = Infinity;
      const threePointZero: number = 3.0;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(onePointZero, -positiveInfinity, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = negativeInfinity;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7400
     * @tc.name testFloat64ArrayReduce2074
     * @tc.desc Verify reduce with 0.0 and -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(zeroPointZero, -0.0, onePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = onePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7500
     * @tc.name testFloat64ArrayReduce2075
     * @tc.desc Verify reduce with precision boundary 0.1+0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const pointThree: number = 0.3;
      const arr = Float64Array.of(pointOne, pointTwo, pointThree);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = true;
      expect(result > 0.3 + 0.3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7600
     * @tc.name testFloat64ArrayReduce2076
     * @tc.desc Verify reduce with large scientific values 1e+300 and 2e+300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e300: number = 1.0e+300;
      const sciValue20e300: number = 2.0e+300;
      const sciValue30e300: number = 3.0e+300;
      const arr = Float64Array.of(sciValue10e300, sciValue20e300);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = sciValue30e300;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7700
     * @tc.name testFloat64ArrayReduce2077
     * @tc.desc Verify reduce with small scientific values 1e-300 and 2e-300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e300: number = 1.0e-300;
      const sciValue20e300: number = 2.0e-300;
      const sciValue30e300: number = 3.0e-300;
      const arr = Float64Array.of(sciValue10e300, sciValue20e300);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = sciValue30e300;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7800
     * @tc.name testFloat64ArrayReduce2078
     * @tc.desc Verify reduce callback uses closure variable multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const twelvePointzero: number = 12.0;
      const multiplier: number = 2;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val) => sum + val * multiplier, 0.0);
      const expectVal = twelvePointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_7900
     * @tc.name testFloat64ArrayReduce2079
     * @tc.desc Verify reduce callback using conditional expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val) => val > 1 ? sum + val : sum, 0.0);
      const expectVal = fivePointZero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_8000
     * @tc.name testFloat64ArrayReduce2080
     * @tc.desc Verify reduce callback modifies array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      arr.reduce<number>((sum, val, idx, ary) => {
        ary[idx] = val * 2.0;
        return sum + val;
      }, 0.0);
      const expectVal = twoPointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_8100
     * @tc.name testFloat64ArrayReduce2081
     * @tc.desc Verify reduce callback reads modified array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const twelvePointzero: number = 12.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val, idx, ary) => {
        ary[idx] = val * 2.0;
        return sum + ary[idx];
      }, 0.0);
      const expectVal = twelvePointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_8200
     * @tc.name testFloat64ArrayReduce2082
     * @tc.desc Verify reduce callback uses external counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const sixPointZero: number = 6.0;
      let counter: int = 0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce<number>((sum, val) => {
        counter++;
        return sum + val;
      }, 0.0);
      const expectVal = threeValue;
      expect(counter).assertEqual(expectVal);
      const expectVal2 = sixPointZero;
      expect(result).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_8300
     * @tc.name testFloat64ArrayReduce2083
     * @tc.desc Verify reduce negative values array -1 -2 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const negsixPointzero: number = -6.0;
      const arr = Float64Array.of(negonePointzero, -2.0, -3.0);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = negsixPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_8400
     * @tc.name testFloat64ArrayReduce2084
     * @tc.desc Verify reduce large negative values -999999.99 and -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const negnum1000000Pointninenine: number = -1000000.99;
      const arr = Float64Array.of(negnum999999Pointninenine, -1.0);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = negnum1000000Pointninenine;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_8500
     * @tc.name testFloat64ArrayReduce2085
     * @tc.desc Verify reduce with all same elements 5.0 (4 elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const twentyPointzero: number = 20.0;
      const arr = Float64Array.of(fivePointZero, fivePointZero, fivePointZero, fivePointZero);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = twentyPointzero;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_8600
     * @tc.name testFloat64ArrayReduce2086
     * @tc.desc Verify reduce with MAX_VALUE and MIN_VALUE elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(numberMaxValue, doubleMinValue);
      const result = arr.reduce((sum, val) => sum + val, 0.0);
      const expectVal = numberMaxValue;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REDUCE_2_8700
     * @tc.name testFloat64ArrayReduce2087
     * @tc.desc Verify reduce initialValue true (boolean as number 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReduce2087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const sevenPointZero: number = 7.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.reduce((sum, val) => sum + val, 1.0);
      const expectVal = sevenPointZero;
      expect(result).assertEqual(expectVal);
    })

  })
}
