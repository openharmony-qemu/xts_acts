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
import Utils from '../Util.test';

function isFloat64Array(val: Object): boolean {
  return val instanceof Float64Array;
}

function getTypeOf(val: Object): string {
  return typeof val;
}

export default function Float64ArraySort2Test(): void {
  describe('Float64ArraySort2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_0100
     * @tc.name testFloat64ArraySort2001
     * @tc.desc Verify sort return type is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.sort();
      const actVal1 = isFloat64Array(result);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_0200
     * @tc.name testFloat64ArraySort2002
     * @tc.desc Verify sort return typeof is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.sort();
      const actVal2 = getTypeOf(result);
      const expectVal = 'object';
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_0300
     * @tc.name testFloat64ArraySort2003
     * @tc.desc Verify sort return constructor is Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(-32768, -128);
      const result = arr.sort();
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_0400
     * @tc.name testFloat64ArraySort2004
     * @tc.desc Verify sort return ArrayBuffer.isView is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      const result = arr.sort();
      const actVal3 = ArrayBuffer.isView(result);
      const expectVal = true;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_0500
     * @tc.name testFloat64ArraySort2005
     * @tc.desc Verify sort return strictly equals arr (three elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_0600
     * @tc.name testFloat64ArraySort2006
     * @tc.desc Verify sort return strictly equals arr (single element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768]);
      const actVal4 = arr.sort();
      const expectVal = arr;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_0700
     * @tc.name testFloat64ArraySort2007
     * @tc.desc Verify sort return strictly equals arr (two elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_0800
     * @tc.name testFloat64ArraySort2008
     * @tc.desc Verify sort return strictly equals arr (with negatives)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_0900
     * @tc.name testFloat64ArraySort2009
     * @tc.desc Verify sort return strictly equals arr (with Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity, 0.0);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1000
     * @tc.name testFloat64ArraySort2010
     * @tc.desc Verify sort return strictly equals arr (with NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue, 1.0, 2.0);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1100
     * @tc.name testFloat64ArraySort2011
     * @tc.desc Verify sort return strictly equals arr (with MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const arr = Float64Array.of(numberMaxValue, 0.0, 1.0);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1200
     * @tc.name testFloat64ArraySort2012
     * @tc.desc Verify sort return strictly equals arr (with MIN_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const arr = Float64Array.of(numberMinValue, 1.0);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1300
     * @tc.name testFloat64ArraySort2013
     * @tc.desc Verify sort return strictly equals arr (with decimals)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1400
     * @tc.name testFloat64ArraySort2014
     * @tc.desc Verify sort return strictly equals arr (with scientific notation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0e+308, 1.0e-308, 1.0e+100);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1500
     * @tc.name testFloat64ArraySort2015
     * @tc.desc Verify sort return strictly equals arr (with hex)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue30: number = 0x30;
      const hexValue10: number = 0x10;
      const hexValue20: number = 0x20;
      const arr = Float64Array.of(hexValue30, hexValue10, hexValue20);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1600
     * @tc.name testFloat64ArraySort2016
     * @tc.desc Verify sort return strictly equals arr (with octal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0o30, 0o10, 0o20);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1700
     * @tc.name testFloat64ArraySort2017
     * @tc.desc Verify sort return strictly equals arr (with binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1000: number = 0b1000;
      const binaryValue10: number = 0b10;
      const binaryValue100: number = 0b100;
      const arr = Float64Array.of(binaryValue1000, binaryValue10, binaryValue100);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1800
     * @tc.name testFloat64ArraySort2018
     * @tc.desc Verify sort return strictly equals arr (all identical elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_1900
     * @tc.name testFloat64ArraySort2019
     * @tc.desc Verify sort return strictly equals arr (zero length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2000
     * @tc.name testFloat64ArraySort2020
     * @tc.desc Verify sort return strictly equals arr (sixteen elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr =
        new Float64Array([-2147483648, -1, zeroValue, 1, 2147483647, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue]);
      const result = arr.sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2100
     * @tc.name testFloat64ArraySort2021
     * @tc.desc Verify test case behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idBefore = arr;
      arr.sort();
      const expectVal = idBefore;
      expect(arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2200
     * @tc.name testFloat64ArraySort2022
     * @tc.desc Verify sort return chainable sort (three elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.sort().sort();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2300
     * @tc.name testFloat64ArraySort2023
     * @tc.desc Verify sort return chainable sort (single element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne]);
      arr.sort().sort();
      const actVal5 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2400
     * @tc.name testFloat64ArraySort2024
     * @tc.desc Verify sort return chainable sort (two elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = new Float64Array([pointFive, 1.5]);
      arr.sort().sort();
      const actVal6 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2500
     * @tc.name testFloat64ArraySort2025
     * @tc.desc Verify sort return chainable sort (with Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const threeValue: number = 3;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity, 0.0);
      arr.sort().sort();
      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2600
     * @tc.name testFloat64ArraySort2026
     * @tc.desc Verify sort return chainable sort (with NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const threeValue: number = 3;
      const arr = Float64Array.of(nanValue, 1.0, 2.0);
      arr.sort().sort();
      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2700
     * @tc.name testFloat64ArraySort2027
     * @tc.desc Verify sort return chainable sort (with MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const twoValue: number = 2;
      const arr = Float64Array.of(numberMaxValue, 0.0);
      arr.sort().sort();
      const expectVal = twoValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2800
     * @tc.name testFloat64ArraySort2028
     * @tc.desc Verify sort return chainable sort (with MIN_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const twoValue: number = 2;
      const arr = Float64Array.of(numberMinValue, 1.0);
      arr.sort().sort();
      const expectVal = twoValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_2900
     * @tc.name testFloat64ArraySort2029
     * @tc.desc Verify sort return chainable sort (with decimals)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      arr.sort().sort();
      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3000
     * @tc.name testFloat64ArraySort2030
     * @tc.desc Verify sort return chainable sort (with scientific notation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(1.0e+308, 1.0e-308);
      arr.sort().sort();
      const expectVal = twoValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3100
     * @tc.name testFloat64ArraySort2031
     * @tc.desc Verify sort return chainable sort (mixed positive negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1]);
      arr.sort().sort();
      const expectVal = twoValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3200
     * @tc.name testFloat64ArraySort2032
     * @tc.desc Verify sort return chainable sort (all identical elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      arr.sort().sort();
      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3300
     * @tc.name testFloat64ArraySort2033
     * @tc.desc Verify sort return chainable sort (ten elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const tenValue: number = 10;
      const arr =
        new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625, zeroValue,
          zeroValue, zeroValue, zeroValue, zeroValue]);
      arr.sort().sort();
      const expectVal = tenValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3400
     * @tc.name testFloat64ArraySort2034
     * @tc.desc Verify sort orders values ascending for reverse-equivalent data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      arr.sort();
      const actVal7 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal7).assertEqual(expectVal);
      const actVal8 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal8).assertEqual(expectVal2);
      const actVal9 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal9).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3500
     * @tc.name testFloat64ArraySort2035
     * @tc.desc Verify sort orders decimal boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, 9007199254740991, zeroValue);
      arr.sort();
      const actVal10 = arr.$_get(0);
      const expectVal = zeroValue;
      expect(actVal10).assertEqual(expectVal);
      const actVal11 = arr.$_get(1);
      const expectVal2 = pointOne;
      expect(actVal11).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3600
     * @tc.name testFloat64ArraySort2036
     * @tc.desc Verify sort orders fractional values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointTwoFive: number = 0.25;
      const arr = new Float64Array([pointFive, 1.5, pointTwoFive]);
      arr.sort();
      const actVal12 = arr.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal12).assertEqual(expectVal);
      const actVal13 = arr.$_get(1);
      const expectVal2 = pointFive;
      expect(actVal13).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3700
     * @tc.name testFloat64ArraySort2037
     * @tc.desc Verify sort keeps in-place sorted first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue, -1, 0]);
      arr.sort();
      const actVal14 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3800
     * @tc.name testFloat64ArraySort2038
     * @tc.desc Verify sort orders zero before positive decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      arr.sort();
      const actVal15 = arr.$_get(0);
      const expectVal = zeroValue;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_3900
     * @tc.name testFloat64ArraySort2039
     * @tc.desc Verify sort subarray sort changes parent buffer (write child read parent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      parent.$_set(0, threePointZero);
      parent.$_set(1, onePointZero);
      parent.$_set(2, twoPointZero);
      const child = new Float64Array(buf, 8, 2);
      child.sort();
      const actVal16 = parent.$_get(1);
      const expectVal = onePointZero;
      expect(actVal16).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4000
     * @tc.name testFloat64ArraySort2040
     * @tc.desc Verify sort subarray sort read parent last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      parent.$_set(0, threePointZero);
      parent.$_set(1, onePointZero);
      parent.$_set(2, twoPointZero);
      const child = new Float64Array(buf, 8, 2);
      child.sort();
      const actVal17 = parent.$_get(2);
      const expectVal = twoPointZero;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4100
     * @tc.name testFloat64ArraySort2041
     * @tc.desc Verify sort parent sort changes subarray view (write parent read child)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      parent[0] = 3.0;
      parent[1] = 1.0;
      parent[2] = 2.0;
      const child = new Float64Array(buf, 8, 2);
      parent.sort();
      const expectVal = twoPointZero;
      expect(child[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4200
     * @tc.name testFloat64ArraySort2042
     * @tc.desc Verify sort parent sort subarray last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      parent[0] = 3.0;
      parent[1] = 1.0;
      parent[2] = 2.0;
      const child = new Float64Array(buf, 8, 2);
      parent.sort();
      const expectVal = threePointZero;
      expect(child[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4300
     * @tc.name testFloat64ArraySort2043
     * @tc.desc Verify sort multi-view interaction sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fourPointZero: number = 4.0;
      const buf = new ArrayBuffer(48);
      const v1 = new Float64Array(buf, 0, 3);
      v1[0] = 3.0;
      v1[1] = 1.0;
      v1[2] = 2.0;
      const v2 = new Float64Array(buf, 24, 3);
      v2[0] = 6.0;
      v2[1] = 4.0;
      v2[2] = 5.0;
      v1.sort();
      v2.sort();
      expect(v1[0]).assertEqual(onePointZero);
      expect(v2[0]).assertEqual(fourPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4400
     * @tc.name testFloat64ArraySort2044
     * @tc.desc Verify sort subarray sort isView remains true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      const child = new Float64Array(buf, 8, 2);
      child.sort();
      const expectVal = sixteenValue;
      expect(child.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4500
     * @tc.name testFloat64ArraySort2045
     * @tc.desc Verify sort parent sort isView remains true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      parent.sort();
      const expectVal = twentyfourValue;
      expect(parent.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4600
     * @tc.name testFloat64ArraySort2046
     * @tc.desc Verify sort after Float64Array copy return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const twentyfourValue: number = 24;
      const src = Float64Array.of(int32MinValue, -1, 0);
      const arr = new Float64Array(src);
      const result = arr.sort();
      expect(result.byteLength).assertEqual(twentyfourValue);
      expect(src[0]).assertEqual(int32MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4700
     * @tc.name testFloat64ArraySort2047
     * @tc.desc Verify sort after FixedArray construction return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const fa: FixedArray<number> = [3.0, 1.0, 2.0];
      const arr = new Float64Array(fa);
      const result = arr.sort();
      const expectVal = twentyfourValue;
      expect(result.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4800
     * @tc.name testFloat64ArraySort2048
     * @tc.desc Verify sort after Array construction return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const a: Array<number> = [3.0, 1.0, 2.0];
      const arr = new Float64Array(a);
      const result = arr.sort();
      const expectVal = twentyfourValue;
      expect(result.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_4900
     * @tc.name testFloat64ArraySort2049
     * @tc.desc Verify sort after Iterable construction return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const iter: Iterable<Number> = [3.0, 1.0, 2.0];
      const arr = new Float64Array(iter);
      const result = arr.sort();
      const expectVal = twentyfourValue;
      expect(result.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5000
     * @tc.name testFloat64ArraySort2050
     * @tc.desc Verify sort after ArrayBuffer offset construction return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourValue: number = 24;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 0, 3);
      const result = arr.sort();
      const expectVal = twentyfourValue;
      expect(result.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5100
     * @tc.name testFloat64ArraySort2051
     * @tc.desc Verify sort after ArrayBuffer with undefined offset construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, undefined, undefined);
      arr.sort();
      const expectVal = threeValue;
      expect(arr.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5200
     * @tc.name testFloat64ArraySort2052
     * @tc.desc Verify sort element sum unchanged after (three elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const sumBefore = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      arr.sort();
      const actVal18 = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      const expectVal = sumBefore;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5300
     * @tc.name testFloat64ArraySort2053
     * @tc.desc Verify sort element sum unchanged after (with negatives)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const sumBefore = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      arr.sort();
      const actVal19 = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      const expectVal = sumBefore;
      expect(actVal19).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5400
     * @tc.name testFloat64ArraySort2054
     * @tc.desc Verify sort element sum unchanged after (with Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity, 0.0);
      const sumBefore: number = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      arr.sort();
      const sumAfter: number = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      const actVal20 = Number.isNaN(sumBefore);
      const expectVal = true;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = Number.isNaN(sumAfter);
      const expectVal2 = true;
      expect(actVal21).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5500
     * @tc.name testFloat64ArraySort2055
     * @tc.desc Verify sort element sum unchanged after (with MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const arr = Float64Array.of(numberMaxValue, 0.0);
      const sumBefore = arr.$_get(0) + arr.$_get(1);
      arr.sort();
      const actVal22 = arr.$_get(0) + arr.$_get(1);
      const expectVal = sumBefore;
      expect(actVal22).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5600
     * @tc.name testFloat64ArraySort2056
     * @tc.desc Verify sort element sum unchanged after (with MIN_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const arr = Float64Array.of(numberMinValue, 1.0);
      const sumBefore = arr.$_get(0) + arr.$_get(1);
      arr.sort();
      const actVal23 = arr.$_get(0) + arr.$_get(1);
      const expectVal = sumBefore;
      expect(actVal23).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5700
     * @tc.name testFloat64ArraySort2057
     * @tc.desc Verify sort element sum unchanged after (with decimals)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const sumBefore = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      arr.sort();
      const actVal24 = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      const expectVal = sumBefore;
      expect(actVal24).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5800
     * @tc.name testFloat64ArraySort2058
     * @tc.desc Verify sort element sum unchanged after (with scientific notation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0e+308, 1.0e-308);
      const sumBefore = arr.$_get(0) + arr.$_get(1);
      arr.sort();
      const actVal25 = arr.$_get(0) + arr.$_get(1);
      const expectVal = sumBefore;
      expect(actVal25).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_5900
     * @tc.name testFloat64ArraySort2059
     * @tc.desc Verify sort element sum unchanged after (mixed positive negative zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      const sumBefore = arr.$_get(0) + arr.$_get(1);
      arr.sort();
      const actVal26 = arr.$_get(0) + arr.$_get(1);
      const expectVal = sumBefore;
      expect(actVal26).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_6000
     * @tc.name testFloat64ArraySort2060
     * @tc.desc Verify sort element sum unchanged after (all identical elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const arr = new Float64Array([pointTwoFive, pointTwoFive, pointTwoFive]);
      const sumBefore = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      arr.sort();
      const actVal27 = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      const expectVal = sumBefore;
      expect(actVal27).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_6100
     * @tc.name testFloat64ArraySort2061
     * @tc.desc Verify sort element sum unchanged after (ten elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr =
        new Float64Array([-32768, -128, zeroValue, 127, 32767, zeroValue, zeroValue,
          zeroValue, zeroValue, zeroValue]);
      const sumBefore =
        arr.$_get(0) + arr.$_get(1) + arr.$_get(2) + arr.$_get(3) + arr.$_get(4) + arr.$_get(5) + arr.$_get(6) +
        arr.$_get(7) + arr.$_get(8) + arr.$_get(9);
      arr.sort();
      expect(arr.$_get(0) + arr.$_get(1) + arr.$_get(2) + arr.$_get(3) + arr.$_get(4) + arr.$_get(5) + arr.$_get(6) +
      arr.$_get(7) + arr.$_get(8) + arr.$_get(9)).assertEqual(sumBefore);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_6200
     * @tc.name testFloat64ArraySort2062
     * @tc.desc Verify sort with octal literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue85: number = 85.0;
      const num255Value: number = 255;
      const arr = new Float64Array([0o377, 0o252, 0o125]);
      arr.sort();
      expect(arr[0]).assertEqual(fillValue85);
      expect(arr[2]).assertEqual(num255Value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SORT_2_6300
     * @tc.name testFloat64ArraySort2063
     * @tc.desc Verify sort keeps NaN pair length after Double.NaN input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySort2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const twoValue: number = 2;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      arr.sort();
      const expectVal = twoValue;
      expect(arr.length).assertEqual(expectVal);
    })

  })
}
