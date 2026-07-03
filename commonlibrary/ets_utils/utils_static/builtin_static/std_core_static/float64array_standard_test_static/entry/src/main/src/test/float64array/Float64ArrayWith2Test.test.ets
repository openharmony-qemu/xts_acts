'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

export default function Float64ArrayWith2Test(): void {
  describe('Float64ArrayWith2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_0100
     * @tc.name testFloat64ArrayWith2001
     * @tc.desc Verify with index 0 replaces first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(0, hundredPointZero);
      const actVal1 = replaced.$_get(0);
      const expectVal = hundredPointZero;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_0200
     * @tc.name testFloat64ArrayWith2002
     * @tc.desc Verify with index 1 replaces middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num200Pointzero: number = 200.0;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(1, num200Pointzero);
      const actVal2 = replaced.$_get(1);
      const expectVal = num200Pointzero;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_0300
     * @tc.name testFloat64ArrayWith2003
     * @tc.desc Verify with index 2 replaces last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num300Pointzero: number = 300.0;
      const values = new Float64Array([-32768, -128, 0]);
      const replaced = values.with(2, num300Pointzero);
      const actVal3 = replaced.$_get(2);
      const expectVal = num300Pointzero;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_0400
     * @tc.name testFloat64ArrayWith2004
     * @tc.desc Verify with index 2 returns last element copy without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const num300Pointzero: number = 300.0;
      const values = new Float64Array([-2147483648, -1, zeroValue]);
      const replaced = values.with(2, num300Pointzero);
      const actVal4 = replaced.$_get(2);
      const expectVal = num300Pointzero;
      expect(actVal4).assertEqual(expectVal);
      const actVal5 = values.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal5).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_0500
     * @tc.name testFloat64ArrayWith2005
     * @tc.desc Verify with index 1 preserves surrounding elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const num200Pointzero: number = 200.0;
      const values = Float64Array.of(pointOne, 9007199254740991, zeroValue);
      const replaced = values.with(1, num200Pointzero);
      const actVal6 = replaced.$_get(0);
      const expectVal = pointOne;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = replaced.$_get(1);
      const expectVal2 = num200Pointzero;
      expect(actVal7).assertEqual(expectVal2);
      const actVal8 = replaced.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal8).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_0600
     * @tc.name testFloat64ArrayWith2006
     * @tc.desc Verify with index 0 preserves tail elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const hundredPointZero: number = 100.0;
      const values = new Float64Array([0.5, onePointFive, pointTwoFive]);
      const replaced = values.with(0, hundredPointZero);
      const actVal9 = replaced.$_get(0);
      const expectVal = hundredPointZero;
      expect(actVal9).assertEqual(expectVal);
      const actVal10 = replaced.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal10).assertEqual(expectVal2);
      const actVal11 = replaced.$_get(2);
      const expectVal3 = pointTwoFive;
      expect(actVal11).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_0700
     * @tc.name testFloat64ArrayWith2007
     * @tc.desc Verify with index length out of bounds positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const threeValue: number = 3;
      try {
        const values = new Float64Array([int16MinValue, int8MinValue, zeroValue]);
        const replaced = values.with(3, num999Pointzero);
        expect(replaced.length).assertEqual(threeValue);
        const actVal12 = replaced.$_get(0);
        const expectVal = int16MinValue;
        expect(actVal12).assertEqual(expectVal);
        const actVal13 = replaced.$_get(1);
        const expectVal2 = int8MinValue;
        expect(actVal13).assertEqual(expectVal2);
        const actVal14 = replaced.$_get(2);
        const expectVal3 = zeroValue;
        expect(actVal14).assertEqual(expectVal3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_0800
     * @tc.name testFloat64ArrayWith2008
     * @tc.desc Verify with index length+1 out of bounds positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      const threeValue: number = 3;
      try {
        const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
        const replaced = values.with(4, num999Pointzero);
        expect(replaced.length).assertEqual(threeValue);
        const actVal15 = replaced.$_get(0);
        const expectVal = int32MinValue;
        expect(actVal15).assertEqual(expectVal);
        const actVal16 = replaced.$_get(1);
        const expectVal2 = negativeOne;
        expect(actVal16).assertEqual(expectVal2);
        const actVal17 = replaced.$_get(2);
        const expectVal3 = zeroValue;
        expect(actVal17).assertEqual(expectVal3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_0900
     * @tc.name testFloat64ArrayWith2009
     * @tc.desc Verify with index -length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      try {
        const values = new Float64Array([0.1, 9007199254740991, 0]);
        values.with(-3, num999Pointzero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1000
     * @tc.name testFloat64ArrayWith2010
     * @tc.desc Verify with index very large positive out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const num999Pointzero: number = 999.0;
      const threeValue: number = 3;
      try {
        const values = new Float64Array([int16MinValue, -128, 0]);
        const replaced = values.with(2147483647, num999Pointzero);
        expect(replaced.length).assertEqual(threeValue);
        const actVal18 = replaced.$_get(0);
        const expectVal = int16MinValue;
        expect(actVal18).assertEqual(expectVal);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1100
     * @tc.name testFloat64ArrayWith2011
     * @tc.desc Verify with index very large negative out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const num999Pointzero: number = 999.0;
      const threeValue: number = 3;
      try {
        const values = Float64Array.of(int32MinValue, -1, 0);
        const replaced = values.with(-2147483648, num999Pointzero);
        expect(replaced.length).assertEqual(threeValue);
        const actVal19 = replaced.$_get(0);
        const expectVal = int32MinValue;
        expect(actVal19).assertEqual(expectVal);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1200
     * @tc.name testFloat64ArrayWith2012
     * @tc.desc Verify with index length-1 valid boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num300Pointzero: number = 300.0;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(2, num300Pointzero);
      const actVal20 = replaced.$_get(2);
      const expectVal = num300Pointzero;
      expect(actVal20).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1300
     * @tc.name testFloat64ArrayWith2013
     * @tc.desc Verify with index 0 single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const oneValue: number = 1;
      const values = Float64Array.of(-32768);
      const replaced = values.with(0, hundredPointZero);
      const actVal21 = replaced.$_get(0);
      const expectVal = hundredPointZero;
      expect(actVal21).assertEqual(expectVal);
      expect(replaced.length).assertEqual(oneValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1400
     * @tc.name testFloat64ArrayWith2014
     * @tc.desc Verify with index -1 single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const values = new Float64Array([-2147483648]);
      const replaced = values.with(0, hundredPointZero);
      const actVal22 = replaced.$_get(0);
      const expectVal = hundredPointZero;
      expect(actVal22).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1500
     * @tc.name testFloat64ArrayWith2015
     * @tc.desc Verify with index 1 single element array out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const hundredPointZero: number = 100.0;
      const oneValue: number = 1;
      try {
        const values = new Float64Array([pointOne]);
        const replaced = values.with(1, hundredPointZero);
        expect(replaced.length).assertEqual(oneValue);
        const actVal23 = replaced.$_get(0);
        const expectVal = pointOne;
        expect(actVal23).assertEqual(expectVal);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1600
     * @tc.name testFloat64ArrayWith2016
     * @tc.desc Verify with index 0 empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const values = new Float64Array(0);
      try {
        values.with(0, hundredPointZero);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1700
     * @tc.name testFloat64ArrayWith2017
     * @tc.desc Verify with stores positive zero replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const values = new Float64Array([-2147483648, -1, 0]);
      const replaced = values.with(1, zeroPointZero);
      const actVal24 = replaced.$_get(1);
      const expectVal = zeroPointZero;
      expect(actVal24).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1800
     * @tc.name testFloat64ArrayWith2018
     * @tc.desc Verify with preserves negative zero replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(1, negativeZero);
      const actVal25 = replaced.$_get(1);
      const expectVal = negativeZero;
      expect(actVal25).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_1900
     * @tc.name testFloat64ArrayWith2019
     * @tc.desc Verify with writes Double.MAX_VALUE at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(1, doubleMaxValue);
      const actVal26 = replaced.$_get(1);
      const expectVal = doubleMaxValue;
      expect(actVal26).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2000
     * @tc.name testFloat64ArrayWith2020
     * @tc.desc Verify with value Double.MIN_VALUE replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const values = new Float64Array([-32768, -128, 0]);
      const replaced = values.with(1, doubleMinValue);
      const actVal27 = replaced.$_get(1);
      const expectVal = doubleMinValue;
      expect(actVal27).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2100
     * @tc.name testFloat64ArrayWith2021
     * @tc.desc Verify with value Infinity replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const values = new Float64Array([-2147483648, -1, 0]);
      const replaced = values.with(1, positiveInfinity);
      const actVal28 = Number.isNaN(replaced.$_get(1) - replaced.$_get(1));
      const expectVal = true;
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = replaced.$_get(1);
      const expectVal2 = positiveInfinity;
      expect(actVal29).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2200
     * @tc.name testFloat64ArrayWith2022
     * @tc.desc Verify with value -Infinity replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(1, negativeInfinity);
      const actVal30 = replaced.$_get(1) < -1e308;
      const expectVal = true;
      expect(actVal30).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2300
     * @tc.name testFloat64ArrayWith2023
     * @tc.desc Verify with stores NaN replacement at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(1, nanValue);
      const actVal31 = Number.isNaN(replaced.$_get(1));
      const expectVal = true;
      expect(actVal31).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2400
     * @tc.name testFloat64ArrayWith2024
     * @tc.desc Verify with value negative replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const values = new Float64Array([-32768, -128, 0]);
      const replaced = values.with(1, negnum999999Pointninenine);
      const actVal32 = replaced.$_get(1);
      const expectVal = negnum999999Pointninenine;
      expect(actVal32).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2500
     * @tc.name testFloat64ArrayWith2025
     * @tc.desc Verify with value decimal replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const values = new Float64Array([-2147483648, -1, 0]);
      const replaced = values.with(1, pointOne);
      const actVal33 = replaced.$_get(1);
      const expectVal = pointOne;
      expect(actVal33).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2600
     * @tc.name testFloat64ArrayWith2026
     * @tc.desc Verify with value scientific notation positive exponent replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e10: number = 1.0e+10;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(1, sciValue10e10);
      const actVal34 = replaced.$_get(1);
      const expectVal = sciValue10e10;
      expect(actVal34).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2700
     * @tc.name testFloat64ArrayWith2027
     * @tc.desc Verify with value scientific notation negative exponent replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e10: number = 1.0e-10;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(1, sciValue10e10);
      const actVal35 = replaced.$_get(1);
      const expectVal = sciValue10e10;
      expect(actVal35).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2800
     * @tc.name testFloat64ArrayWith2028
     * @tc.desc Verify with value integer 1.0 replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values = new Float64Array([-32768, -128, 0]);
      const replaced = values.with(1, onePointZero);
      const actVal36 = replaced.$_get(1);
      const expectVal = onePointZero;
      expect(actVal36).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_2900
     * @tc.name testFloat64ArrayWith2029
     * @tc.desc Verify with value integer 2.0 replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const values = new Float64Array([-2147483648, -1, 0]);
      const replaced = values.with(1, twoPointZero);
      const actVal37 = replaced.$_get(1);
      const expectVal = twoPointZero;
      expect(actVal37).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3000
     * @tc.name testFloat64ArrayWith2030
     * @tc.desc Verify with value overflow boundary replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(1, numberMaxValue);
      const actVal38 = replaced.$_get(1);
      const expectVal = numberMaxValue;
      expect(actVal38).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3100
     * @tc.name testFloat64ArrayWith2031
     * @tc.desc Verify with value Number.MAX_SAFE_INTEGER replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(1, maxSafeIntegerValue);
      const actVal39 = replaced.$_get(1);
      const expectVal = maxSafeIntegerValue;
      expect(actVal39).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3200
     * @tc.name testFloat64ArrayWith2032
     * @tc.desc Verify with value Number.MIN_SAFE_INTEGER replaces element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const values = new Float64Array([-32768, -128, 0]);
      const replaced = values.with(1, negativeMaxSafeIntegerValue);
      const actVal40 = replaced.$_get(1);
      const expectVal = negativeMaxSafeIntegerValue;
      expect(actVal40).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3300
     * @tc.name testFloat64ArrayWith2033
     * @tc.desc Verify with writes integer zero replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const values = new Float64Array([-2147483648, -1, zeroValue]);
      const replaced = values.with(1, zeroPointZero);
      const actVal41 = replaced.$_get(1);
      const expectVal = zeroValue;
      expect(actVal41).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3400
     * @tc.name testFloat64ArrayWith2034
     * @tc.desc Verify with writes negative one replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(1, negativeOne);
      const actVal42 = replaced.$_get(1);
      const expectVal = negativeOne;
      expect(actVal42).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3500
     * @tc.name testFloat64ArrayWith2035
     * @tc.desc Verify with writes positive one replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const oneValue: number = 1;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(1, onePointZero);
      const actVal43 = replaced.$_get(1);
      const expectVal = oneValue;
      expect(actVal43).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3600
     * @tc.name testFloat64ArrayWith2036
     * @tc.desc Verify with value number type literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfivePointfive: number = 25.5;
      const values = new Float64Array([-2147483648, -1, 0]);
      const value: number = 25.5;
      const replaced = values.with(1, value);
      const actVal44 = replaced.$_get(1);
      const expectVal = twentyfivePointfive;
      expect(actVal44).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3700
     * @tc.name testFloat64ArrayWith2037
     * @tc.desc Verify with value number type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const value: number = 100.0;
      const replaced = values.with(0, value);
      const actVal45 = replaced.$_get(0);
      const expectVal = hundredPointZero;
      expect(actVal45).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3800
     * @tc.name testFloat64ArrayWith2038
     * @tc.desc Verify with original array unchanged after with call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const num200Pointzero: number = 200.0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const replaced = values.with(1, num200Pointzero);
      const actVal46 = values.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal46).assertEqual(expectVal);
      const actVal47 = values.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal47).assertEqual(expectVal2);
      const actVal48 = values.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal48).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_3900
     * @tc.name testFloat64ArrayWith2039
     * @tc.desc Verify with original array elements unchanged after multiple with calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const hundredPointZero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const num300Pointzero: number = 300.0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const r1 = values.with(0, hundredPointZero);
      const r2 = values.with(1, num200Pointzero);
      const r3 = values.with(2, num300Pointzero);
      const actVal49 = values.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal49).assertEqual(expectVal);
      const actVal50 = values.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal50).assertEqual(expectVal2);
      const actVal51 = values.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal51).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4000
     * @tc.name testFloat64ArrayWith2040
     * @tc.desc Verify with original array elements unchanged after out of bounds with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const num999Pointzero: number = 999.0;
      try {
        const values = new Float64Array([pointOne, maxSafeInteger, zeroValue]);
        const replaced = values.with(100, num999Pointzero);
        const actVal52 = values.$_get(0);
        const expectVal = pointOne;
        expect(actVal52).assertEqual(expectVal);
        const actVal53 = values.$_get(1);
        const expectVal2 = maxSafeInteger;
        expect(actVal53).assertEqual(expectVal2);
        const actVal54 = values.$_get(2);
        const expectVal3 = zeroValue;
        expect(actVal54).assertEqual(expectVal3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4100
     * @tc.name testFloat64ArrayWith2041
     * @tc.desc Verify with integer value auto converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(1, fivePointZero);
      const actVal55 = replaced.$_get(1);
      const expectVal = fivePointZero;
      expect(actVal55).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4200
     * @tc.name testFloat64ArrayWith2042
     * @tc.desc Verify with decimal value preserves precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const precisionSumValue: number =
        0.30000000000000004;
      const values = new Float64Array([-32768, -128, 0]);
      const replaced = values.with(1, pointOne + pointTwo);
      const actVal56 = replaced.$_get(1);
      expect(actVal56)
        .assertEqual(precisionSumValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4300
     * @tc.name testFloat64ArrayWith2043
     * @tc.desc Verify with large value converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue1e100: number = 1e100;
      const values = new Float64Array([-2147483648, -1, 0]);
      const replaced = values.with(1, sciValue1e100);
      const actVal57 = replaced.$_get(1);
      const expectVal = sciValue1e100;
      expect(actVal57).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4400
     * @tc.name testFloat64ArrayWith2044
     * @tc.desc Verify with minimum positive converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue1e100: number = 1e-100;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(1, sciValue1e100);
      const actVal58 = replaced.$_get(1);
      const expectVal = sciValue1e100;
      expect(actVal58).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4500
     * @tc.name testFloat64ArrayWith2045
     * @tc.desc Verify with negative decimal converted to double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeDecimalValue: number = -0.001;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(1, negativeDecimalValue);
      const actVal59 = replaced.$_get(1);
      const expectVal = negativeDecimalValue;
      expect(actVal59).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4600
     * @tc.name testFloat64ArrayWith2046
     * @tc.desc Verify with last index and positive value combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const num300Pointzero: number = 300.0;
      const values = Float64Array.of(-32768, -128, zeroValue);
      const replaced = values.with(2, num300Pointzero);
      const actVal60 = replaced.$_get(2);
      const expectVal = num300Pointzero;
      expect(actVal60).assertEqual(expectVal);
      const actVal61 = values.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal61).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4700
     * @tc.name testFloat64ArrayWith2047
     * @tc.desc Verify with middle index and negative value combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const negnum200Pointzero: number = -200.0;
      const values = new Float64Array([-2147483648, negativeOne, 0]);
      const replaced = values.with(1, negnum200Pointzero);
      const actVal62 = replaced.$_get(1);
      const expectVal = negnum200Pointzero;
      expect(actVal62).assertEqual(expectVal);
      const actVal63 = values.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal63).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4800
     * @tc.name testFloat64ArrayWith2048
     * @tc.desc Verify with boundary index and boundary value combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(2, doubleMaxValue);
      const actVal64 = replaced.$_get(2);
      const expectVal = doubleMaxValue;
      expect(actVal64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_4900
     * @tc.name testFloat64ArrayWith2049
     * @tc.desc Verify with boundary index and NaN combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const nanValue: number = NaN;
      const values = new Float64Array([pointFive, 1.5, 0.25]);
      const replaced = values.with(0, nanValue);
      const actVal65 = Number.isNaN(replaced.$_get(0));
      const expectVal = true;
      expect(actVal65).assertEqual(expectVal);
      const actVal66 = values.$_get(0);
      const expectVal2 = pointFive;
      expect(actVal66).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5000
     * @tc.name testFloat64ArrayWith2050
     * @tc.desc Verify with single element array index 0 and Infinity combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const positiveInfinity: number = Infinity;
      const values = new Float64Array([pointOne]);
      const replaced = values.with(0, positiveInfinity);
      const actVal67 = replaced.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal67).assertEqual(expectVal);
      const actVal68 = values.$_get(0);
      const expectVal2 = pointOne;
      expect(actVal68).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5100
     * @tc.name testFloat64ArrayWith2051
     * @tc.desc Verify with single element array index 0 and -Infinity combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const negativeInfinity: number = -Infinity;
      const values = new Float64Array([pointFive]);
      const replaced = values.with(0, negativeInfinity);
      const actVal69 = replaced.$_get(0) < -1e308;
      const expectVal = true;
      expect(actVal69).assertEqual(expectVal);
      const actVal70 = values.$_get(0);
      const expectVal2 = pointFive;
      expect(actVal70).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5200
     * @tc.name testFloat64ArrayWith2052
     * @tc.desc Verify with multiple consecutive with calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const hundredPointZero: number = 100.0;
      const num200Pointzero: number = 200.0;
      const num300Pointzero: number = 300.0;
      const values = Float64Array.of(int16MinValue, -128, 0);
      const r1 = values.with(0, hundredPointZero);
      const r2 = r1.with(1, num200Pointzero);
      const r3 = r2.with(2, num300Pointzero);
      expect(r3[0]).assertEqual(hundredPointZero);
      expect(r3[1]).assertEqual(num200Pointzero);
      expect(r3[2]).assertEqual(num300Pointzero);
      const actVal71 = values.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal71).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5300
     * @tc.name testFloat64ArrayWith2053
     * @tc.desc Verify with replacement compared with original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const num200Pointzero: number = 200.0;
      const values = new Float64Array([int32MinValue, -1, zeroValue]);
      const replaced = values.with(1, num200Pointzero);
      expect(replaced[0]).assertEqual(int32MinValue);
      expect(replaced[1]).assertEqual(num200Pointzero);
      expect(replaced[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5400
     * @tc.name testFloat64ArrayWith2054
     * @tc.desc Verify with first element replacement compared with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const hundredPointZero: number = 100.0;
      const values = Float64Array.of(0.1, maxSafeInteger, zeroValue);
      const replaced = values.with(0, hundredPointZero);
      expect(replaced[0]).assertEqual(hundredPointZero);
      expect(replaced[1]).assertEqual(maxSafeInteger);
      expect(replaced[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5500
     * @tc.name testFloat64ArrayWith2055
     * @tc.desc Verify with last element replacement compared with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const num300Pointzero: number = 300.0;
      const values = new Float64Array([pointFive, onePointFive, 0.25]);
      const replaced = values.with(2, num300Pointzero);
      expect(replaced[0]).assertEqual(pointFive);
      expect(replaced[1]).assertEqual(onePointFive);
      expect(replaced[2]).assertEqual(num300Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5600
     * @tc.name testFloat64ArrayWith2056
     * @tc.desc Verify with index 1 replacement compared with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const num200Pointzero: number = 200.0;
      const values = Float64Array.of(int16MinValue, -128, zeroValue);
      const replaced = values.with(1, num200Pointzero);
      expect(replaced[0]).assertEqual(int16MinValue);
      expect(replaced[1]).assertEqual(num200Pointzero);
      expect(replaced[2]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5700
     * @tc.name testFloat64ArrayWith2057
     * @tc.desc Verify with long array index 0 replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const pointZeroSixTwoFive: number = 0.0625;
      const hundredPointZero: number = 100.0;
      const values = Float64Array.of(pointFive, 1.5, 0.25, 0.125, pointZeroSixTwoFive);
      const replaced = values.with(0, hundredPointZero);
      const actVal72 = replaced.$_get(0);
      const expectVal = hundredPointZero;
      expect(actVal72).assertEqual(expectVal);
      const actVal73 = replaced.$_get(4);
      const expectVal2 = pointZeroSixTwoFive;
      expect(actVal73).assertEqual(expectVal2);
      const actVal74 = values.$_get(0);
      const expectVal3 = pointFive;
      expect(actVal74).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5800
     * @tc.name testFloat64ArrayWith2058
     * @tc.desc Verify with long array middle index replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const num300Pointzero: number = 300.0;
      const values = Float64Array.of(int16MinValue, -128, zeroValue, 127, 32767);
      const replaced = values.with(2, num300Pointzero);
      const actVal75 = replaced.$_get(2);
      const expectVal = num300Pointzero;
      expect(actVal75).assertEqual(expectVal);
      const actVal76 = replaced.$_get(0);
      const expectVal2 = int16MinValue;
      expect(actVal76).assertEqual(expectVal2);
      const actVal77 = values.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal77).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_5900
     * @tc.name testFloat64ArrayWith2059
     * @tc.desc Verify with long array middle index replacement compared with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const num300Pointzero: number = 300.0;
      const values = new Float64Array([-2147483648, -1, zeroValue, 1, 2147483647]);
      const replaced = values.with(2, num300Pointzero);
      const actVal78 = replaced.$_get(2);
      const expectVal = num300Pointzero;
      expect(actVal78).assertEqual(expectVal);
      const actVal79 = values.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal79).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6000
     * @tc.name testFloat64ArrayWith2060
     * @tc.desc Verify with all identical elements array replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const hundredPointZero: number = 100.0;
      const values = new Float64Array([int8MaxValue, int8MaxValue, int8MaxValue, int8MaxValue]);
      const replaced = values.with(2, hundredPointZero);
      const actVal80 = replaced.$_get(2);
      const expectVal = hundredPointZero;
      expect(actVal80).assertEqual(expectVal);
      const actVal81 = replaced.$_get(0);
      const expectVal2 = int8MaxValue;
      expect(actVal81).assertEqual(expectVal2);
      const actVal82 = values.$_get(2);
      const expectVal3 = int8MaxValue;
      expect(actVal82).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6100
     * @tc.name testFloat64ArrayWith2061
     * @tc.desc Verify with all-zero array replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const zeroPointZero: number = 0.0;
      const values = new Float64Array(4);
      const replaced = values.with(2, hundredPointZero);
      const actVal83 = replaced.$_get(2);
      const expectVal = hundredPointZero;
      expect(actVal83).assertEqual(expectVal);
      const actVal84 = replaced.$_get(0);
      const expectVal2 = zeroPointZero;
      expect(actVal84).assertEqual(expectVal2);
      const actVal85 = values.$_get(2);
      const expectVal3 = zeroPointZero;
      expect(actVal85).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6200
     * @tc.name testFloat64ArrayWith2062
     * @tc.desc Verify with negative values array replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const num200Pointzero: number = 200.0;
      const values = new Float64Array([-2147483648, negativeOne, 0]);
      const replaced = values.with(1, num200Pointzero);
      const actVal86 = replaced.$_get(1);
      const expectVal = num200Pointzero;
      expect(actVal86).assertEqual(expectVal);
      const actVal87 = values.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal87).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6300
     * @tc.name testFloat64ArrayWith2063
     * @tc.desc Verify with boundary values array replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const values = Float64Array.of(pointOne, 9007199254740991, zeroValue);
      const replaced = values.with(0, zeroPointZero);
      const actVal88 = replaced.$_get(0);
      const expectVal = zeroValue;
      expect(actVal88).assertEqual(expectVal);
      const actVal89 = values.$_get(0);
      const expectVal2 = pointOne;
      expect(actVal89).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6400
     * @tc.name testFloat64ArrayWith2064
     * @tc.desc Verify with NaN array replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(0, hundredPointZero);
      const actVal90 = Number.isNaN(values.$_get(0));
      const expectVal = false;
      expect(actVal90).assertEqual(expectVal);
      const actVal91 = replaced.$_get(0);
      const expectVal2 = hundredPointZero;
      expect(actVal91).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6500
     * @tc.name testFloat64ArrayWith2065
     * @tc.desc Verify with Infinity array replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredPointZero: number = 100.0;
      const values = new Float64Array([-32768, -128, 0]);
      const replaced = values.with(1, hundredPointZero);
      const actVal92 = replaced.$_get(1);
      const expectVal = hundredPointZero;
      expect(actVal92).assertEqual(expectVal);
      const actVal93 = values.$_get(1) < -1e308;
      const expectVal2 = false;
      expect(actVal93).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6600
     * @tc.name testFloat64ArrayWith2066
     * @tc.desc Verify with replacement new array buffer independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num200Pointzero: number = 200.0;
      const values = new Float64Array([-2147483648, -1, 0]);
      const replaced = values.with(1, num200Pointzero);
      const expectVal = false;
      expect(replaced.buffer === values.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6700
     * @tc.name testFloat64ArrayWith2067
     * @tc.desc Verify with replacement new array not same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num200Pointzero: number = 200.0;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const replaced = values.with(1, num200Pointzero);
      const expectVal = true;
      expect(replaced !== values).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6800
     * @tc.name testFloat64ArrayWith2068
     * @tc.desc Verify with replacement value as original returns new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyPointZero: number = 20.0;
      const twentyValue: number = 20;
      const values = Float64Array.of(0.5, 1.5, 0.25);
      const replaced = values.with(1, twentyPointZero);
      expect(replaced === values).assertFalse();
      const actVal94 = replaced.$_get(1);
      const expectVal = twentyValue;
      expect(actVal94).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_6900
     * @tc.name testFloat64ArrayWith2069
     * @tc.desc Verify with replacement original array all properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const num200Pointzero: number = 200.0;
      const threeValue: number = 3;
      const twentyfourValue: number = 24;
      const values = Float64Array.of(-32768, -128, zeroValue);
      const replaced = values.with(1, num200Pointzero);
      expect(values.length).assertEqual(threeValue);
      expect(values.byteLength).assertEqual(twentyfourValue);
      expect(values.byteOffset).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_WITH_2_7000
     * @tc.name testFloat64ArrayWith2070
     * @tc.desc Verify with returns new instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayWith2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.with(0, fillValue99);
      expect(result[0] === 99.0).assertTrue();
      expect(result[0] === 1.0).assertFalse();
    })

  })
}
