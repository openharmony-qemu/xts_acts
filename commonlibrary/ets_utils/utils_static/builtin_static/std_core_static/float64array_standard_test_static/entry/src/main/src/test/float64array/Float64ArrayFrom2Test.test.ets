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

function mapDouble(v: number, k: number): number {
  return v * 2.0;
}

function mapNegate(v: number, k: number): number {
  return -v;
}

function mapAddTen(v: number, k: number): number {
  return v + 10.0;
}

export default function float64ArrayFrom2Test(): void {
  describe('Float64ArrayFrom2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_0100
     * @tc.name testFloat64ArrayFrom2001
     * @tc.desc Verify from with Set of numbers basic usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      source.add(3.0);
      const result = Float64Array.from(source);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_0200
     * @tc.name testFloat64ArrayFrom2002
     * @tc.desc Verify from with empty Set returns empty Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const source = new Set<number>();
      const result = Float64Array.from(source);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_0300
     * @tc.name testFloat64ArrayFrom2003
     * @tc.desc Verify from with single-element Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const fillValue42: number = 42.0;
      const source = new Set<number>();
      source.add(42.0);
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(oneValue);
      const actVal1 = result.$_get(0);
      const expectVal = fillValue42;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_0400
     * @tc.name testFloat64ArrayFrom2004
     * @tc.desc Verify from with Set containing negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const source = new Set<number>();
      source.add(-1.0);
      source.add(-2.0);
      source.add(-3.0);
      const result = Float64Array.from(source);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_0500
     * @tc.name testFloat64ArrayFrom2005
     * @tc.desc Verify from with Set containing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const source = new Set<number>();
      source.add(Infinity);
      source.add(-Infinity);
      const result = Float64Array.from(source);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_0600
     * @tc.name testFloat64ArrayFrom2006
     * @tc.desc Verify from with Set containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const source = new Set<number>();
      source.add(NaN);
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(oneValue);
      const actVal2 = result.$_get(0);
      expect(actVal2).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_0700
     * @tc.name testFloat64ArrayFrom2007
     * @tc.desc Verify from with Set containing MAX_VALUE and MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const maxValue: number = 1.7976931348623157e+308;
      const minValue: number = 5e-324;
      const source = new Set<number>();
      source.add(maxValue);
      source.add(minValue);
      const result = Float64Array.from(source);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
      const actVal3 = result.$_get(0);
      expect(actVal3).assertEqual(maxValue);
      const actVal4 = result.$_get(1);
      expect(actVal4).assertEqual(minValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_0800
     * @tc.name testFloat64ArrayFrom2008
     * @tc.desc Verify from with large Set of 20 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyValue: number = 20;
      const source = new Set<number>();
      for (let i: int = 0; i < 20; i++) {
        source.add(i * 1.0);
      }
      const result = Float64Array.from(source);
      const expectVal = twentyValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_0900
     * @tc.name testFloat64ArrayFrom2009
     * @tc.desc Verify from with Set of scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const highScientific: number = 1.0e+50;
      const lowScientific: number = 1.0e-50;
      const source = new Set<number>();
      source.add(highScientific);
      source.add(lowScientific);
      const result = Float64Array.from(source);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
      const actVal5 = result.$_get(0);
      expect(actVal5).assertEqual(highScientific);
      const actVal6 = result.$_get(1);
      expect(actVal6).assertEqual(lowScientific);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1000
     * @tc.name testFloat64ArrayFrom2010
     * @tc.desc Verify from Set deduplicates mixed zero values and preserves negative zero sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const negativeInfinity: number = -Infinity;
      const source = new Set<number>();
      source.add(0.0);
      source.add(-0.0);
      const result = Float64Array.from(source);
      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
      const actVal = result.$_get(0);
      expect(1 / actVal).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1100
     * @tc.name testFloat64ArrayFrom2011
     * @tc.desc Verify from Set with multi-elements preserves insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      source.add(3.0);
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(threeValue);
      const actVal3 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal3).assertEqual(expectVal);
      const actVal4 = result.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal4).assertEqual(expectVal2);
      const actVal5 = result.$_get(2);
      const expectVal3 = threePointZero;
      expect(actVal5).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1200
     * @tc.name testFloat64ArrayFrom2012
     * @tc.desc Verify from Set with positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const source = new Set<number>();
      source.add(0.0);
      const result = Float64Array.from(source);
      const actVal6 = result.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal6).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1300
     * @tc.name testFloat64ArrayFrom2013
     * @tc.desc Verify from Set preserves negative zero sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const source = new Set<number>();
      source.add(-0.0);
      const result = Float64Array.from(source);
      const actVal7 = result.$_get(0);
      expect(1 / actVal7).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1400
     * @tc.name testFloat64ArrayFrom2014
     * @tc.desc Verify from Set with Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const source = new Set<number>();
      source.add(Infinity);
      const result = Float64Array.from(source);
      const actVal8 = result.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal8).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1500
     * @tc.name testFloat64ArrayFrom2015
     * @tc.desc Verify from Set with -Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const source = new Set<number>();
      source.add(-Infinity);
      const result = Float64Array.from(source);
      const actVal9 = result.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal9).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1600
     * @tc.name testFloat64ArrayFrom2016
     * @tc.desc Verify from Set with MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const source = new Set<number>();
      source.add(1.7976931348623157e+308);
      const result = Float64Array.from(source);
      const actVal10 = result.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal10).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1700
     * @tc.name testFloat64ArrayFrom2017
     * @tc.desc Verify from Set with MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const source = new Set<number>();
      source.add(5e-324);
      const result = Float64Array.from(source);
      const actVal11 = result.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal11).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1800
     * @tc.name testFloat64ArrayFrom2018
     * @tc.desc Verify from Set with scientific notation large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      const source = new Set<number>();
      source.add(1.0e+308);
      const result = Float64Array.from(source);
      const actVal12 = result.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal12).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_1900
     * @tc.name testFloat64ArrayFrom2019
     * @tc.desc Verify from Set with negative large value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const source = new Set<number>();
      source.add(-999999.99);
      const result = Float64Array.from(source);
      const actVal13 = result.$_get(0);
      const expectVal = negnum999999Pointninenine;
      expect(actVal13).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2000
     * @tc.name testFloat64ArrayFrom2020
     * @tc.desc Verify from Set preserves leading negative zero before positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const negativeInfinity: number = -Infinity;
      const source = new Set<number>();
      source.add(-0.0);
      source.add(1.0);
      source.add(2.0);
      const result = Float64Array.from(source);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
      const actVal = result.$_get(0);
      expect(1 / actVal).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2100
     * @tc.name testFloat64ArrayFrom2021
     * @tc.desc Verify from Set with 0.1+0.2 precision value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const source = new Set<number>();
      source.add(0.1 + 0.2);
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(oneValue);
      const actVal14 = result.$_get(0) === 0.3;
      const expectVal = false;
      expect(actVal14).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2200
     * @tc.name testFloat64ArrayFrom2022
     * @tc.desc Verify from Set with MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const source = new Set<number>();
      source.add(9007199254740991);
      const result = Float64Array.from(source);
      const actVal15 = result.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal15).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2300
     * @tc.name testFloat64ArrayFrom2023
     * @tc.desc Verify from Set with MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = -9007199254740991;
      const source = new Set<number>();
      source.add(-9007199254740991);
      const result = Float64Array.from(source);
      const actVal16 = result.$_get(0);
      const expectVal = minSafeInteger;
      expect(actVal16).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2400
     * @tc.name testFloat64ArrayFrom2024
     * @tc.desc Verify from Set return buffer independent from another from call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      const r1 = Float64Array.from(source);
      const r2 = Float64Array.from(source);
      expect(r1.buffer).not().assertEqual(r2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2500
     * @tc.name testFloat64ArrayFrom2025
     * @tc.desc Verify from Set with hex octal binary literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const source = new Set<number>();
      source.add(0x10);
      source.add(0o20);
      source.add(0b100);
      const result = Float64Array.from(source);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2600
     * @tc.name testFloat64ArrayFrom2026
     * @tc.desc Verify from Set with int type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const source = new Set<number>();
      const v: int = 42;
      source.add(v);
      const result = Float64Array.from(source);
      const actVal17 = result.$_get(0);
      const expectVal = fillValue42;
      expect(actVal17).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2700
     * @tc.name testFloat64ArrayFrom2027
     * @tc.desc Verify from Set with double type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piApprox: number = 3.14;
      const source = new Set<number>();
      const d: double = 3.14;
      source.add(d);
      const result = Float64Array.from(source);
      const actVal18 = result.$_get(0);
      const expectVal = piApprox;
      expect(actVal18).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2800
     * @tc.name testFloat64ArrayFrom2028
     * @tc.desc Verify from Set with short type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const source = new Set<number>();
      const s: short = 7;
      source.add(s);
      const result = Float64Array.from(source);
      const actVal19 = result.$_get(0);
      const expectVal = sevenPointZero;
      expect(actVal19).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_2900
     * @tc.name testFloat64ArrayFrom2029
     * @tc.desc Verify from with Set containing negative and positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const threeValue: number = 3;
      const source = new Set<number>();
      source.add(-onePointZero);
      source.add(twoPointZero);
      source.add(threePointZero);
      const arr = Float64Array.from(source);
      expect(arr.length).assertEqual(threeValue);
      const actVal20 = arr.$_get(0);
      const expectVal = -onePointZero;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = arr.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal21).assertEqual(expectVal2);
      const actVal22 = arr.$_get(2);
      const expectVal3 = threePointZero;
      expect(actVal22).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3000
     * @tc.name testFloat64ArrayFrom2030
     * @tc.desc Verify Float64Array.from array source preserves hex literal 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const num255Value: number = 255;
      const arr = Float64Array.from([hexValueFF]);
      const expectVal = num255Value;
      expect(arr[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3100
     * @tc.name testFloat64ArrayFrom2031
     * @tc.desc Verify Float64Array.from array source preserves binary literal 0b11111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const num255Value: number = 255;
      const arr = Float64Array.from([binaryValue11111111]);
      const expectVal = num255Value;
      expect(arr[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3200
     * @tc.name testFloat64ArrayFrom2032
     * @tc.desc Verify from with Array<number> basic usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const source: Array<number> = [1.0, 2.0, 3.0];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(threeValue);
      const actVal1 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal1).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3300
     * @tc.name testFloat64ArrayFrom2033
     * @tc.desc Verify from with empty Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const source: Array<number> = [];
      const result = Float64Array.from(source);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3400
     * @tc.name testFloat64ArrayFrom2034
     * @tc.desc Verify from with Array<number> single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const source: Array<number> = [42.0];
      const result = Float64Array.from(source);
      const actVal2 = result.$_get(0);
      const expectVal = fillValue42;
      expect(actVal2).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3500
     * @tc.name testFloat64ArrayFrom2035
     * @tc.desc Verify from with ArrayLike<number> basic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const twentyPointZero: number = 20.0;
      const source: ArrayLike<number> = [10.0, 20.0, 30.0];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(threeValue);
      const actVal3 = result.$_get(1);
      const expectVal = twentyPointZero;
      expect(actVal3).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3600
     * @tc.name testFloat64ArrayFrom2036
     * @tc.desc Verify from with ArrayLike<number> empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const source: ArrayLike<number> = [];
      const result = Float64Array.from(source);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3700
     * @tc.name testFloat64ArrayFrom2037
     * @tc.desc Verify from with Array<number> containing negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const threeValue: number = 3;
      const source: Array<number> = [-1.0, -2.0, -3.0];
      const result = Float64Array.from(source);
      const actVal4 = result.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal4).assertEqual(expectVal);
      expect(result.length).assertEqual(threeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3800
     * @tc.name testFloat64ArrayFrom2038
     * @tc.desc Verify from with Array<number> containing special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const source: Array<number> = [Infinity, -Infinity, NaN];
      const result = Float64Array.from(source);
      const actVal5 = result.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal5).assertEqual(expectVal);
      const actVal6 = result.$_get(1);
      const expectVal2 = negativeInfinity;
      expect(actVal6).assertEqual(expectVal2);
      const actVal7 = Number.isNaN(result.$_get(2));
      const expectVal3 = true;
      expect(actVal7).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_3900
     * @tc.name testFloat64ArrayFrom2039
     * @tc.desc Verify from with Array<number> large 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredValue: number = 100;
      const source: Array<number> = [];
      for (let i: int = 0; i < 100; i++) {
        source.push(i * 1.0);
      }
      const result = Float64Array.from(source);
      const expectVal = hundredValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4000
     * @tc.name testFloat64ArrayFrom2040
     * @tc.desc Verify from with ArrayLike and mapfn doubles each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const fourPointZero: number = 4.0;
      const sixPointZero: number = 6.0;
      const source: ArrayLike<number> = [1, 2, 3];
      const result = Float64Array.from(source, (v: number, k: number): number => v * 2);
      const actVal8 = result.$_get(0);
      const expectVal = twoPointZero;
      expect(actVal8).assertEqual(expectVal);
      const actVal9 = result.$_get(1);
      const expectVal2 = fourPointZero;
      expect(actVal9).assertEqual(expectVal2);
      const actVal10 = result.$_get(2);
      const expectVal3 = sixPointZero;
      expect(actVal10).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4100
     * @tc.name testFloat64ArrayFrom2041
     * @tc.desc Verify from with ArrayLike and mapfn using index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const twoPointZero: number = 2.0;
      const sixPointZero: number = 6.0;
      const twelvePointzero: number = 12.0;
      const source: ArrayLike<number> = [1, 2, 3, 4];
      const result = Float64Array.from(source, (v: number, k: number): number => v * k);
      const actVal11 = result.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal11).assertEqual(expectVal);
      const actVal12 = result.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal12).assertEqual(expectVal2);
      const actVal13 = result.$_get(2);
      const expectVal3 = sixPointZero;
      expect(actVal13).assertEqual(expectVal3);
      const actVal14 = result.$_get(3);
      const expectVal4 = twelvePointzero;
      expect(actVal14).assertEqual(expectVal4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4200
     * @tc.name testFloat64ArrayFrom2042
     * @tc.desc Verify from with ArrayLike and mapfn returns constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const source: ArrayLike<number> = [1, 2, 3];
      const result = Float64Array.from(source, (v: number, k: number): number => 42.0);
      const actVal15 = result.$_get(0);
      const expectVal = fillValue42;
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = result.$_get(2);
      const expectVal2 = fillValue42;
      expect(actVal16).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4300
     * @tc.name testFloat64ArrayFrom2043
     * @tc.desc Verify from with ArrayLike and mapfn returns negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const negthreePointzero: number = -3.0;
      const source: ArrayLike<number> = [1, 2, 3];
      const result = Float64Array.from(source, (v: number, k: number): number => -v);
      const actVal17 = result.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal17).assertEqual(expectVal);
      const actVal18 = result.$_get(2);
      const expectVal2 = negthreePointzero;
      expect(actVal18).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4400
     * @tc.name testFloat64ArrayFrom2044
     * @tc.desc Verify from with ArrayLike and mapfn on empty source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const source: ArrayLike<number> = [];
      const result = Float64Array.from(source, (v: number, k: number): number => v * 2);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4500
     * @tc.name testFloat64ArrayFrom2045
     * @tc.desc Verify from with ArrayLike and mapfn single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fifteenPointzero: number = 15.0;
      const source: ArrayLike<number> = [5];
      const result = Float64Array.from(source, (v: number, k: number): number => v * 3);
      const actVal19 = result.$_get(0);
      const expectVal = fifteenPointzero;
      expect(actVal19).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4600
     * @tc.name testFloat64ArrayFrom2046
     * @tc.desc Verify from with ArrayLike and mapfn using external variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const thirtyPointZero: number = 30.0;
      const source: ArrayLike<number> = [1, 2, 3];
      let factor: number = 10.0;
      const result = Float64Array.from(source, (v: number, k: number): number => v * factor);
      const actVal20 = result.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = result.$_get(2);
      const expectVal2 = thirtyPointZero;
      expect(actVal21).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4700
     * @tc.name testFloat64ArrayFrom2047
     * @tc.desc Verify from ArrayLike mapfn returning Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const source: ArrayLike<number> = [1, 2];
      const result = Float64Array.from(source, (v: number, k: number): number => Infinity);
      const actVal22 = result.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal22).assertEqual(expectVal);
      const actVal23 = result.$_get(1);
      const expectVal2 = positiveInfinity;
      expect(actVal23).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4800
     * @tc.name testFloat64ArrayFrom2048
     * @tc.desc Verify from ArrayLike mapfn returning NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [1, 2];
      const result = Float64Array.from(source, (v: number, k: number): number => NaN);
      const actVal24 = result.$_get(0);
      expect(actVal24).assertNaN();
      const actVal25 = result.$_get(1);
      expect(actVal25).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_4900
     * @tc.name testFloat64ArrayFrom2049
     * @tc.desc Verify from ArrayLike mapfn returning MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const source: ArrayLike<number> = [1];
      const result = Float64Array.from(source, (v: number, k: number): number => 1.7976931348623157e+308);
      const actVal26 = result.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal26).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5000
     * @tc.name testFloat64ArrayFrom2050
     * @tc.desc Verify from ArrayLike mapfn returning MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const source: ArrayLike<number> = [1];
      const result = Float64Array.from(source, (v: number, k: number): number => 5e-324);
      const actVal27 = result.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal27).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5100
     * @tc.name testFloat64ArrayFrom2051
     * @tc.desc Verify from ArrayLike mapfn returning scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e50: number = 1.0e+50;
      const sciValue20e50: number = 2.0e+50;
      const source: ArrayLike<number> = [1, 2];
      const result = Float64Array.from(source, (v: number, k: number): number => 1.0e+50 * v);
      const actVal28 = result.$_get(0);
      const expectVal = sciValue10e50;
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = result.$_get(1);
      const expectVal2 = sciValue20e50;
      expect(actVal29).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5200
     * @tc.name testFloat64ArrayFrom2052
     * @tc.desc Verify from ArrayLike mapfn using closure counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const fourPointZero: number = 4.0;
      const sixPointZero: number = 6.0;
      let counter: number = 0;
      const source: ArrayLike<number> = [1, 2, 3];
      const result = Float64Array.from(source, (v: number, k: number): number => {
        counter++;
        return v + counter;
      })

      const actVal30 = result.$_get(0);
      const expectVal = twoPointZero;
      expect(actVal30).assertEqual(expectVal);
      const actVal31 = result.$_get(1);
      const expectVal2 = fourPointZero;
      expect(actVal31).assertEqual(expectVal2);
      const actVal32 = result.$_get(2);
      const expectVal3 = sixPointZero;
      expect(actVal32).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5300
     * @tc.name testFloat64ArrayFrom2053
     * @tc.desc Verify from ArrayLike mapfn with add-constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elevenPointzero: number = 11.0;
      const thirteenPointzero: number = 13.0;
      const source: ArrayLike<number> = [1, 2, 3];
      const result = Float64Array.from(source, (v: number, k: number): number => v + 10.0);
      const actVal33 = result.$_get(0);
      const expectVal = elevenPointzero;
      expect(actVal33).assertEqual(expectVal);
      const actVal34 = result.$_get(2);
      const expectVal2 = thirteenPointzero;
      expect(actVal34).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5400
     * @tc.name testFloat64ArrayFrom2054
     * @tc.desc Verify from ArrayLike mapfn large 20-element source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyValue: number = 20;
      const onePointFive: number = 1.5;
      const twentyPointfive: number = 20.5;
      const source: ArrayLike<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
      const result = Float64Array.from(source, (v: number, k: number): number => v + 0.5);
      expect(result.length).assertEqual(twentyValue);
      const actVal35 = result.$_get(0);
      const expectVal = onePointFive;
      expect(actVal35).assertEqual(expectVal);
      const actVal36 = result.$_get(19);
      const expectVal2 = twentyPointfive;
      expect(actVal36).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5500
     * @tc.name testFloat64ArrayFrom2055
     * @tc.desc Verify from ArrayLike mapfn as named function doubling values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const fourPointZero: number = 4.0;
      const sixPointZero: number = 6.0;
      const source: ArrayLike<number> = [1, 2, 3];
      const result = Float64Array.from(source, mapDouble);
      const actVal37 = result.$_get(0);
      const expectVal = twoPointZero;
      expect(actVal37).assertEqual(expectVal);
      const actVal38 = result.$_get(1);
      const expectVal2 = fourPointZero;
      expect(actVal38).assertEqual(expectVal2);
      const actVal39 = result.$_get(2);
      const expectVal3 = sixPointZero;
      expect(actVal39).assertEqual(expectVal3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5600
     * @tc.name testFloat64ArrayFrom2056
     * @tc.desc Verify from ArrayLike mapfn as named function negating values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const negthreePointzero: number = -3.0;
      const source: ArrayLike<number> = [1, 2, 3];
      const result = Float64Array.from(source, mapNegate);
      const actVal40 = result.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal40).assertEqual(expectVal);
      const actVal41 = result.$_get(2);
      const expectVal2 = negthreePointzero;
      expect(actVal41).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5700
     * @tc.name testFloat64ArrayFrom2057
     * @tc.desc Verify from ArrayLike mapfn as named function adding constant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const elevenPointzero: number = 11.0;
      const thirteenPointzero: number = 13.0;
      const source: ArrayLike<number> = [1, 2, 3];
      const result = Float64Array.from(source, mapAddTen);
      const actVal42 = result.$_get(0);
      const expectVal = elevenPointzero;
      expect(actVal42).assertEqual(expectVal);
      const actVal43 = result.$_get(2);
      const expectVal2 = thirteenPointzero;
      expect(actVal43).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5800
     * @tc.name testFloat64ArrayFrom2058
     * @tc.desc Verify from ArrayLike mapfn returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const source: ArrayLike<number> = [1, 2, 3];
      const result = Float64Array.from(source, (v: number, k: number): number => 0.0);
      const actVal44 = result.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = result.$_get(2);
      const expectVal2 = zeroPointZero;
      expect(actVal45).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_5900
     * @tc.name testFloat64ArrayFrom2059
     * @tc.desc Verify from ArrayLike mapfn returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const negativeInfinity: number = -Infinity;
      const source: ArrayLike<number> = [1, 2];
      const result = Float64Array.from(source, (v: number, k: number): number => negativeZero);
      const actVal46 = result.$_get(0);
      expect(1 / actVal46).assertEqual(negativeInfinity);
      const actVal47 = result.$_get(1);
      expect(1 / actVal47).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6000
     * @tc.name testFloat64ArrayFrom2060
     * @tc.desc Verify from ArrayLike mapfn returns decimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointZero: number = 1.0;
      const source: ArrayLike<number> = [1, 2];
      const result = Float64Array.from(source, (v: number, k: number): number => v * 0.5);
      const actVal47 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal47).assertEqual(expectVal);
      const actVal48 = result.$_get(1);
      const expectVal2 = onePointZero;
      expect(actVal48).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6100
     * @tc.name testFloat64ArrayFrom2061
     * @tc.desc Verify from ArrayLike mapfn throws Error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [1, 2, 3];
      try {
        Float64Array.from(source, (v: number, k: number): number => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6200
     * @tc.name testFloat64ArrayFrom2062
     * @tc.desc Verify from ArrayLike mapfn throws RangeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayLike<number> = [1, 2];
      try {
        Float64Array.from(source, (v: number, k: number): number => {
          throw new RangeError("range");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6300
     * @tc.name testFloat64ArrayFrom2063
     * @tc.desc Verify from Iterable basic usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointZero: number = 1.0;
      const source: Iterable<number> = [1, 2, 3];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(threeValue);
      const actVal49 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal49).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6400
     * @tc.name testFloat64ArrayFrom2064
     * @tc.desc Verify from Iterable empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const source: Iterable<number> = [];
      const result = Float64Array.from(source);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6500
     * @tc.name testFloat64ArrayFrom2065
     * @tc.desc Verify from Iterable with mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const sixPointZero: number = 6.0;
      const source: Iterable<number> = [1, 2, 3];
      const result = Float64Array.from(source, (v: number, k: number): number => v * 2);
      const actVal50 = result.$_get(0);
      const expectVal = twoPointZero;
      expect(actVal50).assertEqual(expectVal);
      const actVal51 = result.$_get(2);
      const expectVal2 = sixPointZero;
      expect(actVal51).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6600
     * @tc.name testFloat64ArrayFrom2066
     * @tc.desc Verify from Iterable with Infinity and NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const source: Iterable<number> = [Infinity, -Infinity, NaN];
      const result = Float64Array.from(source);
      const actVal52 = result.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal52).assertEqual(expectVal);
      const actVal53 = result.$_get(1);
      expect(actVal53).assertEqual(negativeInfinity);
      const actVal54 = result.$_get(2);
      expect(actVal54).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6700
     * @tc.name testFloat64ArrayFrom2067
     * @tc.desc Verify from Iterable return buffer independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Iterable<number> = [1, 2];
      const r1 = Float64Array.from(source);
      const r2 = Float64Array.from(source);
      expect(r1.buffer).not().assertEqual(r2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6800
     * @tc.name testFloat64ArrayFrom2068
     * @tc.desc Verify from ArrayLike with int type variable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const a: int = 10;
      const b: int = 20;
      const source: ArrayLike<number> = [a, b, 30];
      const result = Float64Array.from(source);
      const actVal54 = result.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal54).assertEqual(expectVal);
      const actVal55 = result.$_get(1);
      const expectVal2 = twentyPointZero;
      expect(actVal55).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_6900
     * @tc.name testFloat64ArrayFrom2069
     * @tc.desc Verify from Array with double type variable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const twoPointFive: number = 2.5;
      const d1: double = 1.5;
      const d2: double = 2.5;
      const source: Array<number> = [d1, d2];
      const result = Float64Array.from(source);
      const actVal56 = result.$_get(0);
      const expectVal = onePointFive;
      expect(actVal56).assertEqual(expectVal);
      const actVal57 = result.$_get(1);
      const expectVal2 = twoPointFive;
      expect(actVal57).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_7000
     * @tc.name testFloat64ArrayFrom2070
     * @tc.desc Verify from Iterable with short type variable elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const s1: short = 3;
      const s2: short = 4;
      const source: Iterable<number> = [s1, s2];
      const result = Float64Array.from(source);
      const actVal58 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal58).assertEqual(expectVal);
      const actVal59 = result.$_get(1);
      const expectVal2 = fourPointZero;
      expect(actVal59).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_7100
     * @tc.name testFloat64ArrayFrom2071
     * @tc.desc Verify from mapfn doubles negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const fromArr = Float64Array.from(arr, (v: number): number => v * 2.0);
      expect(fromArr[0]).assertEqual(-4294967296);
      expect(fromArr[1]).assertEqual(-2.0);
      expect(fromArr[2]).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_7200
     * @tc.name testFloat64ArrayFrom2072
     * @tc.desc Verify Float64Array.from mapfn increments hex literal 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const num256Pointzero: number = 256.0;
      const arr = Float64Array.from(new Float64Array([hexValueFF]), (v: number): number => v + 0x01);
      const expectVal = num256Pointzero;
      expect(arr[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_7300
     * @tc.name testFloat64ArrayFrom2073
     * @tc.desc Verify Float64Array.from mapfn increments binary literal 0b11111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const num256Pointzero: number = 256.0;
      const arr = Float64Array.from(Float64Array.of(binaryValue11111111), (v: number): number => v + 0b00000001);
      const expectVal = num256Pointzero;
      expect(arr[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_7400
     * @tc.name testFloat64ArrayFrom2074
     * @tc.desc Verify Float64Array.from mapfn maps Double.NaN to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.from([nanValue, doubleMaxValue], (v: number): number => Number.isNaN(v) ? 0.0 : v);
      expect(arr[0]).assertEqual(0.0);
      expect(arr[1]).assertEqual(doubleMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_7500
     * @tc.name testFloat64ArrayFrom2075
     * @tc.desc Verify Float64Array.from mapfn maps infinities to sign markers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.from([positiveInfinity, negativeInfinity], (v: number): number => v > 0.0 ? 1.0 : -1.0);
      expect(arr[0]).assertEqual(1.0);
      expect(arr[1]).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_7600
     * @tc.name testFloat64ArrayFrom2076
     * @tc.desc Verify Float64Array.from mapfn doubles Double min and max values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.from([doubleMinValue, doubleMaxValue], (v: number): number => v * 2.0);
      expect(arr[0]).assertEqual(doubleMinValue * 2.0);
      expect(arr[1]).assertEqual(doubleMaxValue * 2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_7700
     * @tc.name testFloat64ArrayFrom2077
     * @tc.desc Verify from Iterable mapfn throws Error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Iterable<number> = [1.0, 2.0, 3.0];
      try {
        Float64Array.from(source, (v: number, k: number): number => {
          throw new Error('test error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2_7800
     * @tc.name testFloat64ArrayFrom2078
     * @tc.desc Verify from Iterable mapfn throws RangeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Iterable<number> = [1.0, 2.0, 3.0];
      try {
        Float64Array.from(source, (v: number, k: number): number => {
          throw new RangeError('range error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

  })
}
