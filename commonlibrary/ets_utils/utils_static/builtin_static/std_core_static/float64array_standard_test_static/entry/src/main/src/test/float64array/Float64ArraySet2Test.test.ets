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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function float64ArraySet2Test(): void {
  describe('Float64ArraySet2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_0100
     * @tc.name testFloat64ArraySet2001
     * @tc.desc Verify set with hex int literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueDE: number = 0xDE;
      const hexValueAD: number = 0xAD;
      const twoValue: number = 2;
      const num222Value: number = 222;
      const num173Value: number = 173;
      const arr = new Float64Array(2);
      arr.set(Float64Array.of(hexValueDE, hexValueAD), 0);
      expect(arr.length).assertEqual(twoValue);
      expect(arr[0]).assertEqual(num222Value);
      expect(arr[1]).assertEqual(num173Value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_0200
     * @tc.name testFloat64ArraySet2002
     * @tc.desc Verify set with insertPos 1 value -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const arr = new Float64Array(3);
      arr.set(1, -0.0);
      const actVal1 = arr.$_get(1);
      const expectVal = negativeZero;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_0300
     * @tc.name testFloat64ArraySet2003
     * @tc.desc Verify set with insertPos 2 value 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const arr = new Float64Array(3);
      arr.set(2, 3.14);
      const actVal2 = arr.$_get(2);
      const expectVal = piApprox;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_0400
     * @tc.name testFloat64ArraySet2004
     * @tc.desc Verify set with value as hex literal 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenPointzero: number = 16.0;
      const arr = new Float64Array(3);
      arr.set(0, 0x10);
      const actVal3 = arr.$_get(0);
      const expectVal = sixteenPointzero;
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_0500
     * @tc.name testFloat64ArraySet2005
     * @tc.desc Verify set with value as octal literal 0o10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const arr = new Float64Array(3);
      arr.set(0, 0o10);
      const actVal4 = arr.$_get(0);
      const expectVal = eightPointZero;
      expect(actVal4).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_0600
     * @tc.name testFloat64ArraySet2006
     * @tc.desc Verify set with value as binary literal 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const arr = new Float64Array(3);
      arr.set(0, 0b1010);
      const actVal5 = arr.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal5).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_0700
     * @tc.name testFloat64ArraySet2007
     * @tc.desc Verify set(index, value) overwrites a negative decimal with a positive decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const overwriteValue: number = 12345.5;
      const negTwelvePointFive: number = -12.5;
      const arr = new Float64Array(3);
      arr.set(0, negTwelvePointFive);
      arr.set(0, overwriteValue);
      const actVal6 = arr.$_get(0);
      const expectVal = overwriteValue;
      expect(actVal6).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_0800
     * @tc.name testFloat64ArraySet2008
     * @tc.desc Verify set with negative large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const arr = new Float64Array(3);
      arr.set(0, -999999.99);
      const actVal7 = arr.$_get(0);
      const expectVal = negnum999999Pointninenine;
      expect(actVal7).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_0900
     * @tc.name testFloat64ArraySet2009
     * @tc.desc Verify set with value 0.1+0.2 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const precisionValue: number = 0.30000000000000004;
      const arr = new Float64Array(3);
      arr.set(0, 0.1 + 0.2);
      const actVal8 = arr.$_get(0);
      const expectVal = precisionValue;
      expect(actVal8).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1000
     * @tc.name testFloat64ArraySet2010
     * @tc.desc Verify set(index, value) stores MAX_SAFE_INTEGER before source array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const arr = new Float64Array(5);
      arr.set(0, maxSafeInteger);
      const src = new Float64Array([int16MinValue, -128]);
      arr.set(src, 2);
      const actVal9 = arr.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal9).assertEqual(expectVal);
      const actVal10 = arr.$_get(2);
      const expectVal2 = int16MinValue;
      expect(actVal10).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1100
     * @tc.name testFloat64ArraySet2011
     * @tc.desc Verify set all elements individually in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const fortyPointZero: number = 40.0;
      const arr = new Float64Array(5);
      for (let i: int = 0; i < 5; i++) {
        arr.set(i, i * 10.0);
      }
      const actVal11 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal11).assertEqual(expectVal);
      const actVal12 = arr.$_get(4);
      const expectVal2 = fortyPointZero;
      expect(actVal12).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1200
     * @tc.name testFloat64ArraySet2012
     * @tc.desc Verify set with very large integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483647Pointzero: number = 2147483647.0;
      const arr = new Float64Array(3);
      arr.set(0, 2147483647.0);
      const actVal13 = arr.$_get(0);
      const expectVal = num2147483647Pointzero;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1300
     * @tc.name testFloat64ArraySet2013
     * @tc.desc Verify set with scientific notation negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const arr = new Float64Array(3);
      arr.set(0, 1.0e-308);
      const actVal14 = arr.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal14).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1400
     * @tc.name testFloat64ArraySet2014
     * @tc.desc Verify set(index, value) writes negative zero, MIN_SAFE_INTEGER, Infinity, negative decimal and pi values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const positiveInfinity: number = Infinity;
      const piApproxValue: number = 3.14159;
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const arr = new Float64Array(5);
      arr.set(0, -0.0);
      arr.set(1, minSafeInteger);
      arr.set(2, Infinity);
      arr.set(3, -999.99);
      arr.set(4, 3.14159);
      const actVal15 = arr.$_get(0);
      const expectVal = negativeZero;
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = arr.$_get(2);
      const expectVal2 = positiveInfinity;
      expect(actVal16).assertEqual(expectVal2);
      const actVal17 = arr.$_get(4);
      const expectVal3 = piApproxValue;
      expect(actVal17).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1500
     * @tc.name testFloat64ArraySet2015
     * @tc.desc Verify set with double type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointsevenoneeight: number = 2.718;
      const arr = new Float64Array(3);
      const d: double = 2.718;
      const indexOne: int = 1;
      arr.set(indexOne, d);
      const actVal18 = arr.$_get(indexOne);
      const expectVal = twoPointsevenoneeight;
      expect(actVal18).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1600
     * @tc.name testFloat64ArraySet2016
     * @tc.desc Verify set with short type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const arr = new Float64Array(3);
      const s: short = 5;
      const indexTwo: short = 2;
      arr.set(indexTwo, s);
      const actVal19 = arr.$_get(indexTwo);
      const expectVal = fivePointZero;
      expect(actVal19).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1700
     * @tc.name testFloat64ArraySet2017
     * @tc.desc Verify set with int type variable at middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiftyPointZero: number = 50.0;
      const arr = new Float64Array(5);
      const iv: int = 50;
      const indexTwo: int = 2;
      arr.set(indexTwo, iv);
      const actVal20 = arr.$_get(indexTwo);
      const expectVal = fiftyPointZero;
      expect(actVal20).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1800
     * @tc.name testFloat64ArraySet2018
     * @tc.desc Verify set with large negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483648Pointzero: number = -2147483648.0;
      const arr = new Float64Array(3);
      arr.set(0, -2147483648.0);
      const actVal21 = arr.$_get(0);
      const expectVal = negnum2147483648Pointzero;
      expect(actVal21).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_1900
     * @tc.name testFloat64ArraySet2019
     * @tc.desc Verify set(index, value) writes negative scientific, hex and small scientific values at large-array boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negSciLarge: number = -1.0e+308;
      const hexValue20: number = 0x20;
      const sciSmall: number = 1.0e-308;
      const arr = new Float64Array(1000);
      arr.set(0, negSciLarge);
      arr.set(500, hexValue20);
      arr.set(999, sciSmall);
      const actVal22 = arr.$_get(0);
      const expectVal = negSciLarge;
      expect(actVal22).assertEqual(expectVal);
      const actVal23 = arr.$_get(500);
      const expectVal2 = hexValue20;
      expect(actVal23).assertEqual(expectVal2);
      const actVal24 = arr.$_get(999);
      const expectVal3 = sciSmall;
      expect(actVal24).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2000
     * @tc.name testFloat64ArraySet2020
     * @tc.desc Verify set with int max value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483647Pointzero: number = 2147483647.0;
      const arr = new Float64Array(2);
      const v: int = 2147483647;
      const indexOne: int = 1;
      arr.set(indexOne, v);
      const actVal25 = arr.$_get(indexOne);
      const expectVal = num2147483647Pointzero;
      expect(actVal25).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2100
     * @tc.name testFloat64ArraySet2021
     * @tc.desc Verify set with int min value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum2147483648Pointzero: number = -2147483648.0;
      const arr = new Float64Array(3);
      const v: int = -2147483648;
      const indexTwo: short = 2;
      arr.set(indexTwo, v);
      const actVal26 = arr.$_get(indexTwo);
      const expectVal = negnum2147483648Pointzero;
      expect(actVal26).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2200
     * @tc.name testFloat64ArraySet2022
     * @tc.desc Verify set with short max value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num32767Pointzero: number = 32767.0;
      const arr = new Float64Array(4);
      const v: short = 32767;
      const indexThree: int = 3;
      arr.set(indexThree, v);
      const actVal27 = arr.$_get(indexThree);
      const expectVal = num32767Pointzero;
      expect(actVal27).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2300
     * @tc.name testFloat64ArraySet2023
     * @tc.desc Verify set with short min value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32768Pointzero: number = -32768.0;
      const arr = new Float64Array(5);
      const v: short = -32768;
      const indexFour: short = 4;
      arr.set(indexFour, v);
      const actVal28 = arr.$_get(indexFour);
      const expectVal = negnum32768Pointzero;
      expect(actVal28).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2400
     * @tc.name testFloat64ArraySet2024
     * @tc.desc Verify set with double positive boundary 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(2);
      const d: double = 0.0;
      const indexOne: int = 1;
      arr.set(indexOne, d);
      const actVal29 = arr.$_get(indexOne);
      const expectVal = zeroPointZero;
      expect(actVal29).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2500
     * @tc.name testFloat64ArraySet2025
     * @tc.desc Verify set with double negative boundary -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const arr = new Float64Array(3);
      const d: double = -0.0;
      const indexTwo: short = 2;
      arr.set(indexTwo, d);
      const actVal30 = arr.$_get(indexTwo);
      const expectVal = negativeZero;
      expect(actVal30).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2600
     * @tc.name testFloat64ArraySet2026
     * @tc.desc Verify set with int value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(4);
      const v: int = 0;
      arr.set(3, v);
      const actVal31 = arr.$_get(3);
      const expectVal = zeroPointZero;
      expect(actVal31).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2700
     * @tc.name testFloat64ArraySet2027
     * @tc.desc Verify set with double value 123.456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num123Pointfourfivesix: number = 123.456;
      const arr = new Float64Array(2);
      const d: double = 123.456;
      arr.set(1, d);
      const actVal32 = arr.$_get(1);
      const expectVal = num123Pointfourfivesix;
      expect(actVal32).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2800
     * @tc.name testFloat64ArraySet2028
     * @tc.desc Verify set with double value -888.88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum888Pointeighteight: number = -888.88;
      const arr = new Float64Array(3);
      const d: double = -888.88;
      arr.set(2, d);
      const actVal33 = arr.$_get(2);
      const expectVal = negnum888Pointeighteight;
      expect(actVal33).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_2900
     * @tc.name testFloat64ArraySet2029
     * @tc.desc Verify set with int value 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num10000Pointzero: number = 10000.0;
      const arr = new Float64Array(4);
      const v: int = 10000;
      arr.set(3, v);
      const actVal34 = arr.$_get(3);
      const expectVal = num10000Pointzero;
      expect(actVal34).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3000
     * @tc.name testFloat64ArraySet2030
     * @tc.desc Verify set with int value -1 as error marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const arr = new Float64Array(5);
      const v: int = -1;
      arr.set(4, v);
      const actVal35 = arr.$_get(4);
      const expectVal = negonePointzero;
      expect(actVal35).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3100
     * @tc.name testFloat64ArraySet2031
     * @tc.desc Verify set with double scientific notation 1.0e6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num1000000Pointzero: number = 1000000.0;
      const arr = new Float64Array(2);
      const d: double = 1.0e6;
      arr.set(1, d);
      const actVal36 = arr.$_get(1);
      const expectVal = num1000000Pointzero;
      expect(actVal36).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3200
     * @tc.name testFloat64ArraySet2032
     * @tc.desc Verify set(index, value) with byte zero value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(2);
      const indexOne: short = 1;
      arr.set(indexOne, 0);
      const actVal37 = arr.$_get(indexOne);
      const expectVal = zeroPointZero;
      expect(actVal37).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3300
     * @tc.name testFloat64ArraySet2033
     * @tc.desc Verify set(index, value) with byte negative value -12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negTwelvePointzero: number = -12.0;
      const arr = new Float64Array(3);
      const indexTwo: int = 2;
      arr.set(indexTwo, -12);
      const actVal38 = arr.$_get(indexTwo);
      const expectVal = negTwelvePointzero;
      expect(actVal38).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3400
     * @tc.name testFloat64ArraySet2034
     * @tc.desc Verify set(index, value) with byte hex value 0x5A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue5A: number = 0x5A;
      const arr = new Float64Array(4);
      const indexThree: short = 3;
      arr.set(indexThree, hexValue5A);
      const actVal39 = arr.$_get(indexThree);
      const expectVal = hexValue5A;
      expect(actVal39).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3500
     * @tc.name testFloat64ArraySet2035
     * @tc.desc Verify set(index, value) with byte boundary min -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum128Pointzero: number = -128.0;
      const arr = new Float64Array(5);
      const indexFour: int = 4;
      arr.set(indexFour, -128);
      const actVal40 = arr.$_get(indexFour);
      const expectVal = negnum128Pointzero;
      expect(actVal40).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3600
     * @tc.name testFloat64ArraySet2036
     * @tc.desc Verify set(index, value) with byte boundary max 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num127Pointzero: number = 127.0;
      const arr = new Float64Array(2);
      const indexOne: int = 1;
      arr.set(indexOne, 127);
      const actVal41 = arr.$_get(indexOne);
      const expectVal = num127Pointzero;
      expect(actVal41).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3700
     * @tc.name testFloat64ArraySet2037
     * @tc.desc Verify set(index, value) with byte hex literal 0x0A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const arr = new Float64Array(3);
      const indexTwo: short = 2;
      arr.set(indexTwo, 0x0A);
      const actVal42 = arr.$_get(indexTwo);
      const expectVal = tenPointZero;
      expect(actVal42).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3800
     * @tc.name testFloat64ArraySet2038
     * @tc.desc Verify set(index, value) with short positive value 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const arr = new Float64Array(2);
      const s: short = 100;
      arr.set(1, s);
      const actVal43 = arr.$_get(1);
      const expectVal = hundredPointZero;
      expect(actVal43).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_3900
     * @tc.name testFloat64ArraySet2039
     * @tc.desc Verify set(index, value) with short positive value 2048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2048Pointzero: number = 2048.0;
      const arr = new Float64Array(3);
      const s: short = 2048;
      arr.set(2, s);
      const actVal44 = arr.$_get(2);
      const expectVal = num2048Pointzero;
      expect(actVal44).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4000
     * @tc.name testFloat64ArraySet2040
     * @tc.desc Verify set(index, value) with short near-boundary value 32760
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num32760Pointzero: number = 32760.0;
      const arr = new Float64Array(4);
      const s: short = 32760;
      arr.set(3, s);
      const actVal45 = arr.$_get(3);
      const expectVal = num32760Pointzero;
      expect(actVal45).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4100
     * @tc.name testFloat64ArraySet2041
     * @tc.desc Verify set with short hex literal 0x7FF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2047Pointzero: number = 2047.0;
      const arr = new Float64Array(5);
      const s: short = 0x7FF;
      arr.set(4, s);
      const actVal46 = arr.$_get(4);
      const expectVal = num2047Pointzero;
      expect(actVal46).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4200
     * @tc.name testFloat64ArraySet2042
     * @tc.desc Verify set with short boundary max 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num32767Pointzero: number = 32767.0;
      const arr = new Float64Array(2);
      const s: short = 32767;
      arr.set(1, s);
      const actVal47 = arr.$_get(1);
      const expectVal = num32767Pointzero;
      expect(actVal47).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4300
     * @tc.name testFloat64ArraySet2043
     * @tc.desc Verify set with short boundary min -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32768Pointzero: number = -32768.0;
      const arr = new Float64Array(3);
      const s: short = -32768;
      arr.set(2, s);
      const actVal48 = arr.$_get(2);
      const expectVal = negnum32768Pointzero;
      expect(actVal48).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4400
     * @tc.name testFloat64ArraySet2044
     * @tc.desc Verify set with short business value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(4);
      const s: short = 0;
      arr.set(3, s);
      const actVal49 = arr.$_get(3);
      const expectVal = zeroPointZero;
      expect(actVal49).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4500
     * @tc.name testFloat64ArraySet2045
     * @tc.desc Verify set with short business value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const arr = new Float64Array(5);
      const s: short = -1;
      arr.set(4, s);
      const actVal50 = arr.$_get(4);
      const expectVal = negonePointzero;
      expect(actVal50).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4600
     * @tc.name testFloat64ArraySet2046
     * @tc.desc Verify set(index, value) with int negative value -1024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum1024Pointzero: number = -1024.0;
      const arr = new Float64Array(2);
      const v: int = -1024;
      arr.set(1, v);
      const actVal51 = arr.$_get(1);
      const expectVal = negnum1024Pointzero;
      expect(actVal51).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4700
     * @tc.name testFloat64ArraySet2047
     * @tc.desc Verify set(index, value) with int near max value 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483646Pointzero: number = 2147483646.0;
      const arr = new Float64Array(3);
      const v: int = 2147483646;
      arr.set(2, v);
      const actVal52 = arr.$_get(2);
      const expectVal = num2147483646Pointzero;
      expect(actVal52).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4800
     * @tc.name testFloat64ArraySet2048
     * @tc.desc Verify set with int hex literal 0x1234
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num4660Pointzero: number = 4660.0;
      const arr = new Float64Array(4);
      const indexThree: int = 3;
      arr.set(indexThree, 0x1234);
      const actVal53 = arr.$_get(indexThree);
      const expectVal = num4660Pointzero;
      expect(actVal53).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_4900
     * @tc.name testFloat64ArraySet2049
     * @tc.desc Verify set with int octal literal 0123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightythreePointzero: number = 83.0;
      const arr = new Float64Array(5);
      const indexFour: short = 4;
      arr.set(indexFour, 0o123);
      const actVal54 = arr.$_get(indexFour);
      const expectVal = eightythreePointzero;
      expect(actVal54).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5000
     * @tc.name testFloat64ArraySet2050
     * @tc.desc Verify set with int binary literal 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const arr = new Float64Array(2);
      const indexOne: int = 1;
      arr.set(indexOne, 0b1010);
      const actVal55 = arr.$_get(indexOne);
      const expectVal = tenPointZero;
      expect(actVal55).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5100
     * @tc.name testFloat64ArraySet2051
     * @tc.desc Verify set with int business threshold 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num1000000Pointzero: number = 1000000.0;
      const arr = new Float64Array(3);
      const v: int = 1000000;
      const indexTwo: short = 2;
      arr.set(indexTwo, v);
      const actVal56 = arr.$_get(indexTwo);
      const expectVal = num1000000Pointzero;
      expect(actVal56).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5200
     * @tc.name testFloat64ArraySet2052
     * @tc.desc Verify set with double boundary MIN_VALUE 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array(4);
      const d: double = 5e-324;
      const indexThree: int = 3;
      arr.set(indexThree, d);
      const actVal57 = arr.$_get(indexThree);
      const expectVal = doubleMinValue;
      expect(actVal57).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5300
     * @tc.name testFloat64ArraySet2053
     * @tc.desc Verify set with double boundary MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array(5);
      const d: double = 1.7976931348623157e+308;
      const indexFour: short = 4;
      arr.set(indexFour, d);
      const actVal58 = arr.$_get(indexFour);
      const expectVal = doubleMaxValue;
      expect(actVal58).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5400
     * @tc.name testFloat64ArraySet2054
     * @tc.desc Verify set with double boundary NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(2);
      const d: double = NaN;
      const indexOne: int = 1;
      arr.set(indexOne, d);
      const actVal59 = arr.$_get(indexOne);
      expect(actVal59).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5500
     * @tc.name testFloat64ArraySet2055
     * @tc.desc Verify set with double business value 999999.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999999Pointninenine: number = 999999.99;
      const arr = new Float64Array(3);
      const d: double = 999999.99;
      const indexTwo: short = 2;
      arr.set(indexTwo, d);
      const actVal60 = arr.$_get(indexTwo);
      const expectVal = num999999Pointninenine;
      expect(actVal60).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5600
     * @tc.name testFloat64ArraySet2056
     * @tc.desc Verify set negative offset throws RangeError and keeps buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const beforeBuffer = arr.buffer;
      try {
        arr.set([1.0], -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.buffer).assertEqual(beforeBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5700
     * @tc.name testFloat64ArraySet2057
     * @tc.desc Verify set from FixedArray without offset fills from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const thirtyPointZero: number = 30.0;
      const dest = new Float64Array(3);
      const src: FixedArray<number> = [10.0, 20.0, 30.0];
      dest.set(src);
      const actVal1 = dest.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal1).assertEqual(expectVal);
      const actVal2 = dest.$_get(2);
      const expectVal2 = thirtyPointZero;
      expect(actVal2).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5800
     * @tc.name testFloat64ArraySet2058
     * @tc.desc Verify set from FixedArray with insertPos offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const fiftyPointZero: number = 50.0;
      const sixtyPointZero: number = 60.0;
      const dest = new Float64Array(5);
      const src: FixedArray<number> = [50.0, 60.0];
      const offsetTwo: int = 2;
      dest.set(src, offsetTwo);
      const actVal3 = dest.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal3).assertEqual(expectVal);
      const actVal4 = dest.$_get(2);
      const expectVal2 = fiftyPointZero;
      expect(actVal4).assertEqual(expectVal2);
      const actVal5 = dest.$_get(3);
      const expectVal3 = sixtyPointZero;
      expect(actVal5).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_5900
     * @tc.name testFloat64ArraySet2059
     * @tc.desc Verify set from ArrayLike source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const threePointZero: number = 3.0;
      const dest = new Float64Array(4);
      const src: ArrayLike<number> = [1.0, 2.0, 3.0];
      dest.set(src);
      const actVal6 = dest.$_get(0);
      const expectVal = onePointZero;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = dest.$_get(2);
      const expectVal2 = threePointZero;
      expect(actVal7).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6000
     * @tc.name testFloat64ArraySet2060
     * @tc.desc Verify set from ArrayLike with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const eightPointZero: number = 8.0;
      const dest = new Float64Array(5);
      const src: ArrayLike<number> = [7.0, 8.0];
      const offsetThree: short = 3;
      dest.set(src, offsetThree);
      const actVal8 = dest.$_get(3);
      const expectVal = sevenPointZero;
      expect(actVal8).assertEqual(expectVal);
      const actVal9 = dest.$_get(4);
      const expectVal2 = eightPointZero;
      expect(actVal9).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6100
     * @tc.name testFloat64ArraySet2061
     * @tc.desc Verify set from FixedArray containing special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const dest = new Float64Array(3);
      const src: FixedArray<number> = [Infinity, -Infinity, NaN];
      dest.set(src);
      const actVal10 = dest.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal10).assertEqual(expectVal);
      const actVal11 = dest.$_get(1);
      const expectVal2 = negativeInfinity;
      expect(actVal11).assertEqual(expectVal2);
      const actVal12Value = dest.$_get(2);
      expect(actVal12Value).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6200
     * @tc.name testFloat64ArraySet2062
     * @tc.desc Verify set from FixedArray with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const dest = new Float64Array(3);
      const src: FixedArray<number> = [-1.0, -2.0, -3.0];
      dest.set(src);
      const actVal13 = dest.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6300
     * @tc.name testFloat64ArraySet2063
     * @tc.desc Verify set from empty FixedArray does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const dest = new Float64Array(3);
      const src: FixedArray<number> = [];
      dest.set(src);
      const actVal14 = dest.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal14).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6400
     * @tc.name testFloat64ArraySet2064
     * @tc.desc Verify set from FixedArray overflow offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dest = new Float64Array(3);
      const src: FixedArray<number> = [1.0, 2.0];
      const offsetThree: int = 3;
      try {
        dest.set(src, offsetThree);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6500
     * @tc.name testFloat64ArraySet2065
     * @tc.desc Verify set from FixedArray with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const dest = new Float64Array(3);
      const src: FixedArray<number> = [42.0];
      const offsetOne: short = 1;
      dest.set(src, offsetOne);
      const actVal15 = dest.$_get(1);
      const expectVal = fillValue42;
      expect(actVal15).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6600
     * @tc.name testFloat64ArraySet2066
     * @tc.desc Verify set from ArrayLike with hex oct bin literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenPointzero: number = 16.0;
      const fourPointZero: number = 4.0;
      const dest = new Float64Array(3);
      const src: ArrayLike<number> = [0x10, 0o20, 0b100];
      dest.set(src);
      const actVal16 = dest.$_get(0);
      const expectVal = sixteenPointzero;
      expect(actVal16).assertEqual(expectVal);
      const actVal17 = dest.$_get(1);
      const expectVal2 = sixteenPointzero;
      expect(actVal17).assertEqual(expectVal2);
      const actVal18 = dest.$_get(2);
      const expectVal3 = fourPointZero;
      expect(actVal18).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6700
     * @tc.name testFloat64ArraySet2067
     * @tc.desc Verify set from Float64Array source with large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const twentyfivePointzero: number = 25.0;
      const dest = new Float64Array(100);
      const src = new Float64Array(50);
      for (let i: int = 0; i < 50; i++) {
        src.$_set(i, i * onePointZero);
      }
      dest.set(src, 25);
      const actVal19 = dest.$_get(25);
      const expectVal = zeroPointZero;
      expect(actVal19).assertEqual(expectVal);
      const actVal20 = dest.$_get(50);
      const expectVal2 = twentyfivePointzero;
      expect(actVal20).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6800
     * @tc.name testFloat64ArraySet2068
     * @tc.desc Verify set from FixedArray with int double short variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointfive: number = 20.5;
      const thirtyPointZero: number = 30.0;
      const dest = new Float64Array(3);
      const iv: int = 10;
      const dv: double = 20.5;
      const sv: short = 30;
      const src: FixedArray<number> = [iv, dv, sv];
      dest.set(src);
      const actVal21 = dest.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal21).assertEqual(expectVal);
      const actVal22 = dest.$_get(1);
      const expectVal2 = twentyPointfive;
      expect(actVal22).assertEqual(expectVal2);
      const actVal23 = dest.$_get(2);
      const expectVal3 = thirtyPointZero;
      expect(actVal23).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_6900
     * @tc.name testFloat64ArraySet2069
     * @tc.desc Verify set from FixedArray at exact boundary offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const dest = new Float64Array(5);
      const src: FixedArray<number> = [1.0, 2.0];
      dest.set(src, 3);
      const actVal24 = dest.$_get(3);
      const expectVal = onePointZero;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = dest.$_get(4);
      const expectVal2 = twoPointZero;
      expect(actVal25).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7000
     * @tc.name testFloat64ArraySet2070
     * @tc.desc Verify set from Float64Array with offset in middle of large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const dest = new Float64Array(100);
      const src = new Float64Array([pointOne, 9007199254740991, zeroValue]);
      dest.set(src, 50);
      const actVal26 = dest.$_get(49);
      const expectVal = zeroPointZero;
      expect(actVal26).assertEqual(expectVal);
      const actVal27 = dest.$_get(50);
      const expectVal2 = pointOne;
      expect(actVal27).assertEqual(expectVal2);
      const actVal28 = dest.$_get(52);
      const expectVal3 = zeroValue;
      expect(actVal28).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7100
     * @tc.name testFloat64ArraySet2071
     * @tc.desc Verify set from ArrayLike with zero offset on pre-filled array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const dest = new Float64Array([pointFive, 1.5, 0.25]);
      const src: ArrayLike<number> = [10.0, 20.0];
      dest.set(src, 1);
      const actVal29 = dest.$_get(0);
      const expectVal = pointFive;
      expect(actVal29).assertEqual(expectVal);
      const actVal30 = dest.$_get(1);
      const expectVal2 = tenPointZero;
      expect(actVal30).assertEqual(expectVal2);
      const actVal31 = dest.$_get(2);
      const expectVal3 = twentyPointZero;
      expect(actVal31).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7200
     * @tc.name testFloat64ArraySet2072
     * @tc.desc Verify set from FixedArray with scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e100: number = 1.0e+100;
      const sciValue10e1002: number = 1.0e-100;
      const dest = new Float64Array(2);
      const src: FixedArray<number> = [1.0e+100, 1.0e-100];
      dest.set(src);
      const actVal32 = dest.$_get(0);
      const expectVal = sciValue10e100;
      expect(actVal32).assertEqual(expectVal);
      const actVal33 = dest.$_get(1);
      const expectVal2 = sciValue10e1002;
      expect(actVal33).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7300
     * @tc.name testFloat64ArraySet2073
     * @tc.desc Verify set from ArrayLike overflow offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dest = new Float64Array(3);
      const src: ArrayLike<number> = [1.0, 2.0];
      try {
        dest.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7400
     * @tc.name testFloat64ArraySet2074
     * @tc.desc Verify set from FixedArray with zero and negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const dest = new Float64Array(2);
      const src: FixedArray<number> = [0.0, -0.0];
      dest.set(src);
      const actVal34 = dest.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal34).assertEqual(expectVal);
      expect(1 / actVal34).assertEqual(positiveInfinity);
      const actVal35 = dest.$_get(1);
      expect(1 / actVal35).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7500
     * @tc.name testFloat64ArraySet2075
     * @tc.desc Verify set from Float64Array with self as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MaxValue: number = 127;
      const arr = Float64Array.of(int16MinValue, -128, 0, int8MaxValue);
      arr.set(arr, 0);
      const actVal36 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal36).assertEqual(expectVal);
      const actVal37 = arr.$_get(3);
      const expectVal2 = int8MaxValue;
      expect(actVal37).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7600
     * @tc.name testFloat64ArraySet2076
     * @tc.desc Verify set from FixedArray large 50 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const ninePointZero: number = 9.0;
      const dest = new Float64Array(10);
      const src: FixedArray<number> = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];
      dest.set(src, 0);
      const actVal38 = dest.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal38).assertEqual(expectVal);
      const actVal39 = dest.$_get(9);
      const expectVal2 = ninePointZero;
      expect(actVal39).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7700
     * @tc.name testFloat64ArraySet2077
     * @tc.desc Verify set offset greater than length throws RangeError and keeps byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const beforeByteLength: int = arr.byteLength;
      try {
        arr.set([1.0], 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.byteLength).assertEqual(beforeByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7800
     * @tc.name testFloat64ArraySet2078
     * @tc.desc Verify set value then set from source array mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const hundredPointZero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const arr = new Float64Array(5);
      arr.set(0, 100.0);
      arr.set(4, 200.0);
      const src = new Float64Array([pointOne, 9007199254740991, zeroValue]);
      arr.set(src, 1);
      const actVal40 = arr.$_get(0);
      const expectVal = hundredPointZero;
      expect(actVal40).assertEqual(expectVal);
      const actVal41 = arr.$_get(1);
      const expectVal2 = pointOne;
      expect(actVal41).assertEqual(expectVal2);
      const actVal42 = arr.$_get(3);
      const expectVal3 = zeroValue;
      expect(actVal42).assertEqual(expectVal3);
      const actVal43 = arr.$_get(4);
      const expectVal4 = num200Pointzero;
      expect(actVal43).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_7900
     * @tc.name testFloat64ArraySet2079
     * @tc.desc Verify set from source then overwrite single element via set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fillValue99: number = 99.0;
      const threePointZero: number = 3.0;
      const arr = new Float64Array(3);
      const src: FixedArray<number> = [1.0, 2.0, 3.0];
      arr.set(src);
      arr.set(1, 99.0);
      const actVal44 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = arr.$_get(1);
      const expectVal2 = fillValue99;
      expect(actVal45).assertEqual(expectVal2);
      const actVal46 = arr.$_get(2);
      const expectVal3 = threePointZero;
      expect(actVal46).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8000
     * @tc.name testFloat64ArraySet2080
     * @tc.desc Verify set from multiple sources sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const sixPointZero: number = 6.0;
      const arr = new Float64Array(6);
      const src1: FixedArray<number> = [1.0, 2.0, 3.0];
      const src2: FixedArray<number> = [4.0, 5.0, 6.0];
      const offsetZero: int = 0;
      const offsetThree: short = 3;
      arr.set(src1, offsetZero);
      arr.set(src2, offsetThree);
      const actVal47 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal47).assertEqual(expectVal);
      const actVal48 = arr.$_get(2);
      const expectVal2 = threePointZero;
      expect(actVal48).assertEqual(expectVal2);
      const actVal49 = arr.$_get(3);
      const expectVal3 = fourPointZero;
      expect(actVal49).assertEqual(expectVal3);
      const actVal50 = arr.$_get(5);
      const expectVal4 = sixPointZero;
      expect(actVal50).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8100
     * @tc.name testFloat64ArraySet2081
     * @tc.desc Verify set from Float64Array then from ArrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const threePointZero: number = 3.0;
      const arr = new Float64Array(5);
      const f64 = Float64Array.of(pointFive, 1.5);
      const al: ArrayLike<number> = [3.0, 4.0];
      const offsetZero: short = 0;
      const offsetThree: int = 3;
      arr.set(f64, offsetZero);
      arr.set(al, offsetThree);
      const actVal51 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal51).assertEqual(expectVal);
      const actVal52 = arr.$_get(3);
      const expectVal2 = threePointZero;
      expect(actVal52).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8200
     * @tc.name testFloat64ArraySet2082
     * @tc.desc Verify set value at index 0 from all three source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const tenPointZero: number = 10.0;
      const thirtyPointZero: number = 30.0;
      const a1 = new Float64Array(1);
      a1.set(0, 10.0);
      const a2 = new Float64Array(1);
      a2.set(new Float64Array([int16MinValue]));
      const a3 = new Float64Array(1);
      const fa: FixedArray<number> = [30.0];
      a3.set(fa);
      const actVal53 = a1.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal53).assertEqual(expectVal);
      const actVal54 = a2.$_get(0);
      const expectVal2 = int16MinValue;
      expect(actVal54).assertEqual(expectVal2);
      const actVal55 = a3.$_get(0);
      const expectVal3 = thirtyPointZero;
      expect(actVal55).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8300
     * @tc.name testFloat64ArraySet2083
     * @tc.desc Verify set overflow with all three source types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(2);
      const src = new Float64Array([-2147483648, -1, 0]);
      try {
        arr.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect((e as Object as Error).name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8400
     * @tc.name testFloat64ArraySet2084
     * @tc.desc Verify set with self-source copies correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne, 9007199254740991, 0, 3.141592653589793]);
      arr.set(arr, 0);
      const actVal56 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal56).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8500
     * @tc.name testFloat64ArraySet2085
     * @tc.desc Verify set all zeros then set individual values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const sevenPointZero: number = 7.0;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array(5);
      arr.fill(zeroPointZero);
      arr.set(2, 7.0);
      arr.set(4, 9.0);
      const actVal57 = arr.$_get(2);
      const expectVal = sevenPointZero;
      expect(actVal57).assertEqual(expectVal);
      const actVal58 = arr.$_get(4);
      const expectVal2 = ninePointZero;
      expect(actVal58).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8600
     * @tc.name testFloat64ArraySet2086
     * @tc.desc Verify set from FixedArray then verify with $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixtyPointZero: number = 60.0;
      const arr = new Float64Array(3);
      const src: FixedArray<number> = [10.0, 20.0, 30.0];
      arr.set(src);
      const actVal59 = arr.$_get(0) + arr.$_get(1) + arr.$_get(2);
      const expectVal = sixtyPointZero;
      expect(actVal59).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8700
     * @tc.name testFloat64ArraySet2087
     * @tc.desc Verify set then set again at overlapping positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = new Float64Array(5);
      arr.set(new Float64Array([pointFive, 1.5, 0.25]), 0);
      arr.set(Float64Array.of(int16MinValue, -128), 2);
      const actVal60 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal60).assertEqual(expectVal);
      const actVal61 = arr.$_get(2);
      const expectVal2 = int16MinValue;
      expect(actVal61).assertEqual(expectVal2);
      const actVal62 = arr.$_get(3);
      const expectVal3 = int8MinValue;
      expect(actVal62).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8800
     * @tc.name testFloat64ArraySet2088
     * @tc.desc Verify set single value and set FixedArray produce same result at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float64Array(1);
      a1.set(0, 42.0);
      const a2 = new Float64Array(1);
      const fa: FixedArray<number> = [42.0];
      a2.set(fa, 0);
      const actVal63 = a1.$_get(0);
      const expectVal = a2.$_get(0);
      expect(actVal63).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_8900
     * @tc.name testFloat64ArraySet2089
     * @tc.desc Verify set Float64Array and set FixedArray produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a1 = new Float64Array(3);
      a1.set(Float64Array.of(-2147483648, -1, 0));
      const a2 = new Float64Array(3);
      const fa: FixedArray<number> = [-2147483648, -1, 0];
      a2.set(fa, 0);
      const actVal64 = a1.$_get(0);
      const expectVal = a2.$_get(0);
      expect(actVal64).assertEqual(expectVal);
      const actVal65 = a1.$_get(2);
      const expectVal2 = a2.$_get(2);
      expect(actVal65).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_9000
     * @tc.name testFloat64ArraySet2090
     * @tc.desc Verify after set overflow error original array data is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, 9007199254740991, zeroValue);
      try {
        arr.set(Float64Array.of(0.5, 1.5), 3);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      const actVal66 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal66).assertEqual(expectVal);
      const actVal67 = arr.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal67).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_9100
     * @tc.name testFloat64ArraySet2091
     * @tc.desc Verify after set overflow error length is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.set(Float64Array.of(-2147483648), 3);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.length).assertEqual(threeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_9200
     * @tc.name testFloat64ArraySet2092
     * @tc.desc Verify after set error byteLength is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const arr = new Float64Array([0.1, 9007199254740991]);
      try {
        arr.set(Float64Array.of(0.5), 3);
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(arr.byteLength).assertEqual(sixteenValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_9300
     * @tc.name testFloat64ArraySet2093
     * @tc.desc Verify set return type is void across overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const hexValue1F: number = 0x1F;
      const threePointZero: number = 3.0;
      const arr = new Float64Array(3);
      arr.set(0, hexValue1F);
      const src = new Float64Array([int16MinValue]);
      arr.set(src, 1);
      const fa: FixedArray<number> = [3.0];
      arr.set(fa, 2);
      const actVal68 = arr.$_get(0);
      const expectVal = hexValue1F;
      expect(actVal68).assertEqual(expectVal);
      const actVal69 = arr.$_get(1);
      const expectVal2 = int16MinValue;
      expect(actVal69).assertEqual(expectVal2);
      const actVal70 = arr.$_get(2);
      const expectVal3 = threePointZero;
      expect(actVal70).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SET_2_9400
     * @tc.name testFloat64ArraySet2094
     * @tc.desc Verify set source and destination are independent after source value update
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySet2094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const fillValue99: number = 99.0;
      const dest = new Float64Array(2);
      const src = new Float64Array([int32MinValue, -1]);
      dest.set(src);
      src.$_set(0, fillValue99);
      const actVal71 = dest.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal71).assertEqual(expectVal);
    });
  })
}
