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
import Utils, { isPositive103, double107 } from '../Util.test';

export default function Float64ArrayEvery2Test(): void {
  describe('Float64ArrayEvery2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_0100
     * @tc.name testFloat64ArrayEvery2001
     * @tc.desc Verify every returns true when all elements are 0.0 satisfying >= 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value >= 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_0200
     * @tc.name testFloat64ArrayEvery2002
     * @tc.desc Verify every returns true when all elements are -0.0 satisfying >= -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(negativeZero, -0.0);
      const result = arr.every((value: number, index: int): boolean => {
        return value >= -0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_0300
     * @tc.name testFloat64ArrayEvery2003
     * @tc.desc Verify every returns true when all elements are Infinity satisfying > 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, positiveInfinity);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_0400
     * @tc.name testFloat64ArrayEvery2004
     * @tc.desc Verify every returns false when all elements are negative Infinity not satisfying > 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(negativeInfinity, negativeInfinity);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_0500
     * @tc.name testFloat64ArrayEvery2005
     * @tc.desc Verify every returns true when array contains MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = Double.MAX_VALUE;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(doubleMaxValue, onePointZero);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_0600
     * @tc.name testFloat64ArrayEvery2006
     * @tc.desc Verify every returns true when array contains MIN_VALUE tiny positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(doubleMinValue, onePointZero);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_0700
     * @tc.name testFloat64ArrayEvery2007
     * @tc.desc Verify every returns true when array contains negative MAX_VALUE satisfying < 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue17976931348623157e308: number = -1.7976931348623157e+308;
      const arr = Float64Array.of(negsciValue17976931348623157e308, -1.0);
      const result = arr.every((value: number, index: int): boolean => {
        return value < 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_0800
     * @tc.name testFloat64ArrayEvery2008
     * @tc.desc Verify every with hex literal 0x10 equals 16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const hexValue0A: number = 0x0A;
      const arr = Float64Array.of(hexValue10, hexValue0A, hexValue0A);
      const result = arr.every((value: number): boolean => {
        return value >= 10.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_0900
     * @tc.name testFloat64ArrayEvery2009
     * @tc.desc Verify every with scientific notation positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e10: number = 1.0e+10;
      const negsciValue10e10: number = -1.0e+10;
      const sciValue10e102: number = 1.0e-10;
      const arr = Float64Array.of(sciValue10e10, negsciValue10e10, sciValue10e102);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value !== 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1000
     * @tc.name testFloat64ArrayEvery2010
     * @tc.desc Verify every on length 1 array with positive element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(1);
      arr.$_set(0, onePointZero);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1100
     * @tc.name testFloat64ArrayEvery2011
     * @tc.desc Verify every on length 2 array with positive elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = new Float64Array(2);
      arr.$_set(0, onePointZero);
      arr.$_set(1, twoPointZero);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1200
     * @tc.name testFloat64ArrayEvery2012
     * @tc.desc Verify every on large array of 10000 elements all >= 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(10000);
      for (let i: int = 0; i < 10000; i++) {
        arr.$_set(i, i);
      }
      const result = arr.every((value: number, index: int): boolean => {
        return value >= 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1300
     * @tc.name testFloat64ArrayEvery2013
     * @tc.desc Verify every when all elements are same value 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const arr = Float64Array.of(piApprox, piApprox, piApprox, piApprox);
      const result = arr.every((value: number): boolean => {
        return value === 3.14;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1400
     * @tc.name testFloat64ArrayEvery2014
     * @tc.desc Verify every when each element equals index+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero, fourPointZero, fivePointZero);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value === index + 1.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1500
     * @tc.name testFloat64ArrayEvery2015
     * @tc.desc Verify every with shorthand arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1600
     * @tc.name testFloat64ArrayEvery2016
     * @tc.desc Verify every with multi-line arrow function body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.every((value: number, index: int): boolean => {
        const check: boolean = value > 0.0;
        return check;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1700
     * @tc.name testFloat64ArrayEvery2017
     * @tc.desc Verify every with named function extracted to helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.every(isPositive103);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1800
     * @tc.name testFloat64ArrayEvery2018
     * @tc.desc Verify every with anonymous function expression as arrow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_1900
     * @tc.name testFloat64ArrayEvery2019
     * @tc.desc Verify every callback using external variable threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const threshold: double = 0.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > threshold;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2000
     * @tc.name testFloat64ArrayEvery2020
     * @tc.desc Verify every callback modifies external variable count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      let count: int = 0;
      arr.every((value: number, index: int): boolean => {
        count = count + 1;
        return true;
      })

      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2100
     * @tc.name testFloat64ArrayEvery2021
     * @tc.desc Verify every callback calls external function from helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.every((value: number): boolean => {
        return double107(value) > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2200
     * @tc.name testFloat64ArrayEvery2022
     * @tc.desc Verify every with nested every call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return arr.every((innerValue: number, innerIndex: int, innerArray: Float64Array): boolean => {
          return innerValue > 0.0;
        })

      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2300
     * @tc.name testFloat64ArrayEvery2023
     * @tc.desc Verify every with multi-condition AND operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 0.0 && value < 10.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2400
     * @tc.name testFloat64ArrayEvery2024
     * @tc.desc Verify every with multi-condition OR operation returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.every((value: number): boolean => {
        return value < 0.0 || value > 10.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2500
     * @tc.name testFloat64ArrayEvery2025
     * @tc.desc Verify every with equality check value equals index+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value === index + 1.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2600
     * @tc.name testFloat64ArrayEvery2026
     * @tc.desc Verify every with inequality check value not equal to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value !== 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2700
     * @tc.name testFloat64ArrayEvery2027
     * @tc.desc Verify every with logical NOT condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.every((value: number, index: int): boolean => {
        let cond: boolean = value <= 0.0;
        return !cond;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2800
     * @tc.name testFloat64ArrayEvery2028
     * @tc.desc Verify every with ternary expression in predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.every((value: number): boolean => {
        return value > 0.0 ? true : false;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_2900
     * @tc.name testFloat64ArrayEvery2029
     * @tc.desc Verify every with element at int max boundary 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(int32MaxValue, onePointZero);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3000
     * @tc.name testFloat64ArrayEvery2030
     * @tc.desc Verify every with element at int min boundary -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(int32MinValue, onePointZero);
      const result = arr.every((value: number, index: int): boolean => {
        return value > -3000000000.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3100
     * @tc.name testFloat64ArrayEvery2031
     * @tc.desc Verify every with element at MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(maxSafeInteger);
      const result = arr.every((value: number): boolean => {
        return value === 9007199254740991.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3200
     * @tc.name testFloat64ArrayEvery2032
     * @tc.desc Verify every with element at MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = -9007199254740991;
      const arr = Float64Array.of(minSafeInteger);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value === -9007199254740991.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3300
     * @tc.name testFloat64ArrayEvery2033
     * @tc.desc Verify every with element at MAX_SAFE_INTEGER plus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num9007199254740992Value: number = 9007199254740992;
      const arr = Float64Array.of(num9007199254740992Value);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 9007199254740991.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3400
     * @tc.name testFloat64ArrayEvery2034
     * @tc.desc Verify every on array constructed via new Float64Array(N) then set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = new Float64Array(3);
      arr.$_set(0, onePointZero);
      arr.$_set(1, twoPointZero);
      arr.$_set(2, threePointZero);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3500
     * @tc.name testFloat64ArrayEvery2035
     * @tc.desc Verify every on array constructed from FixedArray with single parameter callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Float64Array(source);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3600
     * @tc.name testFloat64ArrayEvery2036
     * @tc.desc Verify every on array constructed from copy of another Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const src = Float64Array.of(int32MinValue, -1, zeroValue);
      const arr = new Float64Array(src);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3700
     * @tc.name testFloat64ArrayEvery2037
     * @tc.desc Verify every returns false on selected middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(maxSafeInteger, zeroValue, piValue);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 0.0;
      })

      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3800
     * @tc.name testFloat64ArrayEvery2038
     * @tc.desc Verify every returns true on selected positive middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const arr = Float64Array.of(onePointFive, pointTwoFive, pointOneTwoFive);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_3900
     * @tc.name testFloat64ArrayEvery2039
     * @tc.desc Verify every with elements from different radix literals hex 0x10 octal 010 binary 0b1010 all equal 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const binaryValue1010: number = 0b1010;
      const arr = Float64Array.of(hexValue10, 0o10, binaryValue1010);
      const result = arr.every((value: number): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_4000
     * @tc.name testFloat64ArrayEvery2040
     * @tc.desc Verify every with float type MIN_VALUE 1.4e-45 as element in Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const arr = Float64Array.of(doubleMinValue);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_4100
     * @tc.name testFloat64ArrayEvery2041
     * @tc.desc Verify every with float type MAX_VALUE 3.4028235e+38 as element in Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMaxValue);
      const result = arr.every((value: number, index: int): boolean => {
        return value > 1.0e+308;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_4200
     * @tc.name testFloat64ArrayEvery2042
     * @tc.desc Verify every with float type positive Infinity element in Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity);
      const result = arr.every((value: number, index: int, array: Float64Array): boolean => {
        return value > 1.0e+38;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_4300
     * @tc.name testFloat64ArrayEvery2043
     * @tc.desc Verify every with float type negative Infinity element in Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(negativeInfinity);
      const result = arr.every((value: number, index: int): boolean => {
        return value < 0.0;
      })

      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_4400
     * @tc.name testFloat64ArrayEvery2044
     * @tc.desc Verify every returns false on mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const fourPointZero: number = 4.0;
      const sevenPointZero: number = 7.0;
      const eightPointZero: number = 8.0;
      const arr = Float64Array.of(twoPointZero, fourPointZero, sevenPointZero, eightPointZero);
      const everyResult = arr.every((value: number): boolean => {
        return value % 2.0 == 0.0;
      })
      const expectVal = false;
      expect(everyResult).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_4500
     * @tc.name testFloat64ArrayEvery2045
     * @tc.desc Verify every returns true when all elements pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const sixPointZero: number = 6.0;
      const sevenPointZero: number = 7.0;
      const eightPointZero: number = 8.0;
      const arr = Float64Array.of(fivePointZero, sixPointZero, sevenPointZero, eightPointZero);
      const result = arr.every((value: number): boolean => {
        return value > 4.0;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_4600
     * @tc.name testFloat64ArrayEvery2046
     * @tc.desc Verify every returns false when a failing value exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourPointZero: number = 4.0;
      const eightPointZero: number = 8.0;
      const sevenPointZero: number = 7.0;
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(fourPointZero, eightPointZero, sevenPointZero, tenPointZero);
      const result = arr.every((value: number): boolean => {
        return value % 2.0 == 0.0;
      })
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_EVERY_2_4700
     * @tc.name testFloat64ArrayEvery2047
     * @tc.desc Verify every returns true when all transformed-equivalent elements pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayEvery2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const fourPointZero: number = 4.0;
      const sixPointZero: number = 6.0;
      const source = Float64Array.of(twoPointZero, fourPointZero, sixPointZero);
      const result = source.every((value: number): boolean => {
        return value % 2.0 == 0.0;
      })
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

  })
}
