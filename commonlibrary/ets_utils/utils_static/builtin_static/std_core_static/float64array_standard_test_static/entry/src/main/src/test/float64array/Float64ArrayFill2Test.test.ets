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

export default function float64ArrayFill2Test(): void {
  describe('Float64ArrayFill2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_0100
     * @tc.name testFloat64ArrayFill2001
     * @tc.desc Verify fill 1-param with number value fills entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const result = arr.fill(fillValue99);
      const actVal1 = result.$_get(0);
      const expectVal = fillValue99;
      expect(actVal1).assertEqual(expectVal);
      const actVal2 = result.$_get(4);
      const expectVal2 = fillValue99;
      expect(actVal2).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_0200
     * @tc.name testFloat64ArrayFill2002
     * @tc.desc Verify fill 2-param value+start fills from start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const fillValue77: number = 77.0;
      const arr = new Float64Array([int32MinValue, -1, 0, 1, 2147483647]);
      const result = arr.fill(fillValue77, 2);
      const actVal3 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal3).assertEqual(expectVal);
      const actVal4 = result.$_get(2);
      const expectVal2 = fillValue77;
      expect(actVal4).assertEqual(expectVal2);
      const actVal5 = result.$_get(4);
      const expectVal3 = fillValue77;
      expect(actVal5).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_0300
     * @tc.name testFloat64ArrayFill2003
     * @tc.desc Verify fill 3-param value+start+end fills exact range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const tinyNegativeValue: number = -1e-100;
      const fillValue55: number = 55.0;
      const arr = new Float64Array([pointOne, 9007199254740991, 0, 3.141592653589793, tinyNegativeValue]);
      const result = arr.fill(fillValue55, 1, 4);
      const actVal6 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = result.$_get(1);
      const expectVal2 = fillValue55;
      expect(actVal7).assertEqual(expectVal2);
      const actVal8 = result.$_get(3);
      const expectVal3 = fillValue55;
      expect(actVal8).assertEqual(expectVal3);
      const actVal9 = result.$_get(4);
      const expectVal4 = tinyNegativeValue;
      expect(actVal9).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_0400
     * @tc.name testFloat64ArrayFill2004
     * @tc.desc Verify fill value=0.0 zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      arr.fill(zeroPointZero);
      const actVal10 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal10).assertEqual(expectVal);
      const actVal11 = arr.$_get(2);
      const expectVal2 = zeroPointZero;
      expect(actVal11).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_0500
     * @tc.name testFloat64ArrayFill2005
     * @tc.desc Verify fill value=-0.0 negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array([-32768, -128, 0]);
      arr.fill(negativeZero);
      const actVal12 = arr.$_get(0);
      expect(1 / actVal12).assertEqual(negativeInfinity);
      const actVal13 = arr.$_get(2);
      expect(1 / actVal13).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_0600
     * @tc.name testFloat64ArrayFill2006
     * @tc.desc Verify Fill2 fills MIN_VALUE into fractional array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(-2147483648, -1, 0);
      arr.fill(doubleMinValue);
      const actVal13 = arr.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_0700
     * @tc.name testFloat64ArrayFill2007
     * @tc.desc Verify Fill2 fills MAX_VALUE into fractional array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      arr.fill(doubleMaxValue);
      const actVal14 = arr.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal14).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_0800
     * @tc.name testFloat64ArrayFill2008
     * @tc.desc Verify fill value=Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      arr.fill(positiveInfinity);
      const actVal15 = arr.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal15).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_0900
     * @tc.name testFloat64ArrayFill2009
     * @tc.desc Verify fill value=-Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = new Float64Array([-32768, -128, 0]);
      arr.fill(negativeInfinity);
      const actVal16 = arr.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal16).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1000
     * @tc.name testFloat64ArrayFill2010
     * @tc.desc Verify fill value=NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(-2147483648, -1, 0);
      arr.fill(nanValue);
      const actVal17 = Number.isNaN(arr.$_get(0));
      const expectVal = true;
      expect(actVal17).assertEqual(expectVal);
      const actVal18 = Number.isNaN(arr.$_get(2));
      const expectVal2 = true;
      expect(actVal18).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1100
     * @tc.name testFloat64ArrayFill2011
     * @tc.desc Verify Fill2 fills 0.1 plus 0.2 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      arr.fill(pointOne + pointTwo);
      const actVal19 = arr.$_get(0) === 0.3;
      const expectVal = false;
      expect(actVal19).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1200
     * @tc.name testFloat64ArrayFill2012
     * @tc.desc Verify fill value=-999999.99 large negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      arr.fill(negnum999999Pointninenine);
      const actVal20 = arr.$_get(0);
      const expectVal = negnum999999Pointninenine;
      expect(actVal20).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1300
     * @tc.name testFloat64ArrayFill2013
     * @tc.desc Verify fill value=1.0e-308 scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const arr = new Float64Array([-32768, -128, 0]);
      arr.fill(sciValue10e308);
      const actVal21 = arr.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal21).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1400
     * @tc.name testFloat64ArrayFill2014
     * @tc.desc Verify fill value=1.0e+308 scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      const arr = Float64Array.of(-2147483648, -1, 0);
      arr.fill(sciValue10e308);
      const actVal22 = arr.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal22).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1500
     * @tc.name testFloat64ArrayFill2015
     * @tc.desc Verify fill value=9007199254740991.0 MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      arr.fill(maxSafeIntegerValue);
      const actVal23 = arr.$_get(0);
      const expectVal = maxSafeIntegerValue;
      expect(actVal23).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1600
     * @tc.name testFloat64ArrayFill2016
     * @tc.desc Verify fill value=-9007199254740991.0 MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      arr.fill(negativeMaxSafeIntegerValue);
      const actVal24 = arr.$_get(0);
      const expectVal = negativeMaxSafeIntegerValue;
      expect(actVal24).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1700
     * @tc.name testFloat64ArrayFill2017
     * @tc.desc Verify fill hex literal 0x10 overwrites int boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const sixteenPointzero: number = 16.0;
      const arr = new Float64Array([-32768, -128, 0]);
      arr.fill(hexValue10);
      const actVal25 = arr.$_get(0);
      const expectVal = sixteenPointzero;
      expect(actVal25).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1800
     * @tc.name testFloat64ArrayFill2018
     * @tc.desc Verify fill octal literal 0o10 overwrites int32 boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const arr = Float64Array.of(-2147483648, -1, 0);
      arr.fill(0o10);
      const actVal26 = arr.$_get(0);
      const expectVal = eightPointZero;
      expect(actVal26).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_1900
     * @tc.name testFloat64ArrayFill2019
     * @tc.desc Verify fill binary literal 0b1010 overwrites decimal and max safe array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1010: number = 0b1010;
      const tenPointZero: number = 10.0;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      arr.fill(binaryValue1010);
      const actVal27 = arr.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal27).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2000
     * @tc.name testFloat64ArrayFill2020
     * @tc.desc Verify Fill2 start zero updates every slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      arr.fill(ninePointZero, 0);
      const actVal28 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = arr.$_get(2);
      const expectVal2 = ninePointZero;
      expect(actVal29).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2100
     * @tc.name testFloat64ArrayFill2021
     * @tc.desc Verify Fill2 start one leaves first slot unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const ninePointZero: number = 9.0;
      const arr = Float64Array.of(int16MinValue, -128, 0);
      arr.fill(ninePointZero, 1);
      const actVal30 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal30).assertEqual(expectVal);
      const actVal31 = arr.$_get(1);
      const expectVal2 = ninePointZero;
      expect(actVal31).assertEqual(expectVal2);
      const actVal32 = arr.$_get(2);
      const expectVal3 = ninePointZero;
      expect(actVal32).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2200
     * @tc.name testFloat64ArrayFill2022
     * @tc.desc Verify fill start=-1 fills last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([int32MinValue, -1, 0]);
      arr.fill(ninePointZero, -1);
      const actVal33 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal33).assertEqual(expectVal);
      const actVal34 = arr.$_get(2);
      const expectVal2 = ninePointZero;
      expect(actVal34).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2300
     * @tc.name testFloat64ArrayFill2023
     * @tc.desc Verify Fill2 negative start minus two updates tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      arr.fill(ninePointZero, -2);
      const actVal35 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal35).assertEqual(expectVal);
      const actVal36 = arr.$_get(1);
      const expectVal2 = ninePointZero;
      expect(actVal36).assertEqual(expectVal2);
      const actVal37 = arr.$_get(2);
      const expectVal3 = ninePointZero;
      expect(actVal37).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2400
     * @tc.name testFloat64ArrayFill2024
     * @tc.desc Verify Fill2 start at length leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointTwoFive: number = 0.25;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([pointFive, 1.5, pointTwoFive]);
      arr.fill(ninePointZero, 3);
      const actVal38 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal38).assertEqual(expectVal);
      const actVal39 = arr.$_get(2);
      const expectVal2 = pointTwoFive;
      expect(actVal39).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2500
     * @tc.name testFloat64ArrayFill2025
     * @tc.desc Verify Fill2 end one updates first slot only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([-32768, int8MinValue, 0]);
      arr.fill(ninePointZero, 0, 1);
      const actVal40 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal40).assertEqual(expectVal);
      const actVal41 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal41).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2600
     * @tc.name testFloat64ArrayFill2026
     * @tc.desc Verify Fill2 negative end minus one leaves final slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      arr.fill(ninePointZero, 0, -1);
      const actVal42 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal42).assertEqual(expectVal);
      const actVal43 = arr.$_get(1);
      const expectVal2 = ninePointZero;
      expect(actVal43).assertEqual(expectVal2);
      const actVal44 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal44).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2700
     * @tc.name testFloat64ArrayFill2027
     * @tc.desc Verify fill(9.0, 0, -2) with [0.1, 9007199254740991, 0, 3.141592653589793] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, 3.141592653589793]);
      arr.fill(ninePointZero, 0, -2);
      const actVal45 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal45).assertEqual(expectVal);
      const actVal46 = arr.$_get(1);
      const expectVal2 = ninePointZero;
      expect(actVal46).assertEqual(expectVal2);
      const actVal47 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal47).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2800
     * @tc.name testFloat64ArrayFill2028
     * @tc.desc Verify fill start=-3 end=-1 fills two middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointOneTwoFive: number = 0.125;
      const ninePointZero: number = 9.0;
      const arr = Float64Array.of(pointFive, 1.5, 0.25, pointOneTwoFive);
      arr.fill(ninePointZero, -3, -1);
      const actVal48 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal48).assertEqual(expectVal);
      const actVal49 = arr.$_get(1);
      const expectVal2 = ninePointZero;
      expect(actVal49).assertEqual(expectVal2);
      const actVal50 = arr.$_get(2);
      const expectVal3 = ninePointZero;
      expect(actVal50).assertEqual(expectVal3);
      const actVal51 = arr.$_get(3);
      const expectVal4 = pointOneTwoFive;
      expect(actVal51).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_2900
     * @tc.name testFloat64ArrayFill2029
     * @tc.desc Verify fill start=1 end=3 fills middle two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MaxValue: number = 127;
      const ninePointZero: number = 9.0;
      const arr = Float64Array.of(int16MinValue, -128, 0, int8MaxValue);
      arr.fill(ninePointZero, 1, 3);
      const actVal52 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal52).assertEqual(expectVal);
      const actVal53 = arr.$_get(1);
      const expectVal2 = ninePointZero;
      expect(actVal53).assertEqual(expectVal2);
      const actVal54 = arr.$_get(2);
      const expectVal3 = ninePointZero;
      expect(actVal54).assertEqual(expectVal3);
      const actVal55 = arr.$_get(3);
      const expectVal4 = int8MaxValue;
      expect(actVal55).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3000
     * @tc.name testFloat64ArrayFill2030
     * @tc.desc Verify fill on single-element array with fromIndex=-1 end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const arr = new Float64Array(1);
      arr.fill(piApprox, -1, 1);
      const actVal56 = arr.$_get(0);
      const expectVal = piApprox;
      expect(actVal56).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3100
     * @tc.name testFloat64ArrayFill2031
     * @tc.desc Verify fill on single-element fromIndex=1 fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(1);
      arr.fill(piApprox, 1);
      const actVal57 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal57).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3200
     * @tc.name testFloat64ArrayFill2032
     * @tc.desc Verify fill on large array 1000 elements fromIndex=500 to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(1000);
      arr.fill(sevenPointZero, 500);
      const actVal58 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal58).assertEqual(expectVal);
      const actVal59 = arr.$_get(499);
      const expectVal2 = zeroPointZero;
      expect(actVal59).assertEqual(expectVal2);
      const actVal60 = arr.$_get(500);
      const expectVal3 = sevenPointZero;
      expect(actVal60).assertEqual(expectVal3);
      const actVal61 = arr.$_get(999);
      const expectVal4 = sevenPointZero;
      expect(actVal61).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3300
     * @tc.name testFloat64ArrayFill2033
     * @tc.desc Verify fill on large array with negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(1000);
      arr.fill(sevenPointZero, -500);
      const actVal62 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal62).assertEqual(expectVal);
      const actVal63 = arr.$_get(499);
      const expectVal2 = zeroPointZero;
      expect(actVal63).assertEqual(expectVal2);
      const actVal64 = arr.$_get(500);
      const expectVal3 = sevenPointZero;
      expect(actVal64).assertEqual(expectVal3);
      const actVal65 = arr.$_get(999);
      const expectVal4 = sevenPointZero;
      expect(actVal65).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3400
     * @tc.name testFloat64ArrayFill2034
     * @tc.desc Verify fill start=-5 end=5 negative start full coverage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointfive: number = 5.5;
      const arr = new Float64Array(5);
      arr.fill(fivePointfive, -5, 5);
      const actVal66 = arr.$_get(0);
      const expectVal = fivePointfive;
      expect(actVal66).assertEqual(expectVal);
      const actVal67 = arr.$_get(4);
      const expectVal2 = fivePointfive;
      expect(actVal67).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3500
     * @tc.name testFloat64ArrayFill2035
     * @tc.desc Verify fill start=0 end=0 empty range fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointfive: number = 5.5;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(fivePointfive, 0, 0);
      const actVal68 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal68).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3600
     * @tc.name testFloat64ArrayFill2036
     * @tc.desc Verify fill start=-1 end=0 negative start greater than zero end empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointfive: number = 5.5;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.fill(fivePointfive, -1, 0);
      const actVal69 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal69).assertEqual(expectVal);
      const actVal70 = arr.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal70).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3700
     * @tc.name testFloat64ArrayFill2037
     * @tc.desc Verify fill original array state is zero-initialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const fillValue: number = 42.0;
      const arr = new Float64Array(3);
      arr.fill(fillValue);
      const actVal71 = arr.$_get(0);
      const expectVal = fillValue;
      expect(actVal71).assertEqual(expectVal);
      const actVal72 = arr.$_get(1);
      const expectVal2 = fillValue;
      expect(actVal72).assertEqual(expectVal2);
      const actVal73 = arr.$_get(2);
      const expectVal3 = fillValue;
      expect(actVal73).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3800
     * @tc.name testFloat64ArrayFill2038
     * @tc.desc Verify fill with int variable as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const arr = new Float64Array(3);
      const val: int = 42;
      arr.fill(val);
      const actVal74 = arr.$_get(0);
      const expectVal = fillValue42;
      expect(actVal74).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_3900
     * @tc.name testFloat64ArrayFill2039
     * @tc.desc Verify fill with short variable as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const arr = new Float64Array(3);
      const s: short = 10;
      arr.fill(s);
      const actVal75 = arr.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal75).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4000
     * @tc.name testFloat64ArrayFill2040
     * @tc.desc Verify fill with 1-param value=0.0 fills array with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(3);
      arr.fill(zeroPointZero);
      const actVal76 = arr.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal76).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4100
     * @tc.name testFloat64ArrayFill2041
     * @tc.desc Verify fill start=2 fills from index 2 to end of pre-filled array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([int32MinValue, -1, 0, 1, 2147483647]);
      arr.fill(ninePointZero, 2);
      const actVal77 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal77).assertEqual(expectVal);
      const actVal78 = arr.$_get(2);
      const expectVal2 = ninePointZero;
      expect(actVal78).assertEqual(expectVal2);
      const actVal79 = arr.$_get(4);
      const expectVal3 = ninePointZero;
      expect(actVal79).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4200
     * @tc.name testFloat64ArrayFill2042
     * @tc.desc Verify Fill2 start three writes suffix range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, 3.141592653589793, -1e-100]);
      arr.fill(ninePointZero, 3);
      const actVal80 = arr.$_get(2);
      const expectVal = zeroValue;
      expect(actVal80).assertEqual(expectVal);
      const actVal81 = arr.$_get(3);
      const expectVal2 = ninePointZero;
      expect(actVal81).assertEqual(expectVal2);
      const actVal82 = arr.$_get(4);
      const expectVal3 = ninePointZero;
      expect(actVal82).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4300
     * @tc.name testFloat64ArrayFill2043
     * @tc.desc Verify fill start=100 out of bounds fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      arr.fill(ninePointZero, 100);
      const actVal83 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal83).assertEqual(expectVal);
      const actVal84 = arr.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal84).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4400
     * @tc.name testFloat64ArrayFill2044
     * @tc.desc Verify Fill2 negative start minus three writes trailing range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const ninePointZero: number = 9.0;
      const arr = Float64Array.of(-2147483648, negativeOne, 0, 1, 2147483647);
      arr.fill(ninePointZero, -3);
      const actVal85 = arr.$_get(1);
      const expectVal = negativeOne;
      expect(actVal85).assertEqual(expectVal);
      const actVal86 = arr.$_get(2);
      const expectVal2 = ninePointZero;
      expect(actVal86).assertEqual(expectVal2);
      const actVal87 = arr.$_get(4);
      const expectVal3 = ninePointZero;
      expect(actVal87).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4500
     * @tc.name testFloat64ArrayFill2045
     * @tc.desc Verify Fill2 end two writes first two indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, 3.141592653589793, -1e-100]);
      arr.fill(ninePointZero, 0, 2);
      const actVal88 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal88).assertEqual(expectVal);
      const actVal89 = arr.$_get(1);
      const expectVal2 = ninePointZero;
      expect(actVal89).assertEqual(expectVal2);
      const actVal90 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal90).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4600
     * @tc.name testFloat64ArrayFill2046
     * @tc.desc Verify Fill2 end four writes first four indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointZeroSixTwoFive: number = 0.0625;
      const ninePointZero: number = 9.0;
      const arr = Float64Array.of(0.5, 1.5, 0.25, 0.125, pointZeroSixTwoFive);
      arr.fill(ninePointZero, 0, 4);
      const actVal91 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal91).assertEqual(expectVal);
      const actVal92 = arr.$_get(3);
      const expectVal2 = ninePointZero;
      expect(actVal92).assertEqual(expectVal2);
      const actVal93 = arr.$_get(4);
      const expectVal3 = pointZeroSixTwoFive;
      expect(actVal93).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4700
     * @tc.name testFloat64ArrayFill2047
     * @tc.desc Verify Fill2 end at length writes all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      arr.fill(ninePointZero, 0, 5);
      const actVal94 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal94).assertEqual(expectVal);
      const actVal95 = arr.$_get(4);
      const expectVal2 = ninePointZero;
      expect(actVal95).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4800
     * @tc.name testFloat64ArrayFill2048
     * @tc.desc Verify fill end=100 large out of bounds clamped to length fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const arr = Float64Array.of(-2147483648, -1, 0);
      arr.fill(ninePointZero, 0, 100);
      const actVal96 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal96).assertEqual(expectVal);
      const actVal97 = arr.$_get(2);
      const expectVal2 = ninePointZero;
      expect(actVal97).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_4900
     * @tc.name testFloat64ArrayFill2049
     * @tc.desc Verify fill(9.0, 0, -2) array[5] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([0.1, 9007199254740991, 0, piValue, -1e-100]);
      arr.fill(ninePointZero, 0, -2);
      const actVal98 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal98).assertEqual(expectVal);
      const actVal99 = arr.$_get(2);
      const expectVal2 = ninePointZero;
      expect(actVal99).assertEqual(expectVal2);
      const actVal100 = arr.$_get(3);
      const expectVal3 = piValue;
      expect(actVal100).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5000
     * @tc.name testFloat64ArrayFill2050
     * @tc.desc Verify Fill2 negative end minus four limits fill to first slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([0.5, onePointFive, 0.25, 0.125, 0.0625]);
      arr.fill(ninePointZero, 0, -4);
      const actVal101 = arr.$_get(0);
      const expectVal = ninePointZero;
      expect(actVal101).assertEqual(expectVal);
      const actVal102 = arr.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal102).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5100
     * @tc.name testFloat64ArrayFill2051
     * @tc.desc Verify fill start=2 end=4 fills two middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const int16MaxValue: number = 32767;
      const ninePointZero: number = 9.0;
      const arr = Float64Array.of(-32768, int8MinValue, 0, 127, int16MaxValue);
      arr.fill(ninePointZero, 2, 4);
      const actVal103 = arr.$_get(1);
      const expectVal = int8MinValue;
      expect(actVal103).assertEqual(expectVal);
      const actVal104 = arr.$_get(2);
      const expectVal2 = ninePointZero;
      expect(actVal104).assertEqual(expectVal2);
      const actVal105 = arr.$_get(3);
      const expectVal3 = ninePointZero;
      expect(actVal105).assertEqual(expectVal3);
      const actVal106 = arr.$_get(4);
      const expectVal4 = int16MaxValue;
      expect(actVal106).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5200
     * @tc.name testFloat64ArrayFill2052
     * @tc.desc Verify fill start=0 end=0 fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([int32MinValue, -1, 0]);
      arr.fill(ninePointZero, 0, 0);
      const actVal107 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal107).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5300
     * @tc.name testFloat64ArrayFill2053
     * @tc.desc Verify fill start=1 end=4 fills three middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const tinyNegativeValue: number = -1e-100;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([pointOne, 9007199254740991, 0, 3.141592653589793, tinyNegativeValue]);
      arr.fill(ninePointZero, 1, 4);
      const actVal108 = arr.$_get(0);
      const expectVal = pointOne;
      expect(actVal108).assertEqual(expectVal);
      const actVal109 = arr.$_get(1);
      const expectVal2 = ninePointZero;
      expect(actVal109).assertEqual(expectVal2);
      const actVal110 = arr.$_get(3);
      const expectVal3 = ninePointZero;
      expect(actVal110).assertEqual(expectVal3);
      const actVal111 = arr.$_get(4);
      const expectVal4 = tinyNegativeValue;
      expect(actVal111).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5400
     * @tc.name testFloat64ArrayFill2054
     * @tc.desc Verify fill with value as double variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const arr = new Float64Array(3);
      const d: double = 3.14;
      arr.fill(d);
      const actVal112 = arr.$_get(0);
      const expectVal = piApprox;
      expect(actVal112).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5500
     * @tc.name testFloat64ArrayFill2055
     * @tc.desc Verify fill on two-element array start=0 end=2 fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const arr = new Float64Array(2);
      arr.fill(eightPointZero, 0, 2);
      const actVal113 = arr.$_get(0);
      const expectVal = eightPointZero;
      expect(actVal113).assertEqual(expectVal);
      const actVal114 = arr.$_get(1);
      const expectVal2 = eightPointZero;
      expect(actVal114).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5600
     * @tc.name testFloat64ArrayFill2056
     * @tc.desc Verify fill on two-element array start=0 end=1 fills first only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(2);
      arr.fill(eightPointZero, 0, 1);
      const actVal115 = arr.$_get(0);
      const expectVal = eightPointZero;
      expect(actVal115).assertEqual(expectVal);
      const actVal116 = arr.$_get(1);
      const expectVal2 = zeroPointZero;
      expect(actVal116).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5700
     * @tc.name testFloat64ArrayFill2057
     * @tc.desc Verify fill single-element array with start=0 end=1 writes value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const arr = new Float64Array(1);
      arr.fill(fivePointZero, 0, 1);
      const actVal117 = arr.$_get(0);
      const expectVal = fivePointZero;
      expect(actVal117).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5800
     * @tc.name testFloat64ArrayFill2058
     * @tc.desc Verify fill chain calls return same array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const ret = arr.fill(fivePointZero);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_5900
     * @tc.name testFloat64ArrayFill2059
     * @tc.desc Verify fill start=1 end=1 fills nothing preserves elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const ninePointZero: number = 9.0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, 0);
      arr.fill(ninePointZero, 1, 1);
      const actVal118 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal118).assertEqual(expectVal);
      const actVal119 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal119).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6000
     * @tc.name testFloat64ArrayFill2060
     * @tc.desc Verify Fill2 start greater than end keeps boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([int32MinValue, -1, zeroValue]);
      arr.fill(ninePointZero, 2, 1);
      const actVal120 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal120).assertEqual(expectVal);
      const actVal121 = arr.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal121).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6100
     * @tc.name testFloat64ArrayFill2061
     * @tc.desc Verify fill preserves buffer reference after mutating int boundary array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([-32768, -128, 0]);
      const buf = arr.buffer;
      arr.fill(ninePointZero);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6200
     * @tc.name testFloat64ArrayFill2062
     * @tc.desc Verify multiple fill calls override overlapping range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const ninePointZero: number = 9.0;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      arr.fill(eightPointZero, 0, 3);
      arr.fill(ninePointZero, 2, 5);
      const actVal122 = arr.$_get(0);
      const expectVal = eightPointZero;
      expect(actVal122).assertEqual(expectVal);
      const actVal123 = arr.$_get(2);
      const expectVal2 = ninePointZero;
      expect(actVal123).assertEqual(expectVal2);
      const actVal124 = arr.$_get(4);
      const expectVal3 = ninePointZero;
      expect(actVal124).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6300
     * @tc.name testFloat64ArrayFill2063
     * @tc.desc Verify fill NaN value with start=1 end=3 range fills mixed NaN and normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fourPointZero: number = 4.0;
      const fivePointZero: number = 5.0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(onePointZero, 2.0, 3.0, fourPointZero, fivePointZero);
      arr.fill(nanValue, 1, 3);
      const actVal125 = arr.$_get(0);
      const expectVal = onePointZero;
      expect(actVal125).assertEqual(expectVal);
      const actVal126 = Number.isNaN(arr.$_get(1));
      const expectVal2 = true;
      expect(actVal126).assertEqual(expectVal2);
      const actVal127 = Number.isNaN(arr.$_get(2));
      const expectVal3 = true;
      expect(actVal127).assertEqual(expectVal3);
      const actVal128 = arr.$_get(3);
      const expectVal4 = fourPointZero;
      expect(actVal128).assertEqual(expectVal4);
      const actVal129 = arr.$_get(4);
      const expectVal5 = fivePointZero;
      expect(actVal129).assertEqual(expectVal5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6400
     * @tc.name testFloat64ArrayFill2064
     * @tc.desc Verify fill with Infinity then -Infinity in different ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(zeroPointZero, zeroPointZero, zeroPointZero, zeroPointZero);
      arr.fill(positiveInfinity, 0, 2);
      arr.fill(negativeInfinity, 2, 4);
      const actVal130 = arr.$_get(0) === Infinity;
      const expectVal = true;
      expect(actVal130).assertEqual(expectVal);
      const actVal131 = arr.$_get(1) === Infinity;
      const expectVal2 = true;
      expect(actVal131).assertEqual(expectVal2);
      const actVal132 = arr.$_get(2) === -Infinity;
      const expectVal3 = true;
      expect(actVal132).assertEqual(expectVal3);
      const actVal133 = arr.$_get(3) === -Infinity;
      const expectVal4 = true;
      expect(actVal133).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6500
     * @tc.name testFloat64ArrayFill2065
     * @tc.desc Verify fill with negative hex literal -0x10 equals -16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const negsixteenPointzero: number = -16.0;
      const arr = new Float64Array(3);
      arr.fill(-hexValue10);
      const actVal134 = arr.$_get(0);
      const expectVal = negsixteenPointzero;
      expect(actVal134).assertEqual(expectVal);
      const actVal135 = arr.$_get(1);
      const expectVal2 = negsixteenPointzero;
      expect(actVal135).assertEqual(expectVal2);
      const actVal136 = arr.$_get(2);
      const expectVal3 = negsixteenPointzero;
      expect(actVal136).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6600
     * @tc.name testFloat64ArrayFill2066
     * @tc.desc Verify fill value=-1.0 negative one fills array correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const arr = new Float64Array(3);
      arr.fill(negonePointzero);
      const actVal137 = arr.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal137).assertEqual(expectVal);
      const actVal138 = arr.$_get(2);
      const expectVal2 = negonePointzero;
      expect(actVal138).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6700
     * @tc.name testFloat64ArrayFill2067
     * @tc.desc Verify fill value=1e10 scientific large fills correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue1e10: number = 1e10;
      const arr = new Float64Array(3);
      arr.fill(sciValue1e10);
      const actVal139 = arr.$_get(0);
      const expectVal = sciValue1e10;
      expect(actVal139).assertEqual(expectVal);
      const actVal140 = arr.$_get(2);
      const expectVal2 = sciValue1e10;
      expect(actVal140).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6800
     * @tc.name testFloat64ArrayFill2068
     * @tc.desc Verify fill value=1.5e-5 scientific small fills correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue15e5: number = 1.5e-5;
      const smallScientificValue: number = 0.000015;
      const arr = new Float64Array(3);
      arr.fill(sciValue15e5);
      const actVal141 = arr.$_get(0);
      const expectVal = smallScientificValue;
      expect(actVal141).assertEqual(expectVal);
      const actVal142 = arr.$_get(2);
      const expectVal2 = smallScientificValue;
      expect(actVal142).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_6900
     * @tc.name testFloat64ArrayFill2069
     * @tc.desc Verify fill value=1.7976931348623158e+308 MAX_VALUE fills correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(3);
      const maxValue: number = 1.7976931348623158e+308;
      arr.fill(maxValue);
      const actVal143 = arr.$_get(0);
      const expectVal = maxValue;
      expect(actVal143).assertEqual(expectVal);
      const actVal144 = arr.$_get(2);
      const expectVal2 = maxValue;
      expect(actVal144).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7000
     * @tc.name testFloat64ArrayFill2070
     * @tc.desc Verify fill value=3.141592653589793 PI fills correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const arr = new Float64Array(3);
      arr.fill(piValue);
      const actVal145 = arr.$_get(0);
      const expectVal = piValue;
      expect(actVal145).assertEqual(expectVal);
      const actVal146 = arr.$_get(2);
      const expectVal2 = piValue;
      expect(actVal146).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7100
     * @tc.name testFloat64ArrayFill2071
     * @tc.desc Verify fill value=2.718281828459045 Euler number fills correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eulerNumberValue: number = 2.718281828459045;
      const arr = new Float64Array(3);
      arr.fill(eulerNumberValue);
      const actVal147 = arr.$_get(0);
      const expectVal = eulerNumberValue;
      expect(actVal147).assertEqual(expectVal);
      const actVal148 = arr.$_get(2);
      const expectVal2 = eulerNumberValue;
      expect(actVal148).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7200
     * @tc.name testFloat64ArrayFill2072
     * @tc.desc Verify fill start=4 fills last element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const hexValue10: number = 0x10;
      const binaryValue1010: number = 0b1010;
      const hexValueFF: number = 0xFF;
      const arr = new Float64Array([hexValue1234, 1000000, -hexValue10, binaryValue1010, 0o777]);
      arr.fill(hexValueFF, 4);
      const actVal149 = arr.$_get(0);
      const expectVal = hexValue1234;
      expect(actVal149).assertEqual(expectVal);
      const actVal150 = arr.$_get(3);
      const expectVal2 = binaryValue1010;
      expect(actVal150).assertEqual(expectVal2);
      const actVal151 = arr.$_get(4);
      const expectVal3 = hexValueFF;
      expect(actVal151).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7300
     * @tc.name testFloat64ArrayFill2073
     * @tc.desc Verify fill start=-length fills from beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const hexValue10: number = 0x10;
      const hexValueFF: number = 0xFF;
      const arr = new Float64Array([hexValue1234, 1000000, -hexValue10]);
      arr.fill(hexValueFF, -3);
      const actVal152 = arr.$_get(0);
      const expectVal = hexValueFF;
      expect(actVal152).assertEqual(expectVal);
      const actVal153 = arr.$_get(2);
      const expectVal2 = hexValueFF;
      expect(actVal153).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7400
     * @tc.name testFloat64ArrayFill2074
     * @tc.desc Verify fill start=INT_MAX out of bounds fills nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const hexValue10: number = 0x10;
      const hexValueFF: number = 0xFF;
      const arr = new Float64Array([hexValue1234, 1000000, -hexValue10]);
      arr.fill(hexValueFF, 2147483647);
      const actVal154 = arr.$_get(0);
      const expectVal = hexValue1234;
      expect(actVal154).assertEqual(expectVal);
      const actVal155 = arr.$_get(2);
      const expectVal2 = -hexValue10;
      expect(actVal155).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7500
     * @tc.name testFloat64ArrayFill2075
     * @tc.desc Verify fill start=INT_MIN clamps to 0 fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const hexValue10: number = 0x10;
      const hexValueFF: number = 0xFF;
      const arr = new Float64Array([hexValue1234, 1000000, -hexValue10]);
      arr.fill(hexValueFF, -2147483648);
      const actVal156 = arr.$_get(0);
      const expectVal = hexValueFF;
      expect(actVal156).assertEqual(expectVal);
      const actVal157 = arr.$_get(2);
      const expectVal2 = hexValueFF;
      expect(actVal157).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7600
     * @tc.name testFloat64ArrayFill2076
     * @tc.desc Verify end=4 clamps to length fills entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const hexValue10: number = 0x10;
      const hexValueFF: number = 0xFF;
      const arr = new Float64Array([hexValue1234, 1000000, -hexValue10]);
      arr.fill(hexValueFF, 0, 4);
      const actVal158 = arr.$_get(0);
      const expectVal = hexValueFF;
      expect(actVal158).assertEqual(expectVal);
      const actVal159 = arr.$_get(2);
      const expectVal2 = hexValueFF;
      expect(actVal159).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7700
     * @tc.name testFloat64ArrayFill2077
     * @tc.desc Verify fill start=1 end=-1 positive-start negative-end mixed range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const hexValue10: number = 0x10;
      const binaryValue1010: number = 0b1010;
      const hexValueFF: number = 0xFF;
      const arr = new Float64Array([hexValue1234, 1000000, -hexValue10, binaryValue1010, 0o777]);
      arr.fill(hexValueFF, 1, -1);
      const actVal160 = arr.$_get(0);
      const expectVal = hexValue1234;
      expect(actVal160).assertEqual(expectVal);
      const actVal161 = arr.$_get(1);
      const expectVal2 = hexValueFF;
      expect(actVal161).assertEqual(expectVal2);
      const actVal162 = arr.$_get(3);
      const expectVal3 = hexValueFF;
      expect(actVal162).assertEqual(expectVal3);
      const actVal163 = arr.$_get(4);
      const expectVal4 = 0o777;
      expect(actVal163).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7800
     * @tc.name testFloat64ArrayFill2078
     * @tc.desc Verify fill start=2 end=INT_MAX normal-start huge-end fills to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const num1000000Value: number = 1000000;
      const hexValue10: number = 0x10;
      const binaryValue1010: number = 0b1010;
      const hexValueFF: number = 0xFF;
      const arr = new Float64Array([hexValue1234, num1000000Value, -hexValue10, binaryValue1010, 0o777]);
      arr.fill(hexValueFF, 2, 2147483647);
      const actVal164 = arr.$_get(1);
      const expectVal = num1000000Value;
      expect(actVal164).assertEqual(expectVal);
      const actVal165 = arr.$_get(2);
      const expectVal2 = hexValueFF;
      expect(actVal165).assertEqual(expectVal2);
      const actVal166 = arr.$_get(4);
      const expectVal3 = hexValueFF;
      expect(actVal166).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_7900
     * @tc.name testFloat64ArrayFill2079
     * @tc.desc Verify fill return this supports chain calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const hexValue10: number = 0x10;
      const binaryValue1010: number = 0b1010;
      const hexValueFF: number = 0xFF;
      const hexValue0A: number = 0x0A;
      const arr = Float64Array.of(hexValue1234, 1000000, -hexValue10, binaryValue1010);
      const result = arr.fill(hexValueFF, 0, 2).fill(hexValue0A, 2, 4);
      expect(result).assertEqual(arr);
      const actVal167 = arr.$_get(0);
      const expectVal = hexValueFF;
      expect(actVal167).assertEqual(expectVal);
      const actVal168 = arr.$_get(1);
      const expectVal2 = hexValueFF;
      expect(actVal168).assertEqual(expectVal2);
      const actVal169 = arr.$_get(2);
      const expectVal3 = hexValue0A;
      expect(actVal169).assertEqual(expectVal3);
      const actVal170 = arr.$_get(3);
      const expectVal4 = hexValue0A;
      expect(actVal170).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_8000
     * @tc.name testFloat64ArrayFill2080
     * @tc.desc Verify fill twice overwrites previous fill values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue1234: number = 0x1234;
      const hexValue10: number = 0x10;
      const hexValueFF: number = 0xFF;
      const hexValue0A: number = 0x0A;
      const arr = new Float64Array([hexValue1234, 1000000, -hexValue10]);
      arr.fill(hexValueFF);
      arr.fill(hexValue0A);
      const actVal171 = arr.$_get(0);
      const expectVal = hexValue0A;
      expect(actVal171).assertEqual(expectVal);
      const actVal172 = arr.$_get(2);
      const expectVal2 = hexValue0A;
      expect(actVal172).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_8100
     * @tc.name testFloat64ArrayFill2081
     * @tc.desc Verify fill after $_set overwrites with new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFFFF: number = 0xFFFF;
      const hexValueFF: number = 0xFF;
      const arr = new Float64Array(3);
      arr.$_set(1, hexValueFFFF);
      arr.fill(hexValueFF);
      const actVal173 = arr.$_get(0);
      const expectVal = hexValueFF;
      expect(actVal173).assertEqual(expectVal);
      const actVal174 = arr.$_get(1);
      const expectVal2 = hexValueFF;
      expect(actVal174).assertEqual(expectVal2);
      const actVal175 = arr.$_get(2);
      const expectVal3 = hexValueFF;
      expect(actVal175).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_8200
     * @tc.name testFloat64ArrayFill2082
     * @tc.desc Verify fill value=2147483647.0 int maximum boundary fills correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483647Pointzero: number = 2147483647.0;
      const arr = new Float64Array(3);
      arr.fill(num2147483647Pointzero);
      const actVal176 = arr.$_get(0);
      const expectVal = num2147483647Pointzero;
      expect(actVal176).assertEqual(expectVal);
      const actVal177 = arr.$_get(2);
      const expectVal2 = num2147483647Pointzero;
      expect(actVal177).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILL_2_8300
     * @tc.name testFloat64ArrayFill2083
     * @tc.desc Verify fill value=-1.0e+309 underflow converts to -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFill2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue10e309: number = -1.0e+309;
      const arr = new Float64Array(3);
      arr.fill(negsciValue10e309);
      const actVal178 = arr.$_get(0) === -Infinity;
      const expectVal = true;
      expect(actVal178).assertEqual(expectVal);
      const actVal179 = arr.$_get(2) === -Infinity;
      const expectVal2 = true;
      expect(actVal179).assertEqual(expectVal2);
    });

  })
}
